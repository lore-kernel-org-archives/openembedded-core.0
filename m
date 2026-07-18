Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3DDC44528
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2524.1784364808265460958
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q3w2WGIy;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso50628935e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364806; x=1784969606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=szAMAxG94/ppw83lu1qdgRmn24yOFQ2P/B/5Ee/NAcE=;
        b=q3w2WGIyETFiCBUVandjfZ65u/PgEeWj+Oo44ryj6j7Ra5W7TQ0Ts8U6sO8SYcfXqx
         UW2v6uH8vqYDODiYX6cI1JsEpYGHKXxvZXggWMSVsXBoClVaLEMw8ctfOo+8QJ5DABJU
         L78Rv2c2pprstWZukfdJLqx1KcrpovEMihUPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364806; x=1784969606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=szAMAxG94/ppw83lu1qdgRmn24yOFQ2P/B/5Ee/NAcE=;
        b=jYw0CQxGGu+GhXikxxRbx/qnCHXpNtdDj5IorucshnERy/g6gxAgkrTCDCn54Chuu4
         T5qXut/KfdGLA8/bOQRZuIT+SvebGWsJ3AOPtuOKFkQNdyGgcYzGQ16fCfLxQbYVaFbg
         tZ8BRxzJw2Q2YQbt9CPDkhEupMyjdPq3+O4h5AwnE+50vYQ3gXiVl/sezboR0Je2rwq7
         1RzaRoJJSbRHLbcgD9PmbiBBiylm9spnJ1E6eXvSk3AFYGlKTqqaeCh0z74EYTCTccGC
         PTsN8027JlNxHO5cZsYka5EezyBTYgpI9wCnnlzdBprujJcj/ry3+9v7R0MsWTwSJlJJ
         ndkg==
X-Gm-Message-State: AOJu0YzL/Ikz0V7FiuJV2U3OcZpvKUAyRo+Cfnv9VkDI16oGj55FzmqS
	8Jd1dacHek3jfdV47PwvEgW/Z3DXWg3qGRcfDvApT/3HiKiucKjhn5TNE7xNGWpN4BfUtOzG8aJ
	chWK+O8U=
X-Gm-Gg: AfdE7cmgK96Tjz+yNTy5UzC076qhkR6rR8uo8Cj+0Esqsk+wQ0f+3jIQGYDgRTdXksO
	OX2NJmFz5oOYPqR55B4QLpkqL07qBGywyLJVk62kZH9qLVtPE38LxlzAYcZcjZUfMlKlkIEBmon
	0X+823ToCTiz8XyZzPp8bEmSGP0Y772nIcd1E5desiAewtrcQqJtCbA2UBZW7BYZJVrZlnPVwDN
	LXvo+nkis2H/xFIbIVlV7TzrV4+xc03rc1bCiNdFoGh2lboyLyeJ/QLI395F50dBsVyECY2Yq1N
	glBRwvOcvyYSKX9I/7B13xlQIWWrBEH/1cxFyy0In345TEXPO/K4dm9AVwe0G7yBhxF636zFJhM
	OJYJaUpXKloxouY65jQhOpz4fcparA2b96nPdPfXEydlcHr4sJ/4ztTxYmWXP2Aq6vN4oWc1HcB
	Uld057R7bp5SOsNmMjyMf+agw3LEPJzg0LxpaldFFO8INFqHA9tEj6itj1O6lv8GSsrAa1JRVEe
	ZX46BA=
X-Received: by 2002:a05:600c:1f93:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-4954a3d64d4mr66267905e9.6.1784364806438;
        Sat, 18 Jul 2026 01:53:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed (c) ISA extension
Date: Sat, 18 Jul 2026 10:52:49 +0200
Message-ID: <c643e2d8af772182167a4ee2a65d5bcdc469934f.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241247

From: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>

SRC_URI_RISCV clears every RISC-V ISA extension via
u-boot-riscv-isa_clear.cfg, then conditionally re-adds a fragment per
TUNE_FEATURES bit: a, f, d, b/zbb, zicbom. There is no line for c, even
though u-boot-riscv-isa_c.cfg (CONFIG_RISCV_ISA_C=y) already ships in
the recipe. So for any tune with c in TUNE_FEATURES (e.g. the default
rv64gc/rv32gc tunes), compressed instructions stay disabled after the
clear fragment runs, and .config ends up with:

  # CONFIG_RISCV_ISA_C is not set

Building without RVC noticeably inflates .text: on qemuriscv64
(tune-riscv64, rv64gc), the resulting u-boot binary is 1312625 bytes of
.text without the fix vs 1082853 bytes with CONFIG_RISCV_ISA_C=y
correctly set, 229772 bytes (17.5%) smaller. On size-constrained
RISC-V SPL targets this .text growth can make the SPL .bss VMA overlap
the .text VMA and fail the link.

Add the missing "c" mapping line, mirroring the existing per-extension
entries (a, f, d, b/zbb, zicbom) already present in SRC_URI_RISCV.

Tested on oe-core master, MACHINE=qemuriscv64, via the
oe-nodistro-master bitbake-setup config:

  bitbake -c cleansstate u-boot && bitbake u-boot
  grep CONFIG_RISCV_ISA_C .../u-boot/2026.04/build/.config
  # before: "# CONFIG_RISCV_ISA_C is not set"
  # after:  "CONFIG_RISCV_ISA_C=y"

do_package_qa passes both before and after; only the ISA config and
resulting .text size change.

Fixes: cd9e7304481b ("u-boot: Overhaul UBOOT_CONFIG flow")

AI-Generated: Uses Cursor

Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fef027f2350cec0e6b890b636d2529a13f1fab58)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot_2026.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
index ac1b0b9b2b4..6d9bc126a16 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
@@ -14,6 +14,7 @@ SRC_URI_RISCV = "\
     ${@bb.utils.contains    ("TUNE_FEATURES", "a",      "file://u-boot-riscv-isa_a.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "f",      "file://u-boot-riscv-isa_f.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "d",      "file://u-boot-riscv-isa_d.cfg", "", d)} \
+    ${@bb.utils.contains    ("TUNE_FEATURES", "c",      "file://u-boot-riscv-isa_c.cfg", "", d)} \
     ${@bb.utils.contains_any("TUNE_FEATURES", "b zbb",  "file://u-boot-riscv-isa_zbb.cfg", "", d)} \
     ${@bb.utils.contains    ("TUNE_FEATURES", "zicbom", "file://u-boot-riscv-isa_zicbom.cfg", "", d)} \
     "

