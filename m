Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A17C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:01:17 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.14294.1676466076132936051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CmsPnCFM;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id f10so7411399ilc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvMr26aqpLGyf38ckJZr394JvIbqSDY9VZXNffZAve0=;
        b=CmsPnCFMPRA+HpcQVb9yPC/hj3+mMnx0sCuFIB2prDBrsfyTe/QLj1zGoSYanCT+x5
         NJxxia9jRb6e5Q/kUFSxpsUt/vbtPDoB4QQoVA0PlLKlZBC1Sj7kXyjXB84Iw5XwVb2a
         UstygjVQK+4+Ksx10U0HzWW/KV0x/NOJhzNl5K3IaCh/Cjx1vPUBpTU/H4DrCt2EqOc7
         8jMQJUW7b2VIhpwd1E0895BS/EkFco+ASSOEWlT8heBo+yWKlFFy4djYAFXjXdy+Sdrb
         zecIDU4AADJld1qVfzh3N82JmKr58+NIl7siNE56QKsk6S1+/ysdLF1r0FRslPiPOFUi
         znww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvMr26aqpLGyf38ckJZr394JvIbqSDY9VZXNffZAve0=;
        b=Wuvodsk6idlX7QZUFGSxzm384nnRz7VinKzqtSfGfZmHtCIczgtn06ZdBJ8iD8qVsb
         vDTSd5GIZDC3tc0AqisZ4l2PXEQtUnjZ1nn+E5g4ts7wPJ1ZhjdyPTp0stt6QJp0hmcu
         rjigDnXZeO9FGrtobCRTRdLnZA2UlxuCqvwRFkA/5DrDaAgpGHWIYZTIf3qwuxqW8KZZ
         9+ia9+xbbQSvaAQhfQwZTwuv/hWECSvxKeijcCdB/EtxNoPq0fWgXAdjEt2XoPcjEISf
         nVwkn8Dy+vpQhmo+roHBsOPNPvEC2xplkd7CnDkkX0dBFYtpMIpePLubuGqsplMLr+f3
         nMzA==
X-Gm-Message-State: AO0yUKXgkwF7Cf4NTo2jn9ylcMdZIGCcKtZwypyWFb5oP0ZCIdeXjgVx
	5oiYeQ8I21Fg1rJk2kBk2sinXPChINU=
X-Google-Smtp-Source: AK7set/9Jn3kF2588pfL5D/sBl38GOGft+l/GXfc+qwcPQxVyKCQIPF4wNMV60Brf3CJ1Hz8Ieo1HA==
X-Received: by 2002:a05:6e02:144b:b0:314:f7f:a369 with SMTP id p11-20020a056e02144b00b003140f7fa369mr2797632ilo.11.1676466075186;
        Wed, 15 Feb 2023 05:01:15 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id u11-20020a92cccb000000b00313f569a0f6sm5570818ilq.40.2023.02.15.05.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 05:01:14 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] kernel: autoload and probeconf are handled by kernel-module-split
Date: Wed, 15 Feb 2023 13:00:57 +0000
Message-Id: <20230215130057.1923450-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215130057.1923450-1-jose.quaresma@foundries.io>
References: <20230215130057.1923450-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177187

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/kernel.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index d327cd6888..5718600eee 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -478,8 +478,6 @@ kernel_do_install() {
 	install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
-	install -d ${D}${sysconfdir}/modules-load.d
-	install -d ${D}${sysconfdir}/modprobe.d
 }
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
-- 
2.34.1


