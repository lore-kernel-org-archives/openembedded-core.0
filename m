Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymP-0006JJ-9H
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:46 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:50:07 -0700
Received: by weyt11 with SMTP id t11so5421755wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=R9nag/F9xO5QYhtqJHynfvpjKq2JokVqALiurviGmp0=;
	b=FPjbO4HWkmC2e6zW3uOE2+amd3osvO1vDR+JqxAreoKpt8ki5d6GjW2HhDaGzN45OG
	kznRle0i9dY+WDu3526USnrFL50zV5/1DZltnZWMYBP830bU8OUGOYI7PTm+iTtmjfJJ
	qeP5PBCMNfv1YUISy002RO6zDz1FsKa1h0IMP95yjm9TNkpjxobZQbUrfvESDZZM/Huc
	P2ZUGCJDtXeSTyBuYD7eFg0U3Cm6M3wsavnZcD864JYyhHcqcOj4R/WVhMbJfvC3cp0A
	R6+CErzEua/Fc9uEqxGxlldnyY0n9OLmcG5QfWu9yeBKCDjhz1TMghEz80GumOspn3V7
	rOyQ==
Received: by 10.216.238.30 with SMTP id z30mr11073923weq.223.1343926205297;
	Thu, 02 Aug 2012 09:50:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.50.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:50:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:49:04 +0100
Message-Id: <b8cdef43090deef8f8be4c3b90fb6b363547a8bd.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk/VrTLT8lSGhdUAU3Eamm4sEHXnN6+HqSsG3nKpQ58ENg95IqEDOuNZ4nXbfgTvsArMQlb
Subject: [PATCH V3 10/11] mesa: respect x11 DISTRO_FEATURE
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:47 -0000

Patch originally by Damien Lespiau <damien.lespiau@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   14 +++++-----
 meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
 4 files changed, 39 insertions(+), 7 deletions(-)
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
index 38b4ab0..77107ab 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,14 +12,10 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r1"
+INC_PR = "r2"
 PE = "2"
 
-
-PROTO_DEPS = "xf86driproto glproto"
-LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
-
-DEPENDS = "makedepend-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
+DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2"
 
@@ -31,9 +27,13 @@ inherit autotools pkgconfig pythonnative
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
-                --enable-glx-tls \
                 --enable-shared-glapi"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
+
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
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



