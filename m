Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B528FC36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:18 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.7677.1742478015432451760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pc2SkIwo;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6eb16dfa988so8022786d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742478014; x=1743082814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRVvSvipmeutmaJJg/2LUXuA5rLrLpzdUq1HvqUyvS0=;
        b=Pc2SkIwoBHST7+gxY1Due2/cbse4NZeADIyUmCqP30a423DcJZe+M+kNkxBqQcGVQG
         67JLp13WGjA6+aQa10EaHEDo6l+uvUJ+ahv5ND9XGPeejiexiDEcoigKjQ5YkH5W8hrW
         OpqGdRhFv9t+he+fRWGrFWw7DBzGb5iPVDFJtITGHRzQ0E6RGpTJ4hLwVMIdfIlucrLW
         iOe5U88jq+6QVIHgwKsuNeP+Hv+y7cUhlY0+dM9/3TidK4CbHgI4DalseHZM9YZ+RZgI
         oLTMWnODsK2tAce/NQRhjggXptPuEiMgHC31hy6xSOx3uYzaAsIPXOrgfpOjLRUZ+zuF
         huVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478014; x=1743082814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRVvSvipmeutmaJJg/2LUXuA5rLrLpzdUq1HvqUyvS0=;
        b=D+sDSjvRR0fzjBlDPYKITCB9S9RxkErln/j+8/7LW7/CViXCRu9udbXBWQ1kMOPuPR
         9HWuLGg9agUnKGIRitXlpAUGYGFcNdclpp6wCw87ECxwIcEVFEcX3mBC94Km7GgcKWPm
         rHPzmW+mko0F9YskMC6T5PuKijWlTp+sg4AFI/O8xQ859R6ai25FjW5/fJ3dW6acP59K
         tL4f8i1xQQr9KQcjILT8LjPRmX2N62fnCE7RRsaQ+G9G81GMNEsG37iUO2vBvXWATBam
         ddbCOChaw1VBiY7+TcVFRfCZhBpEHTGnegr4zL9OF22u2dOkGCG7icmjQZbuS3QhATf6
         DXdQ==
X-Gm-Message-State: AOJu0YzDS8UGPRi+ZHj2kVSip6qnl7m90SEUU+y0/bOXtgEcgsJwjlVc
	z1ua6ja2dH6kTN6mU+cG6y671uGXKIfTP4cXvFOMUHx4TGk2OBu88HKJBrNfd3o=
X-Gm-Gg: ASbGncvE1hfADUDin45ZbvPqZhH9zrA+JYBAM74PCvTxmmG2qxMo34gMo8FwcLBU6CQ
	nTxlQ+61o+zng2JZU6WiDg8BBCPdV4TAbsWZxnblr5jMoLqmqPOhU8jq+s1FCudxG9mNue4AVyA
	25ci20goZd41fZbURF4GY2slPr23uCO4SidHe4ISUH6Z1HWDVclPzIvHF9VIiz9qtXvRnMAn5nh
	GLRefWTP9sxen0ZScLkpABKiJfcjDhrPA6qhk5xO2hSlAc109h6cWQVCnKiYo0KBO7qUUz5VBBx
	4g35kMguScM8J1T3B/OTzHKwZ3eP2Uta7QoxcwSok0KddbSllEvHiNFpHR4QKM5QKvrr7k6gWT2
	kHM84CBPnaibgmnCdLSPNwC7VgNKhuXAMj2TOB4VDqw0KTQ==
X-Google-Smtp-Source: AGHT+IEsMXP7QEdfNK1aRCZ2CnbOVCCZ8Ok9FgeKPrhwmofNZmvUzeaqzwaj2JJY+8Zgr58fCt0b5g==
X-Received: by 2002:a05:6214:f61:b0:6e6:683c:1e32 with SMTP id 6a1803df08f44-6eb35284c22mr43874556d6.8.1742478014218;
        Thu, 20 Mar 2025 06:40:14 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade231256sm93954166d6.32.2025.03.20.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/6.12: configuration graphics, I2C and warnings
Date: Thu, 20 Mar 2025 09:40:06 -0400
Message-Id: <0548cdea301b321dfd4742182de506b48ea640ca.1742477836.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1742477836.git.bruce.ashfield@gmail.com>
References: <cover.1742477836.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213391

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    bb44ae9b bsp/mti-malta32: enable I2C
    e2396ea2 bsp/qemuriscv32: CONFIG_PAGE_OFFSET not assignable
    095395ba cfg/virtio: add DRM frame buffer emulation
    88bbdbd5 features/drm-bochs: remove CONFIG_DRM_TTM

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  4 +--
 .../linux/linux-yocto-tiny_6.12.bb            |  4 +--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 26 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 9ad43410dc..2e16e43628 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fed5fbc6b68a11d4a9055ea8aa481bb2945c9c89"
-SRCREV_meta ?= "2506ff7d20ee515e70964844fa40b35e4fdfbe92"
+SRCREV_machine ?= "81e03d4794dcbe5a29307241dc110f42fa7d7f76"
+SRCREV_meta ?= "bb44ae9b6ada9da4729dfdd4cd6075908a02ba31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index a01b552000..6cd0767092 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_meta ?= "2506ff7d20ee515e70964844fa40b35e4fdfbe92"
+SRCREV_machine ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_meta ?= "bb44ae9b6ada9da4729dfdd4cd6075908a02ba31"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index d99759dba5..1738300379 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "416d14d80c6a4cb641d42f95140aff1ede4da75a"
-SRCREV_machine:qemuarm64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_machine:qemuloongarch64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_machine:qemumips ?= "529b1f229abddc1db8f3240a19a0352257cdea49"
-SRCREV_machine:qemuppc ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_machine:qemuriscv64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_machine:qemuriscv32 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_machine:qemux86 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_machine:qemux86-64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_machine:qemumips64 ?= "10419c638ea26a6dbd364c913f7c3d6894c64e23"
-SRCREV_machine ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
-SRCREV_meta ?= "2506ff7d20ee515e70964844fa40b35e4fdfbe92"
+SRCREV_machine:qemuarm ?= "6c4ce60cf79602b35d0dbb3528737ef9130baeb5"
+SRCREV_machine:qemuarm64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_machine:qemuloongarch64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_machine:qemumips ?= "8c0b66057f688ffac2ae035a8ee7385cd8d535e9"
+SRCREV_machine:qemuppc ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_machine:qemuriscv64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_machine:qemuriscv32 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_machine:qemux86 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_machine:qemux86-64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_machine:qemumips64 ?= "fd60fdcf820529aad2f28d498f7fccb5bce884d8"
+SRCREV_machine ?= "a8ef1d3063769a834565490956e620d38c1ce708"
+SRCREV_meta ?= "bb44ae9b6ada9da4729dfdd4cd6075908a02ba31"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4b07fe4a044d863926707e1106ff142427ec6e02"
+SRCREV_machine:class-devupstream ?= "984391de59a1d6918ac9ba63c095decbcfc85c71"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
-- 
2.39.2


