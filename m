Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1REHJb-0006vx-U0
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:11:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9D95Fut004371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:05:15 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 13 Oct 2011 02:05:15 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 17:05:33 +0800
Message-ID: <57a9134211e3be47d7072ad2b1aa06b443a95927.1318496401.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318496401.git.kai.kang@windriver.com>
References: <cover.1318496401.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 1/4] mesa-dri/xlib: use target commands in mklib file
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
X-List-Received-Date: Thu, 13 Oct 2011 09:11:01 -0000
Content-Type: text/plain

the bin/mklib file in mesa-dri/xlib source code uses commands on
hosts, this may cause build failed on some platform.

Patches are from WindRiver Linux, and CQID are:
    WIND00266791
    WIND00266497

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../mesa-use-target-commands-in-mklib.patch        |  104 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    3 +-
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    3 +-
 3 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands-in-mklib.patch

diff --git a/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands-in-mklib.patch b/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands-in-mklib.patch
new file mode 100644
index 0000000..1bc2a57
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands-in-mklib.patch
@@ -0,0 +1,104 @@
+This patch is merged from WindRiver linux commits, and it is to avoid build failed on some platform because of using the commands on host.
+
+And original commits are:
+
+commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
+Author: Yulong Pei <Yulong.pei@windriver.com>
+Date:   Tue Apr 12 22:14:10 2011 +0800
+
+    fix mesa-dri build fails on x86-64
+    
+    CQID: WIND00266791
+    
+    1. mesa-dri uses it's own script (mklib) to generate libraries, and it
+    calls the host's ar/ranlib/gcc/g++. This fixes mklib so that it calls the
+    cross-compiling tools properly.
+    
+    2. override PYTHON2 with 'python', 'python2' is not available in host-tools python.
+    Only 'python' and 'python2.6' are provided. So force configure to use 'python'.
+    
+    And the above two changes are ported from mesa-xlib.
+    
+    Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
+commit 5c4212084b871a0c0fb7d174280ec9a634637deb
+Author: Bowen <Bowen.zhu@windriver.com>
+Date:   Mon Apr 11 16:25:02 2011 +0800
+
+    Fix freeglut build failed for mips64_octeon-glibc_std_xapps
+    
+    CQID: 266497
+    
+    freeglut build failed on some hosts, because of mesa-xlib uses host ar command,
+    in some hosts, host ar command can't recognize target library, which will make some
+    symbols in libGL undefined.
+    
+    The fix is modifing mklib script in mesa-xlib, change fixed "ar" command to variable
+    $AR that set by our LDAT.
+
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
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 6fc8d95..0f026b1 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -9,11 +9,12 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
 DEPENDS += "mesa-dri-glsl-native"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://crossfix.patch \
            file://uclibc.patch \
+           file://mesa-use-target-commands-in-mklib.patch \
           "
 
 SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index ea4acc6..3301068 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -4,6 +4,7 @@ FILESPATH =. "${FILE_DIRNAME}/mesa-dri:"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://uclibc.patch \
+           file://mesa-use-target-commands-in-mklib.patch \
            "
 
 SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
@@ -17,7 +18,7 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "--with-driver=xlib --without-gallium-drivers"
 
-- 
1.7.5.1.300.gc565c



