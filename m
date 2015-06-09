Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4470F758B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Eq0U5012265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:52:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:52:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:52 -0700
Message-ID: <52da58fbc94439885ea8f1520280c1dc15eb9dce.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] gstreamer1.0-libav: fix build for i586 with gcc
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Backport a patch from debian to fix the build for i586 with gcc, the
patch is similar to libav's
workaround-to-build-libav-for-i586-with-gcc.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ound-to-build-gst-libav-for-i586-with-gcc.patch |   26 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |    1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
new file mode 100644
index 0000000..ccadea4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
@@ -0,0 +1,26 @@
+Description: Workaround to build libav for i586 with gcc 4.9.2 by avoiding memset
+Author: Bernhard Übelacker <bernhardu@vr-web.de>
+
+---
+Bug-Debian: https://bugs.debian.org/783082
+Last-Update: 2015-04-28
+
+Upstream-Status: Backport [debian]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+--- gst-libav-1.4.5.orig/gst-libs/ext/libav/libavcodec/h264_cabac.c
++++ gst-libav-1.4.5/gst-libs/ext/libav/libavcodec/h264_cabac.c
+@@ -2020,7 +2020,11 @@ decode_intra_mb:
+         // In deblocking, the quantizer is 0
+         h->cur_pic.qscale_table[mb_xy] = 0;
+         // All coeffs are present
+-        memset(h->non_zero_count[mb_xy], 16, 48);
++        /*memset(h->non_zero_count[mb_xy], 16, 48);*/
++            /* avoiding this memset because it leads at least with gcc4.9.2 to error: 'asm' operand has impossible constraints */
++        for (size_t i = 0; i < 48; i++) {
++            ( (unsigned char*)(h->non_zero_count[mb_xy]) ) [i] = 16;
++        }
+         h->cur_pic.mb_type[mb_xy] = mb_type;
+         h->last_qscale_diff = 0;
+         return 0;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
index 11b1cfb..97fc7ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
+    file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
 SRC_URI[md5sum] = "f4922a46adbcbe7bd01331ff5dc7979d"
 SRC_URI[sha256sum] = "605c62624604f3bb5c870844cc1f2711779cc533b004c2aa1d8c0d58557afbbc"
-- 
1.7.9.5


