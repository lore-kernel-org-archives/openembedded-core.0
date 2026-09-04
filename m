Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8515C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:54:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10447.1788515645197684082
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Xm1O+9/B;
 spf=pass (domain: snapchat.com, ip: 209.85.128.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso12687765e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1788515643; x=1789120443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjTv0JrH695yRtakWRtuaV9hUzDbxNPA2EAOIw+Oh1I=;
        b=Xm1O+9/B/Ga1D1JJVb0udH2mbz+BLiXjHe6aMLdAVjcYcW44RiXezhEdrqialFiq6I
         UgdmwBuAnEhemHPjJw0pzVfEUGszb8SxPvthwCGHvpwHyc/2hrP0b/1SNLq89BR8WihQ
         mdGOvN6ENZz0TtdTZpGRj1aQku0VMUB5kFHNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515643; x=1789120443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjTv0JrH695yRtakWRtuaV9hUzDbxNPA2EAOIw+Oh1I=;
        b=EZnW2xPUjK4yvkbPiOiqpfYrX4wG/RO9MqGIPbb6EDJvG2DsoHl1F1/6tua5mlAk43
         KUdtYfj8rByJwxe95D2CP1aIobMr+7rOD9mjJIktlLIfPlfxWhG1ZwF4isFqzjf3tRS2
         eXXhwmPUlvxCzxGJZXvJ9aBQ4LmlT5at559CIyFGA/TVQh+hM8zaiWKKTcK37gb3b5cC
         1ZtzNdKI2X41w6hmX0IJs/sNKHy9Yy+B4my4UYCViLH2ziy0T3KavKeqqwnUTa1BlukB
         ZB3MtpTepjIBOhyfJ403OFH8HmJO5sOIbeAIU9QnLH3reboA4iIOkTWeiFKO5QLoLMxf
         Q8Bg==
X-Gm-Message-State: AFuF++mkmx1wRa2RT/H/EWBDkwdSf2yT8sb54AmiDV4DEVfXqgw8oGXE
	lUzRkdG/ntf7oEUAJ2hAOP8M5rhnxbuhWi/yuDXFBwxhAMTs8hRj8mq3VXZHMjrBjXNqZy/Gp5U
	Bpl6el9E=
X-Gm-Gg: AYBFou1sK5VNkiICIpTt+bVEhwyOzHHHH4t+fvhtXw0TQY4SECYrk9jJIoERpI7QxrM
	qtgAF55kSEUqo6V+t3wq+t09mGoJg09RtowBAJgjkyfn8TQ9FeNzDWhBK1y2zTUaeL1YfaTD61M
	ibG/Z6nDM10+b1pONCRJRTQCLx67iHwYdkAEHaQe+zY2viXcH3xcoFpGv6/iU7C2kNCdAvRXy3S
	EL3bAnbKmR3IS6KAE4BUz42rB3VTUzj01GM63mZ3n5qeMCjrtjAucuvpnU/RdzHKp1tSoR4Mz3W
	AHk+tIKAezpoNST7pO5v4PHDnviphGlCpsMY96jQ64BLl7g+gx8sF4kZtpJCKLtAR6xZaCEzf12
	1epQMQccknllJVi7wYoQ5vTM6OE5ZLJAXMynvBJuAmV7rJYnutRLNQtFfLH5IKfe8zn0sD4AbMJ
	Xwh6/ij8Z08mdJGge7fE9g5Z2mqZatrKy2kxpwqJIxdlLEnCmt2LW4/+jV4TFG104m0uqG9xd0n
	CXg9EFkEeU/jMKqQqqE2Mwk2pb/ymga
X-Received: by 2002:a05:600c:8b2f:b0:49c:fa21:1c80 with SMTP id 5b1f17b1804b1-49cfa211cf4mr29288015e9.21.1788515643262;
        Fri, 04 Sep 2026 02:54:03 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf771de2fsm59326345e9.8.2026.09.04.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:54:02 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] ffmpeg: add libdav1d to PACKAGECONFIG
Date: Fri,  4 Sep 2026 11:53:49 +0200
Message-ID: <20260904095349.1016955-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245088

From: Etienne Cordonnier <ecordonnier@snap.com>

Optional AV1 decode via meta-oe dav1d

AI-Generated: Cursor
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
index 26614762e5..ce0ec55991 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.2.bb
@@ -62,6 +62,7 @@ PACKAGECONFIG[fdk-aac] = "--enable-libfdk-aac --enable-nonfree,--disable-libfdk-
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
+PACKAGECONFIG[libdav1d] = "--enable-libdav1d,--disable-libdav1d,dav1d"
 PACKAGECONFIG[libopus] = "--enable-libopus,--disable-libopus,libopus"
 PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
-- 
2.43.0


