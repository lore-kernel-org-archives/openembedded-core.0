Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA43D2CE08
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:58:16 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.23735.1729616291042037653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 09:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Y9vO+Jot;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b152a923a3so389530585a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729616290; x=1730221090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bYDtllyH+TErLtE1YS7ZZKcElNx38xa50kSUInmeYaU=;
        b=Y9vO+Jot6CzNin0+mK5cseTYGf49/3GZ5rWJx//NLUdUyTiR2V/eQWVLdwShAbIX1N
         3n8yYF7AgIuOfVjwqzXEciIPLWAmdzdTeBQCe0nT8W3BlmRISogc+D1Ni/+RLiBIYZR0
         jylNYiFOUkJn/mv1SLA2RElTgI8rH2IbNsCq7tMHjd55FoNt7/4PlpsI+JiHrDlFzx21
         M7MqQZ6cIl9wR8SGKpTtUiMI81gnR28IA4rxRFZt+mVeYhMzdm5hCmDuqPpr8kdIlV3p
         e/Kzv+9/ioo0f/pwl8ya+Xdr3BGDZ54JCSfni52aZi4iOWt1ntPWYGe/iNIWb+sUrOVz
         AI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616290; x=1730221090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYDtllyH+TErLtE1YS7ZZKcElNx38xa50kSUInmeYaU=;
        b=pCU8HSk0aO5sniqFvqhKJeV2w0cMG5hvi5rjgib3Wv4ZOmbpWWsFhkovrPgAwgS8/m
         KGSWnmeNxNRY41RqZ4xkBi2o+80oXkxuzezZAVluUAYl63e/IlU/CUdwNIIvXbJUZGpE
         2ipRmx3vyOjISKKgDNnlHE/stZt7kuj9NEutCN2BsoC9MupwpBS+zhAUPa/7bYlr9DtP
         nyBr6moXYv0AhF9jtmRErgLKekQnNXz8q9LaPS3RhXI8f6Knqu6BXTezQUYAsiKysaXg
         AuHZOQtBbrs5NqUFBEyfw+hMpk+m/+79tf4N8hnDtPJGtHZmfFNc0Vdj6QM4lt5G0RG9
         C3kg==
X-Gm-Message-State: AOJu0YyOOj3y3y8yDxTze8bx5Cp9SR6Lc845r1jM76Kn1gP2o6CQJ7kF
	4ghQUou/x0O7qRKSh7RcYoFy90VAz+anP8N/Gxq4fmTNTKumbObBcMEcMiAMPR68/MydR8NZG2a
	5
X-Google-Smtp-Source: AGHT+IGvwsd7GU2ckBCXvjyTbxz2+xqfBNiGwpbQlonC7aUQwA9eYQROIfdpSx7I+jqA8QcD8p0A3A==
X-Received: by 2002:a05:620a:24d2:b0:7b1:4b2e:3c0 with SMTP id af79cd13be357-7b176722d12mr361285485a.14.1729616289953;
        Tue, 22 Oct 2024 09:58:09 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659b97f5sm297130985a.6.2024.10.22.09.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:58:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6] python3-hypothesis: add python3-zoneinfo to RDEPENDS
Date: Tue, 22 Oct 2024 12:58:04 -0400
Message-Id: <20241022165807.2601020-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022165807.2601020-1-tgamblin@baylibre.com>
References: <20241022165807.2601020-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206163

This fixes the following runtime issue:

|root@qemux86-64:~# python3
|Python 3.12.6 (main, Sep  6 2024, 19:03:47) [GCC 14.2.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import hypothesis
|Traceback (most recent call last):
|  File "<stdin>", line 1, in <module>
|  File "/usr/lib/python3.12/site-packages/hypothesis/__init__.py", line 29, in <module>
|    from hypothesis.core import example, find, given, reproduce_failure, seed
|  File "/usr/lib/python3.12/site-packages/hypothesis/core.py", line 44, in <module>
|    from hypothesis import strategies as st
|  File "/usr/lib/python3.12/site-packages/hypothesis/strategies/__init__.py", line 48, in <module>
|    from hypothesis.strategies._internal.datetime import (
|  File "/usr/lib/python3.12/site-packages/hypothesis/strategies/_internal/datetime.py", line 13, in <module>
|    import zoneinfo
|ModuleNotFoundError: No module named 'zoneinfo'

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
index 1010348e387..b66fa9ce47b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
@@ -24,6 +24,7 @@ RDEPENDS:${PN} += " \
     python3-sortedcontainers \
     python3-statistics \
     python3-unittest \
+    python3-zoneinfo \
     "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.39.5


