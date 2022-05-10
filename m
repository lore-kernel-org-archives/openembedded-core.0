Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505B2C4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:45 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.10890.1652193581570564415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2n9AzvJw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id r192so10630140pgr.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+QC+nsnDsXf54MTv5peTXQ4+GOIgGDe+qGQixdWtQ6c=;
        b=2n9AzvJw42FbjxvOeu9Gu8UmXVThtiOaQheE2LGVPe/LrMGEQC9G07K6RRsrn4uMR8
         jDvZ1jXRRmTZ1+lQYPfnInCKPa+wcM34N2xpb4Gxh0VGXsyXovZ+07XlpA/JRFfs60CB
         qtBv4fnUch83SUM4w2cHN7i3SnbFgKh3OF39oF0Q+t1B7MP/T2ESy+LBpat15gosZfA/
         /+GFiqHVIQpB6LmKoJp8T535UIXb0mGWbd2nm08QkWlvS4fvrmQejFKp5dTEVDYPCtI3
         NzYyBx7qiGHmWmIvANn3XG91NjtN8gMcbYPC+dsSxPgW9axPxLNutJL/49sEkhSpjApB
         Ny/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+QC+nsnDsXf54MTv5peTXQ4+GOIgGDe+qGQixdWtQ6c=;
        b=sNG2goHteTzJaUerDMcp4w7RzhOOvEqUliFE+JzJdszRbr71RgRlugu2f/STl6QMtI
         eIPgsFTxZQzuvpIPRpUVf8YZnOwHMD86Q8JBNvggai2QtTl9+gs5/CBbozspWOZbBtIi
         XItiSzt0yeapDohfkocBl5txjs/7cR7PY8reBhFXWd048nqZ5apOQ3T9rQVPtzZxFEwP
         j/UL/npNrAtJrUpfuOiHw2rr7e05fEvPUDqo6GvG4Dyb9g6b7rPYesJ0NfV3WuQRcPM3
         qIEtrlJEsT5zktEIvpK3oa/dmMK4tjnkYYhFlwvKXefvl8BmVTNpcQmhD3HUZ0ZgZUzh
         Kq1A==
X-Gm-Message-State: AOAM532a2p6TW2jJStCuJka+laCO78msVkEVVMq58FuwCjSoXX4w3p2b
	FvEjgghaX/OL6jIR9ZO93bnL49+DA/7xxdNH
X-Google-Smtp-Source: 
 ABdhPJzShlrJeLz+AgPeEjSgIVEV5FLhhLDNOEvGm9Zm1bPaH+9fmk1+TkrjPP2R4DcuRWGz7YLU8A==
X-Received: by 2002:a63:6aca:0:b0:3ab:a56:126a with SMTP id
 f193-20020a636aca000000b003ab0a56126amr17107385pgc.576.1652193580380;
        Tue, 10 May 2022 07:39:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/40] linux-yocto/5.15: fix qemuarm graphical
 boot
Date: Tue, 10 May 2022 04:37:05 -1000
Message-Id: 
 <ccd27ea8b8e179b7eb0526ed1416ca674c9d295e.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165443

From: Bruce Ashfield <bruce.ashfield@gmail.com>

During the cleanup/refactoring of qemuarm* we dropped a PCI option
that is required for graphical boot. The configuration is fixed to
create a separate fragment, which just enabled the minimim and we
include it into qemuarma15 standard/preempt-rt.

Integrating the following commit(s) to linux-yocto/5.15:

    fcf48627ea5 qemuarma15: include pci-of-generic support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 375366bd16619b14f718f96a9235d0936cae97ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 7ccb13195f..0aef531659 100644
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
2.25.1


