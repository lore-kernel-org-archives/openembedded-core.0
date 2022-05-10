Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405FCC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:38:55 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.10694.1652193534639776979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bur7Dlsy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id i24so15102841pfa.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i1kW++s91pC9OdVm2t5ERBhAEq5sjswNtPz4CluhJPE=;
        b=bur7DlsyW7Z6/AeC2fLKUsTZIzEgvJNiXBkgdJ9uZofbfCJHXNkouIguAEN1KC9gyb
         MIMO+SYniVUa1To4PbaNNyFGVheWxpxkNeMfxT8i7kNv1F6KmBCh3vraHZ7mEkR4rTmL
         aZx3nEa/8lMJyvHXSq270Ttshbn7v3QolgODUUEzW0+Q63Qw8LTnmFk05zMlPFFT4J4m
         CugVBQ7wwP7j913hv5EQKQ0JCTxFk6zIds36Gm7oKsv0jvQ3463xRMZ3Xd76yomY8KEJ
         Yr454hUfpUOTYKabdxVMEjOWy+gbgV95GpSR+NUv/Gdc2oDiPj2bDZSJM1K5UuKQ/KhR
         JiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1kW++s91pC9OdVm2t5ERBhAEq5sjswNtPz4CluhJPE=;
        b=PPwD6u8lXQVEwyfvqzHnU0UVoNtTBmspnBLLy/jhsp71Y1ztnnQgp38lFn0i8jpUpE
         rq0dzCa3sY+8COavbAbIFbpp/jcdjCqZ+EW4AkhxLAFAFLHPb7/Qvrg4BklrS2XOTuwQ
         ZWMZAbK2s8tflfj0ftGVLWg2z0QMrXi5QSgwQ6rar+0q9uxbGzSM/13fF3yrZdEo5G+/
         s4UpI4eJb4uA3m/zmZEYaj5ynWHXz/AHq2YIKI8Cb9GBJCfeq519NgSB4+oobmaHCfPK
         od8EQ8f5dj5jmQsrXfUMSpEgdqbjOIokAQ5PYvm8aHPehYmUDYAihFMRhexItx7jn4o2
         TEkQ==
X-Gm-Message-State: AOAM531g9GZ1BjcUZSNEyHSLKo0Lo1gCbIosrA0a0LSdjYQCY+uH6JER
	wETfb7vyohUOIsb5Qtak8DQ1OAYJn4GoeNNW
X-Google-Smtp-Source: 
 ABdhPJwegHbxlqQ0wPiAP9tMz7M0yW1AFatTO5lN80n78YcJqTeEqMzqW843QeLM/WNFxps+WOwA9w==
X-Received: by 2002:a63:3e44:0:b0:3c3:dabd:eb03 with SMTP id
 l65-20020a633e44000000b003c3dabdeb03mr16913100pga.15.1652193533336;
        Tue, 10 May 2022 07:38:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.38.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:38:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/40] linux-yocto/5.10: base: enable kernel
 crypto userspace API
Date: Tue, 10 May 2022 04:36:50 -1000
Message-Id: 
 <372ee7fac31aa8ebf6f5c38550ecd8de190c40c9.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165428

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    bddb0e4921f base.cfg: enable kernel crypto userspace API

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a08c1c7dba66a1d12e029906d86f4f84e9166232)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b8a280a615..9731a738b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "c11f8738640c3c52f4ffc2adf9aa8f6c097e4a4e"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index bafa486d23..f75c0d70d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "3851408a9f5d9d4531f29340056a1089debd5b58"
 SRCREV_machine ?= "0a47fd76cb0f7e22d47afcb88bf884c750ba5d92"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index a0b7bbe48a..127763e972 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemux86-64 ?= "a275cd6839513c72ceae989a575b6accbb262016"
 SRCREV_machine:qemumips64 ?= "36a2d17167ee66a2feda5fb1efee0a2ee2dc4740"
 SRCREV_machine ?= "a275cd6839513c72ceae989a575b6accbb262016"
-SRCREV_meta ?= "0959fd4d1eeb5312233be7a3c1f9a97104163f90"
+SRCREV_meta ?= "bddb0e4921f541bafa595986f16cff5390d01f40"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
-- 
2.25.1


