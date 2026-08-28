Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE740C61DE1
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2987.1787945904353661392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DQqAC2yF;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so13190235e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945903; x=1788550703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XlCc7rzBdr2XhVWEKLDQXx+2tfwIOqSbK1iDc+Evgcw=;
        b=DQqAC2yFDx82zzGkoZi90m68PaxSUu07xSr2oWnkP/pvDYM8dlxLpNQq0JOxRQZXZ8
         f5T6pjPQ5tIESt/BOeBqrqN0S6TVQC5aO+arRKg4R43dKCS1Q2kCSQzW0uOJqAh35feA
         ozqnz2xUYG0F4Z9jhy5HKZuXSbd2PJDjj2nGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945903; x=1788550703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XlCc7rzBdr2XhVWEKLDQXx+2tfwIOqSbK1iDc+Evgcw=;
        b=bVjmbmegNNe787NU59TVGCY/w0RmD2J1HW1wBgumWqcu51fLNSkaZH6/mYD7zbpTJr
         AyK8QTB1fh6nDzkPu2TnQrv4dUquI9f+g7AXOX0y09hx77kYkaP9j9sl/QZ4S16jNTiM
         DEy6cmoAaCM5rDGVs0X7DXpNLGZC/lpkfjNbz8kTPBIgxWsmwLpaaJXUWM6QJlN6T1Am
         4oua3xQIJ7WvHyUH9vDzJlmBgqwi8N36b+6wHp8m15PQJnJmVmD+xXAo3W/HzrX6g/14
         sRpwEJKoDSapshwLIiOYYL8xUmxxQlSTr4UqZAnSPos00+IARmKiCFi2WlcsfHaLK6E0
         dFCQ==
X-Gm-Message-State: AFuF++mtRpWSVOFVa0jR8XmWf8EYN1ZTL1cBd+MfsQWPjo2tpuiSCSRy
	WBzYUSXdsP7v/TY2WKQ2Dwedt13qOyUrYv1FH4kdEQKKC7CuileslzgOuDDm6QMSXu4xabTgt+B
	PeGpig08=
X-Gm-Gg: AR+sD13La0JhLtjWd72bCu7Py9JeyTp2RYJ3oKjyZMAMJxH8mCxqKSO4h0mGxP8mzsD
	ZWnpHfC0zI/UjOfP1RcCxJK2qUO2azko5iKUkSSywe8lkaBeIU4oJnjweooecLcGULiTyF/Qjfj
	7MUkj2YH1S4Rc6HwMI7Tx30qSj8KWj5eBMPG75tRD/MNKFENoGbfacT9/pGIM5eOV8sMVp2lRr9
	41SdYFARLBIlkfZKv39fdY3BD3XcDJryK1W4VchVEtQMuGs/lpBVAV/dtjFnRPcPflXX64/VP0x
	QlpQGHwHzlFOisEYpDB7j6gjNx3XmEZQ30AcWBiZGeM1nnWyAKnCbRr8EadU681nKfFNDT2t1KW
	5WbY/xMY21225YeRElm13YUMTQwAZNvMG2M9T+N6DKybyw9bMeH7OZKUECfDTKGHUh7Zr+w6fS3
	sHwmB2pGP5SIGhU8YlTRz7+ojmHb1KVwqR5HjZIKKXbtaSz+FqDc6PQ+gxH4CCxT1RrZVtoggxz
	pL3JNIWiw3de/Tn1aW5jMt5LP8vvhkOQsTvTPuPfU3t4UCxLnvblnALvzZ35LSH
X-Received: by 2002:a05:600c:a47:b0:499:be9e:49c8 with SMTP id 5b1f17b1804b1-49b91c50957mr118943515e9.13.1787945902532;
        Fri, 28 Aug 2026 12:38:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/56] ffmpeg: upgrade 8.0.1 -> 8.0.3
Date: Fri, 28 Aug 2026 21:35:42 +0200
Message-ID: <35e3978f2ea38e79449a0eef03eb12fa74e9dd30.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244593

From: Peter Marko <peter.marko@siemens.com>

Changelog:
* https://github.com/FFmpeg/FFmpeg/blob/n8.0.2/Changelog
* https://github.com/FFmpeg/FFmpeg/blob/n8.0.3/Changelog

Resolves CVEs:
* CVE-2025-69693
* CVE-2026-30997
* CVE-2026-30998
* CVE-2026-30999
* CVE-2026-40962
* CVE-2026-8461

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/{ffmpeg_8.0.1.bb => ffmpeg_8.0.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_8.0.1.bb => ffmpeg_8.0.3.bb} (99%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
similarity index 99%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index b6d3ceb6dc3..f2a729fc41c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch \
            "
 
-SRC_URI[sha256sum] = "05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41"
+SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"

