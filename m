Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249E2C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 21:34:02 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.27093.1651354437003572258
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 14:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XiKKAWOd;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id y6so6785917qke.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 14:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6FdVake7BkvbxAesxtjtaaFlOB5qvJEq0j2yWRAoilI=;
        b=XiKKAWOdB9jCpDrBWrujvhS5YcmqXTQLrHICmTP7tjBNmEjZPy1r+tzrw8g/nBnFRd
         /BQX/NS4NJ6CM3RkTVZRPJuNaTZuP0XgMzB2XN4HlDukT2cFcdXjzUTkf+tCHMBBZtZQ
         f08LH25/L859LlbV7iXHW43qiTf4WMpdlMnruhA+2ujbBHALdtMb7dYGLeDL3Wp648ou
         r5NrJFNoB2yP3MvLkL4hAAKpUC9EdbhsWk/gxrjy5eEoCh9urQdoRTwCQBAM5EStMpdB
         SIqxktGUZCOSu6TzLj3og0WsuBAnQkp7ZJNeang8rmfW1O5SYxlmv54hoD7YcRtF/Gav
         MXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6FdVake7BkvbxAesxtjtaaFlOB5qvJEq0j2yWRAoilI=;
        b=q3Ct9REhR/JfNy/lVzh+Bs6EpNcgFJSNGQMFBnEQlmb5k+8+XaE/n9hD508faAfP9d
         6zR4+oKW8Hc9DObwYG51HJjD/s+xTyIPJJ5UIC1cfTvdMd+AImEa6M8t+boH8zWz6psM
         Ag+CG3Pw1GEwDzmjRHET7FABZtt2DjdF0Fu1INIADbPr3NI6lidqS/UQ3KEd9xTqYC8Z
         IrLUG8w8MeQp8KNN7FC7409aruCMUblIMqYnXogbVoFeo52tXHRzADQDIvaLmd1y2Y0E
         HCDS9LSE0rcpByZ5wpSrfphRf/uBZ4X8JYdQDfYFYhivAK41rymLMhlMdcgEhyWALkNJ
         fpOA==
X-Gm-Message-State: AOAM5300heq7nuhmR3TP9n173Ro3YVypQhr7yHO47JrCpwJko6ooSFeV
	ElLskeIIcvqUnVa1aPacpkAVYhOnpdVJZg==
X-Google-Smtp-Source: 
 ABdhPJxioRkpFyVcMJcBhibVeuCUftTLECbqQY31uj7HYk57NCyxaQ3YQ0k0WCgHtd0qH1UVUV4UkA==
X-Received: by 2002:a37:2f45:0:b0:69c:f34:d9b5 with SMTP id
 v66-20020a372f45000000b0069c0f34d9b5mr4008562qkh.68.1651354435939;
        Sat, 30 Apr 2022 14:33:55 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 b21-20020a05620a04f500b0069fc13ce22bsm1724004qkh.92.2022.04.30.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 14:33:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.15: fix qemuarm graphical boot
Date: Sat, 30 Apr 2022 17:33:53 -0400
Message-Id: <20220430213354.7213-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 21:34:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165073

From: Bruce Ashfield <bruce.ashfield@gmail.com>

During the cleanup/refactoring of qemuarm* we dropped a PCI option
that is required for graphical boot. The configuration is fixed to
create a separate fragment, which just enabled the minimim and we
include it into qemuarma15 standard/preempt-rt.

Integrating the following commit(s) to linux-yocto/5.15:

    fcf48627ea5 qemuarma15: include pci-of-generic support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 95a250080d..afcc715918 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "2b74bd6a3a2341f079f914171bc92eadc8a7deaa"
-SRCREV_meta ?= "7aedb91750c4157186761d01d1ab4b4114986071"
+SRCREV_meta ?= "fcf48627ea549df12be5d651521fc97a01b1986c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 465e16f1da..9a708804c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "9107fb1e04c2da3d84e1967aeb7f5bc190423d5b"
-SRCREV_meta ?= "7aedb91750c4157186761d01d1ab4b4114986071"
+SRCREV_meta ?= "fcf48627ea549df12be5d651521fc97a01b1986c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8bada989e5..f8e556be10 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
 SRCREV_machine:qemux86-64 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
 SRCREV_machine:qemumips64 ?= "1822ceafc13337881a81edeb7093b0c095d9efca"
 SRCREV_machine ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
-SRCREV_meta ?= "7aedb91750c4157186761d01d1ab4b4114986071"
+SRCREV_meta ?= "fcf48627ea549df12be5d651521fc97a01b1986c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


