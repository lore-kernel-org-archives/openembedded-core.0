Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C19C678D7
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:05:48 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.168820.1673881539473651553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h1DUfVWT;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-12c8312131fso29117409fac.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ9pWIKz8+5FrKckMkQjUcxJzqHBLlqidMSt6oQwlaM=;
        b=h1DUfVWTn51Wl7YFOTyJhYZOqq1FVrG44DENbZTYLmmdbgdUQPAaD6Cepc0P+jeAni
         0C4eMDTU/yXZU/1Ro1WF54UKPNQ5573+LMm2L83O0srrirGCSt0WKRBdeNL/6FQ/Kt4+
         CDkT8h4wObtrHUznSFxzw5wXJvGE2mOCx+PkA5A5hT+b7ftmq/BEa8BmRAUDL+DruLl9
         9IGhoa6BYj1GpN2jqjmiFkcCWJrDpn8P6RVDi4+gKh0CZ+IjDRJOREqngkrbFj+Vs5vh
         0mVPXQBgCOmEFvrv/BVVPOO5sphXjCld0qlQOSpy+LFqGgviFisswM+90JS5kSgveW4H
         7+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJ9pWIKz8+5FrKckMkQjUcxJzqHBLlqidMSt6oQwlaM=;
        b=fhMwqv/Qbk2cFFzEJTSjvy/hUuSm01b5joUbdGEkgiPiDEc+FMXfL/3wc7RoYu31mq
         RNQ1UYsn5T3LA8+y4V7P33oeSvCLQlllcIF80cBoY7/gqM9Lv+8rYLNT6TFie05bjIoj
         zz3nkl2MbWX4kdnZIwZg3pjnFwJskFoC/JL5epGKhdRGctvRw3Bh0NeE7xgE6oh63p8o
         NAenq6KXHiLe0RjdcK5nVoej6XaFqpCkCj9JTq5qdf/nKfhK0yALBBxUTYhBVb86uIge
         jQ2La9VH134IFi/UsZD1r2ApMlyEWYi2XEl0v+VaerZAkyuCtOpVcV32wdPUZbT+5cP+
         lY9Q==
X-Gm-Message-State: AFqh2krz2FN5hibZgvrFA5A60Wnt+9H5NdR5NznW8vfcvjVQ88OQrLbE
	Ro+xgRFd09Sfa9BuDKLixUlEwrEIxpg=
X-Google-Smtp-Source: AMrXdXtMUbDx/SDYVO/MtYMym5ZHZos6eBli3yGFtnLHWk+s+fFHA0uS8R83lh5Dp62xETjKpN8qBA==
X-Received: by 2002:a05:6870:e8d:b0:15b:51fd:c114 with SMTP id mm13-20020a0568700e8d00b0015b51fdc114mr17070oab.47.1673881538799;
        Mon, 16 Jan 2023 07:05:38 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id q30-20020a37f71e000000b006ec62032d3dsm6794402qkj.30.2023.01.16.07.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:05:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/6.1: edgerouter: Replace OCTEON_USB with USB_OCTEON_HCD
Date: Mon, 16 Jan 2023 10:05:32 -0500
Message-Id: <ad943ee1ab93dcad24ab587897fd7af638a7ed76.1673881447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673881447.git.bruce.ashfield@gmail.com>
References: <cover.1673881447.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175991

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The OCTEON_USB has been converted into USB_OCTEON_HCD by mainline
commit 9dbdac024d4d ("staging: octeon-usb: move driver out of staging").
So adjust the BSP cfg according to that change.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 3f77474ae5..090643476f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "fd78a53858b7f9195ab53fd98c27736d05bbaf7c"
-SRCREV_meta ?= "c56c1ed8bdb0c470069b74090381bfe07341c95a"
+SRCREV_meta ?= "cee0a2ae73b7d47f881db93340292d22a0aeec61"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 54f0065c73..6eb8cbad2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "c56c1ed8bdb0c470069b74090381bfe07341c95a"
+SRCREV_meta ?= "cee0a2ae73b7d47f881db93340292d22a0aeec61"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index f357f43f46..46246b9632 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "872afe79c5e568acf5f971952e78caada8424df7"
 SRCREV_machine:qemux86-64 ?= "872afe79c5e568acf5f971952e78caada8424df7"
 SRCREV_machine:qemumips64 ?= "e01e486b21db695c46c12253b92adc7aa0da6d38"
 SRCREV_machine ?= "872afe79c5e568acf5f971952e78caada8424df7"
-SRCREV_meta ?= "c56c1ed8bdb0c470069b74090381bfe07341c95a"
+SRCREV_meta ?= "cee0a2ae73b7d47f881db93340292d22a0aeec61"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


