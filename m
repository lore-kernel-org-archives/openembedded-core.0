Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EAEC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 16:43:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.343.1692981827692942597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 09:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F632D75;
	Fri, 25 Aug 2023 09:44:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5B813F64C;
	Fri, 25 Aug 2023 09:43:46 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][mickledore 1/2] linux-yocto: add script to generate kernel CVE_CHECK_IGNORE entries
Date: Fri, 25 Aug 2023 17:43:40 +0100
Message-Id: <20230825164341.2145585-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 16:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186714

From: Ross Burton <ross.burton@arm.com>

Instead of manually looking up new CVEs and determining what point
releases the fixes are incorporated into, add a script to generate the
CVE_CHECK_IGNORE data automatically.

First, note that this is very much an interim solution until the
cve-check class fetches data from www.linuxkernelcves.com directly.

The script should be passed the path to a local clone of the
linuxkernelcves repository[1] and the kernel version number. It will
then write to standard output the CVE_STATUS entries for every known
kernel CVE.

The script should be periodically reran as CVEs are backported and
kernels upgraded frequently.

[1] https://github.com/nluedtke/linux_kernel_cves

Note: for the backport this is not a cherry-pick of the commit in master
as the variable names are different. This incorporates the following
commits:

linux/generate-cve-exclusions: add version check warning
linux/generate-cve-exclusions.py: fix comparison
linux-yocto: add script to generate kernel CVE_STATUS entries

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/generate-cve-exclusions.py          | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100755 meta/recipes-kernel/linux/generate-cve-exclusions.py

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/=
recipes-kernel/linux/generate-cve-exclusions.py
new file mode 100755
index 00000000000..b9b87f245d6
--- /dev/null
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -0,0 +1,101 @@
+#! /usr/bin/env python3
+
+# Generate granular CVE status metadata for a specific version of the ke=
rnel
+# using data from linuxkernelcves.com.
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import argparse
+import datetime
+import json
+import pathlib
+import re
+
+from packaging.version import Version
+
+
+def parse_version(s):
+    """
+    Parse the version string and either return a packaging.version.Versi=
on, or
+    None if the string was unset or "unk".
+    """
+    if s and s !=3D "unk":
+        # packaging.version.Version doesn't approve of versions like v5.=
12-rc1-dontuse
+        s =3D s.replace("-dontuse", "")
+        return Version(s)
+    return None
+
+
+def main(argp=3DNone):
+    parser =3D argparse.ArgumentParser()
+    parser.add_argument("datadir", type=3Dpathlib.Path, help=3D"Path to =
a clone of https://github.com/nluedtke/linux_kernel_cves")
+    parser.add_argument("version", type=3DVersion, help=3D"Kernel versio=
n number to generate data for, such as 6.1.38")
+
+    args =3D parser.parse_args(argp)
+    datadir =3D args.datadir
+    version =3D args.version
+    base_version =3D f"{version.major}.{version.minor}"
+
+    with open(datadir / "data" / "kernel_cves.json", "r") as f:
+        cve_data =3D json.load(f)
+
+    with open(datadir / "data" / "stream_fixes.json", "r") as f:
+        stream_data =3D json.load(f)
+
+    print(f"""
+# Auto-generated CVE metadata, DO NOT EDIT BY HAND.
+# Generated at {datetime.datetime.now()} for version {version}
+
+python check_kernel_cve_status_version() {{
+    this_version =3D "{version}"
+    kernel_version =3D d.getVar("LINUX_VERSION")
+    if kernel_version !=3D this_version:
+        bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
+}}
+do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
+""")
+
+    for cve, data in cve_data.items():
+        if "affected_versions" not in data:
+            print(f"# Skipping {cve}, no affected_versions")
+            print()
+            continue
+
+        affected =3D data["affected_versions"]
+        first_affected, last_affected =3D re.search(r"(.+) to (.+)", aff=
ected).groups()
+        first_affected =3D parse_version(first_affected)
+        last_affected =3D parse_version(last_affected)
+
+        handled =3D False
+        if not last_affected:
+            print(f"# {cve} has no known resolution")
+        elif first_affected and version < first_affected:
+            print(f"# fixed-version: only affects {first_affected} onwar=
ds")
+            handled =3D True
+        elif last_affected < version:
+            print(f"# fixed-version: Fixed after version {last_affected}=
")
+            handled =3D True
+        else:
+            if cve in stream_data:
+                backport_data =3D stream_data[cve]
+                if base_version in backport_data:
+                    backport_ver =3D Version(backport_data[base_version]=
["fixed_version"])
+                    if backport_ver <=3D version:
+                        print(f"# cpe-stable-backport: Backported in {ba=
ckport_ver}")
+                        handled =3D True
+                    else:
+                        # TODO print a note that the kernel needs bumpin=
g
+                        print(f"# {cve} needs backporting (fixed from {b=
ackport_ver})")
+                else:
+                    print(f"# {cve} needs backporting (fixed from {last_=
affected})")
+            else:
+                print(f"# {cve} needs backporting (fixed from {last_affe=
cted})")
+
+        if handled:
+            print(f'CVE_CHECK_IGNORE +=3D "{cve}"')
+
+        print()
+
+
+if __name__ =3D=3D "__main__":
+    main()
--=20
2.34.1


