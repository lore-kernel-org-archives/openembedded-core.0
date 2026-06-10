Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E41CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 16:50:22 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25471.1781110218469637760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 09:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=siDUbUdz;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5177b9a02bdso97525141cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781110217; x=1781715017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV8YosCI+4MWR7QV+NGj/IM7mWXtFkvUOtfq8A0or+w=;
        b=siDUbUdzXpMVPimq5ffNhgC8xgD8ZbmEAcDx5VNe9/XXp5FfFZOp2fWZX5hGtfG70C
         VqA6pw+RAw5MUgjPuMfUbHbOjFuWLgd5JCv7oNWbFNh03YyJRGBsYLe4yxn8IDOavsqV
         5UFaJRFJ0h3WlZvzPuw2gLcRZPpN7mwWr46LB+LIB1RQeycCQAZAng15nkj4D8xqIR/i
         LxzHRSIEFPuxvCBaeep49S7rdyxQhw8rcFPUJJf9xp3lY95EdyK8JuR0xE6Fge+9TJf3
         eKIl/vgzoeju2WDPsBnQ1or6qhU10tdDH8LQcwM5ZPn5wYLT4iOJq+02zAeFSRzYTlAQ
         K2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110217; x=1781715017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yV8YosCI+4MWR7QV+NGj/IM7mWXtFkvUOtfq8A0or+w=;
        b=QX5uZOa3D8BXZ5d7CkwbkFpIuNLYYy6PAPe305QoTmXgBWVf3KduqVl4U4nZiUm4TO
         jShMdU4Yg9r4eYtRnRdJ8i9o+JOv1mXXp2zFlRwqxJMnPMGccalUhBJnkLhdzw5QUnYS
         XTSPCG8o2eNZ192bHaH/yrxKL6sStOMl9HZVJUWNfnSiPBsaFG6ogKYaP4jVbD5o+u6M
         zMVo5sxFffKvcn9WNa6X/cDlcU4+5pFNGAySJyYNlEGF0Yi0oLV5FqSpJshj9CeH5lCj
         5yvmHaRjMjx/NhilHDFQrGi5gnY3iHv2sYFbYQE0ul+pg0U49mPwvrjg+HVfQoSCYcvc
         4D+w==
X-Gm-Message-State: AOJu0Yzg8lBmByQCVOIZUOlZOXHJ1raXqId3GHi395m280zLS9dvyK31
	2REJevIti6SS1urgKf16dfOiVnc6PRhJXBj2nXrNu530CQpV8It/PgNo6dyUOfiS
X-Gm-Gg: Acq92OFYIg1gFwowp0uUXAnpCZiUgFZ32g/AdHBRXHp7jrhqr6VAUsjJxtHwBUoDlYw
	9Ghdx7PUT9owkWdq1X0UssilehfSznZx6kCGew+rE0+1zle963AH2vBCIEVj7Na9buIKp8f/tbA
	yQvxwrQrhZuLeQhNZah+hFosf+ykU6LCqGolzXETQyDc7ziZL8GDd5+VeREOP0E08EPnUBbjHVT
	ng1PNai6a6ZWTZ9JNX2c5zMPEJ+soiZi8HPDJO+8KYedhzknolewlUfVYp+0aM78OV/VND0C9oU
	yKplydzAp7HjpI4IJ2zGTp4fOlRHp+LzL/CxlQWbtdNIp6CcPT4s+/xX1mms9IA/O8uR1Y2Vsmz
	DvU/PWKmizG5NAOiaAzHvceUCCJCYP4DNebnnnWv1c2gWXtODa4Gpmj/FkYRE8Z735MXdrZyyy2
	AEYPN9nsYVRvq8NHOD9Su+48A6wxlyJ7T/MBeBYXV++OG/SbS4zrnesf/F+JJNgI5uCUmTXc4bn
	XL6bm62qPfc+L7dpAD249T+89qpvkpSnxyosDyliGVBLXo+qYbMk/5t4eMdQkpLN69hqpq22M2z
	i6IoJAWBUIrmkmgfJsBNWwo1v0IhekLI+CWaLzmn/Oqjf4BovOcVxbs=
