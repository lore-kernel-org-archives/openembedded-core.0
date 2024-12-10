Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01272E77184
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:47 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.3940.1733864198529232973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mMEwxfji;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fc93152edcso33493a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864198; x=1734468998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ePxnDtVd1lXCKhTZ7ERiX0WX0FKkBszkK0W4yMQKXA=;
        b=mMEwxfjiPAxkk8rIl/nSSwNggJs4ysPdcewl5E6wpcgxswcUjK1oOkshX/79CnV5he
         IDFsP1qNag2rVuxZQyKfwaIws/0bP8unYPZayzZUe6moM4bg+inMgMwnT2se8ZH7xZ7E
         KjpMtOR1Zm/X1gnLcNNCbfhqpfoiHnE1sVwdVMayqAw17fJTNvLXAjevMLXBJyeryeKK
         F8+iYroXhJLD0qiO2NmhRk49npjJmTlnCmG5FlMoFYwqbioMeCYUE31rrZA2F0sX3bgX
         QayO2qWWvVUHJElqtuLg/kn8Icordx0svE2uSUnFlKEvbv1vhwPwWI3xf8rDwEWv1OLG
         lX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864198; x=1734468998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ePxnDtVd1lXCKhTZ7ERiX0WX0FKkBszkK0W4yMQKXA=;
        b=a63iBgLgXdl82cMFwhDUYujrqEg3Rwd6jLVSY8TZAVynnBSVrnBnR4A8HYDtldg46T
         73aJqMIHMRjhRs+aqZy8LVUm78wEGaLXLJ6VH9K4PaNJb9jKqIUE/c2J7rRO2lVVYbJl
         D6MhnCEOVrVhEZ73UHodRLAW++xzk90OmwJJo5I1q9TxgM6bNR3bfkwtskZd6FeLxvBO
         nR/73ow5Mk6FJ8Wk9Tvvr43znnOUh2ZJkesrzAGIPNBbmYzHLpoAz0Noaoj6sQ/dUfwa
         2iK4zqrbkyKaCOHpFFZwVuLmJmS67HT3UFbwJJU+cxxBxuFZ1y3ybbqroaM6sZVE537C
         8FCg==
X-Gm-Message-State: AOJu0Yw97uWhTZEFhPvl27I5cOQlsRzW3A8p1WNL+GKppTLBfTkfOg7y
	0GCNUwQBmEfpJc7UfbAWxlYKDG6K1sp2H6hPP2yZXqaYVPMTHRXBUwVxUc9RwU/RfW9lEum04IG
	J
X-Gm-Gg: ASbGncvum1kkYK2hj3I0OOsdvt8bMIF6lUGWoDoik6jiDAS0KVFXw3jxYQRiYVtIE2A
	rqKL18yoIBR6oIYrZU/WANp5mq4Xulgs5Tx2W+AbRpE8bp/8lwRAON2JUE1nv7Eoc9b1CyoowzN
	DhqfS+jmjiXIo+j3MkeM0zBBQ7T+ZUNdVwCZuD0VHfF2lzI9HpV8ao6ldW81PUHuxp4DGIMOr4a
	5kdgyFYTLjECi8B31tu1gjujVO8lsMWo0PbzcSvIh4=
X-Google-Smtp-Source: AGHT+IGrXvSFOCd23DUuzKDjhmGFMA39gtW8HXgfzA95m7SVjU88y/pB216knKDp98EKtUBKK+g0Mw==
X-Received: by 2002:a17:90b:3945:b0:2ee:b8ac:73b7 with SMTP id 98e67ed59e1d1-2f12881b39bmr263366a91.16.1733864197695;
        Tue, 10 Dec 2024 12:56:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/12] ffmpeg: fix CVE-2023-49501
Date: Tue, 10 Dec 2024 12:56:17 -0800
Message-Id: <873025145d42ffe75d421884160ec299d85d21ef.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208544

From: Archana Polampalli <archana.polampalli@windriver.com>

Buffer Overflow vulnerability in Ffmpeg v.n6.1-3-g466799d4f5 allows a
local attacker to execute arbitrary code via the config_eq_output function
in the libavfilter/asrc_afirsrc.c:495:30 component.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2023-49501.patch        | 30 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
new file mode 100644
index 0000000000..80d542952a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-49501.patch
@@ -0,0 +1,30 @@
+From 4adb93dff05dd947878c67784d98c9a4e13b57a7 Mon Sep 17 00:00:00 2001
+From: Paul B Mahol <onemda@gmail.com>
+Date: Thu, 23 Nov 2023 14:58:35 +0100
+Subject: [PATCH] avfilter/asrc_afirsrc: fix by one smaller allocation of
+ buffer
+
+CVE: CVE-2023-49501
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/4adb93dff05dd947878c67784d98c9a4e13b57a7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/asrc_afirsrc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavfilter/asrc_afirsrc.c b/libavfilter/asrc_afirsrc.c
+index e2359c1..ea04c35 100644
+--- a/libavfilter/asrc_afirsrc.c
++++ b/libavfilter/asrc_afirsrc.c
+@@ -480,7 +480,7 @@ static av_cold int config_eq_output(AVFilterLink *outlink)
+         if (ret < 0)
+             return ret;
+
+-        s->magnitude = av_calloc(s->nb_magnitude, sizeof(*s->magnitude));
++        s->magnitude = av_calloc(s->nb_magnitude + 1, sizeof(*s->magnitude));
+         if (!s->magnitude)
+             return AVERROR(ENOMEM);
+         memcpy(s->magnitude, eq_presets[s->preset].gains, sizeof(*s->magnitude) * s->nb_magnitude);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 84bba3b7b6..47be4d3e71 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -32,6 +32,7 @@ SRC_URI = " \
     file://CVE-2024-31582.patch \
     file://CVE-2023-50008.patch \
     file://CVE-2024-32230.patch \
+    file://CVE-2023-49501.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


