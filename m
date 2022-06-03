Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C8DC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 08:56:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.5245.1654246589557456174
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 01:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gBwka7sx;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id r129so3751908wmr.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X9afBzvVV9/uQaVdBiCjsqrxrd18TQ7L1wilLc3NEiM=;
        b=gBwka7sx5j+cIUZib7cBuJrAIkHXivZU0Odim0LYGEZClH7J133wPjfty/cSgRjvth
         1faxpJAuicwCDD+/uATxs0dHDrh9FuaQ5v5Gtnq80p4+wd6vBcwNXoZLCsNfhXPL9DiV
         jjihG0aYuQQtrrJJhhJoUB0IUqKkGmRbc7xu7Vmg0ypPoDaNe6uSVq1CFA6JgIZ2KaQC
         76yEknm/z3agYGB2yjoDR1Kyx/boCZJlw2ZkvNvyTJ60VQyxMEgn0pSdjaLGluYWX74D
         0GDIPz6jLg/AVShR3m6Yh3pBUDBXhbfhoIixaIEVRffvVOkWw9lb1Wyen3ZAVWMozXu4
         wWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X9afBzvVV9/uQaVdBiCjsqrxrd18TQ7L1wilLc3NEiM=;
        b=wmqqlEY+OVfbmzqa6QVfDVZ+YM0YHjYN+AGEa0x9s10nidDjJMHeufV3ymGAr3a3gC
         bgjDLcbBIPlKwU4ozwF13wzOq402mb7YvuFIanGgJ6mh7QLKC4xnsAryrPxx+C5cC/7v
         gabIjJ5juBoeyDur03c/ewTQ/MiIvrNt9ZsS7o3IexAAnINIiFJJK+4SMlNh0PUJLELg
         8PnNstmQeVptLC/ZdbP1Xcpeen8QpkyCsS1dGaWh3EgV9HW6f3SwZ4LxoxRuE2bbOCDm
         1RHpqlKlqMjqSI53JLY72ZT28oVznArGeQEOU9LdVmu+6TtPIt3jEsXF2OzRiDmwfPn5
         T9bg==
X-Gm-Message-State: AOAM5325fm2uUsTBeXPmbcJAew5maNm1zjmMuPjz4XK9h6VinXMRyo30
	J7VbDA/cg4cl8YEGf+ivYQJA+O0d3eM=
X-Google-Smtp-Source: 
 ABdhPJx+cszsxeqXqXR96+tlb0aMPu3cCSjhzbiITLUrVMrzm8XHLhNPOIeqEdFco1x+a08+FfHP7w==
X-Received: by 2002:a05:600c:3788:b0:39c:3a20:a50e with SMTP id
 o8-20020a05600c378800b0039c3a20a50emr3269820wmr.196.1654246587639;
        Fri, 03 Jun 2022 01:56:27 -0700 (PDT)
Received: from localhost.localdomain ([80.215.210.162])
        by smtp.gmail.com with ESMTPSA id
 w16-20020adff9d0000000b002103de97455sm6726183wrr.69.2022.06.03.01.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:56:27 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH] cve-check: fix return type in check_cves
Date: Fri,  3 Jun 2022 10:56:14 +0200
Message-Id: <20220603085614.2214637-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 08:56:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166512

Make empty return types in check_cvs the same for all code paths.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c80a365819..c5c22c4c51 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -269,7 +269,7 @@ def check_cves(d, patched_cves):
     products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
-        return ([], [], [], {})
+        return ([], [], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been skipped/ignored we return empty lists
-- 
2.33.0


