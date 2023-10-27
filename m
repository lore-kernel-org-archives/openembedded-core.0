Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1CDC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:29:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9800.1698420585696344424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 08:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 869E91424;
	Fri, 27 Oct 2023 08:30:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A64C3F64C;
	Fri, 27 Oct 2023 08:29:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] scripts/contrib/patchreview: consolidate imports
Date: Fri, 27 Oct 2023 16:29:41 +0100
Message-Id: <20231027152941.232042-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027152941.232042-1-ross.burton@arm.com>
References: <20231027152941.232042-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 15:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189749

From: Ross Burton <ross.burton@arm.com>

Move most imports to the top of the file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/contrib/patchreview.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview=
.py
index 36038d06d2e..f95cadab0c6 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -5,6 +5,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
=20
+import argparse
+import collections
+import json
+import os
+import os.path
+import pathlib
+import re
+import subprocess
+
 # TODO
 # - option to just list all broken files
 # - test suite
@@ -35,14 +44,12 @@ def blame_patch(patch):
     From a patch filename, return a list of "commit summary (author name=
 <author
     email>)" strings representing the history.
     """
-    import subprocess
     return subprocess.check_output(("git", "log",
                                     "--follow", "--find-renames", "--dif=
f-filter=3DA",
                                     "--format=3D%s (%aN <%aE>)",
                                     "--", patch)).decode("utf-8").splitl=
ines()
=20
 def patchreview(patches):
-    import re, os.path
=20
     # General pattern: start of line, optional whitespace, tag with opti=
onal
     # hyphen or spaces, maybe a colon, some whitespace, then the value, =
all case
@@ -192,6 +199,7 @@ Patches in Pending state: %s""" % (total_patches,
 def histogram(results):
     from toolz import recipes, dicttoolz
     import math
+
     counts =3D recipes.countby(lambda r: r.upstream_status, results.valu=
es())
     bars =3D dicttoolz.valmap(lambda v: "#" * int(math.ceil(float(v) / l=
en(results) * 100)), counts)
     for k in bars:
@@ -226,8 +234,6 @@ def count_recipes(layers):
     return count
=20
 if __name__ =3D=3D "__main__":
-    import argparse, subprocess, os, pathlib
-
     args =3D argparse.ArgumentParser(description=3D"Patch Review Tool")
     args.add_argument("-b", "--blame", action=3D"store_true", help=3D"sh=
ow blame for malformed patches")
     args.add_argument("-v", "--verbose", action=3D"store_true", help=3D"=
show per-patch results")
@@ -243,7 +249,6 @@ if __name__ =3D=3D "__main__":
     analyse(results, want_blame=3Dargs.blame, verbose=3Dargs.verbose)
=20
     if args.json:
-        import json, os.path, collections
         if os.path.isfile(args.json):
             data =3D json.load(open(args.json))
         else:
--=20
2.34.1


