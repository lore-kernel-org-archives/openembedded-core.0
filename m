Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963C0C67871
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.6074.1650021125505579484
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hlA5DqH4;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id bg24so7408275pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3XpBhgpVQTweSqqr/pBi89OpRxoP9mwnmi36gySQIY=;
        b=hlA5DqH4SpBkRxXGE3/sIGUaojp9Usdb2TVHO7sr8LWXS8OwsGM+vu2ZP3QEvkSbtd
         pGGtSMiqTy8d9EwwrqseQOl7HwyZ1Ko3Hr4wfTtTmqKXn1yHflt66VpWHFQu5ZY6aeJP
         3iW0eJDeqdFAdW1x4jxG3kjuugl9pE8RLzqPukD6bp5CBSuu0yF83Pyo4FEU7WBbNzJ2
         LeU+Sad66NeMnXZchENgUu8G+k0SYNP27MYNqvH92hNqE/UvU+SREn0e3IgOsfb8kbDV
         x3ceF8Fn6qLEvh7pl9DGzVWc1BhclNHcwXO+fsDqiOuMQVEmU80S/6VkWebFo3VLXf46
         rjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3XpBhgpVQTweSqqr/pBi89OpRxoP9mwnmi36gySQIY=;
        b=Mn1S/+qbwP18ukkE4qeTpWIFcz5sYt67423OzDs1S77rtin5A6id7CVWLWwNK2S7Fk
         t6bnb/DREmGJkGALaru3sYUnjP6NRpIlVlBVgWEKwAd4ufUZ4eWLCEu81i65n03IxA24
         cWoq3DpqeZm+qwRHk9iL21SwrYUWROtswYQ2t0HEpgGUHy9GSdnWftZRf07CHqSvjNtR
         7VtoMCUs92SFMxm5M6Q5MOX87rDIYHrYB/9dzQuHdCEQW2FE4p7NWN4prrwv1HC17lxV
         HC5unJfG0OdPBrgLpfDn1LlMpRNI7ZRXNHHb3bChfZjD/sc78huVKNobiK/WYos+jY62
         TvqA==
X-Gm-Message-State: AOAM531F17buRzvDMrDcN4J3Z0RzTTMNCu1R3lNBf4m5IpdhKZQl/D/l
	2QEw6XKIz3IjcjCF06/AJY3oozQsYh4=
X-Google-Smtp-Source: 
 ABdhPJxS7QqDGR1qA/bW0o3/FbGdcjgYBtwWG5vP6Ipg4fP4ZjRQ5kd01oQKUx5nvxgmbGgnm4hy0A==
X-Received: by 2002:a17:90b:789:b0:1bc:293c:1445 with SMTP id
 l9-20020a17090b078900b001bc293c1445mr3591200pjz.111.1650021124250;
        Fri, 15 Apr 2022 04:12:04 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 s19-20020aa78d53000000b004fdaae08497sm2492962pfe.28.2022.04.15.04.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:12:02 -0700 (PDT)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] [PATCH] glibc: ptest: Fix glibc-tests package issue
Date: Fri, 15 Apr 2022 04:11:59 -0700
Message-Id: <20220415111159.120195-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164422

The current default DISTRO_FEATURES does not support ptest.
Hence, the following error is generated during "bitbake glibc-tests".
ERROR: glibc-tests-2.35-r0 do_package: QA Issue: glibc-tests:
Files/directories were installed but not shipped in any package
The issue is not reproduced with "DISTRO = Yocto" as DISTRO_FEATURES
in Yocto supports ptest. However, when we run "glibc-tests" using
Open-embedded master sources; it generates the error as default
DISTRO is used.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 3edba1b6d0..d6060ad3ba 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -16,7 +16,7 @@ DISTRO_FEATURES_DEFAULT:remove:riscv32 = "seccomp"
 # seccomp is not yet ported to ARC
 DISTRO_FEATURES_DEFAULT:remove:arc = "seccomp"
 
-DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp"
+DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6 largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp ptest"
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
 IMAGE_FEATURES ?= ""
 
-- 
2.35.1


