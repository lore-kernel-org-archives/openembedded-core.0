Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id A8C5A78552
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 08:35:57 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id q85so103781973pfq.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 01:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=W0RNCiVsIivyK1C6z2BRQ3tLAu0gsbrAXJVl3s8Wn8w=;
	b=Ols1ztR5iIGQ7xs5cwWrVU/iJSzBKApjpssf/fA7w8QN99sMfkDB8uzCmy+2xPnEIw
	FPjXxbd1bc/mhljfI2AbdzOaX5A4uZgpmNMJy8ktH4Wlqx+REpdKf2OcIYI9GSsLgvLj
	9oABV6x23Bt/9225MMxzHxpkfuF4j8rAC7CTTQRtjVAARzONxzfR1ot1lSkbcSTkoDub
	HYOVdYZ6zKNbmruj6051nbZUsgLM5vwkK0WO1t2fJwhMypjcZaAAen3jKk/uri1nA2QS
	hyGe8pL5VNAwRP51kazbt2VUH9PsU8AHTDnece3k1dy4uZElGCEd+HwmVe7TGDpiLLNi
	DKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=W0RNCiVsIivyK1C6z2BRQ3tLAu0gsbrAXJVl3s8Wn8w=;
	b=VIC6l60+iqwipCw1bnXAWqmgVAurbaq1mfuqRL6Y3hRqvhCh+mISSlYzfcMNrlFZ9C
	jIl/N4+5kIdQIQ85stmjIa41BryGWJ+dhM/mp4csyZmgGivVLcgLmgnTr4JQYGTtmXRs
	seAWEQapmf8CufwXDmC+L229zeXz/Kt6XtQFVt8k3kv7E8rBI4MfMeSJgBDwhgV325wR
	MOsvIyriVCzfEl4twzc+xHiCMHXqyllrNZa8DBSKI0kVRsmY3edODnSspQfobWnK87Wt
	rJz02TBzQmRtty8JgERq1RKIjc6mz5R2lhVVR8SFINVDXjX+CANg6By8kqFDu1UanTr1
	7Kcg==
X-Gm-Message-State: AIVw110mQdDyiHbrjb3x7TqbmSH0Juf20WmV8FDWtMHVQH056OJ+xy3b
	1howBGhDgpW24/2M
X-Received: by 10.84.209.232 with SMTP id y95mr10383133plh.391.1501317358762; 
	Sat, 29 Jul 2017 01:35:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	s73sm26396059pgc.73.2017.07.29.01.35.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 01:35:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 01:35:40 -0700
Message-Id: <35b9fa925d7cc30cf66d10d91af9c8eeb6f7705e.1501317178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
In-Reply-To: <cover.1501317178.git.raj.khem@gmail.com>
References: <cover.1501317178.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] mesa: Fix build when building with llvmpipe
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
X-List-Received-Date: Sat, 29 Jul 2017 08:35:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add following in mesa.inc to enable llvmpipe

PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"

This would enable llvmpipe for swrast, to check run this

root@qemux86:~# glxinfo | grep llvm
    Device: llvmpipe (LLVM 5.0, 128 bits) (0xffffffff)
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 5.0, 128 bits)

Backport patches to support llvm 5.0.0+
Add a patch to understand llvm version when llvm is build from git/svn

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch | 40 ++++++++++++++++++
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch | 49 ++++++++++++++++++++++
 .../mesa/files/llvm-config-version.patch           | 23 ++++++++++
 meta/recipes-graphics/mesa/mesa.inc                |  7 +++-
 meta/recipes-graphics/mesa/mesa_17.1.5.bb          |  3 ++
 5 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 create mode 100644 meta/recipes-graphics/mesa/files/llvm-config-version.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch b/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
