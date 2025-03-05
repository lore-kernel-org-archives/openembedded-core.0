Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64BBC28B22
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:56 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.6388.1741212709184536776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q3ea8T1j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22349bb8605so141993295ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212708; x=1741817508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nf33gKvdJV97vDN/McP0e+AWow11PVgRO3pxESp0gVY=;
        b=Q3ea8T1jm3zXph4KfIrd3Vsi/O7BLxHFGcGl/wV42zO/w5ydBu9q22xByZGrmsXP6T
         zPcCTtT8LuOMzskoPt9JXJW73vAcj1nd6poFCd6vcrrO1n7DYmkTS6R6uy8tGt8BwCQf
         ujpRsDLqB8xKEEaaa9zp421N/aqepCGyAF6V3q9Knt5a+MZ+OKxla8Mslv/vRK90I7uS
         g33lRNmLgpV9tZwZ297s2z90yPDx6eKm3iEpmRnXv4qiPRWQ+eYlFD6K4l3b/HNh+2zO
         Wo6uE/LqmInnIZk3AOKkfVvlM9l+DWMj/lp4lefK23Rx5qYZOJ3nGbRI+cPue6EpV+YK
         CdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212708; x=1741817508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf33gKvdJV97vDN/McP0e+AWow11PVgRO3pxESp0gVY=;
        b=b7TpjxAvihGcUiF6bXX/IoTEfy74ixYR+vU6qeCjUjXs2LvZf6uHeWB9z25LV3QP5s
         1g3NejGYkLWYD1NzY6Wbt+/XsY8SzAxs1e033yiiMBPXQNB1K9aBWNF978PvnC3rEV6f
         0kEof/LImu96K0R8zOKPwt7tk+ObIjPcDUmgh3MtCxnEHPRQkIO2jpkRrtR8sWnPMVtn
         qQ5CUiDaQ9kdSFbUlsq1SdWzMBLLsf8+0wKx3OP1J71pyqhYqMtSHqi/okMcEgWumIfg
         T0475T5gDqVUbORlCKkWZBjs9qqNWPfyTlHu5M42v2Yz4PlaT4RhlGhY7SExgLLRRyYI
         lpNA==
X-Gm-Message-State: AOJu0YxrVD9eE7EakHIY0/HlvUOguCHVL/Z2ST+xI2iGcWwdWhwiuqll
	OmwYmvG9c9f+lBWKF/cATDbG0o1TYf5dL5sdsN6sKJwocFuOurBt2q4izpBP60qB6t4CHDDX/A9
	G
X-Gm-Gg: ASbGnctVzNNLH4iyXSavt97IBFJddIitYz9ff9V1UVHO0KKAmdVbI+I6dlHhDz8hi5g
	6G/6yZnhJLpUst+PEYRDw62U++A4jYDat/yPzlogP/weVNck/0P58MRuQ1f8O5H1yoJ+0t7E2je
	OMAFPVGcORfpXwmO+3//pcYrcvmivq+uDX66IWy9tqdAzJqgVsZG18+wW8bITJ/8x+BWCO7HENl
	YkiBOdS8sh9L4TOEhWV1pwFxZHGXykKFVS6u7mxqTcRDecx6vwr9hKx9xKoxSdu70EDYaj0nXhF
	W/eABLxrZ6dYOjxMbj4rfutIDFQy8/Bckxk=
X-Google-Smtp-Source: AGHT+IFLRYp4hWkjFS6dA9QCG6i3VerUY84xxTuc4KO4RqCSN/t4s8io+tc99GEtiQe4j8EpIcBv8Q==
X-Received: by 2002:a05:6a00:c95:b0:736:3bd3:1a64 with SMTP id d2e1a72fcca58-73682cd9709mr8105193b3a.24.1741212708387;
        Wed, 05 Mar 2025 14:11:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/16] ffmpeg: fix CVE-2025-0518
Date: Wed,  5 Mar 2025 14:11:14 -0800
Message-ID: <75ad6e004de95ff6208820ccf2c0af01d9363749.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212365

From: Archana Polampalli <archana.polampalli@windriver.com>

Unchecked Return Value, Out-of-bounds Read vulnerability in FFmpeg allows
Read Sensitive Constants Within an Executable. This vulnerability is associated
with program files https://github.Com/FFmpeg/FFmpeg/blob/master/libavfilter/af_pan.C
This issue affects FFmpeg: 7.1.
Issue was fixed:  https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a
This issue was discovered by: Simcha Kosma

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-0518.patch         | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
new file mode 100644
index 0000000000..d3e02bebe6
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-0518.patch
@@ -0,0 +1,34 @@
+From b5b6391d64807578ab872dc58fb8aa621dcfc38a Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 6 Jan 2025 22:01:39 +0100
+Subject: [PATCH] avfilter/af_pan: Fix sscanf() use
+
+Fixes: Memory Data Leak
+
+Found-by: Simcha Kosman <simcha.kosman@cyberark.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2025-0518
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/b5b6391d64807578ab872dc58fb8aa621dcfc38a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/af_pan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavfilter/af_pan.c b/libavfilter/af_pan.c
+index cfed9f1..ffcd214 100644
+--- a/libavfilter/af_pan.c
++++ b/libavfilter/af_pan.c
+@@ -165,7 +165,7 @@ static av_cold int init(AVFilterContext *ctx)
+         sign = 1;
+         while (1) {
+             gain = 1;
+-            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len))
++            if (sscanf(arg, "%lf%n *%n", &gain, &len, &len) >= 1)
+                 arg += len;
+             if (parse_channel_name(&arg, &in_ch_id, &named)){
+                 av_log(ctx, AV_LOG_ERROR,
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index bd1259d392..06ca65a480 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -50,6 +50,7 @@ SRC_URI = " \
     file://CVE-2025-25473.patch \
     file://CVE-2025-25471.patch \
     file://CVE-2025-22921.patch \
+    file://CVE-2025-0518.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


