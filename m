Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EDACA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:04 +0000 (UTC)
Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18022.1790786301566978870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=jsVcHYE3;
 spf=pass (domain: baylibre.com, ip: 74.125.230.232, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5f63c54eso362555385a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786300; x=1791391100; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLZPHU0sVW+EVRzqHe9tEq77+Z8GBwAUA0ZmeTqqwo8=;
        b=jsVcHYE3fjWELZwwSwBT7CdLhRU/uMZxQuw9yGQ7utHNAySbWKDPTdiHssqOGJhH34
         BRQRNp+F8K9lVX2nP7KTrHIdmtQsMoUjSDImoRtFZbFercnk6JAUJiet2sudEJ0AmDsv
         zNa/VqAVMSB6FhH41mTD2nyWmaPYqE+eUk+HR44UUOMQhkGD6jxlVpT6y+ulam0RZc4B
         UGrT/8x3GOtEJbNxUvBsfTIexL0A37Euiscnpwpq6y4Rx+/CYaXjeQ6bphcpzxhvtUtr
         DO5zDL9+bP5+jgkOOyaRVrrS4q0c8GsrD1F9H10Svw141y5dXlAMG7GOSt0hiVYJeox4
         0Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786300; x=1791391100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLZPHU0sVW+EVRzqHe9tEq77+Z8GBwAUA0ZmeTqqwo8=;
        b=MRG4Pa/gzJl37WBaPAokwW2aBLM6kE7hVEdgMiC+jX8ld7Yju5HUSGHz/Fyg/nieDA
         tQsnllSGKmUc4yvO0JAb8X0IHQr65g5s8bW2leaPJXky8iL/bEJFHulKb7Zy52XJIekV
         xMHAA7jgm1BGT7xMJhoqmTsNyradp4CBtVZD9ow4vCMdFnXvDVwc+1cGI9mM+ZZRjJlT
         rTeuWX3iUmBnPTK7i0NXPdQ1c5OiqKG2pp3rtpGpDQsCVEkYBgCsqyR3mYAxLKAv2g98
         Hbbd+lKy6sZM+G0CVoqjaOJ1ICaO5NTl1r1y7CSdzBaWRfrx21TuEtqg3J3vPkiwnLiR
         vq1g==
X-Gm-Message-State: AFuF++knTE7DNd8DYoWfE7nxAc/EbtYKUUh5fXKxLRhkvTRoERb1lZb+
	18352KYgbk2duli+knu/AZM6IzgFelq3ioD4thWckG9KubrClN/ZuTKjgX+iZRCmOAY=
X-Gm-Gg: AYBFou0ONDAHdhxwiVlpV4JbHEGibrzRrHqG8fJW14XX0/CsYZGjrPNlFrpe40oPyui
	xpJmzMk8w/XC+fsuJqy3udJGTx5c7ZVSibMbu/Go/L6z06DPwOcSUpm1a3G7BK0NQFwI6t/rQyn
	6OjFMtv8yuWYCn/yg8bZIoKhVaVV7hEVC/Kb157aDrrF8dhCdDdpM/Kg3eEf1okU/JILYemznrj
	72krx4LDyO6Nha+m17a1aYa3M8XLFo6dJe1hpePK2gcKe3D7EuyxihuA6w/44S/CLxNRRF18FSY
	wUffy482tMX4ugywpBS30lyHSwkh42SNOGPNE1W3f4tVHROVWZhWSaV+tA4rX5m9cECA4i0k7bc
	fgbdV4ngEm3hY37Vatbm+z1zGyfwzc1CmAudQXThUnDmyWJdxYFXEXUSp8G2/W+OOLLxe1WvqUu
	HtnT0ZtnWzi+NXLvGYtJYbWyUIQQ3jH7BpvKagFx29BsrFiblSPwZw4/WBJEoElQVrOs4tahy28
	qLnp0pG71PY7zQ35sM/r4wpdApS8w9SnEqiiOUKx3E=
X-Received: by 2002:a05:620a:43a9:b0:93c:771e:b672 with SMTP id af79cd13be357-93ca9899d69mr356359485a.54.1790786300326;
        Wed, 30 Sep 2026 09:38:20 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:19 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:07 -0400
Subject: [OE-core][PATCH RFC v2 03/19] arch-riscv.inc: add missing RVA20 extensions
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-3-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246983

There are currently many RISC-V ISA extensions missing from the
arch-riscv.inc file, even some which are required by core 'riscv64gc'
extensions. For example:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$ riscv64-linux-gnu-gcc -march=rv64imafdc_zicsr_zifencei -mabi=lp64d -Q --help=target | grep rv64
|  -march=                               rv64imafdc_zicsr_zifencei_zmmul_zaamo_zalrsc_zca_zcd

versus:

|TUNE_FEATURES        = "rv 64 i m a f d c zicsr zifencei"

which is missing zmmul, zaamo, zalrsc, zca, and zcd. There are even more
absent when comparing against the official RVA20 spec - passing
'-march=rva20u64' to gcc and checking the ISA extension string shows:

|tgamblin@alchemist ~ $ riscv64-linux-gnu-gcc -march=rva20u64 -mabi=lp64d -Q --help=target | grep rv64
|  -march=                     		rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd

Add the following extensions to arch-riscv.inc, along with their
conditional inclusions required:

- za128rs
- zaamo (required by 'a')
- zalrsc (required by 'a')
- zca (required by 'c')
- zcd
- ziccamoa
- ziccif
- zicclsm
- ziccrse
- zicntr
- zmmul (required by 'm')

We also need to change the extension ordering in the file, so that they
appear in the same order as the compiler expects.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 46 +++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 6f9b74974d..0f12059159 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -86,14 +86,58 @@ TUNEVALID[zicbom] = "Cache-block management extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 
+TUNEVALID[ziccamoa] = "PMA guarantees for A-extension atomics extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
+
+TUNEVALID[ziccif] = "Patching instructions at run time extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
+
+TUNEVALID[zicclsm] = "Software that assumes misaligned access works extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
+
+TUNEVALID[ziccrse] = "Guarantees LR/SC forward progress extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
+
+TUNEVALID[zicntr] = "Cycle and instruction counting for profiling extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
+
 TUNEVALID[zicsr] = "Control and status register access extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 
-TUNEVALID[zifencei] = "Instruction-fetch fence extension"
+TUNEVALID[zifencei] = "Instruction-fetch fence extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+TUNEVALID[zmmul] = "Cheaper M subset (mul only) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
+
+TUNEVALID[za128rs] = "Reservation set granularity (128-byte) extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+
+TUNEVALID[zaamo] = "Atomic read-modify-write memory operations extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
+
+TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
+
+TUNEVALID[zca] = "Compressed base integer ops extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "c zca", "_zca", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
+
+TUNEVALID[zcd] = "16-bit encodings for 64-bit FP extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
+
 TUNEVALID[zba] = "Address bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"

-- 
2.55.0


