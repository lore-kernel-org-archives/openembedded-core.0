Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26857C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:01:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.6834.1639141314229182540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N+mR6cJ4;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 137so6766201wma.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I4idqnW/TYwYOWQCVJv928jk9dIIkPOXyCnEJijf0tc=;
        b=N+mR6cJ4j/oEaFE2DhLxRr+vLh4FcysE/b7UBblNg4K70kpsbvWG0BQ7ht9t7aiC2u
         A8Vkwkl/A2srBsPCB4681tOtcoLHpWf9ilyJlmM3obS5I2rjvrLjm7LBpgVL3kpecAl7
         8y1AYrLXVFLb3eGWMnQd49Pwz0zdbSQbZp4+WqscKHqB+ZWEj32lQ1BuhNH0xJ1pGE4H
         T/sGECEP6dkyzHg1rxaS+kwpPuXH3xAcvOoldKA1Eo7hXJZoIKOuhKQL8FDt8IyAVSS8
         QFGqT2ncGezTDs9OE3BDqh3IhppYHwz9jxwHHuAuLLCQAU4viQgyK5IagglMWMdUy5ca
         juTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4idqnW/TYwYOWQCVJv928jk9dIIkPOXyCnEJijf0tc=;
        b=B6nNF4QbLCEkGUBuUHP93DAQPS1qF1WokjKdfZnj/BnItpTgh/8/GDEpvPzCE9C1eg
         BKoAl5gMdLynS0jenbmM2adJ0VW7H8EQIuSBr6eQYljOH/aN0tZxW8SRiiby590yDPKL
         JKmL0K1SKOlm0XwzRuSMJI96OIyOZ2JhnDOUhJUdOfz1vokomKCyZYNe4W291O0AIr1e
         IwgkpTwN8YP/caCpejywv8uV6dbwjbfxpabcpQZhlMYv6Hz0bvRMwLBM+2AH/oh2ceRH
         pEbNSZNDSvtYaas8MeRrU/ewret4KTysUOV9EkKLz2Xy1glvwIfTMcBJ5NRmKPyx92oO
         k0+A==
X-Gm-Message-State: AOAM5324imz3cEKEjr71RrPGVntsN/rHrFER4q+XvKVqQYtmb+FaBO/P
	QZ1cgLsZvt6BDd95tQWINkxr8j8RIQSyjw==
X-Google-Smtp-Source: 
 ABdhPJz3tPRzLk2GBbdMNV6STE4pzFN83s/w6RQML3OgNoftuQWps+gIG1v+b5lxsSha7+wsY6Dlwg==
X-Received: by 2002:a1c:f005:: with SMTP id a5mr17157464wmb.19.1639141312447;
        Fri, 10 Dec 2021 05:01:52 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 d2sm2899653wmb.31.2021.12.10.05.01.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:01:51 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] wic: image for overlayfs-etc tests
Date: Fri, 10 Dec 2021 14:01:40 +0100
Message-Id: 
 <8d51529052e3a7341e1e441c11189fccc3cba744.1639141237.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639141237.git.uvv.mail@gmail.com>
References: <cover.1639141237.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:01:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159512

Introduce wic image for overlayfs-etc tests with a dedicated /data
partition and configurable kernel parameters

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-selftest/wic/overlayfs_etc.wks.in | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-selftest/wic/overlayfs_etc.wks.in

diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/wic/overlayfs_etc.wks.in
new file mode 100644
index 0000000000..1e1e5836e7
--- /dev/null
+++ b/meta-selftest/wic/overlayfs_etc.wks.in
@@ -0,0 +1,4 @@
+part /boot --active --source bootimg-biosplusefi --ondisk sda --sourceparams="loader=grub-efi" --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --use-uuid --align 1024
+part --ondisk sda --fstype=ext4 --size=5 --align 1024
+bootloader --ptable gpt --timeout=1 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
-- 
2.28.0


