Received: from mail-oi1-f225.google.com (mail-oi1-f225.google.com [209.85.167.225])
 by mx.groups.io with SMTP id smtpd.web11.8974.1613157963362833042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 11:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=D/E35/nQ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.167.225, mailfrom: suji.velupillai@broadcom.com)
Received: by mail-oi1-f225.google.com with SMTP id r75so776640oie.11
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 11:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ptu98YJchwhOQQGBZF1DaLtTw263HmTOWVk8NpoG3o8=;
        b=D/E35/nQzSrKH6FMcw99Y4hg6eMynSAZ5WcVoK0FXkSE0mIraHtjmlxuSGemEEdOT5
         AE4NGcM7/N8tD+wOX6Va1theSjDZbWm3qMioe0fLNwKI6hbRLh1xtKp0yn2HrAn0ASIh
         wCrAKJoyZ8erd4CEU780S14DMRuntt21a59aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ptu98YJchwhOQQGBZF1DaLtTw263HmTOWVk8NpoG3o8=;
        b=KwTkNd4w29daCu88NG7GkCuIb7Rt8KFxjtD72FhvabhUM7ArPoWUnoTSTLqMW2lFY/
         5M7tAr8xZ6DOSzzORQrbkwzpOVxcno/p9IL0RWAcvfvEu0FOBia/tDPhRNTu1XLjzF2m
         OXH0sXrm99e4q3+83yZHoRbgsOPiHDj+NaD/N/TMF8phneJQqszQ1A8aP9Ur0u/v8kZp
         QSwRbdu260dcdzzw6qr1mn8FSxLa7iz60oytk9HOOsuIUlQ1uwtWCLSUayBtvpF1X+0W
         da8DWIG8ca5Yf81nD84eAiPou4kH1MxOePds0P8BXPyirRI+gbMtkfrl1d+fAskxSIi3
         1bTA==
X-Gm-Message-State: AOAM531frvyZkEu3LGycepBvpAOOyXhFiGPP9f2iTAHImnmy/rUA5PRO
	PFC5RgWzcpqieHed31iPNDz7U38UlgxSuhT8U0cCJyptz1mwqKwqhtsb+IqOiFealSR5MwFRdcz
	W+hGKVLbQPCIMFSCWOELLFQHDSak4qfK1EWRrlHW3WkgBBdapFdWc52EKHVY/+myq15pINKyebD
	TiLIsoTNf5nygLmc1VgT47ASilvjw36A6i7uKuti4C3w==
X-Google-Smtp-Source: ABdhPJxJqf/MMX+Yeqp+bNu++FWChrnucsXJq/j+p+QnK/OFV4Xzgu7ZqvPRDTfS8WoRKeCLs7K2ieRflrjw
X-Received: by 2002:a05:6808:130d:: with SMTP id y13mr691368oiv.167.1613157962638;
        Fri, 12 Feb 2021 11:26:02 -0800 (PST)
Return-Path: <suji.velupillai@broadcom.com>
Received: from suji-Vostro-460.ric.broadcom.com ([192.19.228.250])
        by smtp-relay.gmail.com with ESMTPS id x45sm1359229ooi.18.2021.02.12.11.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 11:26:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: "Suji Velupillai" <suji.velupillai@broadcom.com>
To: openembedded-core@lists.openembedded.org
Cc: suji.velupillai@broadcom.com,
	jonathan.richardson@broadcom.com,
	scott.branden@broadcom.com
Subject: [OE-core][PATCH] ffmpeg: move ffmpeg config into packageconfig
Date: Fri, 12 Feb 2021 11:25:20 -0800
Message-Id: <20210212192520.7984-1-suji.velupillai@broadcom.com>
X-Mailer: git-send-email 2.17.1

From: Suji Velupillai <suji.velupillai@broadcom.com>

Move ffmpeg configuration options to Yocto PACKAGECONFIG options.

Signed-off-by: Suji Velupillai <suji.velupillai@broadcom.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
index ded8232713..bd21552332 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb
@@ -46,7 +46,8 @@ DEPENDS = "nasm-native"
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
-                   alsa bzlib gpl lzma theora x264 zlib \
+                   alsa bzlib gpl lzma pic pthreads shared theora x264 zlib \
+                   ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips32r2', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
 
 # libraries to build in addition to avutil
@@ -85,6 +86,13 @@ PACKAGECONFIG[xcb] = "--enable-libxcb,--disable-libxcb,libxcb"
 PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
+# other configuration options
+PACKAGECONFIG[mips32r2] = ",--disable-mipsdsp --disable-mipsdspr2"
+PACKAGECONFIG[pic] = "--enable-pic"
+PACKAGECONFIG[pthreads] = "--enable-pthreads,--disable-pthreads"
+PACKAGECONFIG[shared] = "--enable-shared"
+PACKAGECONFIG[strip] = ",--disable-stripping"
+
 # Check codecs that require --enable-nonfree
 USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'openssl' ], 'yes', '', d)}"
 
@@ -95,10 +103,6 @@ def cpu(d):
     return 'generic'
 
 EXTRA_OECONF = " \
-    --disable-stripping \
-    --enable-pic \
-    --enable-shared \
-    --enable-pthreads \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
     \
     --cross-prefix=${TARGET_PREFIX} \
@@ -116,7 +120,6 @@ EXTRA_OECONF = " \
     --libdir=${libdir} \
     --shlibdir=${libdir} \
     --datadir=${datadir}/ffmpeg \
-    ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
     --cpu=${@cpu(d)} \
     --pkg-config=pkg-config \
 "
-- 
2.17.1

