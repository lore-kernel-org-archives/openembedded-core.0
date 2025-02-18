Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9071C021A9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 03:34:26 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.11963.1739849657986259263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 19:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AFoccXhD;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54524740032so4133528e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 19:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739849656; x=1740454456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fECejGeyY9U+qP2mdDYPWaqDcRpl3KUsRK14aePUX3A=;
        b=AFoccXhD3vdnaGVdG9LocGSJJE879tRf4ECBqHotWNnj6e/XXyiDC86uXobeYeIsib
         UgG0IBLnMeH1uR2lNJTsmuLMOSxMMOqm6yZDlQ56h6Zm04WmcB7cQRBHmCtHKPXASPKx
         UcrlNLPBl3LAtANphVABMk6wRIU7U7FSmvOuBKeAx/e2Ss3oHDxU9rnC7ICLY6WSfew3
         Zp5ZI/UE0XtlDhtl3iVOfOm5CGFk7QLTkAommxnDQtk7CZmuCVbmWc1ymV1pmlqUHkC5
         B6NhrOrZNT+tkVRskqp5xlaNkhL3YUSseMTHGT5ICgRlZPuLkTcchsTO1DaqDg25eSvY
         4fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739849656; x=1740454456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fECejGeyY9U+qP2mdDYPWaqDcRpl3KUsRK14aePUX3A=;
        b=JMfB3gkQ+yY3yX+ai9Whcz2U9Ipyr851geHtb2tMa1TnPQzGEEMV1LeAroMhqzJHNl
         srZ7neFyrgcvTsHS25zSQg3x2KZsWPyPhQel5xS90j9zMy75vjKVIrCCVlLjei4Fq9dk
         fVS4IdP6E0VWb1Nu/e4M/NZh/PtLicvD/ZxunGAxbys0yFpsdyzu7OrknncG9HNvkzzv
         sOWF42Fah/eg49LHAodOKqIsiDR5OgU0/MFM56vtjlPjupDwIOTkt7OEtNsIOwaSYilR
         buB/q50TIkrY9uD3VHlrjYEdTOHwDGUYZl0C1lPNP1Jfaph8GKuLxdHCmR/IMGdQixUx
         S8XA==
X-Gm-Message-State: AOJu0YydFnKohI6cjeFUhzQkgqzPqueIgHy10lGusOsVUvPVfphFX2ky
	mn8vt8YqDbl86qxUIoVg78RuD7A//ApszyExqxdfAletp0zCFvHEErIYwvRSRL+xpI+5F83zGyn
	c
X-Gm-Gg: ASbGncvbUrpZzqFt/SxDw9F7WrsEWr7Jk4+1qsP99OapTXEYl9lajuVui1kua+QhPXR
	B6shkLkPCnjgYmJqsKhD34TkwjlI+JG30TCbi87YuBHft3gWAdCHKEnts2xkDRjJZUw7CgxAr5/
	HwDnn7Ty8Dx4KnhPOMs/SbEYuRt7r9qqYUlXUfP32MtZOac+khCK1DP47Sf+dwpocT4ofOmw+nA
	ln+b54/5MjaS5b06xEaUDSq0LuA/3tgUMmHx/cBqsyPPZ/LaNvhC/xtJW2qwVSvGFTIBh6IWvYb
	49Nr/X/agdTSbeEVViwrrvN9uwiMmFw=
X-Google-Smtp-Source: AGHT+IGrEsAhe0gaAgkG+eApwltpyiy5Z2vNQMYNI/rC9cV9BBdOBlbtjNkQQhvOQx9JzQVF9m+Ryw==
X-Received: by 2002:ac2:4e05:0:b0:545:62c:4b29 with SMTP id 2adb3069b0e04-5452fe5bedcmr4312414e87.22.1739849655576;
        Mon, 17 Feb 2025 19:34:15 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5456468c28csm989838e87.122.2025.02.17.19.34.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 19:34:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: fix qca-qca61x4-usb package contents
Date: Tue, 18 Feb 2025 05:34:13 +0200
Message-Id: <20250218033413.2336186-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 03:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211560

The NVM files for QCA61x4 USB chips went to linux-firmware-qca-misc
instead of -qca-qca61x4 because of the c&p error. Fix package contents.

Fixes: 93b3d61b657c ("linux-firmware: further split qca61x4 package")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index 695788e31d05..ec5329760acd 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -666,7 +666,7 @@ FILES:${PN}-qca-qca61x4-serial = " \
   ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin \
 "
 FILES:${PN}-qca-qca61x4-usb = " \
-  ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
+  ${nonarch_base_libdir}/firmware/qca/nvm_usb_*.bin \
   ${nonarch_base_libdir}/firmware/qca/rampatch_usb_*.bin \
 "
 FILES:${PN}-qca-qca6390 = " \
-- 
2.39.5


