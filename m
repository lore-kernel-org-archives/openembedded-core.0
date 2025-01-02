Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32136E77194
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:27 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.5389.1735810884776184986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B7iNS+e7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-386329da1d9so5065030f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810883; x=1736415683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZXzbB/xl4R9UqSS9c+wTemFPUWOoxS3w9NxKcc2SW0=;
        b=B7iNS+e7OcmhMcSLAxX3XLfZ525TnFQZeddQDsL1V3Dl7UOy8zXhioVGKygiH0DoF/
         /prvDVWJCLBfJ3mLgcbJILPMg+qGf7LgLY5+7eWK/398lD6NbZhq/ZrxnSeYAW6nCO9m
         iGflezqdTf3gAX79Rv+t6dM72R0xp6oZu/Sic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810883; x=1736415683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZXzbB/xl4R9UqSS9c+wTemFPUWOoxS3w9NxKcc2SW0=;
        b=BaXwokNTZItk+7ULbg31JdxYeVKY4XpGODZ576105bMaJjWgtbOQW3F6KbwPihh1GX
         QhZuglagBVUoRqMvhkhh0YaksWJCsZewN5Xq1oXuVxDkolbsENbDcyutbGkaseNkwkiL
         H46Ukl+zPyJG2ZanWzoE9eL3m+9f7uBNMaB1gVuQlNocZAjM/S1dpItY3IbI/GX2YyAk
         Bq59MvRTj/w+6sBFJX55j0I3UuLNG5j20o/JqEQ49DdZN0xjVqQf8/tEyjmY2IqKJduG
         iQ39K0fBKiLgpHIlSUxdPZXwvPQSjA24N6AV0ua0HOgVcbdMtme6G6FcZt+g8+7Ovh0A
         zm0Q==
X-Gm-Message-State: AOJu0Yzurf6ojUSA3ElMfvUNQMta6bO6KzrpZWw4anFMh6cZwFlZmkl+
	vQK0vCv7A9D7gUgjSppRf43rTqMxhqeKEM6yRlKQuEt7yUPFLpcUlWy78taqyEGfvN9MkNJkJ8j
	jFTI=
X-Gm-Gg: ASbGncuEOAWDBC4Q2GIBYPCcA7TFKGIa0nf7DC4aIFhITAK1ltLGF6QCkmh0JBD0qUs
	Nd78bWCInTfTXGErmYiTdtx7B0g/UR8n9hepY6LIgMoZKidtD+zJeh6493mUnl9q7Jg8jnxYhgj
	dM6Db+HQMsHhzhozAtCeUmM+nctzv3hmnuGBNdRO6AViNkwIQ3MBvsDoSqtfZ4TG34Wn8eFWpqX
	JjQ7Wir60hD12A/AooN3SB33lEkkzOzBA3KR9Rf+Jcn53C+CMct+Y6RWR27Z+Uj3dwRkOxRprJB
	tTBopvFJeQ==
X-Google-Smtp-Source: AGHT+IGAP0lm111hJWggIrxXdCnRF4XYaIUitlAY9LDOjyoUQeSh/CkJgOrCquQnSStZYZlXjkZ1og==
X-Received: by 2002:a05:6000:1446:b0:385:fae4:424e with SMTP id ffacd0b85a97d-38a22408624mr32967707f8f.52.1735810882831;
        Thu, 02 Jan 2025 01:41:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/21] python3-hypothesis: upgrade 6.122.6 -> 6.123.2
Date: Thu,  2 Jan 2025 09:40:46 +0000
Message-ID: <20250102094059.322187-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209275

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-hypothesis_6.122.6.bb => python3-hypothesis_6.123.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.122.6.bb => python3-hypothesis_6.123.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb b/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
index 37eac3a1a53..5f13a6ca8b8 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.122.6.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2642598dc4426945d62b849a915d0d3e2d53f0fb17090f0cf10d8a545a421dc1"
+SRC_URI[sha256sum] = "02c25552783764146b191c69eef69d8375827b58a75074055705ab8fdbc95fc5"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

