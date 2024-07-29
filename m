Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8A0C52CDA
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:37 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.55957.1722258811856638611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p0Sj4pQm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb674b48ccso1871347a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258811; x=1722863611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LZN/k5/MAxVXFG7luXNUcL5R75Lg+j/87JdfG/X6pA=;
        b=p0Sj4pQmBQZXejqEnFmDPIpAFb/WVCCbesldryVEi1njY6ZLP7QedMnRfbM3KA/Do9
         V4VHJG7aFwYAkGA5o/pguJf7oyHRmNc/YgJ5HsZCtK3jIgOuPiVELtj2as6VjQRH7Hp9
         Ep8g1egTCGnx4krc8bMTR1cBKVb122l4sKpdGpJljJS0IAARJEUdncntcV0JpBrD30ls
         SI/1fNEbV0yjdAMTe8jzQuYVjnFNqL+qJhcLfvPaqJElWwSuwtwN95TXFGEHrT8lF35v
         SjjMeAgRpuOid7Rb5coqWwTKiSlyOURBt9p931ZDSCog2xtdySzOsMubHJrZfyhSMa6H
         hJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258811; x=1722863611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LZN/k5/MAxVXFG7luXNUcL5R75Lg+j/87JdfG/X6pA=;
        b=WrwzopSmoO8Ck3e0GTsiQWiAkMuWGtCicWaCB3fcG3o7d2lZQtG4bUG48QZFNRNDxT
         2YRSFnsX0WbhEHr6xs0L1oex98/A441POQZnFCwfb/5PzvH64XCaITtOubOG6DrNpWOK
         u89fZYrQT7wbhXDSrDlJE3KHvLKpLM0s1lHzGnRLnpEY6sdKh6NiyeEg8d3kiofhmY9o
         +WVPq1rCWlC9Htq0kHoFsk8n02Q1K0maViw13aEWGRKzm3uFHvl5wCCkP0YI9b5F63VQ
         dMQH5+1h2D17oxqsP54rZ2+V288AyaOzBSM0dDKgqwJ1vB8JGJFQ8jmrO0+wWDXy/DBS
         5kBQ==
X-Gm-Message-State: AOJu0YwEivudNtcmy2YINjaAYeRwCD2mny21zA/fhvl6GvqpAAN/jSyd
	rr12ZpBdgSGcnNYFCIbOnpuYn7Nw1Lv56OS7fz2+EoIhLTJiLzs5OytDvUGemx4lMm05ty+0FGn
	iod5Drg==
X-Google-Smtp-Source: AGHT+IHVGyy6wS78Xf3OgwHGhZHMZLVIiQNxg7Y4kaALvMHJmbctxR5IAAl7DlV7xSERRfFONlHZOQ==
X-Received: by 2002:a17:90a:7447:b0:2cc:f538:7cf0 with SMTP id 98e67ed59e1d1-2cf7e098498mr5437985a91.4.1722258811058;
        Mon, 29 Jul 2024 06:13:31 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/37] python3: submit deterministic_imports.patch upstream as a ticket
Date: Mon, 29 Jul 2024 06:12:35 -0700
Message-Id: <eb3868d99ef2d5fa9fafc9cf947209d81ab5f11f.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202639

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d77511cc9add70857e4a9d7237b23d7d6ae14e98)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-devtools/python/python3/deterministic_imports.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 104df94964..2de6ae2e98 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -11,7 +11,7 @@ has caused a long string of different issues for us.
 
 As a result, patch this to a behaviour which works for us.
 
-Upstream-Status: Pending [need to talk to upstream to see if they'll take one or both fixes]
+Upstream-Status: Submitted [https://github.com/python/cpython/issues/120492; need to first talk to upstream to see if they'll take one or both fixes]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
-- 
2.34.1


