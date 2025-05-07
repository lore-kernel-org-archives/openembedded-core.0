Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D530C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 15:11:21 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.994.1746630672593458419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 08:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LFB40Dqj;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4769bbc21b0so86041201cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630671; x=1747235471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+W9PqXnq2wkm++NWDMqVutb3HpwnOuixi7g35OQDyLQ=;
        b=LFB40DqjGdMH6zuNxVNJ8lw6ZBp0H/rlGO/IKh0sy9xUNjIFvpx3La/IkGV0AT8buG
         dhVWp3rQq36Vcz6s+yztXSlZb3DnartT9hy/i6ucAemh90/iynJBEMGdP9qNZ/1pOYlP
         YOklHAjyOrkJpXj7DT5RPBsYE4EIPgvVUBjPKbnZ3glm8C3VE09FcRSzx/MFpsWnmXcn
         Cv8Qtr8hiHkGyhqulqN5kS0P6OOeA2+xQ/BSienUQlqi4dxQ+xVC4G4uZmkeD/XlhMOe
         lcO6vZt/E20CzBVhQGQwkMp9cb+qdsyuPp7O5/zYnlaDcQE0hNnGdyVSkjLjQpyXgZ+6
         07gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630671; x=1747235471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+W9PqXnq2wkm++NWDMqVutb3HpwnOuixi7g35OQDyLQ=;
        b=iDN4Slmpl7ArP1F4B4WC6ItpGizxshhY/nfq1aK8OIruXMqyaqbmUx+BFdpY5UOlfl
         x3DLn2pdqImLmZfQHEMxY8xifqqzyeKUK0G9VZ55mKGI4mIPEknnQpMHXl0X9YqRkvQL
         +2vNZeYe2ZOkeGp0CYV9D2hr/c2TldKFkdM0mbIqZpAErNMU367NfVmFE9tW4WItscDf
         9cUaNBZhvTJeIgXLGNMdTMlncNe9v9bsJJycI47S3TBQJrNNVLUwd1H4HY59h518XM6u
         5Vm2IZVUsd13j8P4LEemsBtaPEOn87YCID14DYWW0My7aI39qVtaeMjLnrV6LfozJpjP
         rNVw==
X-Gm-Message-State: AOJu0YyiegqW9I+hiAyPZ+Fe784zng2O58OLCE6N8MVL88IwaJVTsE3t
	lxQD1y0htB7RCuyHXQC1ndw0kYJ3+i+mbZoNBI3Wskqkmq+JlU4D
X-Gm-Gg: ASbGncsY3EhiQjJVnAyCuq4d4pXxKY6m2m5olIwo+pRsY/yj5bS0ftl7HBCx1b+xWnB
	v6tkB36lTnLWfA4SjlSNDzwCNsNz7m02gK1Y8/aqURCHySZtVS/9e8ZfegA/kD/LaPTszzBzwq6
	53hMTKvp0r0sD9T17VazyzttLj3kRr34VmcEdR8CReOEZmBC2+gUeOqZv7xngqDC5TLR6eSOT9C
	ZSDWuiN/ROOck6Drc9pd3NrA4b2+a+ITflXb6+eM6PrGX9o33HE6teI+mKwu0CDR1qhXp6DhOTK
	8eatNwX+iqEWG4Jz6WRQkHqUF+3NTNMR+fu+QugSegJu5ma5VH3GWxLytqe2ae7FsSI8RZyElMM
	7NtdATFH1YIUuQcqXGSm+thf1kjvVAR0lCDmkSh6SjA==
X-Google-Smtp-Source: AGHT+IFvY/WysvMFot4rSsjcVjQCyw71lfPLnB9THCR1Q4jpgXgypGReki6huBARqBXIR4qOyEsB9w==
X-Received: by 2002:ad4:4b34:0:b0:6f5:473d:e529 with SMTP id 6a1803df08f44-6f5473de7a6mr17402906d6.5.1746630671381;
        Wed, 07 May 2025 08:11:11 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f5427c73fasm14871526d6.115.2025.05.07.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:11:10 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yoto/6.12: bsp/arm: fix CONFIG_CRYPTO_LIB_CHACHA
Date: Wed,  7 May 2025 11:11:09 -0400
Message-Id: <20250507151109.654312-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 15:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216119

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64: add CONFIG_CRYPTO_LIB_CHACHA=m
    Date: Wed, 7 May 2025 14:43:40 +0300

    Fixes CONFIG_CRYPTO_CHACHA20_NEON build as module:

    WARNING: [kernel config]: specified values did not make it into the kernel's final configuration:

        [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (m) and .config val (n) do not match
        [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: qemuarma15.cfg: enable CONFIG_CRYPTO_LIB_CHACHA
    Date: Wed, 7 May 2025 14:43:41 +0300

    It's a dependency of CONFIG_CRYPTO_CHACHA20_NEON.
    Fixes:

        [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and .config val (n) do not match
        [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this on top of my recent kernel series and the warnings
should be gone from the various arm builds.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 2daf71600a..6560175461 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "28fcf1f308c59515410f6a0d0bc3278d5296a3c1"
-SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
+SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index b1a45ab168..cf6014efad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
+SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b44bb94590..fefed8c9c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
 SRCREV_machine:qemux86-64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
 SRCREV_machine:qemumips64 ?= "8e88d1714f7f56efc4650cf84b86845d44c01eb1"
 SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
+SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


