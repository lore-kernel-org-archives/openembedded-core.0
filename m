Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072E8C44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:37 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9495.1783835487857716380
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=HIUWgtqc;
 spf=pass (domain: underview.tech, ip: 74.125.224.45, mailfrom: vince@underview.tech)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-667bae10ba3so1791165d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835487; x=1784440287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GscpPXfKSHQRTPgwRpThC4/9f2HYdpGR0G2UMa5FlOc=;
        b=HIUWgtqcRGmiA3K1huXECjD8beP7RlFEpjdyy8Wme6j/TymdSGPzb39gh3TfTNUCzP
         SBAO8sL6wl4hYFPZQlULwZd8lpMYH2jKQus38MEZOj9sbVwKuFxUzSzUAfOQtjitONcW
         +2CPvcAyMyr0vNCmAjQ7Mw2BmpwWSrLbqOXXsglg6kmAHLHUOg33eNWxoXazmfTXwnPY
         GTp7yiLNc4E0GdnbbKV6ZGuJ7/5W1uyVaujIentrodANFhIu/Ye+3bTx4KR8VdlOE0GH
         WhMtPxn7HkTZfMAP5h5Teo0/w/4AaNJJna1oKS2OZMgrBZhUwKBWIU/XVkIPfRLQTxYl
         KdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835487; x=1784440287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GscpPXfKSHQRTPgwRpThC4/9f2HYdpGR0G2UMa5FlOc=;
        b=qXImWRQnMnZsVSBObFg1CpnZFO6RyNrcaSoSqcpEjxFti8+5zI9D8HnCL7bsDly6Be
         Cgq0gWW1mBN0TJDOy7x0iphGCXf1giVLJVFHQPNhWYuYtJmj/4HFJwlg91RXTS8bFvHh
         0wW2kyucWStR0CcoIg8SuedHs0CeNp7FRiI/oWWOoQk5AO7mRDfrQsY7VNNdxnE4GJGy
         eu9OURqV9CgvMux9px4JaCNjeW1NIpZtN/bIl0ACJv0LDBWkqKxJh+weGoFybJFauavx
         VyuSSfQe+ltjfG+KK22Fwy6pkZZaFiW2GGXQhsvLb7CFTd0uO2xxu8xf6XSFIify8XQs
         WRzA==
X-Gm-Message-State: AOJu0Yw+c66ZhhDCzlq8u7O5TYqoGXvHvqTx0kRM0hnSDikZolIZlPls
	Y7dwjth6fQWMzj8LgUHtunDNWiO1rYnugltzWIjRW93OgMI04jog6IX3fdYv5BR43YA9tMn+97L
	IUvS/
X-Gm-Gg: AfdE7ckhfE8jYDDweX86XjB/H/pjzD1o01JLbr4SknU0aznqLukpRIkHmM3JCUddOHq
	KkyS5TXPnEXZQlG4whioIKn8a2bXBYzbtwDcBAOLRwekeLhwMY9I6d1cttya2Ux16LfSMjR/tfj
	tUAvMreL5XUYGttv11eZ8PcVh1r/UpDYZNRjfbftHK2GoSucxyqXXNnimzaDI6n4Uo3gpqEO3Dl
	x5pqtCdedDJ8qZbS3ue8vNhfc/WQ0OB0g9OG9DXAZAeJFZ5VsOEHEFAvWFxTvQ9ER64/SVzuF8F
	39nvEga983Vx1fNJBEu9MMRUFeDRPfT+/lj+rhOYUsdJIXhf9TE0bhiH0RXACIEVTyNZp0XNVuX
	AQKoH5xhjEWbSyQibdxej4DLXBpQUN79BO1IT3+Ij6iSJtYczux81wDXWsC9rLHMvKCkUSTcuGE
	iC7dCeLlMiCbsBSg==
X-Received: by 2002:a05:690e:b81:b0:667:a12c:8231 with SMTP id 956f58d0204a3-667d7a9345emr3398617d50.8.1783835486749;
        Sat, 11 Jul 2026 22:51:26 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:25 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 02/26] kernel: remove KERNEL_PACKAGE_NAME
Date: Sun, 12 Jul 2026 01:49:30 -0400
Message-ID: <20260712054954.4063745-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240727

It's set globally in bitbake.conf.
No longer required in kernel.bbclass.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernel.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 48e394b650..5fc5f3e31b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -12,7 +12,6 @@ COMPATIBLE_HOST = ".*-linux"
 REQUIRED_TUNE_FEATURES:riscv32 = "rv 32 i m a zicsr zifencei"
 REQUIRED_TUNE_FEATURES:riscv64 = "rv 64 i m a zicsr zifencei"
 
-KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "virtual/kernel"
-- 
2.43.0


