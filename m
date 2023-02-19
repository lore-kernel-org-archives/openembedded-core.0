Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4327BC677F1
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3841.1676835070862692901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B+pu4Ozu;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c3so883821wrb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cm3F5YthRsLSqUhlJj1uyALpt8qizA2UrORThLLHjPw=;
        b=B+pu4Ozu/lfRK2FP5tNSVsqxW5GlbOx7rTq7sYQQMshC82JMjEuW4OatZC+6wKipwu
         uXi++3S4Ia9dnB+AK/9ob5cMlgTWrBcTHlWwoZJ6NS5zZT2oOeBJtoiUxOPaSOTnlMLQ
         TkabjrjfN5cXr74tHbCbkcZlf/YyqpeLeusLNwej3zJ500syd2zbjFS78PFePOQE31DL
         fAxMVhasSWh9UfCa0PpaRwGhSAi9AgrJCDFzEqJo6tQ39631oF5K2UqHSCTjzXUHSkNr
         yPbfeVl2zRaPmOqKJnREb5Z7UuTVpIKjDSM2+j5ZkcDqbJP5KcxwdK5pgAzpG83DeD55
         jOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cm3F5YthRsLSqUhlJj1uyALpt8qizA2UrORThLLHjPw=;
        b=k4mdV4CbP69y6OinPiPge1DdU4d2YnLE+XppmEzWR+1kLCEk1i3GeCH4KzONb3lLMc
         Y1elRojrpz6DtidpRpRAPvvLMHTmkMf1y7soBt9RfvMbZgYxEnwnQjDElEFkIdxNd8qP
         BM8UpsejAV4780rsgOfMu36Y1fh+4dR9MmDnOtjFMibXCxMm0aSG6WbZxPkDPvLKF3Az
         tXE8RnWxkOgcUd/7lShyArqfzlQC13DiUqdSah89GCsc+xsM8xnzW4Gl9EsyqJ6fHdSY
         QlFuwpQlJg98rXVHZ3eR2IWFy6pOR3cHmdf8jx/z2Cq/OAokpQ6shaWq4bxcp2ou4vSR
         0j6Q==
X-Gm-Message-State: AO0yUKUGXl5+vroLVwoRLI4AHqo2crmYRJgltDLh/pbErrgIBT+98EXw
	unTjkSD33yoAY+US1WLjIsxQwJrDLAM=
X-Google-Smtp-Source: AK7set9djd0BKwxwhyRcPl0gDtCO3LDxyw5oQ/umq95NySpBD1oU3Fu7ZaO7Pvde4Z6tD15aFkdlow==
X-Received: by 2002:a5d:4e50:0:b0:2c5:4c32:92cd with SMTP id r16-20020a5d4e50000000b002c54c3292cdmr763891wrt.35.1676835074635;
        Sun, 19 Feb 2023 11:31:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/39] log4cplus: upgrade 2.0.8 -> 2.1.0
Date: Sun, 19 Feb 2023 20:30:37 +0100
Message-Id: <20230219193101.338397-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177357

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../log4cplus/{log4cplus_2.0.8.bb => log4cplus_2.1.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.0.8.bb => log4cplus_2.1.0.bb} (90%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb
similarity index 90%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb
index bbf4ce6218..e0c16d2e73 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.0.8.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.1.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
           "
-SRC_URI[sha256sum] = "cdc3c738e00be84d8d03b580816b9f12628ecc1d71e1395080c802615d2d9ced"
+SRC_URI[sha256sum] = "2a8eb99d71b0680c0520c7c16248cdb4195da82f396b79fea30b0d9e289c8c72"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/log4cplus/files/log4cplus-stable/"
 UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
-- 
2.30.2


