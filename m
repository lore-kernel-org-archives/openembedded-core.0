Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web08.7842.1609214165702191175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 19:56:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from misaki.hotel.hz.sumomo.pri (unknown [192.168.10.3])
	by kozue.soulik.info (Postfix) with ESMTPA id 0352E100029;
	Tue, 29 Dec 2020 12:55:47 +0900 (JST)
From: "Randy Li" <ayaka@soulik.info>
To: openembedded-core@lists.openembedded.org
Cc: Randy Li <ayaka@soulik.info>
Subject: [PATCH v2 1/2] meson: don't turn sting into a list in nativesdk
Date: Tue, 29 Dec 2020 11:55:49 +0800
Message-Id: <20201229035550.226617-2-ayaka@soulik.info>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201229035550.226617-1-ayaka@soulik.info>
References: <20201229035550.226617-1-ayaka@soulik.info>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In the current version of meson, some path variables only
accept a string not a list.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 meta/recipes-devtools/meson/meson/meson-setup.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/reci=
pes-devtools/meson/meson/meson-setup.py
index 808e2a062f..7acfe373fa 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -10,9 +10,13 @@ class Template(string.Template):
 class Environ():
     def __getitem__(self, name):
         val =3D os.environ[name]
-        val =3D ["'%s'" % x for x in val.split()]
-        val =3D ', '.join(val)
-        val =3D '[%s]' % val
+        val =3D val.split()
+        if len(val) > 1:
+            val =3D ["'%s'" % x for x in val]
+            val =3D ', '.join(val)
+            val =3D '[%s]' % val
+        else:
+            if val: val =3D "'%s'" % val.pop()
         return val
=20
 try:
--=20
2.29.2

