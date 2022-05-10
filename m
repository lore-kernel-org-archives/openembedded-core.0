Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39422C433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:05 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.10696.1652193539978342101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=APhC+N3X;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso2311101pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DHpgu2bj3a08KlJPr4/jJjjcIsag50Ej1gJH6gp0+WU=;
        b=APhC+N3X6tW0ummMASHHPWbDSf5eEBLJ4O/+Ntq6XbGFFINZT7nOG37NcG+pTj1K2+
         PXyNydaj0UclGYW9SGNqUBK2Xp4LgKzRGXoSu/7hYq31wMV4a/96P3RRsTI3z0X3PIKQ
         6eYSmLtdmpA9rys3bCT+fX5oHy6ywU0Jo3kW1FQ9S9ai8BmKCLsxAxRbeCON2vf/JSuM
         T2oeVeJSl4dWhyEjfInrWV2PB5Xt8E83VaKh1UKNHNvAyFtPsiRtMCz5h+aj5jtRNL34
         LvUhlfAC2gsttHerPSLhz+5Byp4REPOVlgrKfSnQcowPNMlE2WwO8u9lBv5oqEVXTxu5
         PJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DHpgu2bj3a08KlJPr4/jJjjcIsag50Ej1gJH6gp0+WU=;
        b=oqo5sgXxwvvSUo2+j79xnOKH3ZHPWH/W3KGSvy3ZtHJpgLXAAloSsS+fPWhEp4Sfd6
         Nem914BeJZryEM0HGbfptS1ARw3TSO8WOof7+0VkSP6825boOQjoFC7Jx8IdHXTWFT2u
         55zDW6t5g/+w4D5vTQj7u160eQ6qbFMqpoNRytBIaqx6wwTwDZvm9nPcbBXB0jbOCrPs
         qjP6kayhH2TXLKJsTfiw7KEZbUyJMMoGA9Aw2TSoDEiJRCfW/bcVXiIAJ0OqYPKjIX7n
         3mfLT2ivg/eXwZnb1qVUAMsYYeTciSjw6CBgYdIUn4+Rc4Q2d/AhDHuOp2ZUJ/AG2gYK
         Ia5A==
X-Gm-Message-State: AOAM532bVvteIOyouq294H7MhWJOCJ7VZ/9DtUUZjbZCVoVBdZ9SNOmb
	RCankx6NVkf5Oo37cwxelKeJyvpRB3KNYT+D
X-Google-Smtp-Source: 
 ABdhPJymi6AmuJoU7NjgONDjdXLCqelka1Ssis89fbrB039UQFIPqpHdlWpJ8Z2y06lhlgFfG8+szg==
X-Received: by 2002:a17:903:1104:b0:15f:bce:1a0c with SMTP id
 n4-20020a170903110400b0015f0bce1a0cmr11259818plh.149.1652193538716;
        Tue, 10 May 2022 07:38:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.38.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:38:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/40] poky-tiny: enable qemuarmv5/qemuarm64 and
 cleanups
Date: Tue, 10 May 2022 04:36:52 -1000
Message-Id: 
 <617e13b1af686f0713589b10b2f094a34f588b9d.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165430

From: Jon Mason <jdmason@kudzu.us>

Add support for qemuarmv5 and qemuarm64, and remove qemuarm specific
entries, as it should be generic now.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bd21e1130155ad1ec704e0151a22e9f84bfaa78)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d8ce5dc518..43a5ad728a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -1,5 +1,4 @@
 KBRANCH ?= "v5.15/standard/tiny/base"
-KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
 
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
@@ -15,7 +14,6 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
 SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
 SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
 
@@ -24,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
 
 # Functionality flags
 KERNEL_FEATURES = ""
-- 
2.25.1


