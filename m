Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EEBC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:05:48 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.168822.1673881540555317234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B+L0qdr1;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4bf16baa865so383499587b3.13
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1BpMYK2+PdZPVKG0WxUzK5QMFt4g6ENXg6FIcfd05E=;
        b=B+L0qdr1AQXtAxD/i2iEA4YF8D5zwASevUibkdlI94SAq/7Gi31xnv5YBGY3RvflFg
         LiGpc4ohByP3yqpoVGnvdYLrv7ohCUT2Tzyr6rImk1JcZAi8OhDBBkXDYHMj0JnKZ2Er
         o/5FY59eGcSR0/lnvTFFGktO8sfazOcDh9zyBBs098Yf6i1AI6GV/XQUoX5lcjGZge5I
         5Bucbgh6cztFtmmgwglFoC1Kt4J3N0QF8lFzpCm93gW2AIOniTHL8rCWsUsIXxmUHTIu
         pxpm2NcEDbOUjFp5gC1GV2gKVSvz1dRvNiCEZ4SI2Gz1LlwUPKwWPQmYK0dlWurwMJRV
         LOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1BpMYK2+PdZPVKG0WxUzK5QMFt4g6ENXg6FIcfd05E=;
        b=JxnOHEbfCjuVPrDqTleXiPtvwkjJeZhvHkoOzEKKJO11WMSRgIRXeSeOxhFr44wvzq
         Pq5u29qb4Y+CYGWq5VLvhQqYbxHx0Y5gA7ZwMI57+YjPuezUQHb7peHJ6pzgtC4jMhjZ
         Znctk591/YpLSHH7bWF6nbcMhocLxwuJ8hdc8FpthFPLimUM2Skdv9TzJclr4zgEmMsd
         Yki9eT86sC84qi6j+1zAar4OFeyqnlC2kh7WGyZx8fdLhzjoQdyA4vrVmdullthB/7G4
         wa4Bal5oLhYbRhLjWaeULoSMM2fC4q+R6OmP/Q3Mq1kmjZY0VvPt69nAswiO+vaGutLq
         HCPw==
X-Gm-Message-State: AFqh2krOyK+hjaYGB7cE33JMZjO32QEK3yooWohKJm0JO5NwbspAvzgX
	JMrWOwvacClTJd+fQAm7E08=
X-Google-Smtp-Source: AMrXdXt8rsb4bTk7iFsEGUTNXLqGHKDeQq4lbMQ6BPiJoFFv8vQegJEcj1oEMlM7r75gWLkfrEXQTA==
X-Received: by 2002:a05:7500:16c6:b0:f1:fca6:59aa with SMTP id ce6-20020a05750016c600b000f1fca659aamr88296gab.61.1673881539578;
        Mon, 16 Jan 2023 07:05:39 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id q30-20020a37f71e000000b006ec62032d3dsm6794402qkj.30.2023.01.16.07.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:05:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/6.1: qemuriscv32: Enable CONFIG_NONPORTABLE
Date: Mon, 16 Jan 2023 10:05:33 -0500
Message-Id: <879da02955da6c7548ef8d747fe1f2e21410889a.1673881447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673881447.git.bruce.ashfield@gmail.com>
References: <cover.1673881447.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175992

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    30825f43170 qemuriscv32: Enable CONFIG_NONPORTABLE

    [

       Allow configurations that result in non-portable kernels, this is
       required for rv32 kernels starting 6.0+ see [1]

       [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=44c1e84a38a0

       Signed-off-by: Khem Raj <raj.khem@gmail.com>
    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 090643476f..fb68c7ba78 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "fd78a53858b7f9195ab53fd98c27736d05bbaf7c"
-SRCREV_meta ?= "cee0a2ae73b7d47f881db93340292d22a0aeec61"
+SRCREV_meta ?= "30825f431703621e2b659b8e49effbdb3461f2d9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 6eb8cbad2b..0d8fc236f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "cee0a2ae73b7d47f881db93340292d22a0aeec61"
+SRCREV_meta ?= "30825f431703621e2b659b8e49effbdb3461f2d9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 46246b9632..2caedf78ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "872afe79c5e568acf5f971952e78caada8424df7"
 SRCREV_machine:qemux86-64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
 SRCREV_machine:qemumips64 ?= "e01e486b21db695c46c12253b92adc7aa0da6d38"
 SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "cee0a2ae73b7d47f881db93340292d22a0aeec61"
+SRCREV_meta ?= "30825f431703621e2b659b8e49effbdb3461f2d9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


