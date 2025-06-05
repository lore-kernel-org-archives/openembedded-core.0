Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61B5C5B549
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 02:19:07 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.34624.1749089939412068133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 19:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPhNO9B7;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a589b7dd5fso7106111cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 19:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749089938; x=1749694738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xpZCBBo3pjOt87GCKcHEQlNRk2XsxvOXygf2K+R//To=;
        b=fPhNO9B7oqig1HPV2SOpTFIcYv7wJLvWsrtM7Rlb4ZiNSvfYMdrWN1OSNbv4T+DeCb
         49xkYVFWpmiQ5jZOSyJqzDqDyw1U7lcx3E/99sqrNVUjWnH01S7ivqNDL4xG9JLZtcke
         D/z6JlfTyOMApCgbqXhlQbUustAOsHzncM/d6fBj646CbBuSJRX4t5OnMYV7OBkY08O7
         YcyxbMUaXUOobMRZKIEtN/ld4fIYERRkLMM8/jS3bGx2sc+0+daqZRKo54m2LFk5uUeH
         IWqquiqzt8SrWDWBGoeElwClF9TRO4inY5QZ6+EEJv//douJSTHEhQRl4E1+lYPzSCk3
         Xhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749089938; x=1749694738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpZCBBo3pjOt87GCKcHEQlNRk2XsxvOXygf2K+R//To=;
        b=cu/L36TDfoBmwZbISE3sHTLup3Af6ayRU4DqqLcNcRBRvaalSPsc/jyUJAKEMHDcpK
         UYvD07nunNGYm8EbJhsBQ8Tcm8OTZmcBZTO9zpxPbT7s04wfNWydMYy54VkhqfhCmI9J
         G7k/D08iUbKz+1871qpflYW3rlp0pQSVutLIXGaBTZIEUOl+ffsDYLRjBZ5EfCICTV19
         9C2vaDx4fOXVY+SZwIO1Yg9ZQisulDo1m4Eo5L8sqIMge+dR+OAMUBz0o0+1XBPmqxDn
         9WAjPLjw+uQUxmHv8GWI0svH+vlC+SnncS8KOTiHjSCzlECp2662HWNXXZcYz88KPS6y
         Qkvg==
X-Gm-Message-State: AOJu0YyVw5/hQQ0cl3n/dgAx76PQ+GAA54bRVy+lMSY2bTRwgupzxPpt
	tRCttojDCvJRy6XrXHz1FBTpRTBUob2c9R5CJbp9EuZxQqoCWQ2kP5gJ
X-Gm-Gg: ASbGncvHmIaDeUNBLF/3A+EzVSU0mk7426D0K0O3ngqFrzutfHsS8nf0o2nG0BCUHOX
	DWYh4yiV/ucPsYlbzt1jOgDmWJd8YyMm9XQxJTrzPxiucP9volrHwW+jLvJIu5sVcGyi1wfFlgD
	Ef9aFkGzfvaPsiVUOrhdMYW4Zl5f4S0oztpKREmc0nTZTr9YesQNo+sH5LlGSmMgH0XoZdZgR7x
	r1rdLiYr5jksVselxUY5NpPcXtz7IKrmE4LOxaR09zKJPy6TyVSUvxK/otuJwllnldM8N0OBfTv
	7C/au7ArCH+8uUmhYcECriG8qyD5GYGtsdfFFCDwW9cc6FHPQ2WTj36YqzHfVYy+vOV5LISXzfm
	QCTAFY9aW6bIezDtJ2i8IqVDfn+1xYBHSfXIXAbPncQrOR156lhjln4fv+MWawLc=
X-Google-Smtp-Source: AGHT+IGs64GlplxZxNcQYvcN49ST4hOcsfXCyIzFqAZjMiQALoLkJTVkSTYjEfMTC5uWtpgfpGtr1A==
X-Received: by 2002:ac8:4059:0:b0:4a5:a8db:f851 with SMTP id d75a77b69052e-4a5a8dc0b00mr50668551cf.1.1749089938224;
        Wed, 04 Jun 2025 19:18:58 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a377f1sm102609381cf.61.2025.06.04.19.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 19:18:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.12: libbpf: silence maybe-uninitialized warning from clang
Date: Wed,  4 Jun 2025 22:18:55 -0400
Message-Id: <20250605021855.603640-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 02:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217973

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.12:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: libbpf: silence maybe-uninitialized warning from clang
    Date: Wed, 4 Jun 2025 21:22:23 +0100

    perf is build with -Werror, but clang 20.1.6 (incorrectly) finds that
    mod_len may be used uninitialized:

    libbpf.c: In function 'find_kernel_btf_id.constprop':
    libbpf.c:10009:33: error: 'mod_len' may be used uninitialized [-Werror=maybe-uninitialized]
    10009 |                 if (mod_name && strncmp(mod->name, mod_name, mod_len) != 0)
          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    libbpf.c:9979:21: note: 'mod_len' was declared here
     9979 |         int ret, i, mod_len;
          |                     ^~~~~~~

    Inspecting the code it can be seen that mod_len is set if mod_name is
    set, and the strncmp() is only called if mod_name is set, so this is a
    false positive (interestingly, clang doesn't spot the same issue above).

    Silence the false positive by explicitly initializing mod_len to 0.

    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This needs to be applied on top of all my previous linux-yocto
patches.

Bruce

 .../linux/linux-yocto-rt_6.12.bb              |  4 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 1f61008bd6..5a7bad9017 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,8 +14,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4127c6137af28c2c91ec79acee60fe4d4d70db9b"
-SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
+SRCREV_machine ?= "7cb6d42c40de351ecab0a083aef260f84407de0d"
+SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index d92862a426..0fad73dddd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
+SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index c5cab3432c..262ae35704 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4260a7bd706072e6bec438cdc29f44845d380b21"
-SRCREV_machine:qemuarm64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemuloongarch64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemumips ?= "681fad27d382f2e0eb53d1b46f9d35aa2332248f"
-SRCREV_machine:qemuppc ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemuriscv64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemuriscv32 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemux86 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemux86-64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_machine:qemumips64 ?= "c32033ad8eac09b074c44a42e7d34d398df9d172"
-SRCREV_machine ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
-SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
+SRCREV_machine:qemuarm ?= "37a1fd13ca538e7785daf01434495a614bc55ead"
+SRCREV_machine:qemuarm64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemuloongarch64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemumips ?= "2bcf58ea5aa19d54c436e63c59ab09b307e9ee8e"
+SRCREV_machine:qemuppc ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemuriscv64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemuriscv32 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemux86 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemux86-64 ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_machine:qemumips64 ?= "6470f58a8f04951f202cf85afb4421d2e7ec9995"
+SRCREV_machine ?= "298aefdf4112e7c0a84522e4acf2c722e433c8a0"
+SRCREV_meta ?= "60b8562e9989f268ad5d241989f56b71cfa1f648"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


