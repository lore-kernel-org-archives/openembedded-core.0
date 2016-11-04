Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 19F686AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 11:06:20 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id A4B28A001F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 12:06:55 +0100 (CET)
Received: from lws-mklieser.phytec.de ([172.16.25.207])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016110412062061-28019 ;
	Fri, 4 Nov 2016 12:06:20 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 4 Nov 2016 12:06:46 +0100
Message-Id: <1478257606-15637-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.11.2016 12:06:20,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.11.2016 12:06:20
X-TNEFEvaluated: 1
Subject: [PATCH] u-boot: mkimage: fix build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 11:06:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This fixes the mkimage build for situations where HOSTCC and friends
need to be overridden and the u-boot makefile defaults don't work.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 ...file-improve-cross=5Ftools-target-usability.patch | 35 ++++++++++++++++=
++
 ...ile-add-override-statements-for-cross=5Ftoo.patch | 41 ++++++++++++++++=
++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage=5F2016.03.bb  |  8 ++++-
 3 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0001-tools-Makef=
ile-improve-cross=5Ftools-target-usability.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0002-tools-Makef=
ile-add-override-statements-for-cross=5Ftoo.patch

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-tools-Makefile-imp=
rove-cross=5Ftools-target-usability.patch b/meta/recipes-bsp/u-boot/u-boot-=
mkimage/0001-tools-Makefile-improve-cross=5Ftools-target-usability.patch
new file mode 100644
index 0000000..4b0d0e8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-tools-Makefile-improve-cr=
oss=5Ftools-target-usability.patch
@@ -0,0 +1,35 @@
+From ad129135402b38deeb37383c86781341cf239b6a Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kliese=
r@phytec.de>
+Date: Mon, 31 Oct 2016 10:30:18 +0100
+Subject: [PATCH 1/2] tools: Makefile: improve cross=5Ftools target usabili=
ty
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When building the cross=5Ftools target, HOSTCFLAGS and HOSTLDFLAGS will
+propagate to the target build. This should not happen and is easy to
+prevent.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+---
+ tools/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 400588c..305336c 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -263,6 +263,8 @@ subdir- +=3D env
+=20
+ ifneq ($(CROSS=5FBUILD=5FTOOLS),)
+ HOSTCC =3D $(CC)
++HOSTCFLAGS =3D $(CFLAGS)
++HOSTLDFLAGS =3D $(LDFLAGS)
+=20
+ quiet=5Fcmd=5Fcrosstools=5Fstrip =3D STRIP   $^
+       cmd=5Fcrosstools=5Fstrip =3D $(STRIP) $^; touch $@
+--=20
+1.9.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-tools-Makefile-add=
-override-statements-for-cross=5Ftoo.patch b/meta/recipes-bsp/u-boot/u-boot=
-mkimage/0002-tools-Makefile-add-override-statements-for-cross=5Ftoo.patch
new file mode 100644
index 0000000..4c7b6d0
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-tools-Makefile-add-overri=
de-statements-for-cross=5Ftoo.patch
@@ -0,0 +1,41 @@
+From 2772e2ad0e097590e77fa338295d839d6ae6037c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kliese=
r@phytec.de>
+Date: Thu, 3 Nov 2016 08:48:02 +0100
+Subject: [PATCH 2/2] tools: Makefile: add override statements for cross=5F=
tools
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes the use case where one needs to override the host compiler
+flags for building the target tools. Usually the Makefile will build the
+basic tools first using the hostcc. After that cc will be assigned to
+hostcc to build the target tools. So in this scenario overriding HOSTCC
+fails to build. Using the override statement is one possible fix.
+
+Upstream-Status: Pending
+
+Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+---
+ tools/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 305336c..9cb1607 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -262,9 +262,9 @@ $(LICENSE=5FH): $(obj)/bin2header $(srctree)/Licenses/=
gpl-2.0.txt
+ subdir- +=3D env
+=20
+ ifneq ($(CROSS=5FBUILD=5FTOOLS),)
+-HOSTCC =3D $(CC)
+-HOSTCFLAGS =3D $(CFLAGS)
+-HOSTLDFLAGS =3D $(LDFLAGS)
++override HOSTCC =3D $(CC)
++override HOSTCFLAGS =3D $(CFLAGS)
++override HOSTLDFLAGS =3D $(LDFLAGS)
+=20
+ quiet=5Fcmd=5Fcrosstools=5Fstrip =3D STRIP   $^
+       cmd=5Fcrosstools=5Fstrip =3D $(STRIP) $^; touch $@
+--=20
+1.9.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage=5F2016.03.bb b/meta/rec=
ipes-bsp/u-boot/u-boot-mkimage=5F2016.03.bb
index 5025961..0749408 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage=5F2016.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage=5F2016.03.bb
@@ -3,7 +3,13 @@ require u-boot-common=5F${PV}.inc
 SUMMARY =3D "U-Boot bootloader image creation tool"
 DEPENDS =3D "openssl"
=20
-EXTRA=5FOEMAKE =3D 'CROSS=5FCOMPILE=3D"${TARGET=5FPREFIX}" CC=3D"${CC} ${C=
FLAGS} ${LDFLAGS}" STRIP=3Dtrue V=3D1'
+SRC=5FURI +=3D " \
+    file://0001-tools-Makefile-improve-cross=5Ftools-target-usability.patc=
h \
+    file://0002-tools-Makefile-add-override-statements-for-cross=5Ftoo.pat=
ch \
+"
+
+EXTRA=5FOEMAKE =3D 'CROSS=5FCOMPILE=3D"${TARGET=5FPREFIX}" CC=3D"${CC}" CF=
LAGS=3D"${CFLAGS}" LDFLAGS=3D"${LDFLAGS}" STRIP=3Dtrue V=3D1'
+EXTRA=5FOEMAKE +=3D 'HOSTCC=3D"${BUILD=5FCC}" HOSTCFLAGS=3D"${BUILD=5FCFLA=
GS}" HOSTLDFLAGS=3D"${BUILD=5FLDFLAGS}"'
=20
 do=5Fcompile () {
 	oe=5Frunmake sandbox=5Fdefconfig
--=20
1.9.1


