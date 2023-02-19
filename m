Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A61C678D5
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3846.1676835075403345916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IoF6xAdj;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id o18so968067wrw.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G8CUKgHnuLyxJg1CrQYQtTjGU6Ake77CTWhYhTUhA4=;
        b=IoF6xAdjQ2mMOqsaR9iDivX0MZfaHcbDWkkxnv/9GFRsBUnJfEeI7mizSRfH6Xozw2
         SKedaPwt8XQUxvogAmiFXwNIVTYEBfHBtgxXoXWY45ytFPFhf5LlvUaeRsvp2pCugRLQ
         snd8FZuPCg29rPUg6/gdsfwsMjzkD7QeIMrt9jxTKaWAdRJzpRovEwI6zRkHKj0W+vDq
         xy9UKfYeTQBUOK7f9HIbGQ6Vk5fwLNuy/M/K66Y1TpW/PrFY7PRl2UN9z17+9kZguLXx
         8nbwUka5o04jVC+JUguJXLUSYdcVVd8jNbajcOTe2RnRCtTsHrAokL0+zBZrQxfkusGL
         FtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5G8CUKgHnuLyxJg1CrQYQtTjGU6Ake77CTWhYhTUhA4=;
        b=HBvDWWDsJlffHsLqiOScJ9QItRVbyVP//oWupasjpPc2k6PIL4MQKwae0RHeaC6CXr
         iTjMnqo3zOcKVl27plpxrvyfdHV15eu6idgie0OcCGCFqhVPT7xy2/JhhhD7g0Gb8pX4
         GzxmJxvB2mMOgoeU1QO9dtUQY+lJV/zKzizz+7rX+GgF0aKoGfrtswMmq6fpA3AEId2X
         aGqvjdB/l0y9PvdDYOcaxO5u1/kggFwJEldMUTUBHeJPEONChDtI4c1XWuCAHvuwXwxw
         fnY0fQQwoAy20S7yp+j0EqoORVvQ9LooIlePUQwaQ1cZbewFWz7deP+I+B6b063cq4n5
         on5A==
X-Gm-Message-State: AO0yUKWCgd3Et6CP/3WRb/mfNolrn3BW3NysBvAN+4JnvO2VFZTl4ZhG
	sqJME3Gei0nCRnrkqYKKo/MpzhyL0/4=
X-Google-Smtp-Source: AK7set/OOZeG+C6vCRsx/Blok4/PWEPDRakAAudno1nkJr8dbXEm7/Bha38MkvcX+8AP4Idu8fdBtg==
X-Received: by 2002:a05:6000:503:b0:2c6:dbe7:1d8e with SMTP id a3-20020a056000050300b002c6dbe71d8emr270377wrf.45.1676835073947;
        Sun, 19 Feb 2023 11:31:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/39] nghttp2: upgrade 1.51.0 -> 1.52.0
Date: Sun, 19 Feb 2023 20:30:36 +0100
Message-Id: <20230219193101.338397-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177358

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nghttp2/{nghttp2_1.51.0.bb => nghttp2_1.52.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.51.0.bb => nghttp2_1.52.0.bb} (92%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
similarity index 92%
rename from meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
index 8ddb851f71..f87def14ad 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "66aa76d97c143f42295405a31413e5e7d157968dad9f957bb4b015b598882e6b"
+SRC_URI[sha256sum] = "3ea9f0439e60469ad4d39cb349938684ffb929dd7e8e06a7bffe9f9d21f8ba7d"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.30.2


