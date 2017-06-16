Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A04E3784D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279589"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:46 +0300
Message-Id: <e4df2bb22b82730ec9d91e752f5853ae3bb951b9.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/32] webkitgtk: Upgrade to 2.16.3
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:29 -0000

From: Khem Raj <raj.khem@gmail.com>

Use bfd linker on ppc, this is because gold fails to link
webkit libraries when PIE is enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch        | 12 ++++++------
 .../webkit/{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb}      |  5 +++--
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch b/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
index 5f58e4953e7..a1ad248aac0 100644
--- a/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/ppc-musl-fix.patch
@@ -11,16 +11,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+Index: webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
 ===================================================================
---- webkitgtk-2.12.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-+++ webkitgtk-2.12.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
-@@ -86,7 +86,7 @@ static void pthreadSignalHandlerSuspendR
+--- webkitgtk-2.16.3.orig/Source/JavaScriptCore/heap/MachineStackMarker.cpp
++++ webkitgtk-2.16.3/Source/JavaScriptCore/heap/MachineStackMarker.cpp
+@@ -88,7 +88,7 @@ static void pthreadSignalHandlerSuspendR
      }
  
      ucontext_t* userContext = static_cast<ucontext_t*>(ucontext);
 -#if CPU(PPC)
 +#if CPU(PPC) && defined(__GLIBC__)
-     thread->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
+     threadData->suspendedMachineContext = *userContext->uc_mcontext.uc_regs;
  #else
-     thread->suspendedMachineContext = userContext->uc_mcontext;
+     threadData->suspendedMachineContext = userContext->uc_mcontext;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
index a52d93cfbe4..5feca17be3f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.3.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://gcc7.patch \
            file://detect-atomics-during-configure.patch \
            "
-SRC_URI[md5sum] = "d3bcf995a667fd9febb9ab991acf0ca7"
-SRC_URI[sha256sum] = "eb92383232328ce655b703c64370ed3795662479719ad1b4a869ed46769d2945"
+SRC_URI[md5sum] = "34dbbcad8a87a929519d93c67edd6d87"
+SRC_URI[sha256sum] = "204e9131da0101b9bc8765716e70a897121af04b964d9827cd9f20816a77b512"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
@@ -76,6 +76,7 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
-- 
2.11.0


