Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E916DC61DB3
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 00:39:24 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.59747.1673224745715929993
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 16:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OAYwLKYZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id p17so5232901qvn.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 16:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmFrcB0osI5ziw1C34dyOofG8W0wM3D6DMK3k5vwJ6c=;
        b=OAYwLKYZkMpDmO0NbqbXXztmTxsm633jLdHVYqOKVvhuBBwG52LmUpQp8vG++9L+TQ
         IWhahkl4fix6ALB+ABTRvRjco7vUCmQJHauxEN9rbadZI2XE/LbnvYFS0JgOLfSGavQY
         8r8ballkfodL24WrU/Pa8vXNan1FxyaphpHIsTb8lDkHJ1QeUCAyIvh9B+FxjreoPUHu
         j/BmQdIIJQcIHfRyiXtspjPPhx6Fsxfgp5AhYL+Tc8KWPuQpvR1iTOknGC2E3pu/RRyX
         uBf2PUzT2Oo0iDD6z+Z7wAYHLTV//PAuV3opdGoZ2C83+wmD2KwqhUQGW3oy13tEQzYw
         aezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmFrcB0osI5ziw1C34dyOofG8W0wM3D6DMK3k5vwJ6c=;
        b=kDkDEt+lqBG3blBEsn5/SHYZD1mpxBL1ezqRTEblktOUmyVB2BXqu+hghh6yRhNwKl
         9hbl3GN+/hqJxVgJVn932KZ1bmAkcCHwX148xP+CbhKDuCKkpqZK3AhftxNet6NCdCLk
         yEAMjXdeM/+rPLoFsJaZ3drizL6jxrWQCWfuV9sF2EFul4JZ31AyLR94VnKA1wQKgRBg
         xtk1WrQYERj8+jbnGokk4GR6MTETfUKmZLHnBD2XQyyq+9peSRUmOMotFbOOSzfsmMSJ
         blzI8E9Aejgg91/wwYEf2qQiTb69Nt+dX3eadJvN1B5mqCZ05N0Xl1rs37gsQiJHkFwC
         xkCQ==
X-Gm-Message-State: AFqh2koOkMswRoD5zbCR6x0iEsIl3Ta1ku6z31qoZUje8PPmBZ7kBV0p
	C9usfLtFOIJ1llaIO2m6cNoGh5yTfZB1hw==
X-Google-Smtp-Source: AMrXdXvDypvuqNE0UHe/5jkckV0QBcfIVX9MbuaHPboAK9pRvy4hPWIjTYijrEf1ieP+GqWHPBllNQ==
X-Received: by 2002:a05:6214:4c03:b0:531:7593:f559 with SMTP id qh3-20020a0562144c0300b005317593f559mr69850271qvb.13.1673224756944;
        Sun, 08 Jan 2023 16:39:16 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i1-20020a05620a248100b006fc9fe67e34sm4529980qkn.81.2023.01.08.16.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:39:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/14] linux-yocto/5.19: powerpc: Fix reschedule bug in KUAP-unlocked user copy
Date: Sun,  8 Jan 2023 19:38:59 -0500
Message-Id: <8a8329155b9bf9d0285361ce291db225f6cd8a18.1673224444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 00:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175653

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.19:

    84f2f8e7a625 powerpc: Fix reschedule bug in KUAP-unlocked user copy

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.19.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 20 +++++++++----------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
index 8fb4a6b665..f4d205e613 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8385624e99ac8f15de12a2253e8537dd25fbb082"
+SRCREV_machine ?= "3101c367eab8952721086b545ad37c301b2a7452"
 SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
index 92214b4d90..95a8a46bbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.19.bb
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
 SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
index 2462f5cac3..5baa0c1130 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.19/standard/base"
 KBRANCH:qemux86-64 ?= "v5.19/standard/base"
 KBRANCH:qemumips64 ?= "v5.19/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6a3ad6f786482c60fa0619935fe48dbb44673084"
-SRCREV_machine:qemuarm64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemumips ?= "6722056dc4ccc7ccb7ca6a9d3dd840031c83d66d"
-SRCREV_machine:qemuppc ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemuriscv64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemuriscv32 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemux86 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemux86-64 ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
-SRCREV_machine:qemumips64 ?= "d5bdf10616a90465afaef449feeaf31a51748220"
-SRCREV_machine ?= "3326dff489c84262dc81b7e96cae4c359cab38b2"
+SRCREV_machine:qemuarm ?= "f30404d233fc4cc461a0800fd635f4e9650a20a5"
+SRCREV_machine:qemuarm64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemumips ?= "ceaf2134635845794c24b750f15004096a597256"
+SRCREV_machine:qemuppc ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemuriscv64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemuriscv32 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemux86 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemux86-64 ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
+SRCREV_machine:qemumips64 ?= "acf9ebb1e7d1ceb61a89ec33ca4cc3613287630b"
+SRCREV_machine ?= "84f2f8e7a625aae0fa9e7027a2e774b99b646cf7"
 SRCREV_meta ?= "239a6c0d3c3b046971909f1e066380465b0c331d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


