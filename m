Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1766C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:59 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1281.1693417738417359660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J0+IY4Wr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so4647216b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417737; x=1694022537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJNUleVWv4ooJidtzV9vu734MtgDFua/ic81b7rHseA=;
        b=J0+IY4Wrykr/TrhkpM9WejgLBAP//daY0U/GMdpaPx642aPigALpQPF7GMGR1EhyEH
         o780cHADpAHvusJDw4nTqMd1+RJpgQ9lbgry7ulga8EwY1VqKY8hX2buUcWk2FhVcExo
         HNoKch9qMHqImpcvzYk9/spKAsgE9hHGv0R38prI2C1gr+5GV5o6AqTD9uFdg5QqeC63
         7pzuJR88HcKphYX05HhRaOYWiBdAie9fOVneoW9m6Y29Hcp7wAc7T+1fr+47hNeaX55J
         OpHXsksJl00qTCvpsCN2kOvjzlydni+Iw3+Zp13+ht2J52AL9WwNNsCl6JlIUeFxtsHJ
         xDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417737; x=1694022537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJNUleVWv4ooJidtzV9vu734MtgDFua/ic81b7rHseA=;
        b=HhzsVULOel1ZGlKza9uEj0LIul2zxSSFo5JIj2Jn8469y/f+Y58lNzIIHQiUiIevWX
         mgygixgy8gy45Zw6KSl9RSITrrkLGAYlwILXFacacc1JT88m6U736Whwq0CTue+clrOJ
         eFDtA/9Q02q1eXSQ6zTvelu9GK3k7VHPF7Ws4q6mMZTPf+C0MkdPqBWcKmez4qrR+iq/
         AMudUQ/siIt7yaT3uvnn7UwKxprjGxePzy6xNRWad+j9smJx9QUKjcgmna4YA1ataJ6N
         n7itTF3S1MHR/Zwr5bQrvjrlIYYnMhyjcjXo/p+BM8W45nkKZQd8iGLPhRYIOkW5fVJo
         ZaoA==
X-Gm-Message-State: AOJu0Yyf3KQP0KNePXP5myFT3boUJNAbdfVoptA8emVf0k2PzQopMmoi
	u7nAcRqlxBVKGEncEfoVKS3T/yovF8hbxe/ypfQ=
X-Google-Smtp-Source: AGHT+IERzv2UmrQHM+ylXh+DmZYI4I3/+3a+gZJ3koZQwIPUUG81yVUnPJV8YpNTAfXl2w3gIHYf8g==
X-Received: by 2002:a05:6a21:329d:b0:135:7975:f55 with SMTP id yt29-20020a056a21329d00b0013579750f55mr3438812pzb.47.1693417737493;
        Wed, 30 Aug 2023 10:48:57 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/20] linux-yocto/6.1: fix IRQ-80 warnings
Date: Wed, 30 Aug 2023 07:48:16 -1000
Message-Id: <bbacef1339cc9aeee77ec4192ade19c5c7d73d14.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186914

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.1:

    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT

Paul Gortmaker has found and fixed the root cause of why we are
getting "softirq work is pending" messages on boot with -rt ..
although the issue is not rt-specific.

The fix has been submitted to lkml, but we are integrating it
to avoid the delay of -stable picking it up and then linux-yocto
doing the same.

(From OE-Core rev: 69fffaa7ed863f8811254843e169cfbf3a0400b0)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2099b728c48d920aa3914f4297563105a672e174)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.1.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 0c211dbb72..d13722b32f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3d4b5681aeedac4a5129dd50e12afbda86cad699"
+SRCREV_machine ?= "9d355978d3a95f5c190a21d95ebb2a5d0e638537"
 SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 5b58466774..a77bd9d183 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 57d4f457b9..df477b7dee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,17 +17,17 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bafadaeb59cfe58562e6c6f5b98d9aa2ebb41cae"
-SRCREV_machine:qemuarm64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemuloongarch64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemumips ?= "858e92d1f51930ba57f4cd9013c094da15d4ac65"
-SRCREV_machine:qemuppc ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemuriscv64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemuriscv32 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemux86 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemux86-64 ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
-SRCREV_machine:qemumips64 ?= "41bf8e89bdd29252ee75fe6c8ad0ac65bf2b7bca"
-SRCREV_machine ?= "c9eb757606ff01586272deee463b8d27fcb3cccc"
+SRCREV_machine:qemuarm ?= "4e49d63e747e81aebad5ce6091ba6de09f09d46f"
+SRCREV_machine:qemuarm64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemuloongarch64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemumips ?= "e527feb9cd8acbcbcd7115f51cf71166fdbce11a"
+SRCREV_machine:qemuppc ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemuriscv64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemuriscv32 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemux86 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemux86-64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
+SRCREV_machine:qemumips64 ?= "296b096f4c747e4c4b31b1708fc8a0acb1dac04e"
+SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
 SRCREV_meta ?= "295d37e268bc02070da670e46456227bee38795b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.34.1


