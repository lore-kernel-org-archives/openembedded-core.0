Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3538ECAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 10:56:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.5952.1759402598612464843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 03:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtva2AgN;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-782023ca359so997391b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 03:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759402598; x=1760007398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eV5+Ff/FJmka7e6F+vVDoML2KdPbDz4xz5A6A2a15Ok=;
        b=jtva2AgN6mRXwjGO1zJOwKscsT7u6TcfE9133E7eLnVdeVsPkfpPRb+Muk24e1IJEJ
         wsgGUwTj6IDjid7OLJfuG132oRqY+u1HX/hYQU/S8te+BPoeZCbtzy3GP2epAJvWB9A0
         ywm85D6IfS6SNtl3dOUOFK9xQ/DodIn7TX/Y++MYb+3wMcvVaaysB6LQa+UZvLTQC+as
         XM59GkT6kER4DSCxL83jJZC65gC2b1wJ53ah+Gfm6gwmBZyAztztc/nlNgp2mg3s9gK2
         sRYHq8qVQo7LWjWyZH86asUVB6SpP8z+mBYYM9fJEm9GiE/sCnRzdpNMQsPW55ks061q
         ByAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759402598; x=1760007398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV5+Ff/FJmka7e6F+vVDoML2KdPbDz4xz5A6A2a15Ok=;
        b=wHFJgnU4khxqWw6CBrWrMiR/idmxN5eUmN/c06brOg5NnCdR+dgBcSRhDvNzg5R0jT
         UCSgznYofvpP7jm2MYRlAaNBvZvo6T4Pc4OBwvXCvPoL6bOKDN/7Z1ztZEl/FjKJjYRa
         U7S31atKqpKwVBtrhAXztMW5/qkCKKtAju+wQc8yjkb1ZKOOehzX7hOEqe80Ls52mhyi
         APHOcYfaDjvchdy/axBXZDZKQJcrPw8dFU1W2hIELIjRkPT0r8+CI1MZo0DZmgggANwm
         qwig2TVedaTsFXgCya61qqGeeDbU36pCBqIztA7f47HMZ+fZY1+aNvjuQEp+OFHqFrAb
         Nihw==
X-Gm-Message-State: AOJu0Yx3E34wwqil4dw+30KDkP2jUFK+6fqtia/bIR391LkjZ06YtrR+
	4gHs45jTsxta94iUz6hOWbmPZPhxtTh2AOmgM/0EmOzOInxozIXcTnr1Nu3syR9Z
X-Gm-Gg: ASbGncv4XXX7DKSqaFZsJ+3fYyGCVERMqobudEviP0praFMMgOCaNHe36Xw4klek2L9
	hY4Whxdwk8Nvxf2pghXU/357QEk6NJNB3cZa6Z03F4tqESU5Kx8n6F/5UA+y/9pEVEZJVaOPDzw
	tE+HXGHHPeFxKCHT7iYAnHZ7ben75o9YVd0b6KptIS7UNc8Y9MmSmfKU36UYQSpNJk22nmVJ7Vx
	FonkJFKYEFus4Lb9GtC6nR328MqjSe6rEWKUT4mHvq7OGQGa2F13iGlxnrMpcqUIuxo6cmvulMb
	+9EKRa80Y2O8v5TUWWY3a7uO6g7zr6gb81Gz7pT3S8WdApGN+ZxEvgr/jmj5NaLErc/KB76Ftcz
	HloB6cqB1o9Xb8oxxQD0R65XESSu1+aMaCELPmv/ZzeXkcVY+buCMrIQLezU9kLcQeTFo
X-Google-Smtp-Source: AGHT+IHVkVQ+PL6aDZaLtLONvdIPu46r6BmKCNykBQemqVefrzKBOwM+MpoFcst7FAl2uMVCPgcOwA==
X-Received: by 2002:a05:6a00:3d0a:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-78af4160a09mr8345333b3a.21.1759402597611;
        Thu, 02 Oct 2025 03:56:37 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053b77sm1971105b3a.43.2025.10.02.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:56:37 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: 25.3.4
Date: Thu,  2 Oct 2025 12:56:28 +0200
Message-ID: <20251002105628.1482519-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 10:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224349

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c3751f3414..7046deeb2b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065eadb41e17f92b4f8"
-PV = "25.2.3"
+SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
+PV = "25.2.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.51.0