X-Received: by 2002:a05:622a:15d4:b0:517:d869:4270 with SMTP id d75a77b69052e-517d8694c08mr106714111cf.26.1781110217250;
        Wed, 10 Jun 2026 09:50:17 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb915csm241444346d6.14.2026.06.10.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:50:16 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 07/11] linux-yocto/6.6: update to v6.6.137
Date: Wed, 10 Jun 2026 12:50:04 -0400
Message-ID: <20260610165008.1870552-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 16:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238383

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    258cf62a6dfde Linux 6.6.137
    4b4defd2fce3f Buffer overflow in drivers/xen/sys-hypervisor.c
    402d84ad9e89b xen/privcmd: fix double free via VMA splitting
    710a4ce5d7afd crypto: af_alg - Fix page reassignment overflow in af_alg_pull_tsgl
    3ef530ef5585f crypto: authencesn - Fix src offset when decrypting in-place
    d0c4ff6812386 crypto: authencesn - Do not place hiseq at end of dst for out-of-place decryption
    60c798725c966 crypto: authenc - use memcpy_sglist() instead of null skcipher
    c2138c9bd02af crypto: algif_aead - snapshot IV for async AEAD requests
    3115af9644c34 crypto: algif_aead - Revert to operating out-of-place
    dbea57c08acfc crypto: algif_aead - use memcpy_sglist() instead of null skcipher
    9ec26b5d193c9 crypto: scatterwalk - Backport memcpy_sglist()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 22af5c2a99..bbcf3122ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "99c037f00af27169304f268e388fa3fc65688633"
-SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
+SRCREV_machine ?= "da5f16c9d10d53af703c809e864c09df336edfb7"
+SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.136"
+LINUX_VERSION ?= "6.6.137"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1153249b8d..c5c6f88781 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.136"
+LINUX_VERSION ?= "6.6.137"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4aa4f6df28cc4541355f39ce0c40237408690c14"
-SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
+SRCREV_machine ?= "cd2288c19d6b729b3c7b2b620eb9c311116c72f1"
+SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index f2307dd6e0..358b6a7760 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9d8556efa4dbd3ee1cfac4af6426a8476637fcef"
-SRCREV_machine:qemuarm64 ?= "aaa7c5002cfdf0f46dcf9239f3074aee1e29741d"
-SRCREV_machine:qemuloongarch64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemumips ?= "d9adf59334edff1b09b883ea5717895e9735aa13"
-SRCREV_machine:qemuppc ?= "52b968d255a67240a548e64e784d3f5269ca3894"
-SRCREV_machine:qemuriscv64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemuriscv32 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemux86 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemux86-64 ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_machine:qemumips64 ?= "746738b15a00d5d36105d09ea0f259f44be48ad5"
-SRCREV_machine ?= "59f5af18d31e596ec928a48848bd837d53e06c26"
-SRCREV_meta ?= "b162eec5fa39c4658181073e741efe3a9d498454"
+SRCREV_machine:qemuarm ?= "eb708bdc972fc5dc22cdcbf3d3dbdb81e1450fd9"
+SRCREV_machine:qemuarm64 ?= "eafa49201e224e87ad20cf849dead88aec204e68"
+SRCREV_machine:qemuloongarch64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemumips ?= "b75949027e1e8c8c90998ee144c6b97aa2fbf561"
+SRCREV_machine:qemuppc ?= "1b302e1b1463e28dd8d446754cc3140e935ceec6"
+SRCREV_machine:qemuriscv64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemuriscv32 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemux86 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemux86-64 ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_machine:qemumips64 ?= "620abbeb29fcd44655d2de94ae7a7fff7656ed01"
+SRCREV_machine ?= "f14907570fc0bb7285c62bc9d5146180bafffbae"
+SRCREV_meta ?= "7d4cafa710da4e27a86cb015e50d91cf458af06f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "142cd8382222d9b135e0029da6830e5e30444d34"
+SRCREV_machine:class-devupstream ?= "258cf62a6dfde3c6a39d120a56a298f2ed6a8901"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.136"
+LINUX_VERSION ?= "6.6.137"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


