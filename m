Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51CAC43217
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:48:27 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.10762.1651153704382202189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LrmneUXd;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id kj18so3223105qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SJkLd9+ZZ+o3IKGbiQaynXMgLCaTnQhIS6Hd+uAFVpY=;
        b=LrmneUXdjzggEMlt1ItJwTyBZsFNpuSkmlqcsnw8lg65aVVpqBliOxCS72XIC9uYee
         6cXTICKOwcV3b53to7uB03NC7Qe2f9hOSPcCPCCCnylBEoB78Phe25g1ly7gOP0+AcyE
         dFMZ8oSs+Zw4y2vvG68OcreH3I8GlMhik+kKcEaW9Md/EgofJa0usYNURR4Ywq43GPNs
         /7oVGEGrmSpCRfWUb5OR+z3oV69UPWmMJNRFuABTcbDmmQo6snQ4fA1ujFU13QZ5Lj57
         GMtovpkm+O/PLD3wkzcn5GCh4fjd9i9dE/qdwFEfDSIrynwn47oW43DTnOIyvyUCKSLV
         mvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SJkLd9+ZZ+o3IKGbiQaynXMgLCaTnQhIS6Hd+uAFVpY=;
        b=RIFRAJ6mANnwNYi3hIUkvwlQz1nTUd3taw2PJisENcyZsm7DuDJk4sBfRrFV92xV2R
         CWxClTV0THpdDOcLU3SEm4KFE21NArzIfktP5bXjro59nEipv56QeNL5Lyx66OJZObRZ
         KOupHElLhDFgR3ugMvrt1zxRrlPilqo8I0Q8VVDQynsFM2eAFy5XJ6w5CshNE2gTtvFY
         jtWTZFviSXipFdPTbYUNIzj2goHqg4OxvoINGTDCoAYF+hOOb3MQsz8q0UBTRKerb9FX
         b1COhlRl5/xEdS7dRhmRjE28D78uk2wSWYblBQmIiOjtcpPB6+o6poeg1IyKgX4uUloM
         IrMA==
X-Gm-Message-State: AOAM533Dfrl6I5Ynsq1xd0mo2JdVzt1JxlPtdJIRIz+629J1gXciWC55
	pD9q2XAy6lTjNdD72aqe11k=
X-Google-Smtp-Source: 
 ABdhPJzIfqAh9LwDZiJQFcXa8FbpCh3qDwKPwWjj+Rct6lNyOyKCnAK5/fmOnaSWBO0UIXfp/z16VA==
X-Received: by 2002:a05:6214:21c1:b0:450:5583:6596 with SMTP id
 d1-20020a05621421c100b0045055836596mr24142419qvh.15.1651153703443;
        Thu, 28 Apr 2022 06:48:23 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm20809qtb.48.2022.04.28.06.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 06:48:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com,
	jdmason@kudzu.us
Subject: [PATCH 13/15] linux-yocto: enable powerpc debug fragment
Date: Thu, 28 Apr 2022 09:47:59 -0400
Message-Id: 
 <10bf9e284e68bd75db8925de870acd4e71b204e5.1651153370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1651153370.git.bruce.ashfield@gmail.com>
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:48:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164961

From: Bruce Ashfield <bruce.ashfield@gmail.com>

gcc12 generates some warnings with arch/powerpc, and we know that
these warnings are understood/non-fatal at runtime.

This fragment allows testing to continue, while upstream powerpc
looks at removing warnings.

We only enable it for 5.10/5.15 standard kernels for now, since
this gets us enough coverage to continue working with gcc12.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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
2.19.1


