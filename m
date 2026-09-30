Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36514CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:24 +0000 (UTC)
Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18098.1790786306048184897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=bn2TrOLb;
 spf=pass (domain: baylibre.com, ip: 74.125.230.231, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93cb545be7fso7001785a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786305; x=1791391105; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5cmAMakQVH2+0XZcv737FIHzbxDRM0mC3Zii4Sk2pc=;
        b=bn2TrOLbtpgwvpfPoiO/a6YqDplIyT22FY0ZWFREuoBrpTcRHb659xiDUPyPRx9tW+
         dPY72b0JsDjNGhqoaSOQ9YxSde+iY7bBvoqd8iZR3OfTXQVDPoUBhSUyLnqIZQohfIwp
         yoJQS904LbRkE2ciucOOw0K+s15Jfy+6otapwrAiZgx3F88xhH9tesi1GuFrRZWqmVrh
         dR5ckjqocuZlWoPea/scZeZdF19se26zzr6NJwtl0co+YMml7di29mO8go4j399/FEEs
         Dtx7oIMJA60IWIDK3pPQqkfhRCvaYGiFnu+QdcLS5NXJ8CymoHJFOq/H3bpBaa4E7nLg
         JqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786305; x=1791391105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5cmAMakQVH2+0XZcv737FIHzbxDRM0mC3Zii4Sk2pc=;
        b=Dop8yVLUmDn3iz+/vkzD1tdLS8dgcHjDB94ih3LniP1dXv8MTAnkEgA1jp5TZux2Oq
         Igay8fLz5PX16BdwguSQgEUs8ibCH30nfvGHK3PA+N4b+kIuYf+IWTQiXrGIcKRaZbdl
         mIRdnK4SmH88fdBUrqBCL5ueYMFSwyxTkjZ/9YYiPJ7+OIlxLuiD5iIsHV99ZGjYq3IZ
         VYVT/j6a2w82CBh1zIdpCICUMsyFf4jLeKXUB9EN9SagpptatT75u5HVfPZYV7MRcWqz
         UYGkIxQRo/nE5j6WGPsrVm0CWic8PLvA0YwKh0atOWQsnFdxQLeaBVb2DIZ7nSft0WB5
         0VOQ==
X-Gm-Message-State: AFuF++nM+1Vvjq2C5tBC/nCrlPMCOAjMRqWsDbrtb9OvUxQhsbBjpIVW
	vsL8Y0xiGKHHUwcBTx44c2HZ5MK60O02kjI4VuH2dG7+I/8rbORxBq2Ii3JmPWVtwlN/2IKw+lt
	iyZb+
X-Gm-Gg: AYBFou1FX9yQ1o8UhwMFnWpgOJb9rIZHV1xktE3u1yLuv6JZdEN28yTakyZT3L2aI7e
	XwKihQeWMyXvgntII6FfFlIdr8lAZFq6YfJQob8/b0QnS40zP0C6mOx0cM6neNaw/n2zEHlJWJa
	vG1yiGE9D1ZQI7a7OmfU7QgcDOXipFSLsT54aLSR4WQv1IMaxq6VxWM3dcB2QODOT20J/oKbz5N
	le3H/M91FudBorgNExpAjXLs4a2VXfmtFLKQDXJ/r7aGRN5InXOgs3hNlVpzgl+OQ2VdkypODiG
	y2HMQe1rjueVj23ClRH6BmMEb0wRdYcPV+bzLfPC2kQN5S6+dQA//XEngWZHAZYbMSaEvX0cRuS
	InPrDg4KErUkYhNQhBt7nVpXImrmvwX9bmcIo2qAEVvXjfyBZPXEyzKfSI2r86tXuwV9Rv+9CTu
	IuA2LQmb1gxMMbgA0vuIH7Ml9Kn/xU3vVDlqIl8zPrcijsJxA4C1q5yucn5jMH5MLspxiHC3n3h
	zasB4jJJdRDsxv0KxmDdZDBJ+iiSX5hHe6Omm3YCjfEYB3XeMnc+A==
X-Received: by 2002:a05:620a:2916:b0:93b:c58c:d3be with SMTP id af79cd13be357-93cac18e002mr286884885a.37.1790786304866;
        Wed, 30 Sep 2026 09:38:24 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:24 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:10 -0400
Subject: [OE-core][PATCH RFC v2 06/19] arch-riscv.inc: add rva22u64 extensions
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-6-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246986

gcc reports the following extension string for '-march=rva22u64':

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/layers/openembedded-core (master)$ riscv64-linux-gnu-gcc -march=rva22u64 -mabi=lp64d -Q --help=target | grep rv64
|  -march=                               rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt

Add the following extensions needed to complete the profile:

- za64rs
- zfhmin
- zic64b
- zicbop
- zicboz
- zihintpause
- zkt

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 0f12059159..352d6bd878 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -82,10 +82,22 @@ TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 
 # Now the special Z extensions
+TUNEVALID[zic64b] = "Cache block size is 64 bytes extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
+
 TUNEVALID[zicbom] = "Cache-block management extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 
+TUNEVALID[zicbop] = "Cache-block prefetching extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
+
+TUNEVALID[zicboz] = "Cache-block zeroing extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
+
 TUNEVALID[ziccamoa] = "PMA guarantees for A-extension atomics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
@@ -114,6 +126,10 @@ TUNEVALID[zifencei] = "Instruction-fetch fence extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+TUNEVALID[zihintpause] = "Pause hint extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
+
 TUNEVALID[zmmul] = "Cheaper M subset (mul only) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m zmmul", "_zmmul", "", d)}"
@@ -122,6 +138,10 @@ TUNEVALID[za128rs] = "Reservation set granularity (128-byte) extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
 
+TUNEVALID[za64rs] = "Reservation set size of at most 64 bytes extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+
 TUNEVALID[zaamo] = "Atomic read-modify-write memory operations extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zaamo", "_zaamo", "", d)}"
@@ -130,6 +150,10 @@ TUNEVALID[zalrsc] = "Extended LR/SC semantics extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "a zalrsc", "_zalrsc", "", d)}"
 
+TUNEVALID[zfhmin] = "Minimal half-precision floating point extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
+
 TUNEVALID[zca] = "Compressed base integer ops extension."
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "c zca", "_zca", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "c zca", "_zca", "", d)}"
@@ -154,6 +178,10 @@ TUNEVALID[zbs] = "Single-bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
 
+TUNEVALID[zkt] = "Data-independent execution latency extension."
+TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
+
 # Construct TUNE_CCARGS
 # This should result in a CCARG similar to:
 #   -march=rv32imac -mabi=ilp32

-- 
2.55.0


