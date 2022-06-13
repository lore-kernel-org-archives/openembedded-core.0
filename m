Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDD0CCA47F
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:37 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.6331.1655130156380669505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aIy9OiDD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id c196so5903827pfb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=loI4O04puP2cBz1VleEVJBeseMhP+uQzXNK6Ry9LElk=;
        b=aIy9OiDDHRsthQ/GSN1j8iTl0SKplJZKZX3fhhh5QOptTmR0nS63EckAkmvFBhZu5Y
         o2SPQkKAuBAGW9HoPqoUTAVd47QQi9phfueRXHZqWH7ceQcqxlXYZZI3YzbtfHUblevD
         QnVUmGdlNKlB2m7qe5gzEfOzemDv3DMasksQdfzqszEz+nsQCQkhx7e2h0wwd3dEOVa9
         2e3qQ6td8BcIotYnoBqUTM5boTr/yGQVkaVAAbLU8uzUqnaA0COGQzPiMO/Vu7sIoW0P
         eiPB9htjiM6jgiQzR3xqb7weY74PCWGlfux6gLFNXeFwPXpUnZvzVLYqvMvpuT0brM9A
         24nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loI4O04puP2cBz1VleEVJBeseMhP+uQzXNK6Ry9LElk=;
        b=3zF65tK8d3QOfXXGnrJX5GyP4oo4HdO9njWprGUzgRKfDym/5AE8APjkTOOYxxUMDf
         q+c8oog/BbIPiveaHc6jp1ph4ZimYFGMsXE78ShYE+XoKn8mkZ/pRRhM6ARMJD0Pupxr
         4LU03lTw2CpaD1hCZ4YnzexRw/gJ79Ock1x8jfMVegsUnztlpa4TSd6RTLvqkfOJFxhO
         IeflPhrSVWeL1yutpRgTQQ+BxHCq/qwUTIg5G65JWBu6E54FjFO1AhvM/HAIRJRIqbFB
         FyyLj9JGcws1wPpKEXMCvfr5anjTphxIRDXmndVQ97VTRG51JMcSLRIYVYj7OIMJLFqh
         pjdA==
X-Gm-Message-State: AOAM532U+gOd9mXV56QF3rxCOAtVBLeOjLFXS0PU5DQKjpxPPDcBaPK7
	60N51hxbM+UPrltR7zPjxJt2x0PqtfVFl2+H
X-Google-Smtp-Source: 
 ABdhPJxiFuKtsgJYrQfxJrHYXbU0cPkPcHNyRgaP1kl0eGXw0UokvfsAuRsrYM0dbgoJUv1WVsI2+Q==
X-Received: by 2002:a63:5108:0:b0:3fd:77f1:57a4 with SMTP id
 f8-20020a635108000000b003fd77f157a4mr40163692pgb.125.1655130155353;
        Mon, 13 Jun 2022 07:22:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/20] linux-yocto/5.15: cfg/xen: Move x86
 configs to separate file
Date: Mon, 13 Jun 2022 04:21:44 -1000
Message-Id: 
 <6b82997af3b2dae330c804e5bb3da973cf8fdb28.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166857

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    ad633e22764 features/xen: Move x86 configs to separate file

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a13622703747eb1d7bc4085693d468c2772441b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 059c0e9a99..034656017c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "0349dadc971ea2a9ad780b9be95df3c7b9f08eac"
-SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
+SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 40212beed9..e9991a66fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bec753cf26f9924ed9e4e583032687e4a2a947f4"
-SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
+SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 2128f85355..b7fdaebd3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
 SRCREV_machine:qemux86-64 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
 SRCREV_machine:qemumips64 ?= "cc95aac05d6fb9f0fbe1c336127568df916e2fed"
 SRCREV_machine ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
-SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
+SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


