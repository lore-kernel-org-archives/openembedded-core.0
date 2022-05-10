Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A878C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:35 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.10752.1652193569838190043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ULTYIZ8f;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id v10so14787170pgl.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Yq18iKQjlv+83nlKtKbVWofKAb5d6iNmKVI1bPfa4Xw=;
        b=ULTYIZ8f/En4cOo9ZQqaskrw7seht3UQ5JdwnAokF3gUlqiu5wFsHKFlRFsP11PirU
         KrTYDwHxQF5H/GoZBT83eRjTEEEdpHkzCcWxBm7fYcs6wZCD1tqvhsXIYD6orjhWhMqf
         DiuRGcQDiNlmO396Uyr3NRLBrLfsNs5j09qcpWZOfry44ZPiQhMi/80F0t1HRdaJfQ/c
         iT2oUZsItpEjzIsqKf1YJJPVYocZvjj1JZy3rG29gcPQZY/kdrDBx672/qMsUDUDpYLF
         TdiKzP4qAqIvldvoxEQ/18easO0ssd+03+yI8qdPSpdIuAVjrv8rHUuj+dcOTFjUWdi4
         YufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yq18iKQjlv+83nlKtKbVWofKAb5d6iNmKVI1bPfa4Xw=;
        b=oUY90veJpfXXyrz4usCub3H9l1nnBBdzZMpIt+C9VAlHL6loqt8lH4ovjTVUsLr/4q
         8TatXyN+HSaB/4kWYRYAFIOvKdc2tz3x0K4nIK/p0dIb0NCzgR2X+XQl2yuP5TS9Bie5
         XlHpQ5EEEumD8dXaa0+Q3c8KKXf5lYlnOcIJhzYT5lc2H+yLkJd31QPozt+zbzCzeACw
         Of1g9HalqYIU4rnDNX06Gfap9OfiSDWNLSzyurkSGIu+9aMJ1po/Qsh4zzbmeU2usm/W
         MKRpPkVlBSmOd2TTsiFwZ/08pJKGxqVirzJtH7aHERpw0xxdG460j4FtYIZupIqL1593
         oOhw==
X-Gm-Message-State: AOAM530m4m0SU1m45YDPyltymtEAF6tFdxJn+bGS2iQXM+oDSs4wu3LN
	7YmpP6+Qaje/KZowd68CBT1nTqyWK0OPgqkl
X-Google-Smtp-Source: 
 ABdhPJzCqHk7FZqgZPJokjrAJFuQsdlG3/sHwcBrDaMfwSsRJj8n886u9wg6/YmB6kHmg5juKRoLlA==
X-Received: by 2002:a63:cd41:0:b0:3c5:1242:3a0d with SMTP id
 a1-20020a63cd41000000b003c512423a0dmr17128052pgj.266.1652193568407;
        Tue, 10 May 2022 07:39:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/40] linux-yocto: enable powerpc debug fragment
Date: Tue, 10 May 2022 04:37:01 -1000
Message-Id: 
 <b52d50e00d00df3a3a8263a6b5ef04e22a9c93fb.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165439

From: Bruce Ashfield <bruce.ashfield@gmail.com>

gcc12 generates some warnings with arch/powerpc, and we know that
these warnings are understood/non-fatal at runtime.

This fragment allows testing to continue, while upstream powerpc
looks at removing warnings.

We only enable it for 5.10/5.15 standard kernels for now, since
this gets us enough coverage to continue working with gcc12.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 992d9d41642981152a387fe59733cc6a77ea3528)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 4 +++-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 4 +++-
 6 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3048a3e66b..4c55a27abf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "bd6e7290bc766ef13e42a1e37f75e6e708b4e317"
-SRCREV_meta ?= "2311a54750b6d9e0315e4f316b640e4e73945342"
+SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 5cc1bdbff9..d3d277b172 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "21f94b6c9601dbb03036d539482471ddbe753626"
-SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
+SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d37d39488e..42d5c105b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "ab911ca906ec6d1551ba12373d4133ccaf7f83cc"
 SRCREV_machine ?= "aadc46b05e5c77328bd3461578c770af3efa8944"
-SRCREV_meta ?= "2311a54750b6d9e0315e4f316b640e4e73945342"
+SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 9c9d513f83..afb330e922 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2521f8951adffad70d844209b73cd8d8878710f1"
-SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
+SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 19ac04ae48..b60f3e0773 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
 SRCREV_machine:qemux86-64 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
 SRCREV_machine:qemumips64 ?= "a005c07acd278c86ddab4cd8bc7a1bfae4638414"
 SRCREV_machine ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
-SRCREV_meta ?= "2311a54750b6d9e0315e4f316b640e4e73945342"
+SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
@@ -50,6 +50,8 @@ KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d9b09660c2..bf4ea952cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
 SRCREV_machine:qemux86-64 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
 SRCREV_machine:qemumips64 ?= "0294ba0989f839fb11c41fb887707cb49d20143e"
 SRCREV_machine ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_meta ?= "178b786485dfb3edb05af51f0ba9195ffa07e358"
+SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -62,6 +62,8 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
+KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
 
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
 
-- 
2.25.1


