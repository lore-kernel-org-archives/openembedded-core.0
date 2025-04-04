Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB50C369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.1477.1743784202759972476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T4NHk0dj;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54b10594812so2543284e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784201; x=1744389001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfS4TVgenKD6mOiWnq5dgV2GgU3Hd+vNNEhJ9l3PIuk=;
        b=T4NHk0djJHX4m8FhpBE0WksNmbkpgxankS0v+I07K2ATKW+9jI4PxKYvli+8Y7zIJi
         a7A4EBdo1R6gv309BL1HKg437ibBElzp3vASC9ISGhBbw/NASocFYxd+6l2Rop5Iluw+
         mpBDfqr/vMqgtwj06n1xobZOgzmYxvArpf0wQmzwLJPiuGUobbsjucpQljGVOFVPeJLb
         G9rFZcz/WNcaeh6dXZTz3S0oWn0qU0OPCcgNG//VTLPJMnCELNcsDzBu5Nyv2xGNCXaV
         lQt1JBrL1F7rKk49JMqGa1uSBPmFDT5ZPx1Rnz6rBWeyQDp96Lj1/ATrdKap8N+6E3Ea
         Dc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784201; x=1744389001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfS4TVgenKD6mOiWnq5dgV2GgU3Hd+vNNEhJ9l3PIuk=;
        b=D10UP0gRccKNi0ZV+KC2sAjzmptvW5ukxik/0s7uvtfK6DgBRJzx9JHOs9H6rqNT1z
         HZZnFNhRDfxeozxZKRh3OjIohCQoHeViI1g+CTOVJJrb8NA/g2XHXiwmCAGJAO+FItEI
         o9XRoqgLcpS7E7P9NPvpqrnLb5nUFipHJoawn5OdQsUIn6u8QdrsNdDmi2WwGk/Bsb68
         l68tgClGCkiYqJIHBDqO+2kok+0JEPErVymGUnIpdtYYR5Df1dt6NSP7uWhGY7qEg/pM
         fxKH558AOG1cQ9mop2ERjb58kt7Wf3dEM1FX9JzRza5nEHpcIPsEWZzvzDoxFivrIxAk
         OO9g==
X-Gm-Message-State: AOJu0Yz0GWQj6aBqupr6jHIySYO8Y8CRyGbslCRGMAGBpHMMUR1CunV7
	p/zxHBzNvDKNdV0S0yhk0a90AMMw54hnunXiR80w5SnnpkFMoSvwwUJ0m4SPLpd0Fmj8uea1QEM
	WWeA=
X-Gm-Gg: ASbGncvSXdvkxEAvRiuVs8gg+gUD6dMwotL2DpfEMQJNl92BQGTyFL89KeJCGZBiC2y
	ImgOOVQRRGIh4iXkB10gvHfIO/UL29cqXJ7hbWoj1JM+Iy1vV8etzjKtQo8kx7jkdDCBZvnPg1t
	A4GvRlaPCnX5tl8sj3ohqLCezdj2ZeXHwn3uEb22BAFIJ7gYNyUWuya19iLgPb9JBBOyCb/EtcO
	/YVh8R9Cvo96Ir3mpanBtqF4gtqT3j8IKK08FHPHzbUbq0WFFZiup0AMjvNumXKkwVwSP81cwh1
	VF07YiIYjVsyVZqqwv0sLtgFVb9QsDyGwQ7cz29BVF6CIm7Zpo9mAfu45OLm3RY5Cv96zgWDS9M
	r/sssgKj6mGG3AQjqm6QJhYBZjzzUa5TD
X-Google-Smtp-Source: AGHT+IHJg61NMhSsjG+NIXkrqnN0q1xFjYug2+kEwVapmMfP9cPWxgWBiKM+zh1B1Iz4JYhP8/L6rA==
X-Received: by 2002:a05:6512:4010:b0:545:b28:2fa2 with SMTP id 2adb3069b0e04-54c232bf03amr1168395e87.7.1743784200972;
        Fri, 04 Apr 2025 09:30:00 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:30:00 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 10/11] wic bootimg-efi.py: fail build if no binaries installed
Date: Fri,  4 Apr 2025 19:29:31 +0300
Message-ID: <20250404162932.447699-11-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214361

With systemd-boot, some builds included correct EFI
bootloader binaries and some not. Thus some builds
booted and some not. Check that some boot binary
was installed so that build fails if none were installed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 96c710bf77..20b1c36a46 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -341,6 +341,9 @@ class BootimgEFIPlugin(SourcePlugin):
                     cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     out = exec_cmd(cp_cmd, True)
                     logger.debug("systemd-boot files:\n%s" % out)
+                # must have installed at least one EFI bootloader
+                out = exec_cmd("ls %s/EFI/BOOT/boot*.efi" % (hdddir), True)
+                logger.debug("Installed systemd-boot files:\n%s" % out)
             elif source_params['loader'] == 'uefi-kernel':
                 kernel = get_bitbake_var("KERNEL_IMAGETYPE")
                 if not kernel:
-- 
2.43.0


