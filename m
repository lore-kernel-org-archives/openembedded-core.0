Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92E1C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 10:42:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10134.1747392132851836005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 03:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EBB3169C
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 03:42:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 251C23F673
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 03:42:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] buildstats-diff: find last two buildstats files if none are specified
Date: Fri, 16 May 2025 11:42:06 +0100
Message-ID: <20250516104206.983169-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 10:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216742

If no buildstats directories are specified, then find the last two runs
under BUILDDIR.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/buildstats-diff | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index c9aa76a8faf..df1df432f12 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -12,6 +12,7 @@ import glob
 import logging
 import math
 import os
+import pathlib
 import sys
 from operator import attrgetter
=20
@@ -251,11 +252,32 @@ Script for comparing buildstats of two separate bui=
lds."""
                              "average over them")
     parser.add_argument('--only-task', dest=3D'only_tasks', metavar=3D'T=
ASK', action=3D'append', default=3D[],
                         help=3D"Only include TASK in report. May be spec=
ified multiple times")
-    parser.add_argument('buildstats1', metavar=3D'BUILDSTATS1', help=3D"=
'Left' buildstat")
-    parser.add_argument('buildstats2', metavar=3D'BUILDSTATS2', help=3D"=
'Right' buildstat")
+    parser.add_argument('buildstats1', metavar=3D'BUILDSTATS1', nargs=3D=
"?", help=3D"'Left' buildstat")
+    parser.add_argument('buildstats2', metavar=3D'BUILDSTATS2', nargs=3D=
"?", help=3D"'Right' buildstat")
=20
     args =3D parser.parse_args(argv)
=20
+    if args.buildstats1 and args.buildstats2:
+        # Both paths specified
+        pass
+    elif args.buildstats1 or args.buildstats2:
+        # Just one path specified, this is an error
+        parser.print_usage(sys.stderr)
+        print("Either specify two buildstats paths, or none to use the l=
ast two paths.", file=3Dsys.stderr)
+        sys.exit(1)
+    else:
+        # No paths specified, try to find the last two buildstats
+        try:
+            buildstats_dir =3D pathlib.Path(os.environ["BUILDDIR"]) / "t=
mp" / "buildstats"
+            paths =3D sorted(buildstats_dir.iterdir())
+            args.buildstats2 =3D paths.pop()
+            args.buildstats1 =3D paths.pop()
+            print(f"Comparing {args.buildstats1} -> {args.buildstats2}\n=
")
+        except KeyError:
+            parser.print_usage(sys.stderr)
+            print("Build environment has not been configured, cannot fin=
d buildstats", file=3Dsys.stderr)
+            sys.exit(1)
+
     # We do not nedd/want to read all buildstats if we just want to look=
 at the
     # package versions
     if args.ver_diff:
--=20
2.43.0


