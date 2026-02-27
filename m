Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41A2FD8FFD
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 19:39:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.104595.1772221183495853217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 11:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a01/Bxqx;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-358fb86de36so2105862a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 11:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772221182; x=1772825982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAw3n3NpHW78I+Szxlsqz2AtjPc17HSsgEqC9BvoKdQ=;
        b=a01/Bxqx8b7m8GBveqlnX56Q89qHj8oNb/j1aw6UMThxuih07tErpc2v716MQhMbzq
         UlW8oR04mbSKHR+iM16TpKqyx/LDz2XMvH4DEgOIuvP8QpsAbXJSGi9dn6+mE5Z7w7IN
         1ThCrOu565V0pHkdR+lw3GQLjTE2x5K/RttjtNXZqoiH1+CRjQCXE1WaCRtwoOCNcpkt
         EXql8cpWTyWCcn86ziiPXEDC7CGsW8l3UASRaidfHBphcaO0Px1jPFVvu0IxXyyyhi4C
         B99Mc49cbcRfXv2yGuUJuGqt/sIzpx9DMe7sENU14H4JpZ/HEZNaYg7rTacr/QCwrwUe
         qhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772221182; x=1772825982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FAw3n3NpHW78I+Szxlsqz2AtjPc17HSsgEqC9BvoKdQ=;
        b=tACt6merEZMKAFqNPlgv2n3BEqv51WLda9kYV6Olv6/mwUZwaDVekQo/YrfEsWh5Q8
         vRr7aIzwrqs69z2ZvigxfIjJkBoHkHXPn7QXgN1OIj+B1BDPdM3LTe3Bp40ICVMt0NxH
         u5a0LPV1wqwX51xxTMLVQjY+Utk2Mp2GOUB6iErZxFHl/JfE6uc1+QXPr+BI+URU+i2G
         kVT/u/174ruKhnTTnho9+TM+nXaWKj0mgar5AslkhRQeQYaqEl+0TcD84o5IQC4OO0Lc
         eLr117n+pI0q/25xo8qOyFp9wOd39ajmph6go7QTvBCsdT8pBoeiygiopUTsIwGdOLSf
         idng==
X-Gm-Message-State: AOJu0YzHTSDMOlvV7nJzKVIpeUEz/m36jt3chFA8PLOKKupyO7XhryAJ
	ty5lmX2TtJVdb6UmxwPteNvjh5pH5MwpOGn3L3anu8ai9QCHkpsVSV6nyX7bXQ==
X-Gm-Gg: ATEYQzybhQE3aMgNYaytX+EhhKpTKgOajNtTl1t1uApJvNGsGfzD7naDbjGc3aQynHu
	GfkgjdYzWUjVfA3hHrymoAzZNKuzvZLsqSQ+btGrT4eNJu4lpGby2L1+72GE2d6S/KI/yH7rIJW
	l4EYAv/QistNCiijmpjBFLZbQ4bY6R7MsI4s0IH8/9Zygdz0txZiROqOlgEhKSCtZTtKpm/9qQu
	PyMBEcEcNDa9MpE4Y18Jypp7xpCwurHocHHmq85RHAIyDXm241ofiUXKTh0cEBYHRYbMempqV2z
	3zEu9IMm5wWoE5Pwbn7Mc25CQzFqMtuA8uxcUc0q0CT8OUUNL7PJGxvSDoxa4ctYUW2uCkLbsEC
	G3W28q1gR3b0DW93aU2Q8J6E+tNv9tYqcBBdqFf6yY9o9i5kelFXwkz9mzyXV8e3vmtfZvAGgej
	WhYtRtp5tDaco6/q8pDlXfvvpT6ior9t4j4IjtP1000SNBj+Tl3fYwa6CmZI5bqTfx23WW7kxS2
	eBO2wSLYmC4TEbQVvVqcA==
X-Received: by 2002:a17:90a:dfce:b0:356:3cfd:3ee1 with SMTP id 98e67ed59e1d1-35965ceae6emr4095292a91.23.1772221182334;
        Fri, 27 Feb 2026 11:39:42 -0800 (PST)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcc9c37sm5866738a91.8.2026.02.27.11.39.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Feb 2026 11:39:41 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] core-image-ptest: add PTEST_RUNNER_TIMEOUT
Date: Fri, 27 Feb 2026 11:39:29 -0800
Message-ID: <74c511430b106aa20fe47f1f3a043cf17f0531c9.1772220652.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1772220652.git.tim.orling@konsulko.com>
References: <cover.1772220652.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 19:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232113

In lib/oeqa/runtime/cases/ptest.py, the timeout used to be hardcoded to 450 seconds.
Now that it is a variable, make that a bit more obvious by setting a default value.

Set PTEST_RUNNER_TIMEOUT for python3-cffi to 600 seconds as it is known to come close
to and surpass the 450 second limit under heavy load.

Fixes: [YOCTO #16163]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 0b1eeb1a580..c08561296fe 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -9,6 +9,7 @@ SUMMARY ?= "${MCNAME} ptest image."
 HOMEPAGE = "https://www.yoctoproject.org/"
 
 PTESTS = "${PTESTS_SLOW} ${PTESTS_FAST}"
+PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi = "600"
 
 IMAGE_INSTALL:append = " ${MCNAME}-ptest openssh"
 
-- 
2.50.1 (Apple Git-155)


