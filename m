Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBA3C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 23:37:44 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.3164.1644881863513307130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TFxDwgGX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso822249pjt.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 15:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFT19J5JkRtgD6Lr5oQSDvUPmoadyepPMV1eJjHDD/0=;
        b=TFxDwgGXP7CMKyTeoci6jd6rVUvPzzu9Qv2Dw2IqL1Mk8zpglBJe0eqYYmoeCRvDL3
         sFmKSrK5TIHncrDUUXAtcDFXIWIkgdGZknp+q1FkpsZz2e4/HHzNRG3/B2Nmmxgi6LEk
         7Z3e3Sh89rB5uqa+rU05hrfzZjlie8mnkwrZKnnZIvFi8rF9lmummz/KYLy8V3UVmKlg
         bRoHO//uZ8W6WvMJJrcmOebJH7RS46iNGzy5vgylgu11sgAjwZ65eauGYUreAo9IitdS
         nVkPoHhLT6VsdhpATx3iq3cGZZYkyFLJ21XNIWPPZD0zzf9DPVJUiU6Pn4ygF5r17TOV
         lbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zFT19J5JkRtgD6Lr5oQSDvUPmoadyepPMV1eJjHDD/0=;
        b=bzmEAUC0HocFYlHIaloG7BwlLGjiFK1glh3tac45+935ZbXIOi9T5sB4EWkBD7fa1Y
         bf/yzsJRRYm+szZhsxbT13OlMzhzFLqc8/Ka3il0Bc1ksPOKcBgQYuiw+gqhFAjYCQno
         hDnbE5qP8aIczYiEhUAD0vKVG7qAAcKA8QMeTWKM5Van3rgCbw0DE8cj2Fm3uG/KGu3B
         osgGW0w69mTmI53lp84kEliXXjRX/o47ADcaHLxBxtsNiFe9eJgnJOtbqazJJxcOiCFz
         uTifXpRSnsd1YOC0D6VyKXAbzwrBdl5iCu0A0rXtT9d5iT7t7ZC0/0wmA62QJ2bqrLsq
         dXUg==
X-Gm-Message-State: AOAM531QLR/ZPf0K0bHCMn63S7UbGSt8QExKan3HjHC4ccr3ugQsHmmk
	9EB6ZM7WhoniSzOdpKsBLnHoEfmkKhRq9Q==
X-Google-Smtp-Source: 
 ABdhPJxouYXkHfn7+askB/6OVdJvlHl8cnpFRSIDbBVBuq5i8WHtsj6WYoKebe4tuBN6ocZZmlErJw==
X-Received: by 2002:a17:902:dccd:: with SMTP id
 t13mr1216903pll.65.1644881862595;
        Mon, 14 Feb 2022 15:37:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 k9sm38939368pfc.157.2022.02.14.15.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 15:37:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/2] opensbi: Upgrade to 1.0
Date: Mon, 14 Feb 2022 15:37:38 -0800
Message-Id: <20220214233739.3219186-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 23:37:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161733

Drop OE specific patch to shunt march/mabi
this seems to work fine now.

unset CLANG_TARGET so it can compile with OE produced clang toolchain
which provides --target itself

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 ...Makefile-Don-t-specify-mabi-or-march.patch | 36 -------------------
 .../{opensbi_0.9.bb => opensbi_1.0.bb}        |  5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
 rename meta/recipes-bsp/opensbi/{opensbi_0.9.bb => opensbi_1.0.bb} (91%)

diff --git a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
deleted file mode 100644
index d2a8048e87e..00000000000
--- a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From fe9860fd85e49a75bef545e5d9914070491e8002 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 15 Feb 2019 14:57:41 -0800
-Subject: [PATCH] Makefile: Don't specify mabi or march
-
-To avoid
-    can't link double-float modules with soft-float modules
-errors when building 32-bit openSBI don't specify mabi or march.
-
-Upstream-Status: Inappropriate [Fixes a 32-bit OE flow bug]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
----
- Makefile | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ccf8ea3..69e5b38 100644
---- a/Makefile
-+++ b/Makefile
-@@ -169,7 +169,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
- CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
- CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- CFLAGS		+=	-mno-save-restore -mstrict-align
--CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
- CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
- CFLAGS		+=	$(GENFLAGS)
- CFLAGS		+=	$(platform-cflags-y)
-@@ -183,7 +182,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
- ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
- ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- ASFLAGS		+=	-mno-save-restore -mstrict-align
--ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
- ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
- ASFLAGS		+=	$(GENFLAGS)
- ASFLAGS		+=	$(platform-asflags-y)
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_1.0.bb
similarity index 91%
rename from meta/recipes-bsp/opensbi/opensbi_0.9.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.0.bb
index 1956fbf9ffc..8430f62543a 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.0.bb
@@ -8,14 +8,13 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "234ed8e427f4d92903123199f6590d144e0d9351"
+SRCREV = "ce4c0188d96b2c20c2e08d24646a5e517fe15a4b"
 SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
-           file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
           "
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n"
+EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n CLANG_TARGET= "
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_fdt(d)}"
-- 
2.35.1


