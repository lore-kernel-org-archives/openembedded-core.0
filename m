Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5A5CCF9FE
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:48 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.3243.1761844367909529355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iw1CHpAv;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-88f239686f2so141858785a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844367; x=1762449167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=683eX7f/TSyvN1jb/VU2GemLjevVyr4cKbu3t5UL4T8=;
        b=Iw1CHpAvuA5UQ8rU1t5Bu75QbDxCKtJyjmV7kkppFlX2dBFGP6YDjvys07JbbnR/Go
         E3nTPDB+Z2dKEk4NoN048wm7HZxwAU7GhA/YdTe/c/7joOBqpdq8s24ae3AueIS+f9mG
         0PwZi1WPrdj4M4u/QH7Yh0oWXz38r35ELmcBev4B1Q4Xr1ZtC/E+m2Swr2A9c8LUiCwD
         6U4gFMbFq5pW/PwaHK0bVKt3pToAz+FCo7bHyYVUw8Sdclh9VsJLqWlCzF5rrjpPxRtv
         YcOecepc9F3R/r0uLJHYDQcMwyc/Ka1FRkUp9fiiKE2zna3mB4bjM9qpljoAQ58Vli4k
         vxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844367; x=1762449167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=683eX7f/TSyvN1jb/VU2GemLjevVyr4cKbu3t5UL4T8=;
        b=vpx91soy/K6bBbu/m2/FEPlb33DEaZuTCSSFJ5ZCqW/8RSaCRaS03GdHZigXDpT7Ix
         uR9uvMcnZN7Xf9DJaEuYf78xw3nXhgpkxdmlqEZEDfFvKT2QW1RXacYiG0EpQ1cR7qjB
         JFWxmDcDrWO+wNf9dWd8Ykeb1GRZTiycwBsxbwCA0u6IcFFClZJejGAautlgxhc5TbWe
         s7sOLJ+XVXyxpJN/usrol1BWR66TROMx9QG3vqXU2l2WEfcLUgA0DjcdUe+lZfbtjYW5
         bVdIQvwYCT3IF6VsROfB5A5YtnrtClNjE/2Kl4Bac/lCIKXwxWDu57FXQteoVwFBIgKU
         WRsA==
X-Gm-Message-State: AOJu0YxsWtZxBH2VLrze6/2kqwFxCBFQQLDveV2e9dmxZwKh4vgTc9ai
	YqLQsXSb0LJlrFzaZ4ht3xZR9ZqXg7UEHYr8FtbB2sGbWj+dsowlg3qtW5XOSh+LOks=
X-Gm-Gg: ASbGncuc0fW4uwZvF9hAs0rSTL4hOyY+uJOdSfKvebV/6uz81RGstlUaBdkFNh67IWE
	6OV2xp1hAonWg6UpX6/FfmCWrDHxORRBtRkVBBfd72hGAnRPv6TMwdpY2dGGuAU+YWvknltlYwG
	uIvsUxYSy8pnOaEwWla8Mti2YALOLQGSLktA8016tOrW0FBshVMvIpohA3QZdq/sgVgaPMkn4qB
	OuLQCt2rQsfo6IFU/w5s0I+jP19cC8XPgsU0s1o6Fb4lsCUOD6ghly+GZXEk3d5lMayR5322fMA
	iHphZFKUDnS6NWobPNOUsiL4frHlNILsXSVNtPsY+ZJXJmAHd5G026sXZbvpjkpcOVKqvrVZZYc
	oMckhV/BdoJmJC0qsFAXm+GObm0OggWvSyjGPSvspADpGYP8n1dNCFIy8MsJmTSCoKRfdhLn0HF
	S5VmdxZ0WRxjHZnks4uk1GVdn3GYxlcerPFT5NgewRIShMo/VxnK7jEqr+RcZdeKl6+zkV99fbA
	vkvq5Pdu6PT70M=
X-Google-Smtp-Source: AGHT+IEaI37RJ6155jWc1ov5T1ZMviQfIdtVVcT0CueckgVukSZW2HWNJ0XCtXjLzggriBYJhg7+VA==
X-Received: by 2002:a05:620a:40cb:b0:813:6c7:4517 with SMTP id af79cd13be357-8ab99c72fd1mr26490585a.38.1761844366685;
        Thu, 30 Oct 2025 10:12:46 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] yocto-bsp/6.16: specify genericarm64 SRCREV
Date: Thu, 30 Oct 2025 13:12:26 -0400
Message-Id: <726ac598a129814be4cc8c7568a245fadfd7cb61.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225515

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We had previously dropped the genericarm64 as it was using
standard/base for builds. But we have some temporary serial
patches only for these platforms, so we we are building out
of standard/genericarm64 to isolate those patches.

As a result, we do need to set our SRCREV to ensure that
the content is built on the branch.

Note: we can also move these to the main linux-yocto recipes
as genericarm64 has broad scope and is more than just an
indidual hardware reference BSP.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend
index d28ea78e5c..f1d2fed712 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend
@@ -8,3 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.16/standard/genericarm64"
+SRCREV_machine:genericarm64 ?= "7bd612290b2fef381423e17481e755319cf49993"
-- 
2.39.2


