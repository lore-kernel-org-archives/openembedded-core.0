Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C2EC433FE
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 11:22:26 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.8782.1651922543049916736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 04:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jd011n4N;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id g6so18723990ejw.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRF2ATuFMuDBPkP7KuQZd0DsFKSb+TQBWDVokelevEo=;
        b=Jd011n4NIznH8+XhbUpPUeJeOFLfJiTqYtnLxH6FA5S9sPXbhvtSIhbU++IJRPhmlF
         xHbyHQkY78qiyd6lqX2rk5sBso53+P1m76BlSNiQqH1a5eb8Gl4wcyvwH6auVLb8GfTQ
         NwmZ6m26QLP7M/KAm13Db5PyQ3ErL3H7rj+DR0mKB5cEcgV5U5oXITgBhNzADzOv0gcG
         Gz8HoZFhgu+HRg7gaHWu8EY64vDXWO3aHfJFCBqpf846YLGGrN2D+f4eGqnAAudrqY/I
         s46EHQ1Qu68+bM2Rp27+sse6QhXqXl/EfPeSvzh1zVAP2il7ji8CZVVuszBJ3nAyRFCp
         INYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRF2ATuFMuDBPkP7KuQZd0DsFKSb+TQBWDVokelevEo=;
        b=sKrb0znREH2H0AN7Z5R6uUJmohmsN2exxm5goDCEqTmKW9gKdBAvxTl3rSa7meWLWh
         CIdLi69d8J5WPurz728E2jGz/heFlgzuZ3aHatJzXZIIg3ScsQUAUAzONC/rhlNZtCRq
         3K0wri56NcsWAO+TxjttbDEo0luuVCPJOs17rN95Plc6WIt6jpkyfZiaTaZRAZUovGWJ
         x33BB1A1wr1iYlaNCYoq7Sb4cbrxGfgHa6IdoWKW2Tykjq6J+HNSC0Ufx4KCZwWAgReF
         v57GZVuheXpGAc8VMCgMe0sNldAvtatizJ0+6U/MssJCHOehbPnvv7pVeIU+TCEJDFx9
         tNqA==
X-Gm-Message-State: AOAM533o/ctXZdXvp+ER5iT05BMf+4LKG9SMiDoIazYWpwDtamjckmCc
	41O8lp2QRHeWtq/G+3dFD7LvsKBTOTY=
X-Google-Smtp-Source: 
 ABdhPJyBLD/6AtvpEUI8FPgZw0fm8lu6j0yDm/Rs6Dnx7WuRAouKykSgnqeUj6d5Sit267BugT8jyA==
X-Received: by 2002:a17:906:99c2:b0:6f4:a99c:8dfc with SMTP id
 s2-20020a17090699c200b006f4a99c8dfcmr7396921ejn.386.1651922541347;
        Sat, 07 May 2022 04:22:21 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 gz12-20020a170906f2cc00b006f3ef214de8sm2898577ejb.78.2022.05.07.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 04:22:20 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 3/4] pypi.bbclass: Set CVE_PRODUCT to PYPI_PACKAGE
Date: Sat,  7 May 2022 12:22:11 +0100
Message-Id: <20220507112212.16408-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507112212.16408-1-alex.kiernan@gmail.com>
References: <20220507112212.16408-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 11:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165362

The CVE product name for PyPI packages is (usually) the same as the PyPI
package name (and not our recipe name), so use that as the default.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes/pypi.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index 9405d5860181..5fa7b8a6ae23 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -24,3 +24,5 @@ S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
 UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
+
+CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
-- 
2.35.1


