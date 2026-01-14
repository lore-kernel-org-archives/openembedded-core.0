Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D054ED38FF6
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:26 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15752.1768411460539193157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=blcaB14O;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2ea2b9631so4402585a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411459; x=1769016259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDpArUwrpZQ6DMSsHwk2ZRpl/S7jLCl0BbhbLZCW+hc=;
        b=blcaB14OR15YBqTZe+MbzVoKGUr3xXHpRDUZqWIOGobzRQU4G3fp19vtcsFm+sKft5
         /p3u+tmIxDYsqEptHPZu6zOCqCaxY+DC2Z/pfdNLTMfjf0CFhSWF+49/CA+xwUQ0+E0D
         KS6xF68mt9K8DMEDMXWyAcfOpNsqO02iidtI4Q1h3spihEA+3j9KkDLD6cLqdGOVmqGP
         foUykBAr0Cc3udw671DA7hCku4QybFyw67AS5ElbNeAFGr7rSrUF9IwjNk8ztJq80775
         9QBrb/JTw+EnkowjaxTlcidn0MGtF2y++KiR/t8kFu7WDh4d3BJWBz7bLbV6LJMNAN01
         7ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411459; x=1769016259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDpArUwrpZQ6DMSsHwk2ZRpl/S7jLCl0BbhbLZCW+hc=;
        b=gH2eUJhujNY8pjUD62wl3WcjwOV0HayyN3Kjmz6oQ5A/Ak4ENRNbXu0Y6M3ttNvftg
         8cFNWnD32AEY03zwhDhAaEPBFxK3OzHfRmdMM6k0SJlV4+x9mziXhqePYv5ggCEnJMdV
         inEZgbRhQjYhuSe3BGIRZTUvlnYjnJVJSX8O5mZ2ROaO0uAqKQPvf2kYG+ijKWxe191l
         GsQJIfggfaxxcYlAU+Gx3l1fxsFH37aVOW6AIvKyWrgx3dewGz0/5POPb/fV8X0GpV9x
         6z5UlahXAV5aZmF/LP2PrfjZpeANGNNuAW+nZCoyUw+TrGcUW7mEh729knnp1dZR2Iri
         WnyQ==
X-Gm-Message-State: AOJu0Yzue1UScpB+OexthcFEOM/6TKSrcRpnDeIfC18DVa5ZJvewPaOj
	TJB7+Cnx1Si6zq/NQjlbSRhvjOxqvO+wzNUpgf3z+BxWctt4yVSLL1Ja
X-Gm-Gg: AY/fxX7XmSzTgtR5J3soW5lNtOO17/2/uCJP6YTGU6ao28E61wsvbuY2JITY3kdkvNa
	eaCQuWwjgz6JuU6xgUXkkRpPs/2Yrl4HQz37jXfjh37Qx21NF/GkX8W6l9m8CwCB4FURk52xXDZ
	dWMnD0GI8XP2lUw0JUvnr5oz1isnTJF03exWQ4AAipXO7rGB92B5CiaSl32KvK/ca7bMAI+n75e
	CPI0Ia6XcDgibgv9Yhr+8t+lmOEKzkrbyN/c6OdNcb1fSU+CdulmUZgs1vxBgBIXWPCXBfXi5gP
	HgciiKJZqJWg8QlyNGvN8tJJfo3Dc/U4ukdT96jEmXpRJa/lZM9IJxBBcg5ctvHq63dNq0CUrT3
	RdxnfCNyODkewPPmztpLt7cfk9UZfHCWv1wyQ4HnRQv9gFoOqrOPJgoTUAF1R873KaGXzBFdZui
	1TeT0pqWP01YVZXi3Tm8LiFmAtSfAvl1tgScLsrXbZrvxAHSWudoPLRTgCgVNzdTGqVkp2OKHk3
	UVwR3RyA+VSnOg=
X-Received: by 2002:a05:620a:40cc:b0:8b2:2066:ffca with SMTP id af79cd13be357-8c52fbffe85mr471228885a.82.1768411459351;
        Wed, 14 Jan 2026 09:24:19 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0d9fsm197711385a.45.2026.01.14.09.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:24:18 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 06/06] linux-yocto/6.18: arm: fix defconfig configuration audit warning
Date: Wed, 14 Jan 2026 12:24:06 -0500
Message-ID: <20260114172406.2271015-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
References: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229362

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: arm64: defconfig: remove SLIM_QCOM_CTRL
    Date: Tue, 23 Dec 2025 16:06:45 +0200

    It has been removed by commit
    7cbba32a2d62 ("slimbus: qcom: remove unused qcom controller driver")

    Fixes: 7cbba32a2d62 ("slimbus: qcom: remove unused qcom controller driver")
    Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.18.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 91b5249ddc..76eb891a04 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "51e05e8d4f25e9960897b387c5f6d6af2145ff47"
+SRCREV_machine ?= "878f4a23dbbd21b2eaa97cd82be39db3131f26e3"
 SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 447ca1b18f..6904ce5f56 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
 SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 4f68e679dc..599a3d13b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "57815a771f1c597e9cb14d2ef20b07d70008c7ec"
-SRCREV_machine:qemuarm64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
-SRCREV_machine:qemuloongarch64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine:qemuarm ?= "9e147c72113ebc9bc50a4709953834da3c7f76dc"
+SRCREV_machine:qemuarm64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
+SRCREV_machine:qemuloongarch64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
-SRCREV_machine:qemuriscv64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
-SRCREV_machine:qemuriscv32 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
-SRCREV_machine:qemux86 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
-SRCREV_machine:qemux86-64 ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine:qemuppc ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
+SRCREV_machine:qemuriscv64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
+SRCREV_machine:qemuriscv32 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
+SRCREV_machine:qemux86 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
+SRCREV_machine:qemux86-64 ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "c66fba07b7dd83d583b6c9ea0b007b23e4e2a034"
+SRCREV_machine ?= "0d1b47da567fe4d6ff80c562b706e7a9232d3553"
 SRCREV_meta ?= "d8bded29848649b362d0376692bd86a5f6ebc7e0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.43.0


