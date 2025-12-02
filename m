Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6531FCFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:29:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4054.1764667775734870572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RB69RuVc;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b47f662a0so3017763f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 01:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764667774; x=1765272574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz/TXaP87PYjLiU6SYABzMjHaNB3+JTCEs3eNDKyLU8=;
        b=RB69RuVcTcPj8b2Crl/KJpF/K2RegyVNIlSJWhEn8iTxpDP5S5ngv+TAAB4IsgBcx5
         2WgRZzkZdSsmEPNiy+asNPy/1zxUkz5SagW06Ly+ovFYMNSRStVCZBxNrZC5VT/lDdRo
         Rr8Lv7IFlkRY4Pw6xmPzsqpBBPE7xIrC7h1oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764667774; x=1765272574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uz/TXaP87PYjLiU6SYABzMjHaNB3+JTCEs3eNDKyLU8=;
        b=ckMTWp6LeDfousrKsBd/7nJ0e9o/mLving2U4V+L68qHxO9WK8J9FellwD333HdEDb
         E9j2vobTw7Gi0vmY6aHzw5R9On4OHilZoaMzon/PdtURECTUnRF+WuUQs15paOrcbci2
         jEDDopmY1KaaMp77/QnU0sEREWBV5JZ0v5BYu3x6u++ynDeGWdb5EKe2wbDRtboeZN/N
         h1w9w5UAsxj31piTBqlHO9ytZ3HxzKbOnH9ROURt0H03+XzuOZ8kolJNpeJYd3LhKaUL
         KrRZ3fLmSuMVVFXTf4fXjeQ6wSVzKgEU3dH/buvUYqnMCU7rCSuxB+3IJWOO9SV6QMx3
         Pv9A==
X-Gm-Message-State: AOJu0YxC7IdKJddaVtCBctkF+ZWYl6/P0AjsIh7+g6tNGXQaQl8IzYLt
	qslJnrVSHVDNIeN7FBJhSJj+zrRxDnsa0DntwhVGqOfRkpM6eYFP49D5DEL1XK9+6sH7I4VlC9v
	jQQ3s
X-Gm-Gg: ASbGnctd0tm+NrLBEdeWyi2xza7W3kEUJIysXNbqUbXYIvkP9j87MXGgzRb7rrH8JZn
	zqfmC/uqp26d6KuExqjNkqERcmQxyhwOqocyaU46eY+SPpEK8R6lv7GurwIw6sqFMQoC54JZPoE
	urtk115uMEVw7pRYxorsRxXmt5NDNoA78VGQEIs2umTlRMTJ+ZgFCF6LTDTCU+2uIGsgRXbkIts
	ptfXKpj+DnUtEJdRgq3xKUEB8VAFp7Kg+SnyXfo/mrzkNJvWDAuvkmeDx8oSXyAYBf0LoVOpAbY
	jbqULP6m8VksssPJ4NRflbGcPEGWQ3hEY86xdrvAd6pKTCG/LQhfs7piIkAnnhnIcC9l/8eu8FO
	hCRsrNPief+BpTCYzEpLRFvZPntsWz6rDl0akVrm8voRp1rBGciND3MiaTkznclhswKKyjvWKIL
	bXSO7ijPMfVAh4LHNrIlXdt6LA
X-Google-Smtp-Source: AGHT+IEoXFnooBegIkieOeGenscNtb3Pci1KakPUvL15fcI6H/wGgse9yON66HLpirruFz0WL6m7hQ==
X-Received: by 2002:a5d:4412:0:b0:42b:2eb3:c92a with SMTP id ffacd0b85a97d-42f6d55b7f4mr1421553f8f.12.1764667773960;
        Tue, 02 Dec 2025 01:29:33 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm32148400f8f.15.2025.12.02.01.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 01:29:33 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 2/3] python3-markdown: Upgrade 3.9 -> 3.10
Date: Tue,  2 Dec 2025 11:29:25 +0200
Message-ID: <20251202092926.1370646-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251202092926.1370646-1-leon.anavi@konsulko.com>
References: <20251202092926.1370646-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 09:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227153

Upgrade to release 3.10:

- Officially support Python 3.14 and PyPy 3.11
- Drop support for Python 3.9 and PyPy 3.9.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-markdown_3.9.bb => python3-markdown_3.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.9.bb => python3-markdown_3.10.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.9.bb b/meta/recipes-devtools/python/python3-markdown_3.10.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.9.bb
rename to meta/recipes-devtools/python/python3-markdown_3.10.bb
index 67375e1321..5be1576d20 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.9.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d2900fe1782bd33bdbbd56859defef70c2e78fc46668f8eb9df3128138f2cb6a"
+SRC_URI[sha256sum] = "37062d4f2aa4b2b6b32aefb80faa300f82cc790cb949a35b8caede34f2b68c0e"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


