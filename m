Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.23052.1603605113114052745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 22:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: dHz/V12BMyBkoZXHdz/jvzW6x2tHHXHCxMt21mazFPQeTzhOEteKS10B4He1OoALg9kAYQIp+R
 OS3OQMQoaE+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9784"; a="167910234"
X-IronPort-AV: E=Sophos;i="5.77,414,1596524400"; 
   d="scan'208";a="167910234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2020 22:51:49 -0700
IronPort-SDR: nzRfG0QVDfmHKHZMWgyWr4sK6Oy7wXV5WLC0+yF4DAk6P6L9P9PGziGcIRGtKpe7FGMhnIax9D
 6znrx2Kx3/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,414,1596524400"; 
   d="scan'208";a="303203559"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2020 22:51:48 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] ffmpeg: fix CVE-2020-12284
Date: Sun, 25 Oct 2020 13:51:47 +0800
Message-Id: <20201025055147.76553-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../ffmpeg/ffmpeg/CVE-2020-12284.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch
new file mode 100644
index 0000000000..5fff4754f4
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch
@@ -0,0 +1,36 @@
+From 1812352d767ccf5431aa440123e2e260a4db2726 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 7 Mar 2020 15:42:58 +0100
+Subject: [PATCH] avcodec/cbs_jpeg: Check length for SOS
+
+Fixes: out of array access
+Fixes: 19734/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5673507031875584
+Fixes: 19353/clusterfuzz-testcase-minimized-ffmpeg_BSF_TRACE_HEADERS_fuzzer-5703944462663680
+
+Found-by: continuous fuzzing process https://github.com/google/oss-fuzz/tree/master/projects/ffmpeg
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/1812352d767ccf5431aa440123e2e260a4db2726]
+CVE: CVE-2020-12284
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ libavcodec/cbs_jpeg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libavcodec/cbs_jpeg.c b/libavcodec/cbs_jpeg.c
+index 6bbce5f..89512a2 100644
+--- a/libavcodec/cbs_jpeg.c
++++ b/libavcodec/cbs_jpeg.c
+@@ -197,6 +197,9 @@ static int cbs_jpeg_split_fragment(CodedBitstreamContext *ctx,
+         if (marker == JPEG_MARKER_SOS) {
+             length = AV_RB16(frag->data + start);
+ 
++            if (length > end - start)
++                return AVERROR_INVALIDDATA;
++
+             data_ref = NULL;
+             data     = av_malloc(end - start +
+                                  AV_INPUT_BUFFER_PADDING_SIZE);
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index d7b0641054..fddfef9e27 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
+           file://CVE-2020-12284.patch \
            "
 SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
 SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
-- 
2.17.1

