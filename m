Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B41C83F13
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:06 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.10480.1693064343117080181
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UHP+8aNd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68a6f6a66e1so1433115b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064342; x=1693669142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9N8Ze6oVCQz7jvum7Jw54c8eoS2TgM4sbd83yMLllyQ=;
        b=UHP+8aNdOlWd0RB2oN1fk9lcpKA6I/wLTgxi+dpaYHoAp6y2Q0Di/umaOTIZLjuVES
         zkiniHSPi/4oq/sXTF7QvR1D5D5sSu0pxZe0MPCi2BxmblMvmwBm0Lq0v9Kq77xdiFhB
         FlKh68zwjbgKk/lDi28A+yJ1RO495rNzEWOYbUEHyJJVUUsoRp4udtWBBCahGHIBDSb5
         bmXb0xhHfaDUJxWcT25FLLMC3bRY7fYZ+Yj49IEhQZa09bBe0haGchi1mzUgvmHg5o34
         jbRF/xRTifZFz0pCbgfXlAyW9YsztGrHDyNLj9ogSAWxF4MNS6yJULO1nFAE+Kj9eEZN
         8VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064342; x=1693669142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N8Ze6oVCQz7jvum7Jw54c8eoS2TgM4sbd83yMLllyQ=;
        b=lEeLWNb5Um6XJxFbqRlem5cxlGpsJ9rY40oQFkRnif1L6A1ZMAz1YOPJwIsyRMWIQy
         1mwmhtftJ/ZDEq4ZGWALGxxKR3dHJ6KF/ug2Nk3755TKvsoZ1eOfHyz2ig8N8hAJJ1hS
         1+xCKUyMIDfSBUU1+oiNgeuv0EyTLMZKOyK7A5O0d911D3N/K6QGKQY4ZsHfPYslGzFj
         uxGVN0TXZtlKiLyNDHPRWdDhPzYH7pnmoGeeaUc3KI0CYqCduNAI/VQ1ajmOEo59I2YN
         gIlI1LB660I6Lp65frzS6UPGAMeunI2Jc+jdqgrkqB7Y+ntmmKoClowDxTuJCuvDFma8
         qYBA==
X-Gm-Message-State: AOJu0YwsP+iE8pF5MYWXqerW5Bo9xg1RFpJ8IjoyYEaWDFjOdTHa2pnq
	Gf0Q0NetxZumQZauK3h0XIxmrufwiKh85XvzLWQ=
X-Google-Smtp-Source: AGHT+IHiv7HjKnSJ9S7QGMdKH0d7I7WZxa3KTFNUkCcRtxRnrTivpKuHNEwSWG6GbjCYX069ow9fPw==
X-Received: by 2002:a05:6a00:1912:b0:68b:c1a2:abca with SMTP id y18-20020a056a00191200b0068bc1a2abcamr11958403pfi.14.1693064342182;
        Sat, 26 Aug 2023 08:39:02 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/20] ffmpeg: add CVE_CHECK_IGNORE for CVE-2023-39018
Date: Sat, 26 Aug 2023 05:38:34 -1000
Message-Id: <d1c087713add2d780b4978b9d7ec33d514d68cd4.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186747

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2023-39018 belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
and not ffmpeg itself. As per CVE description, it is mentioned as FFmpeg 0.7.0 which
is the version for ffmpeg-cli-wrapper and ffmpeg don't have 0.7.0 version at all.

Debian & Bugzilla trackers have already marked as NOT-FOR-US/RESOLVED-INVALID.
As it won't be affecting the ffmpeg package so, we can ignore the CVE-2023-39018
in ffmpeg recipe.

References:
https://github.com/bramp/ffmpeg-cli-wrapper
https://github.com/FFmpeg/FFmpeg
https://security-tracker.debian.org/tracker/CVE-2023-39018
https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018

Upstream master patch:
https://git.openembedded.org/openembedded-core/commit/?id=c21ed498b423c13463a4ae0bb475883cc7901847

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index cccd9f65ab..aa5a8681cf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -30,6 +30,12 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc"
 
+# CVE-2023-39018 issue belongs to ffmpeg-cli-wrapper (Java wrapper around the FFmpeg CLI)
+# and not ffmepg itself.
+# https://security-tracker.debian.org/tracker/CVE-2023-39018
+# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2023-39018
+CVE_CHECK_IGNORE += "CVE-2023-39018"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.34.1


