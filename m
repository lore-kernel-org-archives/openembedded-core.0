Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3BDEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 22:36:03 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.3126.1687905360597561738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 15:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gqJ/kaTm;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3a0423ea74eso3730046b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687905360; x=1690497360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jhBKhfJwQwoXYu1LxbuwpJn/S/bOo3T/gLICoutI/s=;
        b=gqJ/kaTm6256skHAkD7FsuNCvtnoxriu/wdsPuQHuiie17OQLgMIY6/+XbGwRmY6ta
         f+/YDZwfA3wg/R5qV7wdx4PWXHiVpZOMGPJ7eZKzGa0+JyczzN0m1fHncYsdjTS0C9rO
         SOjMfHqFeYMXD0WFp+YGiCjQc/SVzZrfFhyqrfxmH7pIFbhLB1QvtnkcKNDbEe4iLW2v
         d0UHZBkR4iEi5zJ/zIHs4wE9ND+dotW4R0/7Z5mcDYhpfAYU8lRhbUK3aLXthaXG1yaZ
         OMvjyFEOX30HBxUSkSiRt+wMi9G+NSkCieIYeQHTzh2TDWg9TbYgxCvG8FEyQqS2Tq40
         a5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687905360; x=1690497360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jhBKhfJwQwoXYu1LxbuwpJn/S/bOo3T/gLICoutI/s=;
        b=NMT8wDEIgoFZBRyKfqQ9BYp+bU3qa/yB1nPE1VNKL3vVMit2dPHlasGInm7Yybbs+E
         Wb/0MIiS90pXbkEpI6WBHOFC7aqmSy/jtIcyudeglvz+rcVx7ZMyj9dJFTz3jHJED7Fr
         CzYHneHpLO/WlfQ/+GLHfRHW2C5CIn5B7h/cQ0HoUEUpvHTxCm0pCfq8gLgMkECJ/HKt
         9V25qHp6jduHFbdtyCFPitIiIcgRJHbCOEIibLNsOV17PfL667t6syItcdtn+YBChMxm
         6S6wrrkE2+GH6henceb4KlW5X9e3puUFvqM/eoIYYDWQPLGgGzw+g/BnEQaOY60Fnf0m
         Oy9Q==
X-Gm-Message-State: AC+VfDyh9aC3fbFhOoXOxFtR1Pgwd39kN93CELDCoIQPStAQk6+cLszX
	5gyiJ93z8WMhL/5ubWuzZCQsbIvmtxghOw==
X-Google-Smtp-Source: ACHHUZ5YljzoyLnXxpxEza2xa6B74KeMFZFKUuVOOz0GeYR8lg1YgSZUF6rj4MaONhcqHCM5RLRtRw==
X-Received: by 2002:a05:6808:1250:b0:39e:ac75:8a09 with SMTP id o16-20020a056808125000b0039eac758a09mr29289988oiv.50.1687905359622;
        Tue, 27 Jun 2023 15:35:59 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a0cf7c9000000b006262f1a7334sm4988926qvo.128.2023.06.27.15.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 15:35:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][kirksone] linux-yocto/5.10: cfg: fix DECNET configuration warning
Date: Tue, 27 Jun 2023 18:35:57 -0400
Message-Id: <20230627223557.899986-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 22:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183506

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Dropping CONFIG_DECNET as it has been removed from -stable
and we now get a configuration warning.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8e7b0b32a0..7976b96a61 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "46fb028ad9413cfa8d47a6dc8bf9a57d9d5edf8b"
-SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
+SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5c4eb9e990..85dac1d874 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "6e0299be775387485e22edcd57ac6099c08f4356"
 SRCREV_machine ?= "772cf990473f73ebf34c1a1ef4f06eb3e297c4db"
-SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
+SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6e82782a38..2c7a3e2597 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "dafc025b033585311d1693255c80b60b690b0e54"
 SRCREV_machine:qemux86-64 ?= "dafc025b033585311d1693255c80b60b690b0e54"
 SRCREV_machine:qemumips64 ?= "ee18c4343db52d5846a0f332cd6df26a6f72dd45"
 SRCREV_machine ?= "dafc025b033585311d1693255c80b60b690b0e54"
-SRCREV_meta ?= "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
+SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.34.1


