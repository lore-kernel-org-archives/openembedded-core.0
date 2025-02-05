Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D0BC02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:05:48 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web11.14156.1738767939297140934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 07:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yp3Sx6XRpzmwk;
	Wed,  5 Feb 2025 16:05:37 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yp3Sx3JLJzNJV;
	Wed,  5 Feb 2025 16:05:37 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Wed, 05 Feb 2025 16:05:24 +0100
Subject: [PATCH v3 2/2] scripts: add b4-wrapper for poky
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-b4-support-v3-2-f8b1456ae1c2@cherry.de>
References: <20250205-b4-support-v3-0-f8b1456ae1c2@cherry.de>
In-Reply-To: <20250205-b4-support-v3-0-f8b1456ae1c2@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 15:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210857

From: Quentin Schulz <quentin.schulz@cherry.de>

poky is a combo-layer containing BitBake, OpenEmbedded-Core and Yocto
Documentation source code into one big repo. It is not uncommon to have
people develop patches for either of those projects from a poky git
repo.
However, it is unlikely those patches are to be sent to the poky mailing
list as very few files contained in the poky git repo actually are
poky-specific. So we need a way to identify to which mailing list a
patch is destined to be sent.
Additionally, because the source code in openembedded-core is
merged/imported at the root of the git repo of poky, its .b4-config
introduced in the previous commit will be used if not overridden (which
will be done in a separate commit specific to the poky git repo). We
need to provide a different .b4-config in poky.

Therefore, this wrapper is used to identify automatically which mailing
list a patch series needs to be sent to (via b4 prep --auto-to-cc) and
does some additional checks (via b4 prep --check) such as making sure a
patch doesn't modify two different projects at the same time or that
multiple projects are modified by different patches in the same patch
series.

This wrapper script is meant to be used by poky's .b4-config. Ideally
the b4 prep --check part could be offloaded to `patchtest` once it
supports running on source different from OE-Core.