new file mode 100644
index 0000000000..b27a3bc8e4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
@@ -0,0 +1,40 @@
+From 9861437e58fdd0de01193a102608d34e5952953f Mon Sep 17 00:00:00 2001
+From: Christoph Haag <haagch+mesadev@frickel.club>
+Date: Thu, 20 Apr 2017 10:34:18 +0200
+Subject: [PATCH 1/2] ac: fix build after LLVM 5.0 SVN r300718
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+v2: previously getWithDereferenceableBytes() exists, but addAttr() doesn't take that type
+
+Signed-off-by: Christoph Haag <haagch+mesadev@frickel.club>
+Reviewed-by: Nicolai Hähnle <nicolai.haehnle@amd.com>
+Tested-and-reviewed-by: Mike Lothian <mike@fireburn.co.uk>
+---
+Upstream-Status: Backport
+
+ src/amd/common/ac_llvm_helper.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/amd/common/ac_llvm_helper.cpp b/src/amd/common/ac_llvm_helper.cpp
+index d9ea4b1..11fa809 100644
+--- a/src/amd/common/ac_llvm_helper.cpp
++++ b/src/amd/common/ac_llvm_helper.cpp
+@@ -44,9 +44,13 @@ typedef AttributeSet AttributeList;
+ void ac_add_attr_dereferenceable(LLVMValueRef val, uint64_t bytes)
+ {
+    llvm::Argument *A = llvm::unwrap<llvm::Argument>(val);
++#if HAVE_LLVM < 0x0500
+    llvm::AttrBuilder B;
+    B.addDereferenceableAttr(bytes);
+    A->addAttr(llvm::AttributeList::get(A->getContext(), A->getArgNo() + 1,  B));
++#else
++   A->addAttr(llvm::Attribute::getWithDereferenceableBytes(A->getContext(), bytes));
++#endif
+ }
+ 
+ bool ac_is_sgpr_param(LLVMValueRef arg)
+-- 
+2.13.3
+
diff --git a/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch b/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
new file mode 100644
index 0000000000..ac8caec74d
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
@@ -0,0 +1,49 @@
+From a02a0dfda2712d30ad62b8f0421ec7b8244ba2cb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>
+Date: Wed, 10 May 2017 17:26:07 +0900
+Subject: [PATCH 2/2] gallivm: Fix build against LLVM SVN >= r302589
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+deregisterEHFrames doesn't take any parameters anymore.
+
+Reviewed-by: Vedran Miletić <vedran@miletic.net>
+Reviewed-by: Marek Olšák <marek.olsak@amd.com>
+---
+Upstream-Status: Backport
+
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+index 2a388cb..0e4a531 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -342,14 +342,20 @@ class DelegatingJITMemoryManager : public BaseMemoryManager {
+       virtual void registerEHFrames(uint8_t *Addr, uint64_t LoadAddr, size_t Size) {
+          mgr()->registerEHFrames(Addr, LoadAddr, Size);
+       }
+-      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr, size_t Size) {
+-         mgr()->deregisterEHFrames(Addr, LoadAddr, Size);
+-      }
+ #else
+       virtual void registerEHFrames(llvm::StringRef SectionData) {
+          mgr()->registerEHFrames(SectionData);
+       }
+ #endif
++#if HAVE_LLVM >= 0x0500
++      virtual void deregisterEHFrames() {
++         mgr()->deregisterEHFrames();
++      }
++#elif HAVE_LLVM >= 0x0304
++      virtual void deregisterEHFrames(uint8_t *Addr, uint64_t LoadAddr, size_t Size) {
++         mgr()->deregisterEHFrames(Addr, LoadAddr, Size);
++      }
++#endif
+       virtual void *getPointerToNamedFunction(const std::string &Name,
+                                               bool AbortOnFailure=true) {
+          return mgr()->getPointerToNamedFunction(Name, AbortOnFailure);
+-- 
+2.13.3
+
diff --git a/meta/recipes-graphics/mesa/files/llvm-config-version.patch b/meta/recipes-graphics/mesa/files/llvm-config-version.patch
new file mode 100644
index 0000000000..0c458c0fa4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/llvm-config-version.patch
@@ -0,0 +1,23 @@
+When building llvm from git or svn it embeds the svn/git revision into internal version string
+
+$ /mnt/a/oe/build/tmp/work/corei7-64-bec-linux/mesa/2_17.1.5-r0/recipe-sysroot/usr/lib/llvm5.0/llvm-config-host --version
+5.0.0git-9a5c333388c
+
+We need to ignore everything after 5.0.0 which is what the cut cmd is doing
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: mesa-17.1.5/configure.ac
+===================================================================
+--- mesa-17.1.5.orig/configure.ac
++++ mesa-17.1.5/configure.ac
+@@ -2560,7 +2560,7 @@ if test "x$enable_llvm" = xyes; then
+     dnl (See https://llvm.org/bugs/show_bug.cgi?id=6823)
+     if test "x$enable_llvm_shared_libs" = xyes; then
+         dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
+-        LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version`
++        LLVM_SO_NAME=LLVM-`$LLVM_CONFIG --version|cut -c1-5`
+         AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.$IMP_LIB_EXT"], [llvm_have_one_so=yes])
+ 
+         if test "x$llvm_have_one_so" = xyes; then
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1b712a24ea..3b42fa9fe8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,8 +25,11 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)}"
 
+export LLVM_CONFIG = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config-host"
+
 EXTRA_OECONF = "--enable-shared-glapi \
-                --with-llvm-prefix=${STAGING_BINDIR_NATIVE} \
+                --disable-opencl \
+                --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
                 --with-platforms='${PLATFORMS}'"
 
 PACKAGECONFIG ??= "gbm egl gles dri \
@@ -68,7 +71,7 @@ GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
-MESA_LLVM_RELEASE ?= "3.3"
+MESA_LLVM_RELEASE ?= "5.0"
 PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.5.bb b/meta/recipes-graphics/mesa/mesa_17.1.5.bb
index ddfcb371ec..36b0377453 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.5.bb
@@ -7,6 +7,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-hardware-gloat.patch \
            file://0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch \
            file://vulkan-mkdir.patch \
+           file://llvm-config-version.patch \
+           file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
+           file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
 "
 SRC_URI[md5sum] = "6cf936fbcaadd98924298a7009e8265d"
 SRC_URI[sha256sum] = "378516b171712687aace4c7ea8b37c85895231d7a6d61e1e27362cf6034fded9"
-- 
2.13.3


