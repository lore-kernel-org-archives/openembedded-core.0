Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ADEC10F00
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.19152.1713529195610783244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D3lRa0k3;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso1761456a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529194; x=1714133994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKzP/QUxqOds3tEgQpl+N4R316z10IA3wMTQxNdsrMs=;
        b=D3lRa0k3HnV7rU3SBNSbqCaV5lOL/n3ASXSL3dT7eXW25oDkCcXmM9RNck1J14vjNo
         fEoKBPr1zLcVvyrQfNAAbXm1p/oY6UPyowvx2bb4z6HHpeEfT12/OPHY2bLGF2BBT7xm
         PdKPAg5ODOJBsV6docqegBcRmur3M/Enx2kb5J1ACkS1Ztlvs5E26KdJXR40TuoS9Axk
         eslQlxM43QoXZPBfJzmKSHE8lnq7clxl2Tb5p81I1sPG6ttd9yg1GrzCcbu4XjOLZAod
         We2dVGDQD41Vgqg/gxFb9KfR9phdHxq+Qlvt0/KYfX2qYv5QdqtX67SoutEe5H2JBA7k
         fhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529194; x=1714133994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKzP/QUxqOds3tEgQpl+N4R316z10IA3wMTQxNdsrMs=;
        b=esFm3S0EiY3B2QtW+jw/KwwpvgihHbS8wTQ9Ix8f1i2m31T1wEXqdibM2kcWXpG5ac
         BcDhAxsMBVhVM72amnVF38Uj9f3l+w4eNjqgKa4I1khPzg6lqaDN44j157ob19s5T1Ck
         DvKqEp55hfIaAIgxk7t7g0Ri+Q6UA/TrvCMM9aODLmQLhQuvqlNmZT6Mor6lTMZFIkKG
         5aNaWC0ADvSmFLi5jsX67F9GCD9XgmU0K4Fns5QtQzyFt4DfJfFdJUMV5asdDOjEomMe
         1kQLVQDXJMFTILEYmRkhiRWUa6PLSAbIv+1/GIv/aqBk5x41jq/TCIF5RVBrzIYikfZH
         3iJQ==
X-Gm-Message-State: AOJu0Yzzrty+awDrB7NcyheAZzV/yruANhXbV8XsSGIhVE7SjXm/AaFO
	BfaZ0wsL/WuZufYrrfrNhJNRsqdwnp+xiyGyXfooKJ3wseQK5MDplc//EA==
X-Google-Smtp-Source: AGHT+IEuFrrJpG9P6kA+Grsa6WZAiEpq8uqMkc9Jg+sCJRI2SXzzO7vvQPHtrQ6UbEkftjjF1ZcmHw==
X-Received: by 2002:a50:d542:0:b0:568:cdd8:cf60 with SMTP id f2-20020a50d542000000b00568cdd8cf60mr1884176edj.8.1713529193974;
        Fri, 19 Apr 2024 05:19:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/19] apr: submit 0001-Add-option-to-disable-timed-dependant-tests.patch upstream
Date: Fri, 19 Apr 2024 14:19:34 +0200
Message-Id: <20240419121945.1920944-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198536

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../apr/0001-Add-option-to-disable-timed-dependant-tests.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
index a274f3a16e3..b46dc76a863 100644
--- a/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
+++ b/meta/recipes-support/apr/apr/0001-Add-option-to-disable-timed-dependant-tests.patch
@@ -7,7 +7,7 @@ The disabled tests rely on timing to pass correctly. On a virtualized
 system under heavy load, these tests randomly fail because they miss
 a timer or other timing related issues.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/apache/apr/pull/54]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
 
 ---
-- 
2.39.2


