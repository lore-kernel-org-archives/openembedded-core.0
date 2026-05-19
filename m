Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252BCCD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 17:22:42 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4217.1779211354668529550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 10:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K5HDJH4b;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba21d32776so27938135ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779211354; x=1779816154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJxCpQ4Ak9w39u5FPFs1qvRqtZBzfg+1FUtjaAoY+/Y=;
        b=K5HDJH4b7vYgqCBbnK9GWlI+bgofHtu3fcCAJQY6HhtFkcACSLlnr9fd06OMEBOwcL
         KoM1PlTDRRqQUV6gVnZLfAYiauIV1THDFdkQvk3/bukRvqGxqObiu2QHhCOUMU3VWBXZ
         Clw/gPo6TyTn66OvnIwZwscIqiwFkjaSY4W7+U5yYGGaIWXMyl8X2yE3/1sOdtXeOQva
         MeyIwNG/x8c0feOO0Pw2Q1Yn2ba5TcDyil3SDngTvsfQwcgbMqOc1MJfLEw/FrZl9WDA
         43I18iX6jWzucsak0tROqWdbdY2QbVtX/PufhLVz3xZd0rprUSBI6XU+F0dlssenNM9s
         zUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211354; x=1779816154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZJxCpQ4Ak9w39u5FPFs1qvRqtZBzfg+1FUtjaAoY+/Y=;
        b=Sf9hRDFmb9KmqEJ5er7x8vP2/QqQGdvOXuFYhbwXSMDeyEZLG4nKzHr/ouejx7klzx
         8OiNXwH18heGbkrx6IcIhS+TB/A+7z6X5LTyPzfVH8b/vDeoU0OgFNtUxSgugLHC13FP
         tsGQoAd0pcnAfWsqypVJlVo1dsaiPwGVxhFJM4MT1d72f1fGiE4ezdKbqJ/7y01yCNhS
         EWXJoBfEpPOMxnQfeZRBvWyVBd1ZC7EF1DzwpUzsSxo/ATb3QFVIrdvx+ayZP4H+133z
         Q48oggEv5XMI17tdKMAWZZOr9qIIPWV78GkZxfxTnJemxwLmuI4wyxasLWP4Z8LmUQD1
         yEGQ==
X-Gm-Message-State: AOJu0YzdTF3LnKvZ3iQgJEFQPzAIYeI/1cbmABFD3JY24HKunACfasSI
	WYXceChe/MaI4tOWbtdjIx78bDPFYG/32t+rNmKPMxbNSoz80EUx8kpl5SC7LFP8
X-Gm-Gg: Acq92OEDLT152M9SPxEJ8s0ivmAY3OK/HEV7jYdyDLqRCoAON0lCF//7YG/rgd9b9Ct
	P2l/FpTVgPsJ/ht2rsEgLqhSRY+I5aNpHx12GekL4miK4eg+HhkQ99qBNbKXLS9oBq+LQ12vTVM
	jW88q9d60y7kRyWR7JnVYhHZclNIHDc01+R+JdyzlchqUXfwuKAO4AHHFrPYV7OikwxzarXHmSl
	WvajGFTK+oY4aCSGNM4n807P2QIMXpCtj8CA8vJO/3/9PG1JYODfmYBZn8nfw5RY88zDCVT/VC3
	+2Dt2t3LOXs764MCCGC0X7W0+EZZ74cycZAzNXBKN8V/rj2oRJiRnkv0aWTU0OOY9IApz9MiHnZ
	iigjLPWfKswj+HqxNvgJ25EIS4ydQqnKRLS9D1ox6HGXnWiDF+chx7Y4lG29mnhdpSZAAHxwr/6
	2rsHJauPWz+61SFtqrRmc0Yp+W1rj/rAhKBSoT9SSEstsiJVKBNd8Z6s9FcUi6LhKLvyhg
X-Received: by 2002:a17:902:868e:b0:2bd:606d:b342 with SMTP id d9443c01a7336-2bd7e88f4b6mr144698645ad.26.1779211353899;
        Tue, 19 May 2026 10:22:33 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com ([103.172.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm107910735ad.20.2026.05.19.10.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:22:33 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 5/7] python3-pyopenssl: upgrade 26.1.0 -> 26.2.0
Date: Tue, 19 May 2026 22:52:03 +0530
Message-ID: <20260519172205.274641-5-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260519172205.274641-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237341

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://github.com/pyca/pyopenssl/compare/26.1.0...26.2.0
https://github.com/pyca/pyopenssl/releases/tag/26.2.0

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 ...{python3-pyopenssl_26.1.0.bb => python3-pyopenssl_26.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_26.1.0.bb => python3-pyopenssl_26.2.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
index 6163093ca9..9660a03f89 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "737f0a2275c5bc54f3b02137687e1a765931fb3949b9a92a825e4d33b9eec08b"
+SRC_URI[sha256sum] = "8c6fcecd1183a7fc897548dfe388b0cdb7f37e018200d8409cf33959dbe35387"
 
 inherit pypi setuptools3
 

