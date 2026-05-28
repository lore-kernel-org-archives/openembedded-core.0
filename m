Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB0FCD6E49
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:37:25 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2753.1779935838952022972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GVhMYtZc;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b98482b253so201026906d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779935838; x=1780540638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbnhN5xRBXNmAqNFpWr00yjBzNPTNhr0Ju37uNdsDHI=;
        b=GVhMYtZcNWGazc2J8ALVOhia5WRpiOGiGjBE1zsv4/x81SYlC2lvTZTl0R0BNwdlx3
         4EoimRi1+7PE0piOQksPVJqbXhZ6FN/TxuAdUzShJn6A7SiY5JC+0yRizSI2xamONcY6
         CexrIz+YN2C+RBxyb44nFwVj6X2mpI/+8PCHwW1J6xnSoyD2TAUUDj6Qh8iduzctgVMz
         h8A5jfhdNPVIOk8G49nxnwOh6akBt/WJXCqCJdcHwbyEwroy8GdrXq09RbLS6m50NNT0
         J9xO2JrmbGGUmrA6D/k9A7Pr5VqVbRoS4L3WcgEXvm6NkTLUj7UYNe92+Gwb9Lj0+fmI
         wqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935838; x=1780540638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbnhN5xRBXNmAqNFpWr00yjBzNPTNhr0Ju37uNdsDHI=;
        b=Nc70upSyMuaFnA+HAyBNmQDjAg6jlMBUu/QSMmRtxnvd9kRczeolbLq5K6PXK5bSb4
         0hjZN5srJeBIZt5G5pdeowmypWh3jZWwN8vJaoDv7BPmlkjmw5TJnmsBvcNuP/f2dRYg
         AVUHNgQhANZfszgoQiVCfZE6AlJrm1G/WARLr6Z+9Dnu2rUYHe2zL4zCgl5vKX4nZGcj
         nF1OA1ZnwcgoNd0o9HTU6E6l/A1sz12x2n7jmM02opTvqsalQzQTCQ0UGLHTwUkcl+nS
         GFsubYKwbjbSwjKCwvYWOViyMg90R9+kcBKJFJIVggPToNNpWU6mbEl3AVGD/f74YeeP
         cauQ==
X-Gm-Message-State: AOJu0Yz0dtuuoR9kGCEIlhl97k/F7ZxJgA3zAvCv9VHuB09dfd9hfDXp
	kABbI9BcNF5bparuiT6qm1l1pK06VGQmEOD9UArnvcrFvVrTwf1hEropRGEQADft
X-Gm-Gg: Acq92OEAbtJ73Dt9a2yXKjCYB6UUg81P6hU6VlvDnrbf4EJdSE/giBc1jDP/GLs4ZXg
	vInLHmw5TDLQLn3WS/DNPKg87DwWpLQWo0nyTFYWKzIu1DToqyef+vFLE/6YokM3sV4M9t9/OQy
	CnTYqTKbqGNwEUJJFSVwJ7mTMCtbGzgVJCgOMrD9dkFSUtSZBr88vJ719kjWsR58TjHPZUxM6vo
	h24J3qWcAFVo4HYCKUkGDVdA2OL1KEu5kUpgEBDkh4f+sQoQ+7kK/hXUV+Oq4kmjTe8X71t7M1W
	4O3SX/tF7WfO7sOVUKkh8OwNy0Odx/GuHIrXQBbgw8yLN4VwO54a8o1Lj6wUpEoXboMGwn2O1vF
	Yygd/FIE8AcCzlbSbUrOhm89RUPxid7W4A48yuDM5VdnvE6L2EgjNXSfevIJPGM/3MMqc/599oN
	1urCGXhqUH7AZgfSLuNM3hCEQ1FiFtatMqCD523/gdgnPYan9NuBOQ4vtn7tsm+RcbznI+52BFl
	PvRKpG7l9PwUYlWq/TtqRoCHUHqRnyBJOgr5/qjZT8sAouY5qfkvxsLPUWqG/GsAOdb/4vrQcp9
	daqn4bWRAfaCXzhfe6MMSNOY1Kch2haY52lVqdzTwsbVgfbmICvKrJE=
X-Received: by 2002:a05:6214:2244:b0:8ca:1e91:e5b8 with SMTP id 6a1803df08f44-8cc7b617b24mr397823896d6.39.1779935837939;
        Wed, 27 May 2026 19:37:17 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcec8esm186146436d6.7.2026.05.27.19.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:37:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/07] linux-yocto/6.18: qat/intel configuration warning fixes
