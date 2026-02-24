Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99355F357AC
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21291.1771943140377080884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rF/SWwVH;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so34027625e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943138; x=1772547938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lkoJ1SXV6Z7/IMOb5m6l9Q0RbWcMvO40Yk710t7IkE=;
        b=rF/SWwVHv4wi+XBz1SJfMGiU2X91g7Wt5PhVr5vuF6FeZLbb82BzS0s99Oxa7g4EHS
         8I/cEOmNe9TS0D0ovGwvrKXOqGcP9ifpLGmk/HCTwgLYqL7T5VTKsxSPrvaLHsPa4Jjc
         vJCWVPHMxg99Y4fqsF+XED/lf+Mo83Lsgs3uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943138; x=1772547938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8lkoJ1SXV6Z7/IMOb5m6l9Q0RbWcMvO40Yk710t7IkE=;
        b=aVyCs8IKuKmV+FWh69uMQiaMXP7gXWsY5zX+RhS7CY90MHC9TC6zoDPukh9LPiuT2R
         6LqQmVP9Wua6ZP0m5kFB6jIyJTTkF+nXc2FTVhZhnuSLaEd6t4JPUXMZaZrtZPzXJ6Ne
         iQomLJCaPcuFBqhqCiHfWk8da/NbyzRhoge7o27q25mGNr5BdV2fY+zgnbCC8wR1aYmk
         m9apPULDWoUzmcKEBZeJkR9L2t9kCHCGShnxAL+Pih88OO/RYeIGlHjZxHYvmMEK5KRl
         XsO/eHiWx9wl+/N80v8IkLA1fphpYuMLXoze0Z9Czx3PU4KwpSt2ZxwLuyT1+pJ5Oy3S
         hc7Q==
X-Gm-Message-State: AOJu0YyM0bi/EGOvDZdfNHYeRcd5sU5WMUCWJ4fBQvaF+zkXYmZpJlZ+
	/O+BnAnUnkmPQhTjOhPW0BG/ogKRlCPtNnjjt85MKCSjiLxS2mH7HI65/4cylLxpO9LOisAVIgn
	nlmBr
X-Gm-Gg: AZuq6aJ0Nrcx1WsgAZfg9qr/rGetDMO6DcmfFq+EHBZZwMq6KpXz0ffT891mF7rgLqx
	W9nssezFpIiNnTVhBfzJp9nlRvWSM1lLli4Q/h/mgHxjnKzkD6t/B6SSqzoIcWyNtP6x8rTz3TF
	SJee7TJScEaSNQZt2+XVansyYpEXDxH78dw+CpiB3wKKwpLj+4fdXjfsT9tYPOwvphHK2FG8IDw
	trIa+RaHw2e3Vg6IdypPpIVrhdRCg6Ldck16OsNs/W6oJlepMovfxdtgccj5Hq9JJQKWOJcYAcE
	PH5+vYHQOqyK0kcAamk28R4V7p8xOFCNuXbIm4pMRQSnFY7WKRvPQoBITUnsDS8ZD2jdQOwkE6p
	Rggbf7hdbkfQbCjKKGHlOedb3HWBXbeyiyO365ayJyyimXNi0VcdtJ/xdIduOdOiktF4A2jlbU1
	c0KivOGGY7PLHEUIJeV9L9Ajf4MltBTWtiMYQVhmCUdOIOYncE6bjbyE8J/K8jMDrUFwH+9PQho
	matDYL15AFbasAM4zuRadypyK31nT84Lw==
X-Received: by 2002:a05:600c:1d1c:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-483a95eb45emr223636955e9.18.1771943138333;
        Tue, 24 Feb 2026 06:25:38 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 38/38] u-boot: move CVE patch out of u-boot-common.inc
Date: Tue, 24 Feb 2026 15:24:30 +0100
Message-ID: <fd883ff6432946d23d923a9be1cd2cb1f001c732.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231804

From: Scott Murray <scott.murray@konsulko.com>

Commit f5b980ad added CVE-2024-42040.patch to the base U-Boot
SRC_URI in u-boot-common.inc as opposed to adding it in the
u-boot recipe where all the other patch additions are. This
breaks at least one downstream BSP that reuses u-boot-common.inc
(meta-sifive), so move that patch addition to the recipe file
with all the others.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 4 +---
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 7a634206426..d366f103982 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,9 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
-           file://CVE-2024-42040.patch \
-"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 0ff2477c394..f0ea3ef9e07 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -11,6 +11,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2022-30790.patch \
                    file://CVE-2022-2347_1.patch \
                    file://CVE-2022-2347_2.patch \
+                   file://CVE-2024-42040.patch \
                    file://CVE-2024-57254.patch \
                    file://CVE-2024-57255.patch \
                    file://CVE-2024-57256.patch \

