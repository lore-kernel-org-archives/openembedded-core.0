Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYHB-0004dz-UX
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:46 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:32:04 -0700
Received: by wibhm11 with SMTP id hm11so3067661wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=mIyjcxySp61o3pEqDFa7hLxaDlrSMxfKIimw3f112Ag=;
	b=H1KD+d5oY5uAHsXFmSWTeRCzZq0sVo79j+nHLUx8h5RJq8AeEsJaLIiDI2epljm8Rp
	1/WbEwNiztRyrekTk6NCO3HKp4+BAmFOQgRgcL7ONAud/G/dq7k12NyMUylxIXqPDYsF
	9TLsBpJa9Hjpp7iTzayBXdke5buIIACVj49BkeeRUV3UuqYCZHY6QCU65JbhGGKLpP9m
	vAs74MQZDFaRFUEW3BnqT+NUqjqoDa9L95UZZg1QdYGQ43AR9TeOvdR+EysGOoRXlOFs
	zq3cOcpAdFc8JJjH9WTFkerSO6scCcr33c73qE98NGiCvtmHWlicQaIabjYenNriv+KT
	LdUA==
Received: by 10.216.4.147 with SMTP id 19mr8330397wej.109.1343824323268;
	Wed, 01 Aug 2012 05:32:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.32.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:32:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:15 +0100
Message-Id: <7edce29ef75deb6486f9d40235d3060a5665b663.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmGt5z82biHvbCJ5VJslTzPniYBFOpA4i0sK6NSAmXDcYdjiyIqGxJ00Vo0b4+7+kLQOc0X
Subject: [PATCH 09/12] mesa: respect x11 DISTRO_FEATURE
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:47 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   10 ++++---
 meta/recipes-graphics/mesa/mesa-dri.inc            |    3 +-
 meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
 5 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch

diff --git a/meta/recipes-graphics/mesa/mesa-8.0.4.inc b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
index d9d17bb..9afb35d 100644
--- a/meta/recipes-graphics/mesa/mesa-8.0.4.inc
+++ b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
@@ -5,6 +5,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0002-cross-compile.patch \
            file://0003-fix-for-x32.patch \
            "
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 7963896..e5e91a3 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,14 +12,16 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r2"
+INC_PR = "r3"
 PE = "2"
 
 
 PROTO_DEPS = "xf86driproto glproto"
-LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
+LIB_DEPS += "${@base_contains('DISTRO_FEATURES', 'x11', \
+             'virtual/libx11 libxext libxxf86vm libxdamage libxfixes', '', d)}"
 
-DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
+DEPENDS = "libxml2-native makedepend-native python-native flex-native bison-native ${LIB_DEPS}"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', '${PROTO_DEPS}', '', d)}"
 
 PROVIDES = "virtual/libgl virtual/libgles2 virtual/egl"
 
@@ -31,8 +33,8 @@ inherit autotools pkgconfig pythonnative
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
-                --enable-glx-tls \
                 --enable-shared-glapi"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'x11', '--enable-glx-tls', '--disable-glx', d)}"
 
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 0c5682c..4e025a0 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -8,7 +8,8 @@ DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",i915,i965"
 DRIDRIVERS_append_x86-64 = ",i915,i965"
 
-EGL_PLATFORMS  = "drm,x11"
+EGL_PLATFORMS  = "drm"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
 
 EXTRA_OECONF += "--disable-gallium --without-gallium-drivers"
 EXTRA_OECONF += "--enable-dri --with-dri-drivers=${DRIDRIVERS}"
diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index 32b1d96..7910eb6 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -11,6 +11,8 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://0002-cross-compile.patch \
            file://0003-fix-for-x32.patch \
            "
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
+
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
diff --git a/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch b/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
new file mode 100644
index 0000000..cf9dee2
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
@@ -0,0 +1,29 @@
+gross hack to prevent from install libgl
+
+This patch is not suitable for upstream. This is only needed for the 8.0.x
+branch, master (8.1.x) has a largely different build system (using automake)
+and does not need it. It is fully expected to drop the patch with the next bump
+to a stable version based on 8.1.x.
+
+Upstream-Status: Inappropriate
+
+---
+ src/mesa/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mesa/Makefile b/src/mesa/Makefile
+index 0e15d61..a0a2cb5 100644
+--- a/src/mesa/Makefile
++++ b/src/mesa/Makefile
+@@ -166,7 +166,7 @@ install: default $(DRICORE_INSTALL_TARGET)
+ 	            else \
+ 	              $(MAKE) install-osmesa || exit 1 ; \
+ 	            fi ;; \
+-	    dri)    $(MAKE) install-libgl install-dri || exit 1 ;; \
++	    dri)    $(MAKE) install-dri || exit 1 ;; \
+ 	    *)      $(MAKE) install-libgl || exit 1 ;; \
+ 	  esac ; \
+ 	done
+-- 
+1.7.10.4
+
-- 
1.7.10



