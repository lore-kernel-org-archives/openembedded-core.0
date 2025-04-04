Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE30EC369A8
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.1472.1743784200611006731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jA3790k5;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b0d638e86so2565891e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784199; x=1744388999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeRlJsYwVM3cbEZg09wa/3SJvsINQ1+FMrV/BPgtirQ=;
        b=jA3790k5drKjNW8KIyKDN1g7vJAYeY24mXnliMR0XUjNXu/QJ2omcbj5GZakfwitG3
         Zmd8jfABayHJ17Eyzidy7yfE9S2W0Qct6F5laIiA54OFRnGVPreJhD19EF+WPLjqFdDo
         TMMDwDpVotfXkbMctMWmLDlZ43/A92G0Dy3R13SMqhaWANWxzMxcpqnnu6juv//Y5QqO
         zRBKr5Fop6fU0/Pid0+XCKw64t32OQ1dgQ/ljzx5yuazTkA3RVpLFvEQ7bq0IL0XbluQ
         WejR6UjzneEhsJk+pMTsJz+/wcaVZ0UeEL49eI8IJUGatp5iSn+2yDkqkqtmoSwI5sjT
         36Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784199; x=1744388999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeRlJsYwVM3cbEZg09wa/3SJvsINQ1+FMrV/BPgtirQ=;
        b=f34KL7SfvkFeXUKd6Lipk/GvaW8ZkKX0XhCALqbUkIAGZqicx5npZm/i1CbonNLJvR
         kKzo7sGQC3hAgONVr+aJD/AhYt3K2632S527AnOlplLiaTUhhMrqzMLWBb/rQJzkqRxq
         p11w8m+hi/R97NXIae5yh0Tymc2u1SQIzOkyGE63byaJmZLy7RVdtVHdH164B/24WQe0
         DqH4b/xKidTgg6TLAxRIJiaeyrHxrgP+QkL7fWKcJZcd2E04sSmuXqzX0wd7km3qhEZX
         LYhhgCO/Gm09S1V5Y7XSHRy4RINlRe7RUvfWBFaaSGyidnpwU5M28EhSXupTSiHXHodZ
         2XIg==
X-Gm-Message-State: AOJu0Yzcinh5w2GrRKQs+kjLL14AXQ/50+s8sC6HLD1HJF6zY/zk+6Lq
	JZqaPCkd+jCrYR/AKLfQbubXuuvkqQh5yAAlapa36ICPXpEqKSSa9iRVhyCDRnd2+xrAosP3Iju
	ZcfY=
X-Gm-Gg: ASbGnctLB4S2d1Uqx3//Os0JXvGug2SbolG8xVKdLcw6af8ugTTGSW8KVlDrYEFkLJG
	c+Qh50VYa5hDZCYVd175NPim5jSs51F5H959sB27vKfHdtM5NkT+NcnzguDMTQr7JbF7YODsxew
	erNp7cBuIh9MbdAhNipecu/S7IKZLS6VNGzs8P5w2cWuPLbMykSKYG1q0UH/iNpq0Mu9NLM8rbv
	Mk2OTTdKXy5EE/ePjW/wXPTF4rLYOYrWbL1vscE74g9WYdAbDdl+ckxSl76yHTbYQLtl+0ua4f/
	koXRbo3ppd6dDHDkZqBC8LABgQwm1v6e71sy1VbnOA2gUDqm3TN5J9vLzAud2nCYeumQTJLRgkk
	VQBnzr1QqNvBe/yyDFovYNA==
X-Google-Smtp-Source: AGHT+IH2Uvs3C28INtw50B4hDTcoLQDCqOCwkTwskCWvvzMHEFN3yxsWviLcpR4nggkdIORZaiiysw==
X-Received: by 2002:a05:6512:691:b0:545:93b:30c3 with SMTP id 2adb3069b0e04-54c2277878emr1126378e87.18.1743784198779;
        Fri, 04 Apr 2025 09:29:58 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:58 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 08/11] test_efi_plugin_plain_systemd-boot: don't set console
Date: Fri,  4 Apr 2025 19:29:29 +0300
Message-ID: <20250404162932.447699-9-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214359

This effectively disables the boot time serial console
so that kernel and initrd logs are not visible which
makes debugging boot failures hard. The logs are
not too verbose, around 270 lines, and can be reduced
with kernel side settings if needed. For example
"loglevel=4" on kernel command line reduces the
output to only warning messages.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks b/meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
index 2745c19e85..83f136ac15 100644
--- a/meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
+++ b/meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
@@ -2,4 +2,4 @@
 part /boot --source bootimg-efi --sourceparams="loader=systemd-boot,initrd=${INITRAMFS_IMAGE}-${MACHINE}.${INITRAMFS_FSTYPES}" --active --align 1024 --use-uuid
 part / --source rootfs --fstype=ext4 --align 1024 --use-uuid
 
-bootloader  --timeout=0 --append="console=ttyS0,115200n8"
+bootloader  --timeout=0
-- 
2.43.0


