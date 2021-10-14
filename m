Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C056C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:10:29 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.8333.1634213428610564546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cXYv7BRz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id r18so18789020wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DEpjVSFo7avP1dPxJJ/wu7ZJNTJSLmJubH4pyfdhvY0=;
        b=cXYv7BRznhKkcITZJgP/LNiZJyFi1WeYGfs6UujPh/JIG/UwuyYChwSk4euqavhnYP
         l0T2WCdsF5PZL6Obef0g/8DXXkCKj7p4VXLKo5IegKGTR+pS04Z5vlh4/BPA4vN0G4A+
         vmmS5UJWEO4PJKazdayP3RkTIFsRsudJ0HqDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DEpjVSFo7avP1dPxJJ/wu7ZJNTJSLmJubH4pyfdhvY0=;
        b=5JBKvkvQWakSR1qleBhTp+k/c5Uyq8qTSWIz6SDPA6d41RpiO0SNgvCVfTnHVkmDqL
         8Gk4wBNrpkQf5knmEE1DR8Fw2xPoMsyKlVtURlY6CSuMn2W906kxc0MICusXT2lwZEE6
         x3GfNX7bUjNPSvsYjt3cyr2lg1fa42ytgvj/7zbm/SkaxuMgNakLQozRbMK1q0PUooNW
         pNMuzXRCbWA3l4vRPHfrbEBl+SYHMeTBUnphBUe4INsjH+kv5RH2Buspe8QQ/S4mfLgq
         /AH1VRZ5t08GEJS3fCru/bo6Z2tHS7HdL0ZX1XLe/813lrfEZ8ylikDiJ2+wg3w2Z3hm
         S+Zg==
X-Gm-Message-State: AOAM5338NgcegmyxpKF2bHAAdmA6KXi5yypR3tzIKJ+1YoR92HRzLqft
	3dKw/u4kXB9X3XaMzB4RhLUTL6qjMCzYDA==
X-Google-Smtp-Source: 
 ABdhPJzI6UkVIrHppc7nbc8qcWzDJZgxBNRwqJg9HcooppupQ5mBvezY7XeuDW1Ubm+lsN4Zs1WpEw==
X-Received: by 2002:adf:a390:: with SMTP id l16mr6117714wrb.291.1634213426811;
        Thu, 14 Oct 2021 05:10:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 10sm4296152wme.27.2021.10.14.05.10.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:10:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] reproducible_build: Drop obsolete sstate workaround
Date: Thu, 14 Oct 2021 13:10:20 +0100
Message-Id: <20211014121025.2913401-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:10:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156937

sstate has been sufficiently invalidated since this change was made, drop
the workaround now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/reproducible_build.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index fd90d771d2b..3f661794c61 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -126,10 +126,6 @@ def get_source_date_epoch_value(d):
             s = f.read()
             try:
                 source_date_epoch = int(s)
-                # workaround for old sstate with SDE_FILE content being 0 - use SOURCE_DATE_EPOCH_FALLBACK
-                if source_date_epoch == 0 :
-                    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-                    bb.warn("SOURCE_DATE_EPOCH value from sstate '%s' is deprecated/invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK '%s'" % (s, source_date_epoch))
             except ValueError:
                 bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
                 source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-- 
2.32.0


