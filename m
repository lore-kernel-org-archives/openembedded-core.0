Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: M/AR/OrYX6Gf/hcXXByDDM58zzEcjYqoOa5duGQvkLodJTYXMH7zgLu3CLbEgpNZWmDxxl802M
 oWyAUj9U9cZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236065"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236065"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:18 -0800
IronPort-SDR: arTpT3e/wugrzgDJbO2VuxdzIuTUex3bjaAhCg53+o4qqpHi1YPExEpsN8ErHjyKjipgC9daIk
 /MQvuwZBl0GQ==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027617"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:17 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/35] ffmpeg: add srt package config knob
Date: Wed, 23 Dec 2020 23:18:29 +0800
Message-Id: <54f8b66ee2439bc6ab68e622f34d451d1bdbfcd9.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

    * 0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
      Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315]

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b9c0fa129308180d6d3acf0a321433652ecd9dc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...uild-fail-when-used-the-libsrt-1.4.1.patch | 52 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |  2 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
new file mode 100644
index 0000000000..7635c9196a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch
@@ -0,0 +1,52 @@
+From aebb72e025cbfbd4a6765354f6f565ad4ac89789 Mon Sep 17 00:00:00 2001
+From: Jun Zhao <barryjzhao@tencent.com>
+Date: Sun, 12 Jul 2020 05:48:48 +0800
+Subject: [PATCH] lavf/srt: fix build fail when used the libsrt 1.4.1
+
+lavf/srt: fix build fail when used the libsrt 1.4.1
+
+libsrt changed the:
+SRTO_SMOOTHER   -> SRTO_CONGESTION
+SRTO_STRICTENC  -> SRTO_ENFORCEDENCRYPTION
+and removed the front of deprecated options (SRTO_SMOOTHER/SRTO_STRICTENC)
+in the header, it's lead to build fail
+
+fix #8760
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+Signed-off-by: Jun Zhao <barryjzhao@tencent.com>
+---
+ libavformat/libsrt.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libavformat/libsrt.c b/libavformat/libsrt.c
+index 4de575b..4719ce0 100644
+--- a/libavformat/libsrt.c
++++ b/libavformat/libsrt.c
+@@ -313,8 +313,12 @@ static int libsrt_set_options_pre(URLContext *h, int fd)
+         (s->pbkeylen >= 0 && libsrt_setsockopt(h, fd, SRTO_PBKEYLEN, "SRTO_PBKEYLEN", &s->pbkeylen, sizeof(s->pbkeylen)) < 0) ||
+         (s->passphrase && libsrt_setsockopt(h, fd, SRTO_PASSPHRASE, "SRTO_PASSPHRASE", s->passphrase, strlen(s->passphrase)) < 0) ||
+ #if SRT_VERSION_VALUE >= 0x010302
++#if SRT_VERSION_VALUE >= 0x010401
++        (s->enforced_encryption >= 0 && libsrt_setsockopt(h, fd, SRTO_ENFORCEDENCRYPTION, "SRTO_ENFORCEDENCRYPTION", &s->enforced_encryption, sizeof(s->enforced_encryption)) < 0) ||
++#else
+         /* SRTO_STRICTENC == SRTO_ENFORCEDENCRYPTION (53), but for compatibility, we used SRTO_STRICTENC */
+         (s->enforced_encryption >= 0 && libsrt_setsockopt(h, fd, SRTO_STRICTENC, "SRTO_STRICTENC", &s->enforced_encryption, sizeof(s->enforced_encryption)) < 0) ||
++#endif
+         (s->kmrefreshrate >= 0 && libsrt_setsockopt(h, fd, SRTO_KMREFRESHRATE, "SRTO_KMREFRESHRATE", &s->kmrefreshrate, sizeof(s->kmrefreshrate)) < 0) ||
+         (s->kmpreannounce >= 0 && libsrt_setsockopt(h, fd, SRTO_KMPREANNOUNCE, "SRTO_KMPREANNOUNCE", &s->kmpreannounce, sizeof(s->kmpreannounce)) < 0) ||
+ #endif
+@@ -333,7 +337,11 @@ static int libsrt_set_options_pre(URLContext *h, int fd)
+         (s->lossmaxttl >= 0 && libsrt_setsockopt(h, fd, SRTO_LOSSMAXTTL, "SRTO_LOSSMAXTTL", &s->lossmaxttl, sizeof(s->lossmaxttl)) < 0) ||
+         (s->minversion >= 0 && libsrt_setsockopt(h, fd, SRTO_MINVERSION, "SRTO_MINVERSION", &s->minversion, sizeof(s->minversion)) < 0) ||
+         (s->streamid && libsrt_setsockopt(h, fd, SRTO_STREAMID, "SRTO_STREAMID", s->streamid, strlen(s->streamid)) < 0) ||
++#if SRT_VERSION_VALUE >= 0x010401
++        (s->smoother && libsrt_setsockopt(h, fd, SRTO_CONGESTION, "SRTO_CONGESTION", s->smoother, strlen(s->smoother)) < 0) ||
++#else
+         (s->smoother && libsrt_setsockopt(h, fd, SRTO_SMOOTHER, "SRTO_SMOOTHER", s->smoother, strlen(s->smoother)) < 0) ||
++#endif
+         (s->messageapi >= 0 && libsrt_setsockopt(h, fd, SRTO_MESSAGEAPI, "SRTO_MESSAGEAPI", &s->messageapi, sizeof(s->messageapi)) < 0) ||
+         (s->payload_size >= 0 && libsrt_setsockopt(h, fd, SRTO_PAYLOADSIZE, "SRTO_PAYLOADSIZE", &s->payload_size, sizeof(s->payload_size)) < 0) ||
+         ((h->flags & AVIO_FLAG_WRITE) && libsrt_setsockopt(h, fd, SRTO_SENDER, "SRTO_SENDER", &yes, sizeof(yes)) < 0)) {
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index 517dac7f05..72c2fe16ec 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
+           file://0001-lavf-srt-fix-build-fail-when-used-the-libsrt-1.4.1.patch \
            "
 SRC_URI[sha256sum] = "ad009240d46e307b4e03a213a0f49c11b650e445b1f8be0dda2a9212b34d2ffb"
 
@@ -70,6 +71,7 @@ PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
+PACKAGECONFIG[srt] = "--enable-libsrt,--disable-libsrt,srt"
 PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora libogg"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
-- 
2.29.2

