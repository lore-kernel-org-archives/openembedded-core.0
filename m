Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15D2C4450B
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1951.1783701428406199027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1/WL8pRu;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso8948635e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701427; x=1784306227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uSAzx0pqCDNWGeTM1PUC8935CV+Y6g65IUJ2sjj1ZQU=;
        b=1/WL8pRugdnEnLVa7zGsy8IWnYGo9LDXPsw3MlkcDiMv86kvnoGczJ5ucPLqNwRCWU
         HgFBYAXO8in/vkZxtoDPzxerhiyNf5WvAqXHguILjAwIqI4jnZZd8oB3j3SrVPZRNCJ9
         j2KNOh9RPDANCAbJ5yjVPSfPUN52+TTTMykSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701427; x=1784306227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uSAzx0pqCDNWGeTM1PUC8935CV+Y6g65IUJ2sjj1ZQU=;
        b=m3QNiDTPI9U6sKtYRIGGji0qjBh+Qf8vEsVMV8DInf0Az4p4wGrgfwu2rZrbXCyjBM
         Q/5ELoCC4nOEKdjnDkP9RD81qTWp+0BhVIbyGNbTCPjG9Uoy19FeCGgpTgnA1S1DOkCN
         yzWiKQICLTZTJM1nLCCMVBVaUDcC+qwg7ogdgHAHcLHcSYBAVPQw60xfXrTCxJ6+o2yU
         DJBCRxFquFIovb1HNv9Q4D2Y8D5zjgZ2ph1Y6aMOloQkUKh3Js3CMDw7j9JbKYPqfdqp
         jlvtb79om9/TGC7aCF+Ilo0tuxKiRlVxa7IygS6ZH7eSvVNiaiuIO+5ZrUmYTSXshMYV
         8F4w==
X-Gm-Message-State: AOJu0YyRYOqdER6FljwFCy6NJu2rtZGjv5r5VCrYWIuNeYi/fRCMO2+2
	JEK1ef2u8SzYLxDbFNq9gkY9nB/5lGJH7HhMz3Boqltc6OOWbLcI+w8Oun7q7xRka0i9jIiyTpk
	waPd/p08=
X-Gm-Gg: AfdE7cn6KCuVFOrdodDBmgFdND1Fw5WUbWsAXnniJ65jYXD2MXS6r2gx5R5mxkKFWAX
	slcdCtzbGyiVoa7xwuU3+oMQebw8C33BG/z6nTqKRKFGN7x+oPLCYLtFjFdYtxjEXhAEFXe+Z5h
	0nDq9ZA//lROisHdhamtspazrxRE9fo58g3Pn9wLJ9YgCgj45m9IfikuOmpGiPl5F5qyCcKxnQH
	+A037UzxI/8J3mewXRtBaRllePd9HNzkRQUWl/AMSDu3UN8do8omk39vTCdqJXY+rMjhTsu4ANB
	QUIq6ELns/FLG1HxwyIyuz384xlZPa/aILGYP6QaFhpa77acFP8P3b3qfYwH8L/W9QEVFA0Zn8R
	0om9IUsTlv2Jh3GQdwIg+TdBEN86g9X4nOlKiERNpH6McgEM2IaA58FxhZ+i+XrnwxVVrougZ4U
	iBmIPpWT9en9XtFXq2hoQkEul6+Ake+HWbCmUnuV1fHImgTuEFwEwOkYG1TEOQkOcXXDWhfPWNS
	IgMKTHcp8zlEnKerMs=
X-Received: by 2002:a05:600c:821a:b0:493:a570:df7d with SMTP id 5b1f17b1804b1-493e68bef51mr125319625e9.20.1783701426546;
        Fri, 10 Jul 2026 09:37:06 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/18] opensbi: don't override ELFFLAGS, silence ldflags QA for bare-metal ELFs
Date: Fri, 10 Jul 2026 18:36:23 +0200
Message-ID: <c92533ac17d9f9035abf9e2c6ac2d36025ea5677.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240669

From: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>

opensbi_1.8.1.bb passes ELFFLAGS="${LDFLAGS}" via EXTRA_OEMAKE. Being a
make command-line assignment, it overrides OpenSBI's in-Makefile
"ELFFLAGS +=" and drops the mandatory firmware link flags:

  -Wl,--gc-sections
  -Wl,--exclude-libs,ALL
  -Wl,--build-id=none
  -Wl,--no-dynamic-linker -Wl,-pie

Losing --gc-sections retains unused fdt_*/atomic_* code and grows .text;
losing -pie/--no-dynamic-linker drops the M-mode firmware hardening.

The distro LDFLAGS were not reaching the link regardless: OpenSBI
rebuilds CC from CROSS_COMPILE (Makefile: CC = $(CROSS_COMPILE)gcc), so
oe's CC and its TARGET_CC_ARCH += "${LDFLAGS}" do not apply, and passing
them via ELFFLAGS was the only path in. They are also dynamic-linking
flags with no role in bare-metal firmware, so drop the override;
REPRODUCIBLE=y and CROSS_COMPILE stay.

Removing it re-exposes an ldflags QA warning that the injected
--hash-style=gnu had been satisfying. These firmware ELFs are bare-metal
M-mode binaries (--build-id=none, no dynamic linker) that legitimately
carry no GNU_HASH, so add INSANE_SKIP += "ldflags", as linux-firmware
does.

Tested on oe-core master (DISTRO=nodistro, MACHINE=qemuriscv64) via the
oe-nodistro-master bitbake-setup config:

  bitbake opensbi
  grep -c gc-sections .../opensbi/*/temp/log.do_compile   # 0 -> 4

Before, the fw_jump.elf link carries only the LDFLAGS content (-Wl,-O1,
--hash-style=gnu, --as-needed, -z relro/now) with OpenSBI's flags absent,
and do_package_qa reports ldflags errors on all three firmware ELFs.
After, the link carries OpenSBI's flags (-Wl,--gc-sections,
--exclude-libs,ALL, --build-id=none, --no-dynamic-linker, -pie) and QA
passes. On a single-SoC defconfig, restoring --gc-sections roughly
halves fw_jump.bin.

Fixes: 9f95660886db ("opensbi: Pass CROSS_COMPILE and REPRODUCIBLE flags")

AI-Generated: Uses Cursor

Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9bf56df6decf3b0a07e5a0814f4ad2d6317568f9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/opensbi/opensbi_1.8.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
index 0a9652c2831..255bab2b58f 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
@@ -16,7 +16,7 @@ TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 RISCV_SBI_FW_TEXT_START ??= "0x80000000"
-EXTRA_OEMAKE += "REPRODUCIBLE=y CROSS_COMPILE=${HOST_PREFIX} ELFFLAGS="${LDFLAGS}" PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_TEXT_START=${RISCV_SBI_FW_TEXT_START}"
+EXTRA_OEMAKE += "REPRODUCIBLE=y CROSS_COMPILE=${HOST_PREFIX} PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_TEXT_START=${RISCV_SBI_FW_TEXT_START}"
 EXTRA_OEMAKE:append:toolchain-clang = " LLVM=y"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE:append = " ${@riscv_get_extra_oemake_image(d)}"
@@ -50,4 +50,8 @@ FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
 FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
+# OpenSBI firmware ELFs are bare-metal M-mode binaries (--build-id=none,
+# no dynamic linker) and intentionally do not carry GNU_HASH.
+INSANE_SKIP += "ldflags"
+
 COMPATIBLE_HOST = "(riscv64|riscv32).*"

