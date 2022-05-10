Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473AFC4332F
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:35 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.10809.1652193572231192168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o6CaSxoi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2325099pjm.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1WrYlpOfDCLZxAubr5Y2q3ApqAfCV8A6PaqWZ5ymrNM=;
        b=o6CaSxoiyQF1wBYawiXcAfLJSRcsvhzFtvw0/RVYzAW9V5D2JolUwS53LZUyzXaPQq
         dQHpnqRKWYyvvUxw8maS2uvaArzLZrRq7hMAO8wg0eXvbVLyqEq23daIdg2O0Qs9tIsc
         +iIpfqAvJvfH7gfDpoOErgx98ryOOhidZcU6FX/FZ7MmNegTjY29EPQt96C51EYl3/tc
         7Mda9PwBsr69PjqtwUCbsVKS0FIXWMZDc7+qf6UUBckQk+bHnVxjnKK038zWymxTqCNc
         Pf2MbOKEIYWGd3LTp/cz9jRgiKk/1RVvsnmxBsGVoc824ogoltMvO5iFXt5HnxY5uWAH
         AkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1WrYlpOfDCLZxAubr5Y2q3ApqAfCV8A6PaqWZ5ymrNM=;
        b=y08HoOsMmoPM+brATdeBkPV8Rht8CwC9RtNzOzZpcmuqIuwjx7XBoV51eRHLvSMyEq
         FzU5ci/y2Tqudfltvd6n9kTnYr0MNKESg60NXrjec9f7hgpK7blptaAgsmGa0DuHI1dc
         lIRPjQOvPYGEcO3nw4mrFlLwuHWoV3azW/vz4sbt4I+PPZNdr4LzS/EdUUv4Ogm/yeSR
         DMVQSDxd7OovPh7JQeyx5k9TGiUkfM/xkQLJEDZ0cYEMxUi0uCh5cFFN3OXsQNCLCVZG
         Z5WTVlCh9b+P+JkzlgGCz4B8ikSiXxjk039ScSA+bwIU/ydMZSkhsZcCXX+ppgZyo+Pu
         zOhw==
X-Gm-Message-State: AOAM533ZnpeVD97yMPiMAN8Y2VdqiwhDCEtgmUGpU2eaFkOgne8aR19u
	Al3Kdy+1a9x0c/vL5MIN4XpyZmDFd4jZ5jpQ
X-Google-Smtp-Source: 
 ABdhPJxvZk9PCn14h+YIg0fCKv5DAm0zJi9eKgis+r+nPQOhYoON6uh7ejsZdE2qEk0iTjvXALL2Fg==
X-Received: by 2002:a17:903:2310:b0:15e:bc9c:18b9 with SMTP id
 d16-20020a170903231000b0015ebc9c18b9mr21458930plh.58.1652193571097;
        Tue, 10 May 2022 07:39:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/40] linux-yocto/5.15: fix -standard kernel
 build issue
Date: Tue, 10 May 2022 04:37:02 -1000
Message-Id: 
 <f648a6b4a4f5c4e99ea93e802b2ca7284f52f72d.1652192957.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/165440

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""

The revert of commit [fbdev: Hot-unplug firmware fb devices on forced
removal] was done to fix powerpc fbdev issues. Upstream went in a
different direction, which means that our fbdev routines have conflicts
with -stable updates.

The fix for the fbdev is in -stable, so we drob our reverted commit,
such that 5.15 builds again, and fbdev is functional.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6da0cde02dd6a315a7eb34cb0bc691cf622eba05)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 22 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d3d277b172..fe1c7fb533 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "21f94b6c9601dbb03036d539482471ddbe753626"
-SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
+SRCREV_machine ?= "4648820c6ca4146a3dbb4eb6a5b4ac93401f9596"
+SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index afb330e922..3f4509c921 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2521f8951adffad70d844209b73cd8d8878710f1"
-SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
+SRCREV_machine ?= "7505af5d55038e463bf45794603b6efabb655817"
+SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index bf4ea952cf..02b16b5f25 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5dab48a9c4bb681646b06004bc081cc5b4e65285"
-SRCREV_machine:qemuarm64 ?= "fc0cae7371697d26cda76f46d352648a0d8a8fd8"
-SRCREV_machine:qemumips ?= "58617a04ab52b58a5393b5088a3199c3d28b7a15"
-SRCREV_machine:qemuppc ?= "fdf86234f2a35c3fe2457ee02847b4351fdeb08b"
-SRCREV_machine:qemuriscv64 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemuriscv32 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemux86 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemux86-64 ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_machine:qemumips64 ?= "0294ba0989f839fb11c41fb887707cb49d20143e"
-SRCREV_machine ?= "5df6d1b00f95b5bce43bb208b87b182b0656dfed"
-SRCREV_meta ?= "7e73214eee6728b7984d12bead8ad3af2ce06db9"
+SRCREV_machine:qemuarm ?= "2d10943aa7855dc5bbe2c74c6f05ef2e4eb39e3a"
+SRCREV_machine:qemuarm64 ?= "b623e8d1eaacbeee250ea37328a9b566ca52f890"
+SRCREV_machine:qemumips ?= "7e897b81f922149be5edaab68eb8034a75899ce7"
+SRCREV_machine:qemuppc ?= "c3db8eb7b0a5b171ac4c0c6def487b5572a7b3f9"
+SRCREV_machine:qemuriscv64 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemuriscv32 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemux86 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemux86-64 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_machine:qemumips64 ?= "9868746e0736d8659374e93129cca9d3413a7918"
+SRCREV_machine ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
+SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.25.1


