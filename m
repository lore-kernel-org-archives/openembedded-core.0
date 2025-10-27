Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F6CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:22:05 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.34306.1761574917910790981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B1oP37CY;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-88f239686f2so464660885a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574917; x=1762179717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EBbIV9drKjEEE0q6t6c1Tc6XP8rFUcIencp2izk6K2c=;
        b=B1oP37CYwBgsMIT3dwuLcsBmu/RKcj5EG5M7rSampP7Vjdjr7GqlvpEiSu2WVP6hIH
         yc9njk6d2Cxhp7ih048EoZoh0x5+x0WX5hMdkOlfn3/Drz4Gduc3mL3ZjgzSw7zU2mwl
         sz0flXhBAC2+6PMad64oWKkrATjNjTTGVFywCICotHfsKLkMFMEMR+FgAKIJSU2bQChE
         nm1vFhDtc+tW9S5MfRLLXQ9YZtscjFSPSplyVrP9eV81fbF+xiSwOReRLhOSPbGj6gTB
         VRK3OAjnfQ43iCfZvMdmiCfOIV6ym4tl+d5I8soBFwdlYI1CynGpYAvck64wxPDuu0xo
         IWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574917; x=1762179717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBbIV9drKjEEE0q6t6c1Tc6XP8rFUcIencp2izk6K2c=;
        b=qv4+L2/BadRnCFOfFtebvhFBB5vLelEccNcimh6IH/xnZXXHVsrpKdvVrj+heUR4Pd
         JBOlHhC2BqcVzpk4Z+QTjAmZn0br1KMJvCV+fKfB0Fht9zoSOUWDBNKkeya/O6eGiWVH
         VWt+/cAx7udQpYBGBQC2phmKHDlPoHcPrPuCwlXndZXZ0F11A7jn0aN/XPQMRgm8GEts
         20II88uaGLZd4qPbONxrvsJmfQAGIwrmpnlgqZ3EHbcN4AoVcurkyyzziSz/QgbvvC50
         uVSanZ3Inl13bIjo4zu6ebNFv6I5MIMg13pJj6Ty1wNOsaEHQ80Ylcy+ZRpHmEurc6EF
         IpQw==
X-Gm-Message-State: AOJu0YxbarQyJmQqjay7Ak4RG3jVqaZUL6+ZyRqjV5ouuKjBHvGsI3b9
	Gd+wwAyt2zcMgaiuEcnL3zm+8rGxGkYV9HTlqq7Hk5BiSFo5INzjiQ4L+gzbtse9X4U=
X-Gm-Gg: ASbGncsyQ11Fqg1vPdX+RlSa6OY6HDLQwNFwvT8kdaA2tT/d99yg+Bz7cgx6xk+iAQO
	lfkZUu6ZSDDnqlJse6uEUZXLa5ebhS+87Y+PqLsPb+Yyng7/csL6QhOp0WveFR3YC6GAmikFCox
	8FqqgDToLtZzwKP64ycfFuW6Nuf3gomHxUd/aEgoIMVDeIZTTLxZUBi39IXm6ilEFFPlFXn8rMk
	IkjBZuxMz0F1RCyUxChYyT5Sa426BTEvPvMpPgYtYN5zoDiofjBPfOupX7h9kjUdqOtyI/P40m7
	H0eNhv6QHEROJ5tgd3ZZI6G+gq7BmICdJeDQrogtr7DqlX8kLuKPetOh1rfjMeUICg4XwWWisUp
	d1kcZExJa9ILM+mK1pAOYWJpZ45yByowpOTfyJd8p6SJIh4CccvzYkP3Da67AwWlo7IgrdBkB9q
	mHKH8V3PgqytYqKd/aD/T3vqk5m6sLP4ZT+NR07WbqLtETCQwEPQlrsiFx7jE7l1l211+FJUgWt
	tUx9KUNdrRReMw=
X-Google-Smtp-Source: AGHT+IFbckLI8fF2aE/C/j7J29eFzOoaN8bUcyRJ6LLJ8wVr1DQ8oFs39yucqX4VOG8FonWNB77G8g==
X-Received: by 2002:a05:620a:480c:b0:835:7c99:a028 with SMTP id af79cd13be357-8907030cdf1mr4565200585a.57.1761574916652;
        Mon, 27 Oct 2025 07:21:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f24cd5820sm601770885a.17.2025.10.27.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:21:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.17: fix rdinit boot warning
Date: Mon, 27 Oct 2025 10:21:53 -0400
Message-Id: <20251027142153.3941086-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 14:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225336

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.17:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: boot: only emit rdinit warning on initramfs boot
    Date: Mon, 27 Oct 2025 09:47:05 -0400

    commit 98aa4d5d242d3a73 [init/main.c: add warning when file specified in
    rdinit is inaccessible] promoted a long time check to be visible on
    boot.

    The issue is that it is always issued even when an initramfs boot is
    not used.

    To avoid needing to completely disable CONFIG_BLK_DEV_INITRD and not
    have the warning issues when an initramfs isn't used, we add checks for
    the existence and size of an initramfs before allowing the warning
    to be generated.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Discussions are already underway upstream to make sure this warning
it more targeted.

For now, I'll carry this in linux-yocto to get our testimages passing
for 6.17+

The warning is harmless, so it isn't critical to ensure all kernels
get this change. But this is better than masking the warning, since
we may use this boot method in the future and want the warnings!

Apply this on the end of my 6.17 series. You'll also find this on
my zedd/kernel poky-contrib branch.

Cheers,

Bruce


 .../linux/linux-yocto-rt_6.17.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.17.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 20 +++++++++----------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 5af16f9b61..2e3b05c563 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "268abc460d21fe8510bc8a521f3ea887f2bbeef0"
-SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
+SRCREV_machine ?= "ded5de96729dc397870572482c44c65e4c353998"
+SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index 81a24b6bc9..4ed894239f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
+SRCREV_machine ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 9d2f51ad41..1a1078daaa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "23c78022fc97ea5ebc19ea8fb86d324c23a6fbaa"
-SRCREV_machine:qemuarm64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemuloongarch64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemuarm ?= "d71de08747bc2f9b9b4a67baec689847c89f4fec"
+SRCREV_machine:qemuarm64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuloongarch64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemuriscv64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemuriscv32 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemux86 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_machine:qemux86-64 ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
+SRCREV_machine:qemuppc ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuriscv64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemuriscv32 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemux86 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_machine:qemux86-64 ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "d76cb43db46c5d45e25df34484c87f5e545bf4c5"
-SRCREV_meta ?= "8f5d87f8cae63175d9a7d6b8791864df15b327ec"
+SRCREV_machine ?= "3b2f001e6a236aaf17bf11005dc18cef6f13f7b3"
+SRCREV_meta ?= "7b13aa26166b61951a03005f72d158543ad9f3c8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


