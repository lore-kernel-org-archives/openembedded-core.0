Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1931DC433FE
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.22425.1638602023311223077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JHe5TnKX;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t9so10514638wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgC3ERA8LgN8g+zzhJIOFDkYgs3gaVgcx3QGloalifM=;
        b=JHe5TnKXoyNTDqzCLO6PpgJQ5jYkgSMUNZV2bF3DgUj5XZIlQCs3V0a7P8HGcOdsin
         qZXNKfz1g3M9WWDjXQmxBLnfbCozq/mbt8EEl8LVSDpyquPWS2Rd/cLZKYG87Qh0wLQH
         cn8Rgfq6+cbDbHfjpV+RATDkYYVPyUVg3c18LLABcNC0OAjLblmKjrDR8KftV/RrGYLJ
         Dug7jsvnejPW+simNOullhmVl+Mg779aPXgiBrgKqMyGrrrW9SMmGAkCv7xuqPok98lg
         /UcumFjisJaC4YPCfug5PMji3tkw8lgSlKMKJH+zxxo5eQpwqQ6O0ncWNvVZrmkWByZN
         ZeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgC3ERA8LgN8g+zzhJIOFDkYgs3gaVgcx3QGloalifM=;
        b=zhNzImM+E+vV8mU0hOYXQlvjseHWVtpi3b8ZxsqFPsjYkVs/WeRtfXI6aOH2jJxWu9
         eZqmebrqrBmipJiAG+g3nSYTG09vgCMdbOSSniCTnVrNNZ7X3e6r4SULhlGYocAzyyUr
         yI1nCnib1CdJg63HjU8i0WPzUey+hbFNKzvNrgo6cCB4Zqo1W5s68VxN360xv+dl5iJB
         5ATnwwePJEnJfK9jbA09W3v48qaDSBzv7zhmc1NVHaJu250Uphnsz4yWxxJHM/aN7avF
         6z1OedEK9fO5l8f9yoKLQjqjT+tVbYPoQ/BUF0hLHSjFtGfwhyfVwENkf0z8f3C4eZeS
         1vmg==
X-Gm-Message-State: AOAM533BwcfzEva4q1r5XJ6NXmN20NEdMjrMX8MKYh31N6OgmOamgHpj
	K7PbbKShqdKn/2oqx29BnDwn5jjzI0sgzw==
X-Google-Smtp-Source: 
 ABdhPJxA5CC2O1YFKgGHj20ujMl4jfaRBvsC+ozKkS7ETeQYFM221AfwqYuBicKpq7Jyr9jareWaiA==
X-Received: by 2002:a5d:40cf:: with SMTP id
 b15mr27678723wrq.161.1638602021948;
        Fri, 03 Dec 2021 23:13:41 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/26] ffmpeg: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:19 +0100
Message-Id: <20211204071323.2480163-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159169

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-libavutil-include-assembly-with-full-path-from-sourc.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
index 3b503c49c9..2b4ca0e9b9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libavutil-include-assembly-with-full-path-from-sourc.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] libavutil: include assembly with full path from source root
 Otherwise nasm writes the full host-specific paths into .o
 output, which breaks binary reproducibility.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to jamrial@gmail.com,ffmpeg-devel@ffmpeg.org]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  libavutil/x86/cpuid.asm      | 2 +-
-- 
2.20.1


