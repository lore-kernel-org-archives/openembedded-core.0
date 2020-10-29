Received: from mail.bubus.at (mail.bubus.at [81.19.156.191])
 by mx.groups.io with SMTP id smtpd.web11.1342.1603995628740446320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 11:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bubus.at, ip: 81.19.156.191, mailfrom: dev@bubus.at)
Received: from brokenbit.skidata.net (83-215-125-121.lhau.dyn.salzburg-online.at [83.215.125.121])
	by mail.bubus.at (Postfix) with ESMTPSA id 66EA16C20001;
	Thu, 29 Oct 2020 19:20:25 +0100 (CET)
From: "Richard Leitner" <richard.leitner@skidata.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH] deb: export INTERCEPT_DIR for remove actions
Date: Thu, 29 Oct 2020 19:20:14 +0100
Message-Id: <20201029182014.19085-1-dev@bubus.at>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Richard Leitner <richard.leitner@skidata.com>

During the do_populate_sdk task apt-get purge is called by deb's remove
function. This fails with error messages similiar to the following one
if any of the included packages uses intercepts as the INTERCEPT_DIR
isn't exported:

.../*.postinst: line 4: /postinst_intercept: No such file or directory

Therefore fix it by exporting the INTERCEPT_DIR variable within the
remove function.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/lib/oe/package_manager/deb/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/pa=
ckage_manager/deb/__init__.py
index 6c56991911..10ad707c23 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -312,6 +312,8 @@ class DpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
=20
+        os.environ['INTERCEPT_DIR'] =3D self.intercepts_dir
+
         if with_dependencies:
             os.environ['APT_CONFIG'] =3D self.apt_conf_file
             cmd =3D "%s purge %s" % (self.apt_get_cmd, ' '.join(pkgs))
--=20
2.28.0

