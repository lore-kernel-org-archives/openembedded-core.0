Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88138C43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:30 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.13291.1668953788637235746
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=c0SCBnnP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id b21so8417607plc.9
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNBuqjHHKei3onCnGBKM+dL9fkj43mjVAg3+ZacoNpw=;
        b=c0SCBnnPQ283hejCJVM8qdM+NFXaYDMwT5yQPHDVhmmWAqbtPH5VbxOB82KCWtVOJ2
         6fOZsoAK3XYuhU+l9uO5UvEilqrmb1o/XpcAfeWt+SBX7S+wc5mRkQBNu9kNEVBHr1Xc
         WU9O5O0yKpX1tIoAnNmS3YyOn0yNDGAM1v7O/EgRNY8OoBMBsy8hDdaVEWc7WwJkqYU2
         mm/XL6NUSxyYpmqK1oN5YG1OShFYPN2CfOwN0BF7+iwH8JtSeX28lxVcxuHCfsP5AryB
         0SS6rXD1CKfkGDk/Aw30qaatK207cUFJc0xDF2DRorDovC2Qaj80YMy0tbc0PJ/xyoDs
         gFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNBuqjHHKei3onCnGBKM+dL9fkj43mjVAg3+ZacoNpw=;
        b=TPeaHYiXmbbEKVCiQbC6RfKCiBlQ16Oq7t4v6yVXP6l1NEjS0QN113uCFjGAnxK61L
         nXezqk0dBCHeVR7ZqvETp8zsx4WP/n8SrPKExI1cmgQyZX6tr+49YNxpPLZvrRF3t2Lx
         Fsrcm5NipmuLK+nnmIPCgtZdZx3g8IG5+mTB3jgLyq0oi/Rl60e4ouZGeYQ23roFn8qz
         6ujUvx8EgUbIn1rNMSIhCaFsGPc8SIupr1FARQestWgdLkEg6dyoPk/JpLo7fcR5V4iR
         52V6+NVr6b0yEbxmFYzLgCjdyq1FmsLPik2SE1ppk8ATqDTi03PqdsRHGxpuKPUady1O
         Ot+Q==
X-Gm-Message-State: ANoB5pm+UYO+YyE10rVVv4uqcNMFJxsatUPInP43Eq1N3AIJ9eTAgN64
	NNmsnIlw6ylaYyRujEeoLNJLemZGRQTCIlPCM8w=
X-Google-Smtp-Source: AA0mqf5N80KppTTibZmK2Dc9S1dZMdiLeJPaNUh/CMR/UKDzSkSk9QV3B1SSrlVY/r7tNLbt0IJcIQ==
X-Received: by 2002:a17:902:d58d:b0:187:2502:888f with SMTP id k13-20020a170902d58d00b001872502888fmr7920285plh.136.1668953787675;
        Sun, 20 Nov 2022 06:16:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/35] bitbake.conf: Drop export of SOURCE_DATE_EPOCH_FALLBACK
Date: Sun, 20 Nov 2022 04:15:16 -1000
Message-Id: <7a1555a0f4223f8ca4485b410de91098301d5896.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173627

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst SDE definitely needs to be exported, the fallback does not as
it is only used in our python code via the datastore.

It was introduced as an export in 9a1dde74e794362399193dc3f81c9685a83d0776
but even then it doesn't look like it needed to be, likely just a copy and
paste mistake.

Drop the export.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 74fb6539dd06acb0dd6a9af4809152975e8473e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 516a30c963..82b115e3a2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -671,7 +671,7 @@ export PYTHONHASHSEED = "0"
 export PERL_HASH_SEED = "0"
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
-export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
+SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
 
 ##################################################################
-- 
2.25.1


