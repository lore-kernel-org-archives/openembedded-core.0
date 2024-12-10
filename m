Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D826E77185
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:47 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.3981.1733864199925932759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1c3OPlBY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2efb17478adso2121355a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864199; x=1734468999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIBTmdZT1CeQa/YiyV/zUEgqbfRcHG6e+rqZgX+0bV4=;
        b=1c3OPlBYHdQ+raJMmQsEN2iMZsQvs0Yj7WojIPoRnKtNu3sZoNbamiSG/T+F9jJtsn
         5fiMPjnS3zS2vexa4BKZ20UP2PBfJWrLg9FJJgKD9AHVQ7hnIn5WTjgLxHl3YsebUs10
         OBFCDzTu+zCgtP4hbZuSrXLst9VnuDKTB/xMWOiCmNXvz1F97yAygaBk5OusplcxRU4n
         /LqulZH3QeEN4rUrv9TYDiKxgaBTuP9NhB3Gplrc2z2yUBCzkghS2H4/LshOa9VukWEb
         IOBDSJ1+gWaqve+vUT/uqV0uwXnjWig1X1lDAWMrtlhS+vLZgHzdmpx3OcZAWAXtMFdi
         2eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864199; x=1734468999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIBTmdZT1CeQa/YiyV/zUEgqbfRcHG6e+rqZgX+0bV4=;
        b=Mf6ytFN41GDoyLzEIAY6g4o2htDlFXT4+LdNVi2N8DVDLxM4mYvwLfd2KsvN3p/xuU
         ThCKvSoX6t4HK4CzLwAw2zQE3uvuKb6gNY0DcS3lRuMpyzHe8Hb/aTOA8yMl1w5AiuSY
         QUOLhSgDrcraw0+TYHp692qNdfZLtkWLiXl24VawzmjOo32IWH0W6XkDFuz0GJ4/FFHT
         zbts5+VrgQfgOSH7mL2xkNMqJJ+zYsDA3ME2rOEJHOGmHzuIVMyhMrlFPewR9CZVQsdx
         sOCZjurgv+924RG2RgOH5FR3eevRVQR0LA2E+3eVjRLP4zb5J5sAOZ8ANUacnrLahEOV
         B+FA==
X-Gm-Message-State: AOJu0Yx4D8/+59mdTQNbMdIZxtags8179wRx+jXx6+4Zp/zp11SYefxM
	VSvotwtei1BwutyOZLQgMs5mAxw34qmZ7tAPFyTc86geTwbbtVDp1Fh9EKp5wDN6lExDIxCuL0q
	0
X-Gm-Gg: ASbGncviGnKvnDZ2teM+9dBt3wGfMCNA6LSh11EMNai/c9CjizJ4aFbIBN3RjUs09DP
	gXWB0rdN0ejXkieb9huvZdqod/g7NpV26nz8dA2ASrKTu4N0M5fSsIhlKVixj/hDO426L1FEJah
	lOf/hD93K7L/67eVq+G6rwVIH0Wgtsi/DLp2neV6VPC0ze0esOkfh7ClwurHllOyAV0EjkcqYqA
	pNuBkpmNc/sC14gcojjsYNOAWgP+d60rl2l9ex+xuM=
X-Google-Smtp-Source: AGHT+IGLUAWPHVWD7DQBfyVCKTG+CWNDSIQWOtbAjy+DKlomi3/VaSFeVAQShZW6vxDFV8sAuOex5w==
X-Received: by 2002:a17:90a:c107:b0:2ee:b26c:10a0 with SMTP id 98e67ed59e1d1-2f12808bb7dmr634782a91.24.1733864199170;
        Tue, 10 Dec 2024 12:56:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/12] ffmpeg: fix CVE-2024-28661
Date: Tue, 10 Dec 2024 12:56:18 -0800
Message-Id: <4ca1544e95e327c7060efa845aa69c2a1eb1d782.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208545

From: Archana Polampalli <archana.polampalli@windriver.com>

Some of the changes are already present in recipe version

Ref:
https://github.com/FFmpeg/FFmpeg/commit/148ada5577262c6c18ae97604df8fe1c18b096e2
https://ffmpeg.org/security.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-28661.patch        | 37 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
new file mode 100644
index 0000000000..b42badb567
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-28661.patch
@@ -0,0 +1,37 @@
+From 66b50445cb36cf6adb49c2397362509aedb42c71 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Fri, 16 Feb 2024 11:17:13 -0300
+Subject: [PATCH 1/3] avcodec/speexdec: check for sane frame_size values
+
+Regression since ab39cc36c72bb73318bb911acb66873de850a107.
+
+Fixes heap buffer overflows
+Fixes ticket #10866
+
+Reported-by: sploitem <sploitem@gmail.com>
+Reviewed-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2024-28661
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/66b50445cb36cf6adb49c2397362509aedb42c71]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavcodec/speexdec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavcodec/speexdec.c b/libavcodec/speexdec.c
+index 08c7e77..23b8605 100644
+--- a/libavcodec/speexdec.c
++++ b/libavcodec/speexdec.c
+@@ -1422,6 +1422,7 @@ static int parse_speex_extradata(AVCodecContext *avctx,
+     s->frame_size = bytestream_get_le32(&buf);
+     if (s->frame_size < NB_FRAME_SIZE << s->mode)
+         return AVERROR_INVALIDDATA;
++    s->frame_size *= 1 + (s->mode > 0);
+     s->vbr = bytestream_get_le32(&buf);
+     s->frames_per_packet = bytestream_get_le32(&buf);
+     if (s->frames_per_packet <= 0 ||
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 47be4d3e71..acff21f558 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -33,6 +33,7 @@ SRC_URI = " \
     file://CVE-2023-50008.patch \
     file://CVE-2024-32230.patch \
     file://CVE-2023-49501.patch \
+    file://CVE-2024-28661.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


