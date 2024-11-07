Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE27D44D56
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:30 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.63345.1730946562622993565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVWSKgXI;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6cbd57cc35bso13452496d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946561; x=1731551361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8zcmqMqEIjm1PmHoO1ok8XSM87WPcsEVtKU1xlRtDs=;
        b=gVWSKgXIxmwUt9nr9Q14aHNVzeriq5YoPyMElAmuQoWN/nm6DbFGiHP6xGUmUAuKqS
         rzx4bISE/XLuw++j47pUcnCWEl9FrTsm+Y//cQjZKqQJl9lguc3VNRaiXpheUmCS+4FM
         O8D9XUQJv/kLrDe80o1hpBQDfqvgfn1CAwZNKX9Y0DC+8vx5hakUeZzNFhPIWSWfJyF2
         Yv0Gy9BKXKoDD3wtWsE8Jytnzmiu2YwELtWWN1cI4LaS5SjePCVswoWAy4k39G+39OoC
         Y/D3LcigUdDdNu7Ww05lxPnRhGaGXr8kAgcFYf/yJrLSmcTdjntgTIrdDKlsocu3bH80
         WaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946562; x=1731551362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8zcmqMqEIjm1PmHoO1ok8XSM87WPcsEVtKU1xlRtDs=;
        b=CIZj7CJZ+9z/SDSTZb8W0EUKtJP7HYUMmQjpl6vgLVi6sotE13lj4PpN+PkpqE3MJH
         XwG734urk9NxKKvbcG0A5JEK4EIx2OjYQ9TaWenf14kUGm8jAR3X6gVWCHu5moGIl3Go
         cImY/K14wW3tO/bSV14HTWE5QpFLxQy8s33lkUmSTEXJqPeNo1vMR14gkgFKjnRlIGaM
         8wf2+DZtzO8oh0clTpLaRluaBbddeQKj+Dhx7ElMwmtz04W5+EijNbElXmuqQmViM5ca
         8KMA4iVJA0bbKYS+ut6HeaZFjbIgAak+r6yHranFHQmWfxUr+IUjpxNEjpyQrK5z8UbP
         PT2g==
X-Gm-Message-State: AOJu0YxfdEgRG3RLffJroIcGll4hb6zs4rmUtGgltfkPOtuxP/Imav1o
	4L7yNYPa/pDF/EH+aRJM8T7cxN2Pm9yKZSNQPzj/W1Y6rSlLPq6+HI6PVnZj
X-Google-Smtp-Source: AGHT+IFVbHTA4h7sS3yPJBb1DTL5GKp1GZ1PrXwv6zjMQFfyQUsy3DoG/ZVV58LrXrUtePrSrqYLGQ==
X-Received: by 2002:a05:6214:5f11:b0:6cb:c661:49ce with SMTP id 6a1803df08f44-6d393e84574mr29461646d6.23.1730946561667;
        Wed, 06 Nov 2024 18:29:21 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] kernel-yocto: Support in-tree config fragments
Date: Wed,  6 Nov 2024 21:29:06 -0500
Message-Id: <48061c493636c7f5b68f713f5732663aea57295b.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206805

From: Paul Barker <paul@pbarker.dev>

[This is currently an RFC as it depends on a separate patch to add
  support for config fragments with .config file extensions in
  yocto-kernel-tools:
  https://lists.yoctoproject.org/g/linux-yocto/message/14431]

In Linux 6.8, the in-tree rv32_defconfig file for 32-bit RISC-V support
was dropped in favour of a Makefile target which combines the RISC-V
defconfig with a config fragment '32-bit.config'. So to build for 32-bit
RISC-V using the in-tree configuration from an upstream kernel, we need
to be able to enable this 32-bit config fragment.

We can support this via KERNEL_FEATURES if we add the in-tree arch
config directory (arch/${ARCH}/configs) to the search path.

While we're here, let's also add the generic config directory
(kernel/configs) to the search path so in-tree config fragments such as
'hardening.config' can be used.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 6d5c3b6327..66602d3594 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -248,6 +248,9 @@ do_kernel_metadata() {
                 fi
 	done
 
+	# allow in-tree config fragments to be used in KERNEL_FEATURES
+	includes="$includes -I${S}/arch/${ARCH}/configs -I${S}/kernel/configs"
+
 	# expand kernel features into their full path equivalents
 	bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
 	if [ -z "$bsp_definition" ]; then
-- 
2.39.2


