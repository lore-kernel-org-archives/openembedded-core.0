Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4065DC3DA7D
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:42:25 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.58203.1671561737956477275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GB6tWDgn;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id jr11so11761417qtb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erAIghH2mm/HJkYGSmJY/woNVDvMR6pYzJtiQ2TowHg=;
        b=GB6tWDgnxAt5POsdXrTxirJUD+T6H6bi9ePAvujDDpLISrr3QPJ3w0ZHLblhLt2hF/
         97H6IX8driH+jm5XFYlaZ7nxP/bgW7NYwK1iTu33NBFC39ttnVEpnd+GuBjrtu8G/0ez
         Cj7pW01FFFAPoTKi9jNLnym5I7IlbfNN7/5I/VPO0+LjN9SK48dpM19HMpVWj12RHXN5
         r6bEtEEQ/XpzSetcOGhzuJdKkDhGpSgr6fqkYKaBIsiG6xBujOg9D/FeQ1Xb7uRQuRE5
         nro2Z3BkUIiwludA+8V1b9Lo+99Xch0k/+nxzxfLX1fuJpO6Iuq8VH4y7qh5BpBg1Ukq
         VL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erAIghH2mm/HJkYGSmJY/woNVDvMR6pYzJtiQ2TowHg=;
        b=UTq2DmF3oUPms87cXAdXKhoVHufYSnH5ilaicKvWze8nB9OYb7OesVHhvkpaCNarqk
         xM0VCWln+WuCqUjWH22wieTbUmslWlQ1cMGElmN3/1xrhmbW7/DtPGLJRHSMNh9/PWL7
         21NphnkXnm0TQEcO1dGZrD6GvmhP0HrltZdjVYKTg2t4cT+CkygNPD/pnWfbSjjDBEQr
         W4Iocnw/u8zK1MEvzD8Dk7gseix9m7AZYK+fVXGFiJ1Q78/3xVpM0HdySwPVjvjuio41
         Sp9ieqPvtQhz0pbAqxGjXVCJptXT2LN21xTTi88ZGzf9OzEGXBcwmMQA5lBF7+6NarV4
         nE5Q==
X-Gm-Message-State: ANoB5pl+6VoYN2VCYsqtsEORn4udEStPhbGZQ/FG78bcYCPO5vOZIb0G
	XjhdDCENagM/qrjuxjhtMs4PGU87eOM=
X-Google-Smtp-Source: AA0mqf73bubknOidSqDMwDqrOzP824Kx8og6PXE9wv53Jt2X8R3yn1Vdq4EQ0jlVs7DRR99LZhyr0g==
X-Received: by 2002:ac8:4508:0:b0:3a8:59a:39fd with SMTP id q8-20020ac84508000000b003a8059a39fdmr59025929qtn.60.1671561736913;
        Tue, 20 Dec 2022 10:42:16 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fc94f65417sm9229265qkg.40.2022.12.20.10.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:42:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/5.15: ltp and squashfs fixes
Date: Tue, 20 Dec 2022 13:42:05 -0500
Message-Id: <2e6cab2172009658055a544e397fcad1d53c5d5b.1671560769.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1671560768.git.bruce.ashfield@gmail.com>
References: <cover.1671560768.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174877

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.15:

    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fc1ccd9b39..bd57d7c47e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a0d36398b257c555381e735cd721cd8479d6762d"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "9860fe27332e09dd4f0f3b303e40377de083be9a"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 087c30b5a5..8b83b5a8de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1c3448ff6cc6d24d16c6ef6065cb642245cac627"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine ?= "86627fc3da74aefec1338724a597356e6b8ad88b"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d5f21daf35..0b373c40fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d3aa5916b2b02966ef37bfe3fc527c99754571ec"
-SRCREV_machine:qemuarm64 ?= "a1d364fbe3d8a916426a107f07b89fd0338923c7"
-SRCREV_machine:qemumips ?= "904de7b55a7e8edf4cd894fb0558efee799a314a"
-SRCREV_machine:qemuppc ?= "35d547b91124bef128a13402190ca05f54a2392e"
-SRCREV_machine:qemuriscv64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemuriscv32 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemux86-64 ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_machine:qemumips64 ?= "ae8ab2e3acaf9e14cd75a6c96f1ba43c66a1babd"
-SRCREV_machine ?= "8cd3f1c8dc13e8fa2d9a25ce0285d3526705eea7"
-SRCREV_meta ?= "f475b1a9deddbde23f48d7d535abdd5fb133b837"
+SRCREV_machine:qemuarm ?= "4915b05912ee7d15224eb9064ca63678f0bc6815"
+SRCREV_machine:qemuarm64 ?= "660bf605998f60fd77f24d3316b95b14ef2fa035"
+SRCREV_machine:qemumips ?= "38bf282c052b70c1c6dd79dc6ae49da1ec1c7de8"
+SRCREV_machine:qemuppc ?= "ac4a5d99364cede21dc1838213f7fb29e1735969"
+SRCREV_machine:qemuriscv64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemuriscv32 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemux86-64 ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_machine:qemumips64 ?= "2923c39cc815e2109c9bfc0985adcd8d342fc415"
+SRCREV_machine ?= "1c5699ee85d4ffe1be2bea17f4587375bf3877f6"
+SRCREV_meta ?= "c2d64b008142d2a2bc9c8cca8a3d579a62275122"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "509a32764e1a5692935c4f26ed96fbe94c480186"
+SRCREV_machine:class-devupstream ?= "71e496bd338221709b180b60ba419fa542c2b320"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-- 
2.37.3


