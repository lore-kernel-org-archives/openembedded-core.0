Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27967D5AE57
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2975.1765620021964207048
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXDnVL+w;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f30233d8aso14589945ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620021; x=1766224821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvyQxpwtFcOjHi5/f4+pBqbM01hNiCHRGQc2YfpEsuQ=;
        b=aXDnVL+wJdrY9nAIWzK8fZ08+iYUeK2dfBVuZ0F8N1hugfZorMrrJnkXH57lubbJVb
         1HAEMuPsORwm1hGVzwIk2Q0KN0tfjmIWYuzGg077wtfIj+RrJDR6xYXG601fofU/xOVS
         ENbAbi+wLvUabnBkpNMrYuRHs7EKTyNBIv9yZKdahb2mEX1MAoDeWBFKO+vfa9tWuio2
         XfymgbGRNcrYjjZ3gXgQ5Dtf15jEOV0n/s3l/aqOdyYvCFnpzQSXR2YSAcRTfVgjeL4I
         NmjMCcfH4e8Ej+U5UHGnnuvpK1RnkHUjn335ILAQgf+UK5dqt4z7RTnlpmbdP+/9T0BX
         B47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620021; x=1766224821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvyQxpwtFcOjHi5/f4+pBqbM01hNiCHRGQc2YfpEsuQ=;
        b=lZBwmUgF33TPUMcKMn3SDSiCL78DUdvCXow4i6x8prCAnppn0eMMkZOvwudLDJvM6m
         EYRB4TOFjYfananhKbyFsf6OdU5cJkqtjOwn4CR4xD38w7rYlV9g/8gpr2JgE8FtoRFI
         fTqdBCuPH+83fazFwMTEadY/ojpliLLRZclcfqiAkzmnsKC85ggIeAlAx7pR6WxxoUtg
         gUWlU/yl8aQuJXwM8r/rV9Bm1XiRc1NkPdnAyhSlFY+rrO+pNNMGhzJbHs3n3UCV1uhq
         fYz6z7dBDomL4I3LX95J9gw0A7IvtV85b3nUwIo/DJmzcACbhNF8uTP3JBbMvrqCAQlj
         dEqA==
X-Gm-Message-State: AOJu0Yx4G1aIAeuQkKwRtBYDzgftUJIrrh//0OqyDroHBEfguYuEzKgG
	7ChAW+ysf8qKBywBju/GIE3ecWEDgZAP7k/o/bzT2hgjnn4wQpy1+h6dKYq/0IOH
X-Gm-Gg: AY/fxX6ozYBRpoc5kGc9fWxEd7MjFCD+ucsiUD36tdy5eWZtlyBTYAD+keioHXWd6Rj
	5KF8CkfxyLBLAGJSGgQtu1RCxvxUMoVUrUavai3Q6AxyiTUU0pzU3sMb8a4aGkqvaKAYZYicTSM
	5ggcWupD66oMXigu+MXeG5toRWF9X+wm/woZ6eFGo/nMB0c67uqZgx9Gg1PUl4FgzRfZSQuF9Za
	F/aVLouYYGqvlBybaOKp5y0tBkAy+/VOdYEyQALiecXUwGK4u0VGezSg40gjrTnohMI6QmSj3iD
	IWGQxIB8WRa3ljtGhkdCvQuygjLVrgs60U88FHV5bGsrp6MkUnJZAj6uQRY4rTIdN32t4+ybXjb
	13YDC7aW+5WyZy7W/U5zjzoKHkzlC5RQGSBhp6aSvWNuPfEc2i8RCeoQ0ZWncG21F+ogMzC6YR9
	6KcYDx80U0b2THSRnCMN86G2St
X-Google-Smtp-Source: AGHT+IEn8PKQJVlJW6U+IqpX6LjP7BDjDiDWk4vUXYdELAIM69lI/Pw9ZrnAma3oXEFEzL6CcucnrA==
X-Received: by 2002:a17:903:11c7:b0:29e:3823:a70 with SMTP id d9443c01a7336-29f23caff95mr51961625ad.42.1765620021182;
        Sat, 13 Dec 2025 02:00:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 16/67] ell: upgrade 0.79 -> 0.80
Date: Sat, 13 Dec 2025 15:28:40 +0530
Message-ID: <20251213095931.2571498-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227634

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix issue with ECDHE client key exchange.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6a1a278de3183a1b8e6e27a38b17dd1dc8890ac2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.79.bb b/meta/recipes-core/ell/ell_0.80.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.79.bb
rename to meta/recipes-core/ell/ell_0.80.bb
index 8bd0f8badd..90474dadae 100644
--- a/meta/recipes-core/ell/ell_0.79.bb
+++ b/meta/recipes-core/ell/ell_0.80.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b"
+SRC_URI[sha256sum] = "6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00"

