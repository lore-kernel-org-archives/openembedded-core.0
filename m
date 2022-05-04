Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAF6C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:09:58 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.6966.1651673397978440720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ODJNfkWh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id e15so904135qtp.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGTAU1iI8kFA3CWZltjKk33yTqtKKAbu2YV1S6gAzqY=;
        b=ODJNfkWhKUq8ELCIBoOXl5A20+T8UjonEy39y9mrMX6J+mFu9xPNquL3j3iGJ+XvXX
         7/qYwzTH4dxcBcEpqoSAnzsPK28G3hixxllyAqkpkU3TTyUIyKRlXdKoIFzc9gDDfToP
         i2YM53Y70PbtqSugp5BqADd9/zCGImCZ9zFN4pSnb7EwY4D4a+YRbJeyGRod7lwv58uV
         FUhocCpSnbm7gIcWUCtzdxWRUvRRLEa5OZVRSGNYRYhVhQcwaN1bY59lATfNmetVCKto
         p+eCtkUgQXxZcFcjTGeXNeoKzvZByjr0ozGQOtUJFG0W87XKZYDrp/jAde/DpbIr3cfw
         8d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bGTAU1iI8kFA3CWZltjKk33yTqtKKAbu2YV1S6gAzqY=;
        b=FjAEHaVTKl40FtImflS7FY6k+i3RH5rugcvU+nXe3nPawvPEXax+q2uKcfSpov0+4D
         qyhycPqbG76ojzbImaNeXTFrrrNqH1s4raG1nvUlcQ8Wd8AAMvIjWCzxwfLOLCFV9dr/
         +9ZFOU+j6fCJL4Lo/jAbsOUWiZPCT8ON6fRu1CQRa1ro5aFzurTQIzfAIlTUtz0zvzEw
         lYn3weraeDO/c1xr/AZGpb90mFhIds9r1DANNP5YQnQ7ZJBLg5JEzwOaDLzKKCqXvPK6
         nsRV3637LB1hb7UWu/fL/l20dDnIbkh96fhXKzgrU0V/QRcREh1OrvyauvbfXgStG/Xr
         gJ2g==
X-Gm-Message-State: AOAM531TjUwXAr3ZzMFCK6p+gn0FXA7eiMHqmi0vJuiVljba1/O0GSrH
	12N0vq/N9Jh4KJU5E4E8IQX8FyEjBtlpInna
X-Google-Smtp-Source: 
 ABdhPJyhPBv8LGf15Nq6aIQPs/oqwbh6Y8UQelq2ATiU11CyYAbt5IgOeig9YyRpls1vIDo4fe6Rdg==
X-Received: by 2002:ac8:5a4f:0:b0:2ed:d39b:5264 with SMTP id
 o15-20020ac85a4f000000b002edd39b5264mr19462616qta.477.1651673396807;
        Wed, 04 May 2022 07:09:56 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 t28-20020a05620a005c00b0069fc13ce20asm7390776qkt.59.2022.05.04.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 07:09:56 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] qemuarmv5: use arm-versatile-926ejs KMACHINE
Date: Wed,  4 May 2022 10:09:56 -0400
Message-Id: <20220504140956.4373-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 14:09:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165220

Use the Arm Versatile 926 kernel configs to get this machine working
again.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarmv5.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 2dad504c9932..abdae5f36182 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
-PREFERRED_VERSION_linux-yocto ??= "5.15%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-KMACHINE:qemuarmv5 = "qemuarm"
+PREFERRED_VERSION_linux-yocto ??= "5.15%"
+KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
-- 
2.30.2


