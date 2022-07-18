Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A671C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:31:58 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.21608.1658104310860161773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=anjaWzos;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id s206so9253802pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kxUNsi+LPhe3wmA0ZkyK/RrMp1v/EMIuFt1RX9Vk8KM=;
        b=anjaWzosObyxMg5/6XQOIhhlOGQj4hR4POeF5KeB0HO0m5qsbLSIsvxlBXEZlg6TY/
         47awkq0qPnQ1xKQ4hmaSV6QAXmtsJvukfSW6vmPKQMFlired/7+C77tSLb9s3f6aKnGN
         pfqZFp+p0xn1MBqqym48dSSSV+6b07o+BAud5H8e0sstB0rrsFOtrNpZdoZIv5BsUzFz
         ed/iG3yNJh/lhN96rXMr97hPn75j+EdxjjrJcKH9E28e6d7NpEzGAjIwAkB/EDn1b/X1
         cn2Bf33Os+uxaUDkYwE7Llcyk/+MCrwVfZupxEZPR9NOy2fUX/QupQbc5Mq2jXDx48ff
         7YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxUNsi+LPhe3wmA0ZkyK/RrMp1v/EMIuFt1RX9Vk8KM=;
        b=H9GbjuFNU9bLEUBEVMnhRHWf09cJXbPMygl/Bu40bKFYaAvwwvGkCPsT3tuOb6PrCh
         no5jpMHTXNNCX7gSmStHPmbz0pFDLGi0gyIz7JIUg/WHazfREL9tMYh29tF6IUpUw+oU
         ogxgbtE8XlKABK0Z+j+mTO425OIbFHHqMjrZ4MffpvSWuDziKJ14zL8MogjItm6N6OpI
         8gYGpuCUizQn3WsZKH7L5MA9Zg8WZhiKP0x1MYT6sE4RmrSUuKMymSIMatlrUMRHJ5Ye
         0mAiaBpGpUOGEEYhJWoS7rx5bRCslLbe4gmqtyIdg1Nc/s2GUxKM1jDbi6dRRdRiioZf
         zECA==
X-Gm-Message-State: AJIora9Fq8PKlQQIUVLDa6S4Oz1nud4fDGcSV/+9Akv3KM3c3KZqsNJ5
	xIC8DPBklpomGSovpAoQk2nViUmlaNcpsQ6t
X-Google-Smtp-Source: 
 AGRyM1tSFOt3QpfHyKEmgcur6jf2F2eVXBc96D2FHty0mN2gzOPQoJeKvQq9h+cW34gJLgieaQgx3w==
X-Received: by 2002:a62:8747:0:b0:52b:486a:50f with SMTP id
 i68-20020a628747000000b0052b486a050fmr12227622pfe.23.1658104309653;
        Sun, 17 Jul 2022 17:31:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.31.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:31:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/23] linux-yocto/5.15: fix build_OID_registry
 buildpaths warning
Date: Sun, 17 Jul 2022 14:30:16 -1000
Message-Id: 
 <e1c1ad4c1ff57acff0a841a5bcf42494fe67302f.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:31:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168180

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

 Author: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date:   Sun Jul 10 22:56:53 2022 -0400

    lib/build_OID_registry: fix reproducibility issues

    The script build_OID_registry captures the full path of itself
    in the generated data. This causes reproduciblity issues as the
    path is captured and packaged.

    We use the basename of the script instead, and that allows us
    to be reprodicible, with slightly less information captured in
    the output data (but the generating script can still easily
    be found).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 708421238ed149b1eabf463bd563a37480ad1169)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9c869faa9d..61b1df04a9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9179770f29198c123b02f1d7cd20fb08c71c0159"
-SRCREV_meta ?= "e532b0393413badf4f0df4b2337015efd8eae932"
+SRCREV_machine ?= "4132e425a2dee778212b42d99a9812fe1c78a03d"
+SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index b87e41776a..7c81b048dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7dc6451b61e67818fe461b950a3450bf9d06067c"
-SRCREV_meta ?= "e532b0393413badf4f0df4b2337015efd8eae932"
+SRCREV_machine ?= "b2dcc4f70362059ef107000f9be5c76c2886911c"
+SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index e09faaecdb..3e22f8d570 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "51fc1677b3378d04bf6bc59f632d80c8a21e54fe"
-SRCREV_machine:qemuarm64 ?= "5c9319fd04d643d55836b94f7eeb4dd7561ea197"
-SRCREV_machine:qemumips ?= "78b65359d44c9ae535388dfc8bf06eb8dc8764dc"
-SRCREV_machine:qemuppc ?= "dd1a7ce7eb8274e72507d634d9239109fdbebb85"
-SRCREV_machine:qemuriscv64 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemuriscv32 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemux86 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemux86-64 ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_machine:qemumips64 ?= "a6f8486df096f727ec6233a152947d9bf26202bb"
-SRCREV_machine ?= "0f586f4ee8adacac79b64d1f3d47799a5eb7fbea"
-SRCREV_meta ?= "e532b0393413badf4f0df4b2337015efd8eae932"
+SRCREV_machine:qemuarm ?= "3d2ffe77f277a0a650e7d012c5bfe3765a467e4b"
+SRCREV_machine:qemuarm64 ?= "1da6524b1508ca6e9b6602471b478d310bec1960"
+SRCREV_machine:qemumips ?= "4101fd448319edc00fec2bd822be407d19205bb9"
+SRCREV_machine:qemuppc ?= "651a0112fb207bae1be0d2609e9a910135fb4feb"
+SRCREV_machine:qemuriscv64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemuriscv32 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemux86 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemux86-64 ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_machine:qemumips64 ?= "d518b9a80c938ca7ce11e56d2275c33b89dfc9c3"
+SRCREV_machine ?= "2fca0fd719812ea2ff67630b01355aa80481623e"
+SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


