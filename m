Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B03DEE6B59
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:28:01 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26.1770409675843302944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HiuVhQ1V;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5062fc5d86aso19302421cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409675; x=1771014475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LccsjxfFZreWpW/Ap3lajXw9UUfekxi2pivheabKs9c=;
        b=HiuVhQ1VX6zdQoNZ7lyrvXCQMDflLs5l/MMuPs4WujyohIRXzf26hwM0y0kigB9B8m
         qWnzMxkdr/EfYMPn/tzXxWB3P9iBu0jQlOljZ5MoW2QCLoRRW40sxmzHnkgrSqRCgtCy
         GRMwVn77uynvDrWWKPEEY2FKa0yokjk6ug2YootwHSBnE2zb/0P4QDPaqNvwqsrIJer2
         33ChdBS+CUOlk+Qmqu2H682MmiTd+MBsYS8qJpePLwEAxzoTok52NxFhedMffeWNKcOC
         /9J30QFuoEbcgbfeYtedM2KlyFXHTs9VGW+OT4k8Iyvk5/w2ysPJJzQSpE8/uL1taXzD
         VZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409675; x=1771014475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LccsjxfFZreWpW/Ap3lajXw9UUfekxi2pivheabKs9c=;
        b=NxEOwRXGDGTbZ3uuHkgGzqWI+6gis6Z+V6wdl6uYCFweNzkG176DHy1S9nDrqhFszM
         hPP8X21Q7gPhVPXOcOZGuK9Ttf4Ac/hdqEoVMQuOddkhicY7zXWFcIBfnkSiTVvbfGMD
         Dkh4y+mDFdDt3QMUhbfib3q1aRFvRg8zL3PnskmA2xQGpcFOtwRU9WK2HP1nosGIJqai
         mn9R+/D1CQOT/LvITBfH0V6aNbFDsBkp5Cqrqz6KlGKeWJPwc1V61CQhTUbwnb9c9hUF
         5VXK//Qv4YdR/Rtsmw0lWEuYuNfr9ku6qtDZqFtDTYbS6glMO7rWBDD5cQIlsFqBnXM7
         1qCg==
X-Gm-Message-State: AOJu0YwoMMFGuS/UdV2G9fNsnEV1IE70QML6BoGx4LoRjZ3gAtjpw44I
	ECW8YiZwXj8EAY4/XMxvY9cOmb5pHnWuP4u5NGZtUUHDegNw7oLCOHxbBmeofsTx
X-Gm-Gg: AZuq6aI9cihfRZOifkA4S7Do3aWvM5XnGRlT/jwlpMxHPGNIN/YLRYTIik5pbk7l7GR
	g8IJ53h9h400lax7fYHxf+8+8JteXGey0IsL0JjBmtJgHpZ2RpCfzL4CZQYIUAf51byfr9fUYCQ
	dUfx7cUCGWARS91Ux5A4uKfHy3g2/BdKH88tWbVHCFGhUw+twleCcgSuJIZHtZ0bsgB4pi+iSKy
	s3vKYq6umMya7GRO5luwEJwfkI2YNxNOCoe/gNgayrV0ZP3QQKLJ4amMLh7P7tgt1h3un2agRZ5
	0bueA7pbckbIeP3kWYi+reJc/I8GKWJKS97nsBEHoGrvxDQrVbJ6t13ViAVMGXPkHzNdT0es05C
	Tm+uDcqNltkKZV33cuOOci2rKYH5woPlvQAf9ZFoLIZwX+lYIpgy5SjpW0F6ZixbAYIAXS3xVqt
	xUO4HywrL4kc3IQkQG07WRXCHudXUZaiSk+aQTqKOorN1T3xEtdlXj60SiOfFP9Cc6ybGAwYawp
	UezCkGHOfXiacrWLYBHWN8reoZMQId8oy6yh0jT1c3NIGk=
X-Received: by 2002:ac8:5f4c:0:b0:4f4:c7c0:bd15 with SMTP id d75a77b69052e-506398af417mr55832731cf.12.1770409674845;
        Fri, 06 Feb 2026 12:27:54 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 03/04] meta-yocto-bsp: drop 6.16 bbappend
Date: Fri,  6 Feb 2026 15:27:30 -0500
Message-ID: <20260206202732.1080699-13-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230656

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.16.bbappend    | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend
deleted file mode 100644
index f1d2fed..0000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
-COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
-COMPATIBLE_MACHINE:genericx86 = "genericx86"
-COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-
-KMACHINE:beaglebone-yocto ?= "beaglebone"
-KMACHINE:genericx86 ?= "common-pc"
-KMACHINE:genericx86-64 ?= "common-pc-64"
-
-KBRANCH:genericarm64 ?= "v6.16/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "7bd612290b2fef381423e17481e755319cf49993"
-- 
2.43.0


