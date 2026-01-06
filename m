Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C03CE9D53
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:24:10 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92279.1767713040671406503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X01V+69t;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ee158187aaso10479881cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713040; x=1768317840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwqS+xANaVPXF+QPnfpBDMl8+RHWjyAc483Dh5G8BfU=;
        b=X01V+69tGSZzGRp6OV+ubRahzdQgZHtZGMu3YnL+Gg3VkNXEmwhT1jgIegBAm8d/Os
         pjZ+4fwWMZUVafntcDjFIZxWlwBXpl26BdyBxOlm/ssL+4MBbtwPxce09xIwBEbaBQDN
         V+362cZN0u8IIXT/lIZL8YWqYiaf/D3h/hC1DojzmJsYdDxuFlIdDRu04+fjRzBvFJvA
         ftEDpyX9Cf6oBA5t7XSRLxs92IrBIZ1RSQRzJi2YVf4pMztaQi9mmDFlKACe+3igOQMm
         0UOmHr/Nto9SjTD7zPKLbKLgsPsI/0fq/vhBOEPDREZtWSHdQ2/eVO7hP8YaOhzxLiec
         t0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713040; x=1768317840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fwqS+xANaVPXF+QPnfpBDMl8+RHWjyAc483Dh5G8BfU=;
        b=xRVaeN5nU9BarQfnu74SfwiQLKp8/n8cwvaYWdHfGbBrxfpcHRYS7NqxCPffE+f/th
         Yz/BuLjL+qRAHQd2S/cSF57Tlvt2phg9z+VaJ+42UFInKlciR1AiA6iT6bn7EUwYI9LR
         KXglL2hSg8DTgL3QPjp4rxHL4JDgs91YAtfdivkAp0hQp1sc6mmoNZ59PTDstiEiy+v1
         46hs/7TGRHea/mkCwx/7ZprwaP32RUhp9EQ9bnUrdB+HGzThof5XINBMbo2i2idZ7SP9
         xhjaO1ANy+3WWBJ+rhnmGIQDHR1NU356IrmrMYEjR3Xv/Ng8GdKMUozeJRViL2pzzOAc
         +N5g==
X-Gm-Message-State: AOJu0YxTcRKYTUgu+CTyRGcFH6lJq2WPtKQuaxx0G59qWSYpigDYQMMJ
	SgfM3AnGH8yQAyEMpkJjZEzXSuzZSb291Y7Pv8sl5IX/xiT+68UdGu4w
X-Gm-Gg: AY/fxX4ZOYJgFF7vsH07rLq5OEqGjety62sDwHCQLq4V1k9y7h+huLKEq6EdcxwjWBt
	BoyKRYuGTcH4GluOv7cycqVVW4olDLWGGWFfSMJeHeENXrmDQ1fcHCPQHTHiF1xqKbiSaHEYGZy
	oB0MBfQ40+KlX7zcZhYDxRKdl2yg4p5fECAq5Nf883hHsSwm2EelpibX8WyPus8wjsiwSjnOn0J
	F66UNnIubvN66Pv9njGEAmTMN5j/CIKzRl/hZ972e7ht/Nid9HKXt4bMPhnGzMsT0T2xsoUteuf
	ajfB+AInHathHvCNf3HIS8d6MoJUcLrxI4oz/56tA0Ip+mc/mom58m0XR7MFMlVSNodUEQL9Mjb
	Wi84Ei7/I4OGEy7bTFAdlkwzYZA7ho8TpVue/H5HfVJTEiAK4wjM8FfqHh6T9E0vHQ98OfvoY9q
	xodaMilgXjiihMMqqIgf2n7t9YW2FwkmNPYiteQ13dmm19s6T62/EXLQ/K1JXCTsRTBr1wyqmYO
	Sphke6GPH3aPVE=
X-Google-Smtp-Source: AGHT+IFAiwcgtP4zie8pQoQP+DyT9hQ8c72XAurdVIhv4dbhiKN9d2A34KTxoT9N8+09ujhXRan86Q==
X-Received: by 2002:a05:622a:1f93:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4ffa77e0478mr37479631cf.56.1767713039578;
        Tue, 06 Jan 2026 07:23:59 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm15587326d6.48.2026.01.06.07.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:23:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	haokexin@gmail.com
Subject: [meta][PATCH 04/07] linux-yocto/6.18: libpf prepare for new glibc
Date: Tue,  6 Jan 2026 10:23:49 -0500
Message-Id: <20260106152352.932717-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260106152352.932717-1-bruce.ashfield@gmail.com>
References: <20260106152352.932717-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228898

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/1 [
    Author: Mikhail Gavrilov
    Email: mikhail.v.gavrilov@gmail.com
    Subject: libbpf: Fix -Wdiscarded-qualifiers under C23
    Date: Sat, 6 Dec 2025 14:28:25 +0500

    glibc ≥ 2.42 (GCC 15) defaults to -std=gnu23, which promotes
    -Wdiscarded-qualifiers to an error.

    In C23, strstr() and strchr() return "const char *".

    Change variable types to const char * where the pointers are never
    modified (res, sym_sfx, next_path).

    Suggested-by: Florian Weimer <fweimer@redhat.com>
    Suggested-by: Andrii Nakryiko <andrii@kernel.org>
    Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
    Link: https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v.gavrilov@gmail.com
    Signed-off-by: Alexei Starovoitov <ast@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.18.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index c54e4a0b18..4a97e69bd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "be7ae5a34401b4f6dcb48ff7ae47e67394dba79c"
+SRCREV_machine ?= "2113af81503bf1956e1fd35ebeb47b30fb4800ad"
 SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index bce86a263e..654ed412a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
 SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index a4e56acee6..b341b4b658 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "2ccfe72c732cedba580d6f485b0b4147ebe1a483"
-SRCREV_machine:qemuarm64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
-SRCREV_machine:qemuloongarch64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine:qemuarm ?= "1d85405aa5f80c9a3fb644ffab29f6d952da2146"
+SRCREV_machine:qemuarm64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
+SRCREV_machine:qemuloongarch64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
-SRCREV_machine:qemuriscv64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
-SRCREV_machine:qemuriscv32 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
-SRCREV_machine:qemux86 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
-SRCREV_machine:qemux86-64 ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine:qemuppc ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
+SRCREV_machine:qemuriscv64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
+SRCREV_machine:qemuriscv32 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
+SRCREV_machine:qemux86 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
+SRCREV_machine:qemux86-64 ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "189fc21c2a600eba9cacde0cd3fd1532681be785"
+SRCREV_machine ?= "bbf290cebd6e11b7d0fd3182ae77c94c332b8ecf"
 SRCREV_meta ?= "8ac9b1baf5d3cc1cb53a87a449b52f253dc32cab"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


