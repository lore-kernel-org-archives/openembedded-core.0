Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47267C677C4
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 20:58:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.5506.1749243511805785406
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 13:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KK9QWpjZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a51d552de4so1423472f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749243510; x=1749848310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24KoRmr6j37rPZaMxaqnSd/338S1bGZaFmZ2mWjASH8=;
        b=KK9QWpjZTrtrPCWfiz7LX8enOB092GNUw9tXQg7p6uFwaWA+zDMzyn0/s5pPSq9aau
         2poYS2l156jCWl4UZkTbAHERbSWfu8D62SNPkhcPR4pcM4qccWvY4c7Ml45cFdkIxx2T
         zEwKeKMbqngBwTyq/7x6RAsJxq2+mxcQMkXJxcRWbzexybYYkX/YHT0D2NmaAnXGL3Gw
         O35anXWaWOttfWkRWpCRsAkP068us6pArI1KWfB9ki8F7hWO4HNIKwsMC41cVFkVOD1q
         ga47/l4/YhKCNnsZ1hu7Lmc6LcBWHQCJ5+vkgv4KJO+4A3QBBJ9v9hKsUwUEETLlraO1
         UsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243510; x=1749848310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24KoRmr6j37rPZaMxaqnSd/338S1bGZaFmZ2mWjASH8=;
        b=wLiSgIU/e5IfF1FjkTdkqVYDEFGW401KgIwnMgQvkY7s8W2H2t+VEf/LfNeTaLDE9p
         B7TL9OgHFG2kWvTAGHkKma9zQ+3yIX6bUJmNYSQ7Mk6jaz9mOlBEJtFILg9mu0GCmR78
         ZBEHBUPtINdTe+YXwrxoKQnq04eQYwvVraWEfzkRxay1GncnXpQtCLaO4vKNHDHKs8aO
         KAJNtw9QffzNRS0N8AGoP3NucSNe1ciOwjANvz9wk192I5ydhMI2lvkPECmfLQcxjfo5
         i7JXT77CvGuFvlxfAktG1Ss16WDQWeh+ZIudPibsJ2Zdz43y8p6/lfa3eV/eTPqMu124
         KgmA==
X-Gm-Message-State: AOJu0YzS18zcseUq3Js6UF6nntsTTTpcXl193/6LNI1PEpyj/IK7vo3s
	fxfPBqWYGMTSt1ZvmXTC/zHYC/YdhOvPwCCGdbV9QV7VDsTEjHpVdkZVA0Dhow==
X-Gm-Gg: ASbGncsa8n/rYMVlmUXLGkSJZ6Jojm1XjvzIT5q0RDMh1C2SF0vtCluAghWJMvChEWE
	BmNn6ZhqM1jRSBXfduacdldcyAzUCyuEytTDbdEA/IsP6F3VlxosGifiPmII/7f9fMZfDGnIikK
	xiqHilG5ML3Am4tXLd3NfbieXQtQC7Z80wCSGNEGxtchI8J9nk4F22oSSkuQdYY1pNmLoeD3+0D
	fXDfih9iCGYI5/B3y0nlFz906VaCpejF254fvxHseuwjBvT1+ywy/0azEF3z9PMSAEmA2ldGVf5
	pVuurhfj9n0LAzw/QpT10wpjaHmnaO6Qnz2ebIiNR1F3ogApOjtaBtLbaz8TtLdxtXj1FmEycnw
	TKz5+KT7IJWubJMXXO09yyek=
X-Google-Smtp-Source: AGHT+IG21ua4ZSG73krRUk3s3bEe/CQtmXUVvvpojTeaedbcU7/+WH5P1ux3EtadS2s5Chnl2cNYdA==
X-Received: by 2002:a05:6000:144b:b0:3a4:e6b4:9c4b with SMTP id ffacd0b85a97d-3a5317849cbmr4448064f8f.1.1749243509924;
        Fri, 06 Jun 2025 13:58:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f4e7sm2850859f8f.77.2025.06.06.13.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:58:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] strace: better sed expression for ptest Makefile
Date: Fri,  6 Jun 2025 22:58:08 +0200
Message-Id: <20250606205809.4071299-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606205809.4071299-1-alex.kanavin@gmail.com>
References: <20250606205809.4071299-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 20:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218184

From: Alexander Kanavin <alex@linutronix.de>

The previous one wasn't particularly readable, and assumed
a particular relationship between S and B. The new one
also works when S is in UNPACKDIR, or anywhere else.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/strace/strace_6.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_6.15.bb b/meta/recipes-devtools/strace/strace_6.15.bb
index d8ac2a53d09..2093c92eb31 100644
--- a/meta/recipes-devtools/strace/strace_6.15.bb
+++ b/meta/recipes-devtools/strace/strace_6.15.bb
@@ -45,7 +45,7 @@ do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/src
 	install -m 755 ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
 	install -m 644 ${B}/src/config.h ${D}${PTEST_PATH}/src/
-	sed -e '/^src/s/strace.*[0-9]/ptest/' \
+	sed -e 's/^srcdir = .*/srcdir = ..\/..\/ptest\/tests/' \
 	    -e "/^TEST_LOG_DRIVER =/s|(top_srcdir)|(top_builddir)|" \
 	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
-- 
2.39.5


