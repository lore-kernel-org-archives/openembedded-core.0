Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472C0C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.8463.1709854664005919833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YCYeQtNt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d944e8f367so12774725ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854663; x=1710459463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgMmABkllbv9nnld9Xl599kOuyLJHdMTITtxV10sQGk=;
        b=YCYeQtNtPZrtF3kuiPTEFpJ/rGA9SB/Ilwjt8SYvP+aTbgCZFwwtwlncC32yr9+1Yw
         qTfmjr47ty3ZebM6yNFJ45mLhXb4kb3YnGH6uXazoJ+p0toA7dmb6CBsLUjkDY3//cJn
         V7USxo2/6YXLj8Lh7Gda9hcf5Y8IS17Rq6DGMl1NM/pv/ybMxR2XlE2wYnvi9qqNW9hm
         5cco+liWAH/NHtlsktCdhP1AqqhCGQbehdkRcLuvzIxms9K3PxLSCI5Kf3mieRnYEXds
         ZizM2k0bQWJxtRXCJzX7vTmr4xseyDWAuUxLHkKv74qupaFiVJ5J1LYta3X8qhwKaWac
         3K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854663; x=1710459463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgMmABkllbv9nnld9Xl599kOuyLJHdMTITtxV10sQGk=;
        b=o1QB9ceLqiWW66NJuYCkQNswTCYq0gP2zIZ4bJpDViBHfUGPF5OofJm1SCqm+rg8n4
         Xu2t1+Q2BzScmcdSxGkqt5uxuKHa2hTjBuyPULnwRH0WpsKYAbl+jwt0BjuJkJWS7630
         B4mRjnXtDYn7wvihpNdkay6JOQ2Q+H0+jlB3NtGLU1h1RfJxRmz1fRFacmc4Ut18FLkP
         dMxjKEMICfFSsjFE3Dm9JFzpQtlZwlnM9clEXfhxzeLj9XEuHR5eR4fVbzXwZzKEal5w
         ibsI2sMhxpnrxp18+xOmkZP0+GprkhCm6c8a3TJQDRFoFcQx5mle0eTmOM5z1REqQpfg
         pVbw==
X-Gm-Message-State: AOJu0YyGpms6QtNIaFUysFesVTPJ1Q+9ulETPcibHyIqDscPX1YtB3Uf
	B88YHJXNMU7KHaN9F4Is4yGbLq8W9vlHwkDMMDbHlmCR8PUf6mRlGUutATcWuCsKxANvCcU3d7L
	jQ0U=
X-Google-Smtp-Source: AGHT+IEH7BNcKt5ziYkrzMoMkhO4JId+J8Z0/i3te0la/FKQvUCuZZ04A6obnp3gLbz+sinD6HZS2g==
X-Received: by 2002:a17:902:684d:b0:1dd:6899:397a with SMTP id f13-20020a170902684d00b001dd6899397amr274242pln.64.1709854663139;
        Thu, 07 Mar 2024 15:37:43 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] Revert "linux-yocto/5.15: update to v5.15.145"
Date: Thu,  7 Mar 2024 13:37:19 -1000
Message-Id: <8f43a73efedaf1256d5f277d5d066bf11ada74df.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196834

This series is causing issues with adding and resizing partitions.

This reverts commit 03794866c1333113c909ef88dc232bcc47a7c459.
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4f02e5acfa..37fb729e0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cf2f74df4ffdee7034979616bc37c5717b0d6070"
-SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
+SRCREV_machine ?= "205938506aafa86698f2753a59d2c9f13d080fbb"
+SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.145"
+LINUX_VERSION ?= "5.15.142"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 037c33f434..f502030c9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.145"
+LINUX_VERSION ?= "5.15.142"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3b30ca7fb1716cd0f7bbf16c1253d8a4bbdeb421"
-SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
+SRCREV_machine ?= "53b8058476d634a0103dff993e24d15b1fd087c7"
+SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0cb559b162..1021065bf7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5b261b61614c090b787fdadb865c5db3ee0171f4"
-SRCREV_machine:qemuarm64 ?= "fdaf870c63fc887b40138cca652ae961c9556a95"
-SRCREV_machine:qemumips ?= "8a07b5a788879035d1eea4df0780a40d131cf5d9"
-SRCREV_machine:qemuppc ?= "fffda6901d92bf63f7876cb6d912492030995588"
-SRCREV_machine:qemuriscv64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemuriscv32 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemux86 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemux86-64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_machine:qemumips64 ?= "510f5a0a3daaf9f970b610a427f77c52289a2777"
-SRCREV_machine ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
-SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
+SRCREV_machine:qemuarm ?= "325679bc1a595ca81783f7652e13ce7f2be58620"
+SRCREV_machine:qemuarm64 ?= "338f086bcd841a5b0239ddb66c34ca23ff5af2f5"
+SRCREV_machine:qemumips ?= "af26192f4dd0fc7396faedd4653034ae02d5ed6d"
+SRCREV_machine:qemuppc ?= "be567407d4d9009407c4e7a511e7227fcb36b0b7"
+SRCREV_machine:qemuriscv64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemuriscv32 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemux86 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemux86-64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_machine:qemumips64 ?= "3a2ff5c2f2e6e0c0653da1192081681e2a50b592"
+SRCREV_machine ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
+SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d93fa2c78854d25ed4b67ac87f1c3c264d8b27fb"
+SRCREV_machine:class-devupstream ?= "8a1d809b05454b2e08fb3d801787917975fdb037"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.145"
+LINUX_VERSION ?= "5.15.142"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


