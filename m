Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2N6ZiVEnwNpplkPq4bnqU299jTw0Ha671dil+hrN8uCIVO/ZLGLuFH2ckSWYqY/uRdcR8wgXIm
 PP55RaJyotfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236071"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236071"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:20 -0800
IronPort-SDR: CHPll3YMMKjOFW+yrTgM/gkU7/HyJTjucs7yKGLTGv1CjaSqm//vHb4fT1LvfwxjmATYS74rNi
 /Wx5xM1WYOTg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027625"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 20/35] ffmpeg: fix reproducibility
Date: Wed, 23 Dec 2020 23:18:30 +0800
Message-Id: <6a4eab303cf56102cf78da07866ac248c6183944.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4f7c6f831a551e3df503091fdca5c9f4add879d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...e-assembly-with-full-path-from-sourc.patch | 97 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  6 ++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
new file mode 100644
index 0000000000..3b503c49c9
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
@@ -0,0 +1,97 @@
+From 24a58d70cbb3997e471366bd5afe54be9007bfb1 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 15:32:14 +0000
+Subject: [PATCH] libavutil: include assembly with full path from source root
+
+Otherwise nasm writes the full host-specific paths into .o
+output, which breaks binary reproducibility.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libavutil/x86/cpuid.asm      | 2 +-
+ libavutil/x86/emms.asm       | 2 +-
+ libavutil/x86/fixed_dsp.asm  | 2 +-
+ libavutil/x86/float_dsp.asm  | 2 +-
+ libavutil/x86/lls.asm        | 2 +-
+ libavutil/x86/pixelutils.asm | 2 +-
+ 6 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/libavutil/x86/cpuid.asm b/libavutil/x86/cpuid.asm
+index c3f7866..766f77f 100644
+--- a/libavutil/x86/cpuid.asm
++++ b/libavutil/x86/cpuid.asm
+@@ -21,7 +21,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/emms.asm b/libavutil/x86/emms.asm
+index 8611762..df84f22 100644
+--- a/libavutil/x86/emms.asm
++++ b/libavutil/x86/emms.asm
+@@ -18,7 +18,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/fixed_dsp.asm b/libavutil/x86/fixed_dsp.asm
+index 979dd5c..2f41185 100644
+--- a/libavutil/x86/fixed_dsp.asm
++++ b/libavutil/x86/fixed_dsp.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/float_dsp.asm b/libavutil/x86/float_dsp.asm
+index 517fd63..b773e61 100644
+--- a/libavutil/x86/float_dsp.asm
++++ b/libavutil/x86/float_dsp.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION_RODATA 32
+ pd_reverse: dd 7, 6, 5, 4, 3, 2, 1, 0
+diff --git a/libavutil/x86/lls.asm b/libavutil/x86/lls.asm
+index 317fba6..d2526d1 100644
+--- a/libavutil/x86/lls.asm
++++ b/libavutil/x86/lls.asm
+@@ -20,7 +20,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
+diff --git a/libavutil/x86/pixelutils.asm b/libavutil/x86/pixelutils.asm
+index 36c57c5..8b45ead 100644
+--- a/libavutil/x86/pixelutils.asm
++++ b/libavutil/x86/pixelutils.asm
+@@ -21,7 +21,7 @@
+ ;* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ ;******************************************************************************
+ 
+-%include "x86util.asm"
++%include "libavutil/x86/x86util.asm"
+ 
+ SECTION .text
+ 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index 72c2fe16ec..97b2d21d31 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
+           file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
 SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
@@ -130,6 +131,11 @@ do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/config.h
+}
+
 PACKAGES =+ "libavcodec \
              libavdevice \
              libavfilter \
-- 
2.29.2

