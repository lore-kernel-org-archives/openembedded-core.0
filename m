Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF66C54E5E
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 23:37:43 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.8651.1709854662267295067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 15:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1q9ccCiw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dd0d46ecc3so11624935ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709854661; x=1710459461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVpn6u1B0CQnaFBkCc6KUWt1ZjSvG3WU2hGfSyDHGjw=;
        b=1q9ccCiwSwez+Xjfe4aLvOtuCwYhOvDZWp/aniXn0LAJYumDAab/h4Gckr+Wwv73Cx
         /pOXEmJU6o5a1lGw+JowHxwcllEEiCzXZJdHBabeREX9qI8SfzhsA/OjLUlNfHXUNPbV
         GanRfyr+aUkDQMxKJjhtBssfP/OW4oPMGuYWmClXPd1WCoBcZ66yySb2ly0qRZQQ19zV
         ElavfUlrTqTnZjKBXTGPSgtMqPVtoxghl/YwzEmNOm6O9Watdyf/V8ITQtCeBiHkW02O
         Ca/Yydi4tcw8gmt7foCeIuFJ8GwCRwalKMF2N324oiCNMaai+NXQ6F1JGWXRqV1ere+p
         /Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709854661; x=1710459461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVpn6u1B0CQnaFBkCc6KUWt1ZjSvG3WU2hGfSyDHGjw=;
        b=NPsmr1WJIuY+IqJdVy3mzI6fyE6KDH351KkVZ+6zsI5pLaWHlNb2l2BWqHZuouiZBB
         5GiXY85i3sbux80moZzNmI7oTbReYEcGUuFUwWUb47A1eykSJzzoc+aRCZIXQ3TXwljS
         pASU3aP4mAzggVhYB09VeDCmU9mFLPsSSU5pBw5D9Mu5os7ZhSjMcHAcC+qhAaUukd6e
         FeQDwz4W2EFBre9rxsHFR3bD6JNh3R/tK2i1UeFb2B3ZOtkRaSCbzGEbpB05qPxhR9Wp
         6SxLD7aFWYL2dTG89lf24R7rhRHgQlphPHsVCaEHXVfo0BnTQRY/jJeJjJvN3H7NTNY3
         hWYQ==
X-Gm-Message-State: AOJu0YxVzPX/nd0SRBjFp4UZm+rryQ+ekdagdQtcuX64hdCzWtRoQShK
	IFrazcIn/3i/Et+uqaMW7dHf9UNcY7VYLtcbs7Za+x1HSgIFDxusiBHLFALhrB4Y2fAZVz+N/6S
	MoaA=
X-Google-Smtp-Source: AGHT+IHZWFJoS3Do/o4iX7JBQ0UshDNqV4Lzl+CAp6mAwqV/RWkRWCG5e8gX+qHkX5mCG/dp/shwkQ==
X-Received: by 2002:a17:902:a582:b0:1db:e7a7:63f4 with SMTP id az2-20020a170902a58200b001dbe7a763f4mr9507730plb.19.1709854661563;
        Thu, 07 Mar 2024 15:37:41 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h18-20020a170902f7d200b001dd526ff7d2sm1933243plw.308.2024.03.07.15.37.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:37:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/9] Revert "linux-yocto/5.15: update to v5.15.146"
Date: Thu,  7 Mar 2024 13:37:18 -1000
Message-Id: <bb69d4b78838a719c91ef6da38b1addca9d32820.1709853987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709853987.git.steve@sakoman.com>
References: <cover.1709853987.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 23:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196833

This series is causing issues with adding and resizing partitions.

This reverts commit ee4695138e36155c8e0b173f7952372693c0589a.
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 1e61698222..4f02e5acfa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "daa620f017a02ae381f1e54be7ceb8a2f3e3caee"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine ?= "cf2f74df4ffdee7034979616bc37c5717b0d6070"
+SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.145"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c7c4e09bd9..037c33f434 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.145"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aade2fc343af128889d6c6f1071ec1a8e9a548a8"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine ?= "3b30ca7fb1716cd0f7bbf16c1253d8a4bbdeb421"
+SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index ef8c18b1b2..0cb559b162 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f59d00a628c3ddb39052284a4a7bd54f9ee12999"
-SRCREV_machine:qemuarm64 ?= "8b10556d4fd67dec1a16252ef0d3058dfe31dff5"
-SRCREV_machine:qemumips ?= "b0c8aefa7811fd3b7cebb25c1565f73523c7b2ac"
-SRCREV_machine:qemuppc ?= "0ebd785a8436934e3f3e6dea6506de7f7ed9947e"
-SRCREV_machine:qemuriscv64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemuriscv32 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemux86 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemux86-64 ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_machine:qemumips64 ?= "187d249255a797c470b0680f28e18a17a05c3bb4"
-SRCREV_machine ?= "ea4d6bb2c229f41b49dc8a8a9cdcd6d7e55dc46f"
-SRCREV_meta ?= "be429ba6790683eae6d1c34d527af29890988c25"
+SRCREV_machine:qemuarm ?= "5b261b61614c090b787fdadb865c5db3ee0171f4"
+SRCREV_machine:qemuarm64 ?= "fdaf870c63fc887b40138cca652ae961c9556a95"
+SRCREV_machine:qemumips ?= "8a07b5a788879035d1eea4df0780a40d131cf5d9"
+SRCREV_machine:qemuppc ?= "fffda6901d92bf63f7876cb6d912492030995588"
+SRCREV_machine:qemuriscv64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemuriscv32 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemux86 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemux86-64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemumips64 ?= "510f5a0a3daaf9f970b610a427f77c52289a2777"
+SRCREV_machine ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "26c690eff0a56293e0b6911a38e406c211b35547"
+SRCREV_machine:class-devupstream ?= "d93fa2c78854d25ed4b67ac87f1c3c264d8b27fb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.146"
+LINUX_VERSION ?= "5.15.145"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


