Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RRIAP-0003zz-UN
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 07:43:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAI6apfx018418
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 22:36:51 -0800 (PST)
Received: from localhost.localdomain (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 17 Nov 2011 22:36:51 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Nov 2011 14:36:39 +0800
Message-ID: <e1b1eb55f02eed20c1b1c84a0c95faf50175beec.1321598073.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321598073.git.kai.kang@windriver.com>
References: <cover.1321598073.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 1/1] mesa: fix calling host's commands
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Nov 2011 06:43:18 -0000
Content-Type: text/plain

mesa use its script file bin/mklib to generate libraries, and call the
host's commands "ar/ranlib/gcc/g++". Fix it to call the cross-compile
tools properly.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-graphics/mesa/mesa-7.11.inc           |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
 .../mesa/mesa/crossfix-mklib.patch                 |   71 ++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch

diff --git a/meta/recipes-graphics/mesa/mesa-7.11.inc b/meta/recipes-graphics/mesa/mesa-7.11.inc
index 746b764..2f14ed4 100644
--- a/meta/recipes-graphics/mesa/mesa-7.11.inc
+++ b/meta/recipes-graphics/mesa/mesa-7.11.inc
@@ -2,6 +2,7 @@ DEPENDS += "mesa-dri-glsl-native"
 
 SRC_URI += "file://uclibc.patch \
             file://crossfix.patch \
+            file://crossfix-mklib.patch \
            "
 SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
 SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 06ebb75..1d9c894 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r12"
+INC_PR = "r13"
 PE = "2"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
diff --git a/meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch b/meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch
new file mode 100644
index 0000000..dc08228
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch
@@ -0,0 +1,71 @@
+This patch is ported from WindRiver linux and to fix cross compile failure.
+
+And original commits are:
+commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
+commit 5c4212084b871a0c0fb7d174280ec9a634637deb
+
+Upstream-Status: Pending
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+--- Mesa-7.10.2/bin/mklib.orig	2011-09-28 16:15:34.170000074 +0800
++++ Mesa-7.10.2/bin/mklib	2011-09-28 16:15:42.370000073 +0800
+@@ -49,8 +49,8 @@
+                     /*) ;;
+                     *)  FILE="$ORIG_DIR/$FILE" ;;
+                 esac
+-                MEMBERS=`ar t $FILE`
+-                ar x $FILE
++                MEMBERS=`${AR} t $FILE`
++                ${AR} x $FILE
+                 for MEMBER in $MEMBERS ; do
+                     NEWFILES="$NEWFILES $DIR/$MEMBER"
+                 done
+@@ -77,7 +77,7 @@
+ make_ar_static_lib() {
+     OPTS=$1
+     shift;
+-    RANLIB=$1
++    USE_RANLIB=$1
+     shift;
+     LIBNAME=$1
+     shift;
+@@ -87,11 +87,11 @@
+     rm -f ${LIBNAME}
+ 
+     # make static lib
+-    ar ${OPTS} ${LIBNAME} ${OBJECTS}
++    ${AR} ${OPTS} ${LIBNAME} ${OBJECTS}
+ 
+     # run ranlib
+-    if [ ${RANLIB} = 1 ] ; then
+-        ranlib ${LIBNAME}
++    if [ ${USE_RANLIB} = 1 ] ; then
++        ${RANLIB} ${LIBNAME}
+     fi
+ 
+     echo ${LIBNAME}
+@@ -313,9 +313,9 @@
+ 	if [ "x$LINK" = "x" ] ; then
+ 	    # -linker was not specified so set default link command now
+             if [ $CPLUSPLUS = 1 ] ; then
+-                LINK=g++
++                LINK=$CXX
+             else
+-                LINK=gcc
++                LINK=$CC
+             fi
+ 	fi
+ 
+@@ -531,9 +531,9 @@
+ 	if [ "x$LINK" = "x" ] ; then
+ 	    # -linker was not specified so set default link command now
+             if [ $CPLUSPLUS = 1 ] ; then
+-                LINK=g++
++                LINK=${CXX}
+             else
+-                LINK=gcc
++                LINK=${CC}
+             fi
+ 	fi
+ 
-- 
1.7.5.4



