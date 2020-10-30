Received: from mail.bubus.at (mail.bubus.at [81.19.156.191])
 by mx.groups.io with SMTP id smtpd.web11.13838.1604065581839551156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 06:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bubus.at, ip: 81.19.156.191, mailfrom: dev@bubus.at)
Received: from brokenbit.skidata.net (83-215-125-121.lhau.dyn.salzburg-online.at [83.215.125.121])
	by mail.bubus.at (Postfix) with ESMTPSA id 7F4C36C20001;
	Fri, 30 Oct 2020 14:46:15 +0100 (CET)
From: "Richard Leitner" <richard.leitner@skidata.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Leitner <richard.leitner@skidata.com>
Subject: [dunfell][PATCH] xcb-proto: backport fix for python gcd function
Date: Fri, 30 Oct 2020 14:45:51 +0100
Message-Id: <20201030134551.44013-1-dev@bubus.at>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Richard Leitner <richard.leitner@skidata.com>

This backports the fix [1] for the following build error for nativesdk on
Fedora 33 which is caused by the removal of fractions.gcd() in favor of
math.gcd() in python 3.9 [2]:

ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/python=
3.9/fractions.py)

[1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35be=
e1fa0fdb8b5120b1dcd20cee6e34512
[2] https://bugs.python.org/issue39350

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...1-xcbgen-use-math-gcd-for-python-3-5.patch | 40 +++++++++++++++++++
 .../xorg-proto/xcb-proto_1.13.bb              |  3 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbge=
n-use-math-gcd-for-python-3-5.patch

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-m=
ath-gcd-for-python-3-5.patch b/meta/recipes-graphics/xorg-proto/xcb-proto=
/0001-xcbgen-use-math-gcd-for-python-3-5.patch
new file mode 100644
index 0000000000..f9f4424da5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-gcd=
-for-python-3-5.patch
@@ -0,0 +1,40 @@
+From 426ae35bee1fa0fdb8b5120b1dcd20cee6e34512 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Esser?=3D <besser82@fedoraproject.o=
rg>
+Date: Mon, 1 Jun 2020 12:24:16 +0200
+Subject: [PATCH] xcbgen: Use math.gcd() for Python >=3D 3.5.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+fractions.gcd() has been deprecated since Python 3.5, and
+was finally dropped in Python 3.9.  It is recommended to
+use math.gcd() instead.
+
+Signed-off-by: Bj=C3=B6rn Esser <besser82@fedoraproject.org>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/proto/xcb=
proto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512]
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ xcbgen/align.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/xcbgen/align.py b/xcbgen/align.py
+index d4c12ee..5c4f517 100644
+--- a/xcbgen/align.py
++++ b/xcbgen/align.py
+@@ -2,7 +2,12 @@
+ This module contains helper classes for alignment arithmetic and checks
+ '''
+=20
+-from fractions import gcd
++from sys import version_info
++
++if version_info[:2] >=3D (3, 5):
++    from math import gcd
++else:
++    from fractions import gcd
+=20
+ class Alignment(object):
+=20
+--=20
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb b/meta/re=
cipes-graphics/xorg-proto/xcb-proto_1.13.bb
index 7467090920..1f41821302 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
@@ -11,7 +11,8 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd763b081cb10c223435b01e00dc0a=
ba7 \
                     file://src/dri2.xml;beginline=3D2;endline=3D28;md5=3D=
f8763b13ff432e8597e0d610cf598e65"
=20
-SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
+SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \
+           file://0001-xcbgen-use-math-gcd-for-python-3-5.patch"
 SRC_URI[md5sum] =3D "abe9aa4886138150bbc04ae4f29b90e3"
 SRC_URI[sha256sum] =3D "7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271=
e47a2fe875e2bde1"
=20
--=20
2.28.0