Date: Wed, 27 May 2026 22:37:06 -0400
Message-ID: <20260528023714.4026613-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237683

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Yogesh Tyagi
    Email: yogesh.tyagi@intel.com
    Subject: qat: fix CONFIG_CRYPTO_CTS mismatch warnings
    Date: Mon, 18 May 2026 22:21:02 +0530

    [NOTE]: 'CONFIG_CRYPTO_CTS' last val (m) and .config val (y) do not match
    [INFO]: CONFIG_CRYPTO_CTS : y ## .config: 8103 :configs/v6.18/ktypes/base/base.cfg (y) configs/v6.18/standard/features/qat/qat.cfg (m)
    [INFO]: raw config text:

            config CRYPTO_CTS
                    tristate "CTS (Cipher Text Stealing)"
                    select CRYPTO_SKCIPHER
                    select CRYPTO_MANAGER
                    depends on CRYPTO
                    help
                      CBC-CS3 variant of CTS (Cipher Text Stealing) (NIST
                      Addendum to SP800-38A (October 2010))

                      This mode is required for Kerberos gss mechanism support
                      for AES encryption.

            Config 'CRYPTO_CTS' has the following Direct dependencies (CRYPTO_CTS=y):
                    CRYPTO(=y)
            Parent dependencies are:
                 CRYPTO [y]

    [INFO]: selection details for 'CONFIG_CRYPTO_CTS':
            Symbols currently y-selecting this symbol:
              - FS_ENCRYPTION_ALGS

            Symbols currently n-selecting this symbol (no effect):
              - RXGK
              - CRYPTO_KRB5

    base.cfg pins CRYPTO_CTS=y while features/qat/qat.cfg requests =m.
    FS_ENCRYPTION_ALGS=y forces the symbol to =y at .config time, which is
    the correct outcome -- QAT consumes CRYPTO_CTS via the in-kernel
    crypto API and works against either built-in or modular CTS. Add the
    symbol to the y_or_m_enabled.cfg whitelist so the audit no longer
    flags this mismatch, matching the existing handling of CRYPTO_CCM
    and CRYPTO_GCM.

    Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Yogesh Tyagi
    Email: yogesh.tyagi@intel.com
    Subject: bsp/intel-{x86,common}: drop CONFIG_HIGHMEM64G
    Date: Mon, 18 May 2026 22:21:03 +0530

    CONFIG_HIGHMEM64G was removed from the kernel in v6.18-rc1 by:

        commit bbeb69ce301323e84f1677484eb8e4cd8fb1f9f8
        Author: Arnd Bergmann <arnd@arndb.de>
        Date:   Wed Feb 26 22:37:09 2025 +0100

            x86/mm: Remove CONFIG_HIGHMEM64G support

    The two intel 32-bit BSP fragments still carry CONFIG_HIGHMEM64G=y,
    which against a v6.18 kernel produces:

        [INFO]: the following symbols were not found in the active configuration:
            - CONFIG_HIGHMEM64G

    emitted by do_kernel_configcheck whenever MACHINE selects one of these
    BSPs (e.g. MACHINE=intel-core2-32).

    The replacement on x86-PAE kernels is the unconditional 64GiB ceiling
    that landed alongside the removal commit; no fragment-level opt-in is
    required. Drop the obsolete symbol from both fragments. This mirrors
    the recent "x86: drop CONFIG_BIG_SMP" cleanup (3260f662) for symbols
    upstream removed in the same series.

    Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 031c81c2b3..b5775d2fd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -16,7 +16,7 @@ python () {
 }
 
 SRCREV_machine ?= "dda294005f893c24b6322a7bdf58d7575f4ad21f"
-SRCREV_meta ?= "2d12860e7692327b02ec4d707585fe101b8c4d38"
+SRCREV_meta ?= "a5384458147b581e6beac32ee5cec4e4422d58b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 824546e661..70577b74b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -19,7 +19,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
-SRCREV_meta ?= "2d12860e7692327b02ec4d707585fe101b8c4d38"
+SRCREV_meta ?= "a5384458147b581e6beac32ee5cec4e4422d58b1"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 2964cf6000..26e02541b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
 SRCREV_machine:qemux86-64 ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
 SRCREV_machine ?= "8b43828d68f73df49a408e5bba88eade55b0ca09"
-SRCREV_meta ?= "2d12860e7692327b02ec4d707585fe101b8c4d38"
+SRCREV_meta ?= "a5384458147b581e6beac32ee5cec4e4422d58b1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


