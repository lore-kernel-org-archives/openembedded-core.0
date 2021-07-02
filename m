Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6802.1625213457528224289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 01:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1628Aj9b026286
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Jul 2021 01:10:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 2 Jul 2021 01:10:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 2 Jul 2021 01:10:44 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <tanuk@iki.fi>,
        <armccurdy@gmail.com>
Subject: [PATCH v3] pulseaudio: check if NEON code can be compiled on arm
Date: Fri, 2 Jul 2021 16:09:51 +0800
Message-ID: <20210702080951.7938-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <afabe035831b1987521868bfda74a6dc43298aa7.camel@linuxfoundation.org>
References: <afabe035831b1987521868bfda74a6dc43298aa7.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to check if NEON code can be compiled on arm to
fix below issue:
 | /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-r0/recipe-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/10.2.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
 |  31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~
 | ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function 'pa_mix_ch2_s16ne_neon':
 | ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type name 'int32x4_t'; did you mean 'int32_t'?
 |   38 |         int32x4_t sum0, sum1;

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...check-if-NEON-code-can-be-compiled-o.patch | 71 +++++++++++++++++++
 .../pulseaudio/pulseaudio_14.2.bb             |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch
new file mode 100644
index 0000000000..5d9370fb16
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch
@@ -0,0 +1,71 @@
+From 09f846fbdeb19193e778ce51baa77bd03c38372e Mon Sep 17 00:00:00 2001
+From: garrison <garrison@qemu15.qemu-network>
+Date: Fri, 4 Jun 2021 22:13:02 +0000
+Subject: [PATCH] build-sys: meson: check if NEON code can be compiled on arm
+
+When Meson SIMD module returns HAVE_NEON=1 on arm host, do extra compile check
+to verify compiler can actually handle NEON code.
+
+Related Meson issue #6361 https://github.com/mesonbuild/meson/issues/6361
+
+Part-of: <https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/574>
+
+Upstream-Status: Backport[https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/commit/6d2a49a6a1eacc2096d0d9473a074421c181ab56]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/pulsecore/meson.build | 41 +++++++++++++++++++++++++++++----------
+ 1 file changed, 31 insertions(+), 10 deletions(-)
+
+diff --git a/src/pulsecore/meson.build b/src/pulsecore/meson.build
+index 99a702e..d0b7990 100644
+--- a/src/pulsecore/meson.build
++++ b/src/pulsecore/meson.build
+@@ -172,16 +172,37 @@ endif
+ 
+ # FIXME: SIMD support (ORC)
+ simd = import('unstable-simd')
+-libpulsecore_simd = simd.check('libpulsecore_simd',
+-  mmx : ['remap_mmx.c', 'svolume_mmx.c'],
+-  sse : ['remap_sse.c', 'sconv_sse.c', 'svolume_sse.c'],
+-  neon : ['remap_neon.c', 'sconv_neon.c', 'mix_neon.c'],
+-  c_args : [pa_c_args],
+-  include_directories : [configinc, topinc],
+-  implicit_include_directories : false,
+-  compiler : cc)
+-libpulsecore_simd_lib = libpulsecore_simd[0]
+-cdata.merge_from(libpulsecore_simd[1])
++simd_variants = [
++  { 'mmx' : ['remap_mmx.c', 'svolume_mmx.c'] },
++  { 'sse' : ['remap_sse.c', 'sconv_sse.c', 'svolume_sse.c'] },
++  { 'neon' : ['remap_neon.c', 'sconv_neon.c', 'mix_neon.c'] },
++]
++
++libpulsecore_simd_lib = []
++
++foreach simd_kwargs : simd_variants
++
++  if host_machine.cpu_family() == 'arm' and 'neon' in simd_kwargs
++    if not cc.compiles('''
++        #include <arm_neon.h>
++        int main() {
++            return sizeof(uint8x8_t) + sizeof(int32x4_t) + sizeof(float32x4_t);
++        }
++        ''', name : 'neon code')
++      continue
++    endif
++  endif
++
++  libpulsecore_simd = simd.check('libpulsecore_simd',
++    kwargs : simd_kwargs,
++    c_args : [pa_c_args],
++    include_directories : [configinc, topinc],
++    implicit_include_directories : false,
++    compiler : cc)
++
++  libpulsecore_simd_lib += libpulsecore_simd[0]
++  cdata.merge_from(libpulsecore_simd[1])
++endforeach
+ 
+ # FIXME: Implement Windows support
+ #'mutex-win32.c',
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
index 9b8338a665..a7ea8caccb 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-meson-Check-for-__get_cpuid.patch \
            file://volatiles.04_pulse \
            file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
+           file://0001-build-sys-meson-check-if-NEON-code-can-be-compiled-o.patch \
            "
 SRC_URI[md5sum] = "1efc916251910f1e9d4df7810e3e69f8"
 SRC_URI[sha256sum] = "75d3f7742c1ae449049a4c88900e454b8b350ecaa8c544f3488a2562a9ff66f1"
-- 
2.29.2

