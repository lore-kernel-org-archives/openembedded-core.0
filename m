Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88B7E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 17:48:22 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.25749.1734025697012344618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 09:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dLsW2W49;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d8878ec049so8970466d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734025696; x=1734630496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynffBdoa7GJauKTVhg2YOqoDGQvsP9+SmAc/JxwTDKE=;
        b=dLsW2W49UP8lHkQ63VZZxEkm8/vgoJRNKsK4K2QdRRlLlnEhajtj/PKISosEd+PMmz
         363zII8t+Vun4nEFQMBgbILlR4ttTZM+Q7S/FVWW3r0VEggCqdw7oWWfEQK9fBRd8zJN
         9G+ytH2pClw7swubORTiB1HBuWMHccoDIBkff4/ZS4aEFNo6WDouN71REbyCeFMpAZ+D
         aosrYmfr+/3MpzYBw7kPSMjzlswKYG+b3IPWd/WU0d3E9pU5+4wiXlCg2LkuxrLnzkv9
         HO/20idM8Gx/87EytQ6++HBtE3KuVeV1OOPInN19INDPNhqdhTVUqn8r21RS4nZZTDr+
         Eo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025696; x=1734630496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynffBdoa7GJauKTVhg2YOqoDGQvsP9+SmAc/JxwTDKE=;
        b=NrE1HisyzsjUEmWnxnfPXfwFZpjeOmZuAaEyRJNW1+LihFOnp74JO4rUvsuVoQ4Aq/
         8Yp8KerLYeqZU14hcCfQGtCStNJ08C9uPaPlfhtgEof5Wd5ZiH9IEFAhlPDI/Zti4C0R
         QC25XWd1TlLuYRHw4poPz93qN/UyQd9N5NjG9XAJq+6lk+W6BiHSjpLVzPyUc4zAvPi7
         OH+ry1hU14HEzMbra5xzC/fZ89ACGqc6PrLbn0XyLfZdfvFNonCq5BPqnhjgCq4I3rZ6
         ltBY4lWkepfGZoUPZKSEWzWkLG4QfLQhhsVFB5Ng00xHaT5STGcSwLM7pV2RuwWf1pBL
         6wEw==
X-Gm-Message-State: AOJu0YxwEbcgTF//fQj1g/sgKgAQx1nbFSOFX85/4JyQ0snG+JMWMIEP
	v9sxvc5ojdhSSqzyXoSr05Jrj54kWnrSTjH/e+xxcVMwDBqK5OAFK6mqT9sJ
X-Gm-Gg: ASbGncsTFCvwdeUF51iSu3QMVyeDpn0QcqWpjezBt3BKoYQiLBT1laY/9MwohBkWdHl
	GvsqyXZvgaK/x/Pl+owiLvPO9pggp97IfxoAZkd4MQAl760PHyYeuBJW+xupftTFjcbGszMstGL
	nrKIwgT1I+JoFYfQgwS94tUVEWFPr6JC2XIbHoCgbrGaU63dRba/Sp2BUM0tor9NIMoKjnuY9Nz
	a11iKxoP2rnmj81uc8BVysuZxwsT+xTU1aK0avicdWAXBZ70dL09xij+nz50m526FgylwvIk9Af
	z7g5xZ8RVfP0bPxk8sNrEmBdhSRrVJksfqVNRyTV9o8kaobWsdkI48FjBw==
X-Google-Smtp-Source: AGHT+IGQvLW/TGmLep5whBcQsCQwdBIJAgrKqgq0chkDyYAc2gHa1naoXYi/pqBYt8xKjy/Kv7dkEg==
X-Received: by 2002:a05:6214:5002:b0:6d8:8fdd:9797 with SMTP id 6a1803df08f44-6db0f807986mr19009866d6.36.1734025695957;
        Thu, 12 Dec 2024 09:48:15 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8dac13563sm83977036d6.126.2024.12.12.09.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:48:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yoto/6.10: bsp/genericarm64: fix configuration warning
Date: Thu, 12 Dec 2024 12:48:13 -0500
Message-Id: <20241212174813.2791649-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241212174813.2791649-1-bruce.ashfield@gmail.com>
References: <20241212174813.2791649-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 17:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208661

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.12:

1/1 [
    Author: Ross Burton
    Email: ross.burton@arm.com
    Subject: arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    Date: Thu, 12 Dec 2024 16:44:00 +0000

    This option was removed from the Kconfig in in "clk: qcom: fold
    dispcc-sm8650 info dispcc-sm8550"[1] but it was not removed from the
    defconfig.

    [1] 802b83205519e4253b873bef5c095b147cd69dad
    Signed-off-by: Ross Burton <ross.burton@arm.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  2 +-
 .../linux/linux-yocto-tiny_6.12.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index ff1962590a..f4fe3bf156 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b01e5cf7ee075ac6fae18ee9eb0ecfaaf024f394"
+SRCREV_machine ?= "29974e6f86d7ddc55a72fc44d209b84256c69e21"
 SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 84c4353008..0ed00fbb64 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
 SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 728d7e188c..76f38d8884 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c2bc3bf6168351b86c1940020a05bc3907bd97af"
-SRCREV_machine:qemuarm64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemuloongarch64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemumips ?= "9537ff669bd3fded04ef795aad118851a2bd210c"
-SRCREV_machine:qemuppc ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemuriscv64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemuriscv32 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemux86 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemux86-64 ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
-SRCREV_machine:qemumips64 ?= "c804d6e613ac8dce9cfde9a245ad3496ad835e0c"
-SRCREV_machine ?= "48f49b0d6627a29c4dbe99cf2faa299acf4ca61f"
+SRCREV_machine:qemuarm ?= "0c33fda4cb5c0a3dfbdbb2040a8b4affbb34e00a"
+SRCREV_machine:qemuarm64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemuloongarch64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemumips ?= "cb10a94d7ca5ce5c00608ffcea74a79df6b15329"
+SRCREV_machine:qemuppc ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemuriscv64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemuriscv32 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemux86 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemux86-64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
+SRCREV_machine:qemumips64 ?= "861600ef3aecc4bb78dd57f92e4814c9647f1cd9"
+SRCREV_machine ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
 SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