Note that b4 makes sure that an address doesn't appear twice in the
recipient list. There's also no priority in the type of recipient list,
so if the address appears first in Cc and then in To, only the Cc will
be added. The opposite is true as well.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 scripts/b4-wrapper-poky.py | 177 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/scripts/b4-wrapper-poky.py b/scripts/b4-wrapper-poky.py
new file mode 100755
index 0000000000000000000000000000000000000000..332194cd53ff8081154f308347e2158f771b0475
--- /dev/null
+++ b/scripts/b4-wrapper-poky.py
@@ -0,0 +1,177 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# This script is to be called by b4:
+# - through the b4.prep-perpatch-check-cmd with "prep-perpatch-check-cmd" as
+#   first argument,
+# - through b4.send-auto-cc-cmd with "send-auto-cc-cmd" as first argument,
+# - through b4.send-auto-to-cmd with "send-auto-to-cmd" as first argument,
+#
+# When prep-perpatch-check-cmd is passsed:
+#
+#  This checks that a patch makes changes to at most one project in the poky
+#  combo repo (that is, out of yocto-docs, bitbake, openembedded-core combined
+#  into poky and the poky-specific files).
+#
+#  Printing something to stdout in this file will result in b4 prep --check fail
+#  for the currently parsed patch.
+#
+#  It checks that all patches in the series make changes to at most one project.
+#
+# When send-auto-cc-cmd is passed:
+#
+#  This returns the list of Cc recipients for a patch.
+#
+# When send-auto-to-cmd is passed:
+#
+#  This returns the list of To recipients for a patch.
+#
+# This script takes as stdin a patch.
+
+import pathlib
+import re
+import subprocess
+import sys
+
+cmd = sys.argv[1]
+
+patch = sys.stdin.readlines()
+
+# Subject field is used to identify the last patch as this script is called for
+# each patch. We edit the same file in a series by using the References field
+# unique identifier to check which projects are modified by earlier patches in
+# the series. To avoid cluttering the disk, the last patch in the list removes
+# that shared file.
+re_subject = re.compile(r'^Subject:.*\[.*PATCH.*\s(\d+)/\1')
+re_ref = re.compile(r'^References: <(.*)>$')
+
+subject = None
+ref = None
+
+if subprocess.call(["which", "lsdiff"], stdout=subprocess.DEVNULL) != 0:
+    print("lsdiff missing from host, please install patchutils")
+    sys.exit(-1)
+
+try:
+    one_patch_series = False
+    for line in patch:
+        subject = re_subject.match(line)
+        if subject:
+            # Handle [PATCH 1/1]
+            if subject.group(1) == 1:
+                one_patch_series = True
+            break
+        if re.match(r'^Subject: .*\[.*PATCH[^/]*\]', line):
+            # Single patch is named [PATCH] but if there are prefix, it could be
+            # [PATCH prefix], so handle everything that doesn't have a /
+            # character which is used as separator between current patch number
+            # and total patch number
+            one_patch_series = True
+            break
+
+    if cmd == "prep-perpatch-check-cmd" and not one_patch_series:
+        for line in patch:
+            ref = re_ref.match(line)
+            if ref:
+                break
+
+        if not ref:
+            print("Failed to find ref to cover letter (References:)...")
+            sys.exit(-2)
+
+        ref = ref.group(1)
+        series_check = pathlib.Path(f".tmp-{ref}")
+
+    patch = "".join(patch)
+
+    if cmd == "send-auto-cc-cmd":
+        # Patches to BitBake documentation should also go to yocto-docs mailing list
+        project_paths = {
+                "yocto-docs": ["bitbake/doc/*"],
+        }
+    else:
+        project_paths = {
+                "bitbake": ["bitbake/*"],
+                "yocto-docs": ["documentation/*"],
+                "poky": [
+                    "meta-poky/*",
+                    "meta-yocto-bsp/*",
+                    "README.hardware.md",
+                    "README.poky.md",
+                    ],
+        }
+
+    # List of projects touched by this patch
+    projs = []
+
+    # Any file not matched by any path in project_paths means it is from
+    # OE-Core.
+    # When matching some path in project_paths, remove the matched files from
+    # that list.
+    files_left = subprocess.check_output(["lsdiff", "--strip-match=1", "--strip=1"],
+                                         input=patch, text=True)
+    files_left = set(files_left)
+
+    for proj, proj_paths in project_paths.items():
+        lsdiff_args = [f"--include={path}" for path in proj_paths]
+        files = subprocess.check_output(["lsdiff", "--strip-match=1", "--strip=1"] + lsdiff_args,
+                                        input=patch, text=True)
+        if len(files):
+            files_left = files_left - set(files)
+            projs.append(proj)
+            continue
+
+        # Handle patches made with --no-prefix
+        files = subprocess.check_output(["lsdiff"] + lsdiff_args,
+                                        input=patch, text=True)
+        if len(files):
+            files_left = files_left - set(files)
+            projs.append(proj)
+
+    # Catch-all for everything not poky-specific or in bitbake/yocto-docs
+    if len(files_left) and cmd != "send-auto-cc-cmd":
+        projs.append("openembedded-core")
+
+    if cmd == "prep-perpatch-check-cmd":
+        if len(projs) > 1:
+            print(f"Diff spans more than one project ({', '.join(sorted(projs))}), split into multiple commits...")
+            sys.exit(-3)
+
+        # No need to check other patches in the series as there aren't any
+        if one_patch_series:
+            sys.exit(0)
+
+        # This should be replaced once b4 supports prep-perseries-check-cmd (or something similar)
+
+        if series_check.exists():
+            # NOT race-free if b4 decides to parallelize prep-perpatch-check-cmd
+            series_projs = series_check.read_text().split('\n')
+        else:
+            series_projs = []
+
+        series_projs += projs
+        uniq_series_projs = set(series_projs)
+        # NOT race-free, if b4 decides to parallelize prep-perpatch-check-cmd
+        series_check.write_text('\n'.join(uniq_series_projs))
+
+        if len(uniq_series_projs) > 1:
+            print(f"Series spans more than one project ({', '.join(sorted(uniq_series_projs))}), split into multiple series...")
+            sys.exit(-4)
+    else:  # send-auto-cc-cmd / send-auto-to-cmd
+        ml_projs = {
+            "bitbake": "bitbake-devel@lists.openembedded.org",
+            "yocto-docs": "docs@lists.yoctoproject.org",
+            "poky": "poky@lists.yoctoproject.org",
+            "openembedded-core": "openembedded-core@lists.openembedded.org",
+        }
+
+        print("\n".join([ml_projs[ml] for ml in projs]))
+
+    sys.exit(0)
+finally:
+    # Last patch in the series, cleanup tmp file
+    if subject and ref and series_check.exists():
+        series_check.unlink()

-- 
2.48.1


