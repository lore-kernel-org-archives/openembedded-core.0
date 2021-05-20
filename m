Received: from nebuchadnezzar.corp.vecima.com (nebuchadnezzar.corp.vecima.com [204.83.204.143])
 by mx.groups.io with SMTP id smtpd.web09.11403.1621529921621569250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 09:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: nebuchadnezzar.corp.vecima.com, ip: 204.83.204.143, mailfrom: dan@nebuchadnezzar.corp.vecima.com)
Received: by nebuchadnezzar.corp.vecima.com (Postfix, from userid 1001)
	id 546925C314C; Thu, 20 May 2021 10:58:40 -0600 (CST)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH] bison: Make libtextstyle and libreadline optional
Date: Thu, 20 May 2021 10:58:20 -0600
Message-Id: <20210520165820.959446-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Bison opportunistically enables libtextstyle and libreadline support
if they're installed on the build host. Since textstyle and readline
aren't part of uninative avoid host contamination by making their
support configurable and disabled by default in the native case.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/bison/bison_3.7.6.bb | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_3.7.6.bb b/meta/recipes-de=
vtools/bison/bison_3.7.6.bb
index a7f01c3299..a8d57f2742 100644
--- a/meta/recipes-devtools/bison/bison_3.7.6.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.6.bb
@@ -15,10 +15,25 @@ SRC_URI =3D "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] =3D "67d68ce1e22192050525643fc0a7a22297576682bef6a5c5=
1446903f5aeef3cf"
=20
+inherit autotools gettext texinfo
+
 # No point in hardcoding path to m4, just use PATH
-EXTRA_OECONF +=3D "M4=3Dm4"
+CACHED_CONFIGUREVARS =3D "ac_cv_path_M4=3Dm4"
=20
-inherit autotools gettext texinfo
+PACKAGECONFIG ??=3D "readline ${@ 'textstyle' if d.getVar('USE_NLS') =3D=
=3D 'yes' else ''}"
+PACKAGECONFIG_class-native ??=3D ""
+
+# Make readline and textstyle optional. There are recipie for these, but=
 leave them
+# disabled for the native recipe. This prevents host contamination of th=
e native tool.
+PACKAGECONFIG[readline] =3D "--with-libreadline-prefix,--without-libread=
line-prefix,readline"
+PACKAGECONFIG[textstyle] =3D "--with-libtextstyle-prefix,--without-libte=
xtstyle-prefix,gettext"
+
+# Include the cached configure variables, configure is really good at fi=
nding
+# libreadline, even if we don't want it.
+CACHED_CONFIGUREVARS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'readli=
ne', '', ' \
+                           ac_cv_header_readline_history_h=3Dno \
+                           ac_cv_header_readline_readline_h=3Dno \
+                           gl_cv_lib_readline=3Dno', d)}"
=20
 # The automatic m4 path detection gets confused, so force the right valu=
e
 acpaths =3D "-I ./m4"
--=20
2.31.1

