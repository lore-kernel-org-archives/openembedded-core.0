Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SDhKT-0002Tw-Q9
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 21:17:46 +0200
Received: by pbcum15 with SMTP id um15so1906208pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OB8mrF/jERISRe8OvzQkAoDsr/lhObjbFbuobdC8Gc4=;
	b=SFzWYlNyjohsYz0F0uhAGTeUoQrZUhzPk4hHqPxKA7dMyhL8PoorNMGMLLCKe0NS/W
	suyT4ellqQRfwxbTZkHCz9dPftw2nBBDczDpUjeD3nHkPwsUo40MUVhRaZHH3b45M7dh
	H3Zm16XrQmhroFGCQ36VExhFieTCFA5mbk0kPyHLEHVCKTaDyIhRDCZAS8a+FabuI8Gd
	3LsWd2JWnGjPmB+ApkhehN07gT1C9wzXTv0XgmlzoxYDw9oHxUKnRElVYL0RjWf77YYs
	wjR21ovoaqQIAlQLhaHgaiDXGlWOuqmE5YoPmeEOgdVmC0t9M0kMG2dmC2aT5sjACx3g
	z3nw==
Received: by 10.68.196.163 with SMTP id in3mr12204895pbc.118.1333134520336;
	Fri, 30 Mar 2012 12:08:40 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id l8sm7933943pbd.62.2012.03.30.12.08.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 12:08:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 12:07:39 -0700
Message-Id: <1333134459-13057-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1333134459-13057-1-git-send-email-raj.khem@gmail.com>
References: <1333134459-13057-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] gst-ffmpeg: Fix build with gcc 4.7
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
X-List-Received-Date: Fri, 30 Mar 2012 19:17:46 -0000

A cmp instruction with two constants is invalid, therefore 'g' constraint
is not correct but must be "rm" instead.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gst-ffmpeg-0.10.13/h264_qpel_mmx.patch         |   57 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    3 +-
 2 files changed, 59 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch
new file mode 100644
index 0000000..7891329
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/h264_qpel_mmx.patch
@@ -0,0 +1,57 @@
+Backport http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=5f654897e325349dacf2546674e0510bb72ecb50;hp=250cebeb3b348c3da71f9972eb500d6005dc01f1
+
+Fixes these errors on x86
+
+libavcodec/x86/h264_qpel_mmx.c: Assembler messages:
+libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+libavcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
+make[5]: *** [libavcodec/x86/dsputil_mmx.o] Error 1
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-status: Backport
+Index: gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c
+===================================================================
+--- gst-ffmpeg-0.10.13.orig/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:39:41.324522051 -0700
++++ gst-ffmpeg-0.10.13/gst-libs/ext/libav/libavcodec/x86/h264_qpel_mmx.c	2012-03-30 11:54:08.152564075 -0700
+@@ -398,7 +398,7 @@
+             "2:                         \n\t"\
+             \
+             : "+a"(src), "+c"(dst)\
+-            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
++            : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
+             : "memory"\
+         );\
+         src += 4-(h+5)*srcStride;\
+@@ -446,7 +446,7 @@
+             QPEL_H264HV(%%mm3, %%mm4, %%mm5, %%mm0, %%mm1, %%mm2, 15*48)\
+             "2:                     \n\t"\
+             : "+a"(src)\
+-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)\
++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)\
+             : "memory"\
+             );\
+         tmp += 4;\
+@@ -823,7 +823,7 @@
+         "2:                          \n\t"\
+         \
+         : "+a"(src), "+c"(dst)\
+-        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "g"(h)\
++        : "S"((x86_reg)srcStride), "D"((x86_reg)dstStride), "rm"(h)\
+         : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3", \
+                        "%xmm4", "%xmm5", "%xmm6", "%xmm7",)\
+           "memory"\
+@@ -878,7 +878,7 @@
+             QPEL_H264HV_XMM(%%xmm3, %%xmm4, %%xmm5, %%xmm0, %%xmm1, %%xmm2, 15*48)
+             "2:                         \n\t"
+             : "+a"(src)
+-            : "c"(tmp), "S"((x86_reg)srcStride), "g"(size)
++            : "c"(tmp), "S"((x86_reg)srcStride), "rm"(size)
+             : XMM_CLOBBERS("%xmm0", "%xmm1", "%xmm2", "%xmm3",
+                            "%xmm4", "%xmm5", "%xmm6", "%xmm7",)
+               "memory"
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 92cd349..3b607bf 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -18,12 +18,13 @@ inherit autotools pkgconfig
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://lower-rank.diff \
            file://configure-fix.patch \
+           file://h264_qpel_mmx.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
 SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
 
-PR = "r1"
+PR = "r2"
 
 GSTREAMER_DEBUG ?= "--disable-debug"
 EXTRA_OECONF = "--with-ffmpeg-extra-configure=\"--target-os=linux\" ${GSTREAMER_DEBUG}"
-- 
1.7.5.4



