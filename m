Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F95E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.5207.1735810893200073279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WbJ4dGZH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so126921855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810891; x=1736415691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjm7mCtvafGI5/7Aspmiq6XilP0wrxcpTMXOMLb0K1M=;
        b=WbJ4dGZHDJwkjq8NGKWaNaFwVb9ACTBBTw7mJ/CaCSwP6rDMx7TzbGMrxuk2uBR9Eu
         d+fwKnBxWyp7SwAUUnFcn95H+aJLqFbXqPH6l953mPOkEeXahcdLrng8JF1ytZULoKaB
         jgDgoIjfqS3yvatWQeSCWZtZSTSCanbwcJu0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810891; x=1736415691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjm7mCtvafGI5/7Aspmiq6XilP0wrxcpTMXOMLb0K1M=;
        b=vtcrrHbb8mOsY19JMs7AZjS3LGGkmMJTdhv9EIIEtxL0RDjjRlmA4+f6KtqIgMiTNC
         WMQOR0Efi/xDfgT3cxID6N8JwwwajnMOJIU2Vsm6Zw9ZKEXZmSlrmaRqNh/chjk/T7eO
         Oo7usxQdLURVkAi70jvamjydN2murFsi54FyPQslNY0djd8LcFOpT4qx3VT8A8Uswhn0
         sILU7kGW+Pguw/swR1/CR7wQ9/5L+IS8Es9B7FnLGyFzTKMSBwLV0zGbgacv/qIctt+F
         SXmDm/XUnJoDFkXGJFTwdCOd6t4SGchCWoPoeYUu4JBvIzXvGQTmCHZO0um0NPejhsP7
         K1GQ==
X-Gm-Message-State: AOJu0Yw1f6w1yy9CqtJ23PElireuv7LnXxo36AnAyvTXCoD9TTYE3GrH
	LMy7py6I4dCgbo0z+mbzaX3VVj9lpgotePOuZN924huJqNY3/JCL41iqO4cHG1WyvU6A+OWxsmQ
	F9wA=
X-Gm-Gg: ASbGncujc8MqU3HO63ESyvFH7Icy1ID/HQF4eVTop+L6uhtodYvJgjhRWb4h6W46jA1
	X3xtSsuzVq3yEGAaDw076RtG45pyBz5EXkiF1hgHIuYH51Tw8y8P7VwzKY8YF9WGyItFzYKUmLH
	xoWQfg2MPVz5FJtETXpKAQ69SrwyJWeuX0iYyFFhPuGIVRKUz6jnA2JsyyG2eGPtzksfAhO2esb
	jLJ0gYyvSoumVgOLU8tbaLq8x1FDrPM6kVxzN6PnZ54x2QxbJw3k68rquRK8iEubZ5nF0U/5zgE
	onCMm+hSPw==
X-Google-Smtp-Source: AGHT+IEdk4kX3ExaEK2oLYojCuAIgMepIFe/nD1jLnbOQ3iD66AX7kFUOeMqNM5PlX7O8KQpvW81Gw==
X-Received: by 2002:a5d:6d84:0:b0:386:45e9:fc8a with SMTP id ffacd0b85a97d-38a221e1dfemr39114842f8f.5.1735810891279;
        Thu, 02 Jan 2025 01:41:31 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/21] python3-attrs: upgrade 24.2.0 -> 24.3.0
Date: Thu,  2 Jan 2025 09:40:52 +0000
Message-ID: <20250102094059.322187-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209281

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-attrs_24.2.0.bb => python3-attrs_24.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_24.2.0.bb => python3-attrs_24.3.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb b/meta/recipes-devtools/python/python3-attrs_24.3.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-attrs_24.2.0.bb
rename to meta/recipes-devtools/python/python3-attrs_24.3.0.bb
index a6cb60a8c82..fa35e4b6819 100644
--- a/meta/recipes-devtools/python/python3-attrs_24.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_24.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346"
+SRC_URI[sha256sum] = "8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff"
 
 inherit pypi ptest python_hatchling
 

