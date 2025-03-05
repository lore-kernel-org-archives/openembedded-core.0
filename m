Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BBDC28B28
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6385.1741212706489768856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uXiY1kb2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fd89d036so19282805ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212706; x=1741817506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohevBRtr8buR/GRuE18HObtcg2UQMaHDLzlS1pf0aHw=;
        b=uXiY1kb2vfSehAXH+7sdn2TFliRY326etEnPWOkXvC9I+yfviFYxoed0QTkLoFGjSx
         AC03dgY2H6az70lO3m80YDDBK1z9rAfKbDeOPmonifFLbjE1/nmZFDzWxEKahcT2qdjc
         nKfxresrkdsl14PycmFa6BH385u1TvJfiBkWchTZLSbzKGRnVIfwBTC0hQMTytldFH//
         5YraDTLc++F51uFSFTtD46dkz22i8VyNhUDW2sbJMDO2pB7f8ZD+5qk/00DJ66xE1zJ6
         3TNmJHo7xH3FCBDVa+iU/rcpGV3tllVyJ0A86B7kmu8oWev/5t44r9VComttUdLxKiwd
         J+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212706; x=1741817506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohevBRtr8buR/GRuE18HObtcg2UQMaHDLzlS1pf0aHw=;
        b=QDt1lwtZ6Yx2g01zo1zPgRgACZh4qnCjAoPcxiQBy21A4NMVBHZ+n2khCuGHhdLQDB
         bFGJVGTaJ5XdhefFshecO2q0BxFNJjXx8RJgxiA6hD7w/jLPijvj4DXUrDwm5W6zCG/w
         Kref6ZcqKBaV7AyLkRSA6748KifuEIvRqiIf8wPN9tjq5WviRkabJS3y6zarbHsPOF2h
         QBFDjXct7Ra1rHtixFawsg2QXcg7zF2VdzVbEHNsfOFBjCn+I4ZUeJHVebZ6N8t7DiO6
         pullGkmj7EQNh5AFuFfmpDlZO1Y63BsUzdnN0tkgc32Hzfz9Fub2Td5KJHvf7BvoUHkp
         3LYA==
X-Gm-Message-State: AOJu0YxTfw/8NfB0hxZC4mdJD3g75Tp945vrBgdRT6GCJETY1ZTotNhn
	5T8CjdroDYq9h7bRboLYgFHK4i8MDSnBVJ1fn4YGldhQJR5G3CdNKBNFPPi9grGg5rtVW9ecXcO
	P
X-Gm-Gg: ASbGncughrtUeZb4MPqTHIG5EMMguYFfSHEYJU9dZHqIef9CyJpMhCDDRRjNf08gC8G
	YSl12/lny1yeL0aBVFP+0gmDxQPY8JMO1m2jJkAX2b7IKq9Ol9C6itvK6P6PseDGwOCoV/0RReB
	fDyi7ivYNlHODy1tF8qJFikP4y+DSY4uYj4OppuN8N4RW5EFoRaMq0QxzMgFZj22BoLZiO2tLTJ
	mynJuH7S8FswrVO5zbZS0CRvjZPp0vh8NXrLUROSuhKRvAgNUJDrGaYhCeJKdv64u5py6kpGjqX
	nHc0DuVt7BGpGHh8UWkhgKqMvk5jhdMgMSY=
X-Google-Smtp-Source: AGHT+IGFym9ngsChKP4rszg20bZSxpQpX6fO07BWN3F727BkPw9+rt3FM536oqRlv2NWQe5q+11rVw==
X-Received: by 2002:a05:6a00:998:b0:730:9946:5973 with SMTP id d2e1a72fcca58-73682b55115mr7111337b3a.5.1741212705556;
        Wed, 05 Mar 2025 14:11:45 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/16] ffmpeg: fix CVE-2025-25471
Date: Wed,  5 Mar 2025 14:11:12 -0800
Message-ID: <a8331b11d5d7aa8f1997eaa189b74aaab7cc44da.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212363

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git master before commit fd1772 was discovered to contain a NULL pointer
dereference via the component libavformat/mov.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-25471.patch        | 39 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch
new file mode 100644
index 0000000000..6af01b298f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25471.patch
@@ -0,0 +1,39 @@
+From 1446e37d3d032e1452844778b3e6ba2c20f0c322 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Mon, 30 Dec 2024 00:25:41 -0300
+Subject: [PATCH] avfilter/buffersrc: check for valid sample rate
+
+A sample rate <= 0 is invalid.
+
+Fixes an assert in ffmpeg_enc.c that assumed a valid sample rate would be set.
+Fixes ticket #11385.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-25471
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1446e37d3d032e1452844778b3e6ba2c20f0c322]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/buffersrc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavfilter/buffersrc.c b/libavfilter/buffersrc.c
+index 453fc0f..f49aa91 100644
+--- a/libavfilter/buffersrc.c
++++ b/libavfilter/buffersrc.c
+@@ -401,6 +401,11 @@ FF_ENABLE_DEPRECATION_WARNINGS
+         av_channel_layout_describe(&s->ch_layout, buf, sizeof(buf));
+     }
+
++    if (s->sample_rate <= 0) {
++        av_log(ctx, AV_LOG_ERROR, "Sample rate not set\n");
++        return AVERROR(EINVAL);
++    }
++
+     if (!s->time_base.num)
+         s->time_base = (AVRational){1, s->sample_rate};
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index cb6a50401b..6af43bcf37 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -48,6 +48,7 @@ SRC_URI = " \
     file://CVE-2024-36619.patch \
     file://CVE-2024-35369.patch \
     file://CVE-2025-25473.patch \
+    file://CVE-2025-25471.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


