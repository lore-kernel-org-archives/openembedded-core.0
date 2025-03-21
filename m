Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD58C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:26:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.21074.1742563561928630698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 06:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DWf6LPtV;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549963b5551so2159594e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742563560; x=1743168360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeRlJsYwVM3cbEZg09wa/3SJvsINQ1+FMrV/BPgtirQ=;
        b=DWf6LPtVyOXYoEHrODVZOdkvIbRZDGj7wPi0qCO+VK2myQO9lxyIPDJJjd0FnIJnac
         S2uKIJ1n65XEjCJs9yo/bWzIfrEuCSxQRw2feGVq5clQBKVWsBe88WzIGJ6XFal31YmS
         GwCEDKEPlUxkCX3ZVzwH5wLHSPM21fSi8zYwceCzdUExXryEez2h3aLE2vhaZMXQj+C4
         W4PSFoQxr1viQyw08a1jByc6mpCTRos4Eqc+gwqK1ICfxMA+Xkcy1HuPySOdws/lAi2s
         5rTqEJalxRwjGjhMmKZ/9uGIaZmhsfiUHEshWzj77qITFDhShrCgV7FNglh3cHs7t0z4
         b7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742563560; x=1743168360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeRlJsYwVM3cbEZg09wa/3SJvsINQ1+FMrV/BPgtirQ=;
        b=uvucXZC6WGWDKln8VuJtjaTtORedcgUbiLo5Lu6Eu7VI+m4VH9BoFQPF66FM4GAxVt
         iXL0oREJHk8akeMeYWtpbHpMdy/4pGJt0tierM6sOa7MaNwrQbzy+I76QcQq/XEh/Hga
         ZN9I6HC1lEGZRRRdaKqM22IW1JVgIkjDB6ut/SHncIUVDgQX4lFkOcUTCu8OdG0VGDyr
         /1Ro2giitADUc2yuV6J+wg7qIZd4cVmhjqQAAFwQl+znu9bsSsJNiftvPTSfGUZBmD/8
         cI+l41grtid/jir8bPw5TZNjtPtcTRAShQcYMUk7WlVN6D+4MdKvQUDpSLpcK/rS5BEF
         grvw==
X-Gm-Message-State: AOJu0Yxyq2L1/i+Kxc9kpvFPo/28AATFBZ/Z/hVc05RfGoO7cP8JZAL6
	Vq51kShsEBNzswqPF7r3rqxXlNkYi9gUmG5HLpm92939z8KmwHoN4B+kKNC53OEsH8jTrcYvu8v
	Dg44=
X-Gm-Gg: ASbGncsViRlYTYSn4QR9jj5u0oUR5i/jVjHn+h/yxeXG9CvelGaRkXLGCtiaOm+J5D6
	qEA++3YzAH2M5H+q0s6s4TswRIURj6Hhq3602KrumLVh+y0tWeVzU7d6b16Pzf+mm+NKVETmK9k
	ZrjdCmKsshTw+f0WGqxKiWO/jjk/dp5NazbojlweuzIjqlehVEr/3Q4tsr6RUV3cokqGWv063Fo
	abhbgAEPvTR+rerEo4j7tdQekc1Of09M7q6yG10nuvTLzqYJi5RolaYfibai8ZmCe+yTuc34UDX
	Z6OPYCbC/5Og7AS1kCMFExdwGRSSJaTljCYoVMRXEFcvsTjVlWYDv8FVhCX9pXJL7mZA6YX6cIt
	FYx/P9FEdcqiINoYYQlWDXg==
X-Google-Smtp-Source: AGHT+IHwGA7Xh0oJxmeDYbB64uP+3hdLFjNUli77uVBD106zPg16qtGfSmN7X2RsEJeuJc184Z8tEw==
X-Received: by 2002:a05:6512:6cf:b0:549:b0fa:6733 with SMTP id 2adb3069b0e04-54ad64f5110mr1237439e87.37.1742563560067;
        Fri, 21 Mar 2025 06:26:00 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a25sm182634e87.11.2025.03.21.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:25:59 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 08/11] test_efi_plugin_plain_systemd-boot: don't set console
Date: Fri, 21 Mar 2025 15:25:14 +0200
Message-ID: <20250321132517.670372-9-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321132517.670372-1-mikko.rapeli@linaro.org>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 13:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213464

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


