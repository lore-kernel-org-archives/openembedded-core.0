Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.1166.1588097903081714155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 11:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03SIILSg026354
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 11:18:21 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 11:18:02 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1][v2] re2c: advance to version 1.3
Date: Tue, 28 Apr 2020 11:18:02 -0700
Message-ID: <20200428181802.37502-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 03SIILSg026354
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The locations of release archives have changed.  We change to pulling
source from the git repo.  Remove PV from the recipe name.

Fix CVE-2020-11958 which applies to versions 1.2 and 1.3.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-support/re2c/re2c/cve-2020-11958.patch | 48 ++++++++++++++++=
++++++
 meta/recipes-support/re2c/re2c_1.0.1.bb            | 14 -------
 meta/recipes-support/re2c/re2c_git.bb              | 24 +++++++++++
 3 files changed, 72 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-support/re2c/re2c/cve-2020-11958.patch
 delete mode 100644 meta/recipes-support/re2c/re2c_1.0.1.bb
 create mode 100644 meta/recipes-support/re2c/re2c_git.bb

diff --git a/meta/recipes-support/re2c/re2c/cve-2020-11958.patch b/meta/r=
ecipes-support/re2c/re2c/cve-2020-11958.patch
new file mode 100644
index 0000000..95a1cb9
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/cve-2020-11958.patch
@@ -0,0 +1,48 @@
+From c4603ba5ce229db83a2a4fb93e6d4b4e3ec3776a Mon Sep 17 00:00:00 2001
+From: Ulya Trofimovich <skvadrik@gmail.com>
+Date: Fri, 17 Apr 2020 22:47:14 +0100
+Subject: [oe-core][PATCH 1/1] Fix crash in lexer refill (reported by Ago=
stino
+ Sarubbo).
+
+The crash happened in a rare case of a very long lexeme that doen't fit
+into the buffer, forcing buffer reallocation.
+
+The crash was caused by an incorrect calculation of the shift offset
+(it was smaller than necessary). As a consequence, the data from buffer
+start and up to the beginning of the current lexeme was not discarded
+(as it should have been), resulting in less free space for new data than
+expected.
+---
+ src/parse/scanner.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+---
+
+CVE: CVE-2020-11958
+
+Upstream-Status: Backport [github.com/skvadrik/re2c.git]
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+diff --git a/src/parse/scanner.cc b/src/parse/scanner.cc
+index 1d6e9ef..bd65131 100644
+--- a/src/parse/scanner.cc
++++ b/src/parse/scanner.cc
+@@ -155,13 +155,14 @@ bool Scanner::fill(size_t need)
+         if (!buf) fatal("out of memory");
+=20
+         memmove(buf, tok, copy);
+-        shift_ptrs_and_fpos(buf - bot);
++        shift_ptrs_and_fpos(buf - tok);
+         delete [] bot;
+         bot =3D buf;
+=20
+         free =3D BSIZE - copy;
+     }
+=20
++    DASSERT(lim + free <=3D bot + BSIZE);
+     if (!read(free)) {
+         eof =3D lim;
+         memset(lim, 0, YYMAXFILL);
+--=20
+2.7.4
+
diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-suppo=
rt/re2c/re2c_1.0.1.bb
deleted file mode 100644
index 4ed8d25..0000000
--- a/meta/recipes-support/re2c/re2c_1.0.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "Tool for writing very fast and very flexible scanners"
-HOMEPAGE =3D "http://re2c.sourceforge.net/"
-AUTHOR =3D "Marcus B=C3=B6rger <helly@users.sourceforge.net>"
-SECTION =3D "devel"
-LICENSE =3D "PD"
-LIC_FILES_CHKSUM =3D "file://README;beginline=3D146;md5=3D881056c9add17f=
8019ccd8c382ba963a"
-
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] =3D "e2c6cf52fc6a21595f21bc82db5324f8"
-SRC_URI[sha256sum] =3D "605058d18a00e01bfc32aebf83af35ed5b13180b4e9f279c=
90843afab2c66c7c"
-
-BBCLASSEXTEND =3D "native"
-
-inherit autotools
diff --git a/meta/recipes-support/re2c/re2c_git.bb b/meta/recipes-support=
/re2c/re2c_git.bb
new file mode 100644
index 0000000..1922d49
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c_git.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Tool for writing very fast and very flexible scanners"
+HOMEPAGE =3D "http://re2c.sourceforge.net/"
+AUTHOR =3D "Marcus B=C3=B6rger <helly@users.sourceforge.net>"
+SECTION =3D "devel"
+LICENSE =3D "PD"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64eca4d8a3b67f9dc7656094731a2=
c8d"
+
+SRC_URI =3D  "git://github.com/skvadrik/re2c.git \
+            file://cve-2020-11958.patch \
+           "
+
+# rev of 1.3 tag
+#
+SRCREV =3D "e1901b71c6414c510f10f4cc30c0a05600e55ed1"
+PV =3D "1.3"
+
+inherit autotools
+
+# override the default S
+#
+S =3D "${WORKDIR}/git"
+
+BBCLASSEXTEND =3D "native"
+
--=20
2.7.4

