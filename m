Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhB-0002KN-La
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396285"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:03 -0800
Message-Id: <3eb0c7dd7cd03e3b6ae3040299b2359975c9ef79.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 05/11] mesa-dri, mesa-xlib: fix compilation with x32 toolchain
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:58 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Add support for building with x32 toolchain.

Simplified the use of SRC_URI & S vars across multiple files.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-7.11.inc           |   11 ++++++--
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 -
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    2 +-
 meta/recipes-graphics/mesa/mesa-git.inc            |    6 ++--
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    2 +-
 .../mesa/mesa/mesa_fix_for_x32.patch               |   24 ++++++++++++++++++++
 6 files changed, 37 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch

diff --git a/meta/recipes-graphics/mesa/mesa-7.11.inc b/meta/recipes-graphics/mesa/mesa-7.11.inc
index 2f14ed4..7c4a690 100644
--- a/meta/recipes-graphics/mesa/mesa-7.11.inc
+++ b/meta/recipes-graphics/mesa/mesa-7.11.inc
@@ -1,9 +1,14 @@
 DEPENDS += "mesa-dri-glsl-native"
 
-SRC_URI += "file://uclibc.patch \
-            file://crossfix.patch \
-            file://crossfix-mklib.patch \
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \ 
+           file://uclibc.patch \
+           file://crossfix.patch \
+           file://crossfix-mklib.patch \
+           file://mesa_fix_for_x32.patch \
            "
+S = "${WORKDIR}/Mesa-${PV}"
+
 SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
 SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
 
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index df035e6..59e8e64 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -15,8 +15,6 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1
 INC_PR = "r13"
 PE = "2"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
-S = "${WORKDIR}/Mesa-${PV}"
 
 PROTO_DEPS = "xf86driproto glproto"
 LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 5d25127..219e555 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -1,4 +1,4 @@
 include mesa-common.inc
 include mesa-${PV}.inc
 include mesa-dri.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index 594d9b8..1b4c0a6 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -6,9 +6,9 @@ PV = "7.11+gitr${SRCPV}"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 FILESEXTRAPATHS_prepend := "${THISDIR}/mesa-git:"
 
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git"
-SRC_URI += "file://uclibc.patch \
-            file://crossfix.patch \
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
+           file://uclibc.patch \
+           file://crossfix.patch \
            "
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index 95ff5e8..7912287 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -1,5 +1,5 @@
 include mesa-common.inc
 include mesa-${PV}.inc
 include mesa-xlib.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
diff --git a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
new file mode 100644
index 0000000..22a2339
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
@@ -0,0 +1,24 @@
+UpstreamStatus: Pending
+
+get correct compiler options for x32 gcc.
+
+Received this patch from H.J. Lu <hjl.tools@gmail.com>
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
+
+--- Mesa-7.11/bin/mklib.x32	2011-11-30 14:29:14.976465283 -0800
++++ Mesa-7.11/bin/mklib	2011-11-30 14:32:48.591525193 -0800
+@@ -335,7 +335,12 @@ case $ARCH in
+ 	    set ${OBJECTS}
+ 	    ABI32=`file $1 | grep 32-bit`
+ 	    if [ "${ABI32}" -a `uname -m` = "x86_64" ] ; then
+-		OPTS="-m32 ${OPTS}"
++		ABIX32=`file $1 | grep x86-64`
++		if [ "${ABI32}" ]; then
++		    OPTS="-mx32 ${OPTS}"
++		else
++		    OPTS="-m32 ${OPTS}"
++		fi
+ 	    fi
+ 
+             if [ "${ALTOPTS}" ] ; then
-- 
1.7.6.4



