Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC42ED711BE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:23 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2043.1766089400342267190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gD32BpZI;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-889a865bc1dso8318096d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089399; x=1766694199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYFS4fQArHpymASUQ6I4l6zIWajfYCF2ZgdLbrRt/O8=;
        b=gD32BpZIyjyL+i9FMg2eoNZDVYJtGfaEB1DlEAeHs5Ce68oyio3Y144OheR4byuF/Q
         5zqAos3leQu++KQmFWN7Ji9UbJSFuYI6sr7P+PfQ2SOytfkxgUqas9+snQrcDTNH/aA1
         T8LQua4nT8JwxvzZubdocgyJGC2ULpDziPGbkRNDI2g0ZHwhwqnSDojwE4co60ma7JlO
         ad5Aqgj3wpdrW2I6OxhyMQ6cGc8RFd8lJXfYkBshXW+D+fSFajaahJCIi6tFvhf4wFse
         j2Z4Kf+oW+Qfu4xONmvdUQx4kTjI89veIajpKk5MwUz9acVjrKqScHmMoUxoNQS6ptv4
         1T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089399; x=1766694199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYFS4fQArHpymASUQ6I4l6zIWajfYCF2ZgdLbrRt/O8=;
        b=luMGLx89FhqGQUUUM6rDifq0kiqKRdxJDXmzVIkO8uchp6B6dpI0GIK7nyuI2T9XuO
         pwIjkTSIg7RFY9FhgryzrtthJWs8cLYBVLRI/k3CQgJUTSfZX1kY1GNxYE+QEIrqLiQs
         g6AtK5NSClZ+oXSniVcBOvjMdkZDmZFXcekFQKU5IOkSwe7G/7grnXCvTsqtBPGZ1LpV
         4n7xPAEeFn1TqeUnRx+krJslXt63uMlYgQ07x0BAN0qjo0SKd4mLSsivf1uFsoOdLLLT
         7e/e6CagDthTvgqAtK11TNcxh9jlBqy8OddaH3pvAFsQO7hDgtctX7ANBxbriBaoWOFd
         R74w==
X-Gm-Message-State: AOJu0YyaxDreo4ZAi2SqfRbZifHELhS37jex5vfkB0Mn+ig+baSB8dP+
	1aw7Z+43APShhyo2MsWXDDFLz/gg+XZrqwKoIJJrx0pkdyP83xax/XgW
X-Gm-Gg: AY/fxX5jnj4SxC8zWXXwDIQyeIkz//m2z+R3/zfcKpvtSjfQi6u3mgW1uTcUV12Q37p
	V0m15Omesxgr70LYqX6J9bD/LDhVZAcjzZVnbl45yYTE25QA2rYknfRuBzwxVyqalxPP0yhughJ
	FQWXPk8BLojVH8uwTcR9TPZ65kc0j4gczPwcfiDKW92AKKmgZVMIGFQe3Rm+90/QZigDxQdmV3m
	UdCOwX9yvO9WyNaZYzqjUXJTYB5BcKbT0dvczymCzPSNccvL1L3Qps3NfSmhHSm4LzFr0FcSRuA
	xox8ZMBM6XGSf+mChIXKhGGqoeDsE/A9g+SYrdlX1PArMoWHDIkSYL+FBpZa71RFQocVh10Xg6x
	AGENpLjCAywc2ERqYnAnUYg8n4Zx9nMoVzKw60fHvCEXjxt/gyuUq4oUprw+6sQEggR6r7EUkZ3
	KyOJIx+X2VTcKq/rq1YRnomAC0F6MeaAUVBSUghuYIb4ai/jxi7o4h5TbWv4PV82cNgnXFSsH5+
	kV2n+6xNJrxFNs=
X-Google-Smtp-Source: AGHT+IESpUjtTbw2g75ogp5lghdMZPQdHEWL8AFtv89Qp4eEBymJQhCzCXPSIgKdGiL8EiBpzUO8OA==
X-Received: by 2002:a05:6214:5789:b0:888:1e72:afb5 with SMTP id 6a1803df08f44-88d8166a0dcmr16388836d6.2.1766089399372;
        Thu, 18 Dec 2025 12:23:19 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [06/06][meta-yocto] yocto-bsp: genericx86: bump default kernel to 6.18
Date: Thu, 18 Dec 2025 15:22:46 -0500
Message-Id: <20251218202248.70476-21-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228164

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/conf/machine/include/genericx86-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
index 76a742b..95d9e17 100644
--- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
+++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
@@ -2,7 +2,7 @@ include conf/machine/include/x86/x86-base.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 MACHINE_FEATURES += "wifi efi pcbios"
 
-PREFERRED_VERSION_linux-yocto ?= "6.12%"
+PREFERRED_VERSION_linux-yocto ?= "6.18%"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 XSERVER ?= "${XSERVER_X86_BASE} \
-- 
2.39.2


