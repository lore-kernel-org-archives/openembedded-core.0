Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12736.1600174592888427754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 05:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AFDD1FB
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 05:56:31 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 289B43F718
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 05:56:31 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildhistory-diff: use BUILDDIR to know where buildhistory is
Date: Tue, 15 Sep 2020 13:55:48 +0100
Message-Id: <20200915125548.502859-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of assuming that the buildhistory is stored in ./buildhistory
unless told otherwise, use the environment variable BUILDDIR if present
(which is set by oe-init-build-env) to locate the buildhistory
directory.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/buildhistory-diff | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 833f7c33a5..3bd40a2a1e 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -28,10 +28,12 @@ def get_args_parser():
     %(prog)s [options] [from-revision [to-revision]]
     (if not specified, from-revision defaults to build-minus-1, and to-r=
evision defaults to HEAD)""")
=20
+    default_dir =3D os.path.join(os.environ.get('BUILDDIR', '.'), 'build=
history')
+
     parser.add_argument('-p', '--buildhistory-dir',
                         action=3D'store',
                         dest=3D'buildhistory_dir',
-                        default=3D'buildhistory/',
+                        default=3Ddefault_dir,
                         help=3D"Specify path to buildhistory directory (=
defaults to buildhistory/ under cwd)")
     parser.add_argument('-v', '--report-version',
                         action=3D'store_true',
@@ -80,11 +82,6 @@ def main():
         parser.print_help()
=20
         sys.exit(1)
-    if not os.path.exists(args.buildhistory_dir):
-        if args.buildhistory_dir =3D=3D 'buildhistory/':
-            cwd =3D os.getcwd()
-            if os.path.basename(cwd) =3D=3D 'buildhistory':
-                args.buildhistory_dir =3D cwd
=20
     if not os.path.exists(args.buildhistory_dir):
         sys.stderr.write('Buildhistory directory "%s" does not exist\n\n=
' % args.buildhistory_dir)
--=20
2.28.0

