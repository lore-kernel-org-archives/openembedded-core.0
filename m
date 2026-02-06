Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E410EE6B58
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:28:01 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23.1770409672690284749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FlJyXjao;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5029901389dso18827671cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409672; x=1771014472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAVDiZ6ka5i/y7TcDCeW1iJnwd8nUGxP2nBLn8qVAVA=;
        b=FlJyXjaoNfa2X8AmEOh0j4KOczrzmzDLkkxjjis9uwllE2aApPOVNdYi+QLnA2CRqd
         s+0oANQd8Kw8NZfmN+3ogKOTgMJW5Bc+ZYQ6FnOdYAHCkhpU+8KhqeCXygf0RpFxtl1s
         w/QvDCFdmQR0pL4tutNtQFiG2cp/huJLWN8XWn2KPE9fj+pNJOgwEDV4uAM3ewMzHsEW
         fmG/Zu8p3RlHnngdXtvqRgNejqhXdci67+VJ2FwdywcElaudacJqZBqO04bieNl4mfYB
         4yNkczqm96q/F57K6HiQnmyPk/ceG/BcHhCASf7AdGVwWmTZfbnK4/FItSSUGMw2vbvh
         Zb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409672; x=1771014472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAVDiZ6ka5i/y7TcDCeW1iJnwd8nUGxP2nBLn8qVAVA=;
        b=AiOUYzKNEnL1B52xJ3O4XPIu/APqbu6+5zAdVVOo/yKdWH025D4C7KPiclb3tFhGkD
         W9UMmOsDQXKKLxw3+b+PIb3/8FNWjws6qFR0d9HWTOxNMXY7FbWyZf0UiZMddalzqqz5
         A0k9mSv+vY09m6guRTcZu6Ec3sLWlNv5WUsjnVAvgKbHRzAhYGr0yrQZ3U39K/1hcfl1
         206GIlS53rufh5/iotU4qDH0AB562ukuScBgefZ7WNr3cLEdybeTTT+a5AWB2Yt5AQBN
         Lx0Kst+PjzBq3QqjQrDRqlYMKgZSIQT7Av0jF/LpPvSaBh02kbe4Cf7NvhhLvZXo+nEQ
         nX8w==
X-Gm-Message-State: AOJu0Yz2WQjD2xKCWeNsZFmQDSitatS2cbwQ7C2LTGUVaJv65xt4X/6N
	vbbj+x76eqGvxQexBEt3Fko4Z1nP43nn2epBY+PPapCI+2nxkh2hvMmrKBxfhdpH
X-Gm-Gg: AZuq6aKLPA6HpDO5on+zayU1UPmnliqTAPUx0huOwVkGz90g3WShi2oFVLBM/zYsGMk
	y8PlVsHw12aZwdznp+7YIvSydDw6ULtfB3IIpX7jy797Q7PVthn3imjCDHpIXYm3DejLm2RPVbu
	EQLiXYXuEgCoHryrb7Nq///3P7laUCyzxLMfA/zG6adKvnMN59Jzls0QtsqsW4nd5Uk5hSzfB8v
	/20kkxfEqi/5V4EjoyJDf5Z4YZOLEiG68+lW+EgUMThK6cMHSr1A5/QtZxk3ne9Y2GwKOJ3SyMw
	4sMzExas+tgOLmV/TOXjg9rlchSdMtS+3moV4yxVX/nAissWT1L2vOm0Nzh/P1YrxaFK3gS3uqY
	pXxfIz0BUvYFYdy2uy13ezlnCpGJuIuPeZkfg8FzdxDtI5ve8lfUibNd1Njg4A+gCsL+wf1gwUY
	XCKELnSeqVLxq2swSzdit2yIldoLTIubaveqJjBP22Ma743hDQQg5gOCTlTnEog1BGDzoVrHlFV
	+sKDOZo/5+kmWWxjCbuX0X2UcWBUinb3qPeLHu6U3VYOIo1nixYeoH7NCo=
X-Received: by 2002:ac8:5754:0:b0:503:2f41:aba5 with SMTP id d75a77b69052e-5063991400dmr49454921cf.24.1770409671664;
        Fri, 06 Feb 2026 12:27:51 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 01/04] yocto-bsp: Bump the default kernel to v6.18 for beaglebone
Date: Fri,  6 Feb 2026 15:27:28 -0500
Message-ID: <20260206202732.1080699-11-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230654

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Kevin Hao has the beaglebone working on the 6.18 standard
branches. So we bump the default version to 6.18 for the
upcoming LTS release.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index 63d7f94..b76edff 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -20,7 +20,7 @@ do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "6.12%"
+PREFERRED_VERSION_linux-yocto ?= "6.18%"
 
 KERNEL_IMAGETYPE = "zImage"
 DTB_FILES = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
-- 
2.43.0


