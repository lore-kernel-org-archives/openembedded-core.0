Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC11D75BB0
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:13:40 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.3533.1732162410307045912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 20:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EZsQ0hPm;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cd7a2ed34bso3281626d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162409; x=1732767209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/O7mZvQ7mhvh57jxd2Hb70oNjjdwNddkdjUqIVPyk4=;
        b=EZsQ0hPmT4KZASg6TQ/PLDnGZwH30BcSslIykHJDDryKaT8oMFOha+8GAzg0yHbDlf
         MGCQ7rKgIX/xOjQgXxpInE0rFxiiKE2SHpAvEmJSOQoWG4cSgvbb8lIB6bpt1IrDKUlm
         tmhlL+ff+KakTMvgOt+gJ5lwZS/pJpK5Hzrs3tocP9mK+jJLgyPmYud3Zy3jnmB0MVUW
         cxP+5mt7lUuY7oCtEMmciN0J+h2vX9diHVuv24MqEa9ia/C3CJizPo+ljdKse1mZGpzZ
         AM8PwNMqmSoo39s/y8JgDNXjFzCeq03VEo7cXScepdkXpmWnZqhckPpaYp7jzGK1CrhS
         UUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162409; x=1732767209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/O7mZvQ7mhvh57jxd2Hb70oNjjdwNddkdjUqIVPyk4=;
        b=soeizH5q70WwvO2/SfsO4sFhnYzbIebX2FdJ/KdNPLFo6SjL29ApS2piEI8CytT2KO
         i+cxwaqdrCrhq4tP5685Rp1sN7dp3DKZcaDKx9clGSskElRV9CNfI2KXxkx2M2D7M8Yh
         IfglXJ52O48t3jw3QaI/dPxqjGFA9xd5D5emh0Sr+hZDcIIMBrgBlGimB5NCV83lOi/j
         dETUD/xVf7RosOg6h6iMWbIvpFSYqdJd+jkxhT6Luj8r94IdFVpMGb/rFYsIWRoISpa7
         fdl0hLkTrPDJJcG9EdHCowNQhSDfmf13xYRUmiDvMhR2aKauT7FshYaiYsLouPotZ8Ft
         LFOQ==
X-Gm-Message-State: AOJu0YyMDjqsLVeAJ4W+s+qxRgZYYYG/V2yXHYDRkUgY2Cq2zqxtLfwm
	0RP7U7xrIZq2i5mP0z1/I5dKx74Q3eXE+Klu34XYPg8DBk6El2uajm6xWIzp
X-Google-Smtp-Source: AGHT+IHbWXONPAxIKBbl7w9nhwATPZp1f2M+eYofPLCHF75xYKqp4LudtlScgBqndHrNPdvBI1RA3g==
X-Received: by 2002:a05:6214:5299:b0:6d3:b636:eccc with SMTP id 6a1803df08f44-6d4377a857fmr69691656d6.21.1732162409395;
        Wed, 20 Nov 2024 20:13:29 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380d8b06sm18238846d6.37.2024.11.20.20.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:13:28 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/6.10: cfg:  gpio: allow to re-enable the deprecated GPIO sysfs interface
Date: Wed, 20 Nov 2024 23:13:18 -0500
Message-Id: <bc5660218fe1e983a1d14b51ccbe9a4b39999ab5.1732162137.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1732162137.git.bruce.ashfield@gmail.com>
References: <cover.1732162137.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207506

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bartosz Golaszewski
    Email: bartosz.golaszewski@linaro.org
    Subject: gpio: allow to re-enable the deprecated GPIO sysfs interface
    Date: Mon, 11 Nov 2024 14:08:23 +0100

    The GPIO sysfs interface is disabled in standard linux config and in
    general users should use the character device instead but there are still
    programs out there that depend on it so for the time being add a kernel
    feature allowing to enable it.

    Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 8f87a096ad..fa78313a9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
-SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
+SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index abfee6953d..d21fd63d38 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
+SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 9b2334afd0..45d7bfd619 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
 SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
 SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
-SRCREV_meta ?= "0e4596272608c13c9e25bbefd6f27f213bac077d"
+SRCREV_meta ?= "3a72fcf6df4fd9edc8c5933393be76cea6cb4a42"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


