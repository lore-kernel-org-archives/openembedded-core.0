Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D44ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.9369.1662016904791665444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CeKB9s4R;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id k9so21134535wri.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BgfEqNjMIMkokgpq8n13KwBQ+potT4Qrwv6OAOVdVQQ=;
        b=CeKB9s4RLzrPPSFS8TwLIkjdvJMQlzxy6kLw30L5omzy9I+rKsjjUMiuEJsMApdqBC
         x1I9oQPH58LxPog05BNDKmkQz7TQP/THq8X5l32dAbDGVKsszkc9rUVrTHtTys+yVDXi
         5jiG5IBTO7Wrdc/5ADl9wpX5XIxeJi80SWd1LKmIwS4Q33goywzTDH7lqUkjLeUSGJpm
         lYDm5j7AvLihbB2ivhU0q1Y5wJHlmjxOVgGNsxCPTd2Zm1OBiBQs9RKK/NOE0n64v3Gu
         VkUtQcV0FYCITByNIffCGBMgD3yA9WV/w2V2HxqKTvZQYUqNkb3xJGN5v5yD+hF1PGd4
         tPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BgfEqNjMIMkokgpq8n13KwBQ+potT4Qrwv6OAOVdVQQ=;
        b=LfIvym4reH7hmHmhSv1uT9S1x7XUqYAAL6HASBYS1o03doFaFsgFaIH7KibwWMU96F
         V21pPXDL6dYy4YyI391GnTUNKpczq5CoTXW34aB7LVV8mcfYRn96TSRG+p/YvYqcPfZC
         iMqY51A+0Kf2JqdVTghC/qs3nUpwzpSZD6Y/Tebp8HYW46jjt3XGs6fsIFKeKTJONfAk
         EWTpO/80KXLn0pis3lRvybjJijKxB2GoprgnNIJ6D1ViUiEDa05D4lI4Gc586SNdUVh8
         J4pGs2vqGD5X5lrhl9L2YzeAqvGEypF2YkQ4bIe70QeAVqDRHUEAjH/w22+byLNxCrNM
         Qmpg==
X-Gm-Message-State: ACgBeo3PeK5RHLQv4jMzdRn49ukMTa5OyOY0OvYub9jU2isQuUWkVufi
	ezwc8EVbUfoz7XlgB5dR4DBSL6g/puk=
X-Google-Smtp-Source: 
 AA6agR4jvFrE3NRdWP/sNP+HXNzw9pF1Lz2FE6VLpcwEDZoCTAdbRF1ArnoiYlzwx8MkGnryMZuCLg==
X-Received: by 2002:adf:d1c7:0:b0:226:ee75:3e73 with SMTP id
 b7-20020adfd1c7000000b00226ee753e73mr3234342wrd.239.1662016903327;
        Thu, 01 Sep 2022 00:21:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/14] mc: submit perl warnings patch upstream
Date: Thu,  1 Sep 2022 09:21:19 +0200
Message-Id: <20220901072125.3366367-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170150

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mc/files/0001-mc-replace-perl-w-with-use-warnings.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch b/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
index bf8037cd28..012a499684 100644
--- a/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
+++ b/meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch
@@ -17,7 +17,7 @@ So replace "perl -w" with "use warnings" to make it work.
 
 The man2hlp.in already has "use warnings;", so just remove '-w' is OK.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/MidnightCommander/mc/pull/174]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
-- 
2.30.2


