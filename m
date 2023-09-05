Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD14C83F2C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:23 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.23197.1693924639941922077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OlYxCwKY;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-76dc7b0da9fso126933585a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924639; x=1694529439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0c71U+CdnDSG8SRLlaV1v6HrpMPksKz0MmjDRQlGNg=;
        b=OlYxCwKY6A+EGFG+29oXBxHK8F7a599a/yqYSLReF/wBv477j6fPaC+dhh41TMvQ3q
         w97J7w5sRzBZJg1wzq2/SNe9qKKcJUXTMlEEwLqgCKOfEE+Xcs3o1YwFSjTT+JHupz13
         BJwhcn4MTpaxsjsMvbbNIxg+zZ5p2Uo6f5aaPOL9qQcKvozB/TaIGuKrNWg2ulIgI2/k
         1IXYQLvXxL1Tqp8Q8D/AlQ/CbcETIHlPuhRjZVUA7IQWKuEPz3MzNaUPdgzlUceZ7ZRu
         G+YlLCz5Vh9pzW/kCKZbk0Hj2s70ZScN0p+CnRR9pq11NBaMQC2EV69ha/23hKaQHBBT
         BgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924639; x=1694529439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0c71U+CdnDSG8SRLlaV1v6HrpMPksKz0MmjDRQlGNg=;
        b=L9ZCncgR+IM7UiUdalZhpvwNTGOYTH8ruUFRQ+nbwEt8vARPInf2eY1E4RvRV1CVQ3
         fqysD7bEfi5WVCxTbSjnawswoO4mzIGY5TrxnprC292DXdDTekCCMp/uDyuy4M2A06ua
         Y3dlXlk9LueYX4ucIfEV6efqjh/QDYAjGtRg4KNa0lxDcmrBwL7gJXTjjoo81cPtqneH
         s/1iPOLF4rxvTCNsSajiUNfiWGL94DT+o0RVaIp142RQXpwAnf/8QqJVuzeGNYGvufqG
         JtSnYjsDEAJH1FFL8iwSSLQ2aQUZUcp76F5w9hh+dii95s6yMxZXL2qeYfhIUMwzEbes
         +DEQ==
X-Gm-Message-State: AOJu0YxA4XvCUQcwoirjkQS2v9iYvXmsD60oQUmzXJqn99dgZ7vs1c4J
	UdFILh30ZaH+YMCJex4HW3MWyodFc5aI8w==
X-Google-Smtp-Source: AGHT+IGzFjBuMbTkmQb4jr90Ohs7Ys2kXfSZBsOkwlG9njIiF1FZmD242hXbdwkLjgwKTYy+CQG1mw==
X-Received: by 2002:a05:620a:4250:b0:76c:c055:aa32 with SMTP id w16-20020a05620a425000b0076cc055aa32mr13227120qko.24.1693924638952;
        Tue, 05 Sep 2023 07:37:18 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto/6.1: fix CONFIG_F2FS_IO_TRACE configuration warning
Date: Tue,  5 Sep 2023 10:37:08 -0400
Message-Id: <ff00e2accd97a887cf0d10d3c38dd23c151092c3.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187218

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    70924d2512b features/f2fs: remove CONFIG_F2FS_IO_TRACE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index be2110ecc9..c78e248cfd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "9d355978d3a95f5c190a21d95ebb2a5d0e638537"
-SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
+SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 6b452f3803..93bda2eca2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
+SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index b4601f583e..d1a4bc8538 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemux86-64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_machine:qemumips64 ?= "296b096f4c747e4c4b31b1708fc8a0acb1dac04e"
 SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
+SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


