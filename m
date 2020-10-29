Received: from mail.bubus.at (mail.bubus.at [81.19.156.191])
 by mx.groups.io with SMTP id smtpd.web11.6560.1603966030275946983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 03:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bubus.at, ip: 81.19.156.191, mailfrom: dev@bubus.at)
Received: from brokenbit.skidata.net (83-215-125-121.lhau.dyn.salzburg-online.at [83.215.125.121])
	by mail.bubus.at (Postfix) with ESMTPSA id AEDE46C20001;
	Thu, 29 Oct 2020 11:07:08 +0100 (CET)
From: "Richard Leitner" <richard.leitner@skidata.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH] deb: replace deprecated apt force-yes argument
Date: Thu, 29 Oct 2020 11:07:02 +0100
Message-Id: <20201029100702.7806-1-dev@bubus.at>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Richard Leitner <richard.leitner@skidata.com>

apt-get deprecated --force-yes in favor of various options starting with
--allow [1]. Replace it to avoid the following warning:

W: --force-yes is deprecated, use one of the options starting with --allo=
w instead.

[1] https://salsa.debian.org/apt-team/apt/-/blob/master/debian/changelog

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/lib/oe/package_manager/deb/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/pa=
ckage_manager/deb/__init__.py
index 67c241a6f6..6c56991911 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -282,7 +282,7 @@ class DpkgPM(OpkgDpkgPM):
=20
         os.environ['APT_CONFIG'] =3D self.apt_conf_file
=20
-        cmd =3D "%s %s install --force-yes --allow-unauthenticated --no-=
remove %s" % \
+        cmd =3D "%s %s install --allow-downgrades --allow-remove-essenti=
al --allow-change-held-packages --allow-unauthenticated --no-remove %s" %=
 \
               (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
=20
         try:
--=20
2.28.0

