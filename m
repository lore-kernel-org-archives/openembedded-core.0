Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CEECAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:54:44 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.15248.1758016474244159932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LLvBWFPm;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5725e554ec1so1912228e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758016472; x=1758621272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Py3eR5VgNR/e1telq+gYrQzffENG1DjBUNm+gD1I+ik=;
        b=LLvBWFPm90+YXPvvu5ZuXlNtx/Z4HJBjxXa4GKyKLgn3k7a6sn9HD0h40mdk36cvPp
         ZGky7VHlO90pbYQpeSzDkMFVY77i3RrnoCFEAwZsf7dAsGGWjxKUnho2bzvULFrtZUyV
         fvr+wOn8B2dFLyRuPHTqNVPukeDQKvDUaybcVkOEmQCIoAWizAw2Yz6SDA7Rc12KbM8S
         3Xw/uoQF9Aj8lUcGvMPwPIeOD8eEHZncTtgKuTugeBL3rLvmLGNKNH74Sch87KWdoJ24
         JfHizDPTCzZHo9Vu5QT8mth4wn/eRBNmFYPrxjxZ648/ZRVNW0gUcbi3zxakUUMi+MYO
         wBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758016472; x=1758621272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Py3eR5VgNR/e1telq+gYrQzffENG1DjBUNm+gD1I+ik=;
        b=UT7t41HD73ePuUlEpOrWwK5CNHMdSiCvNYRyLnv/QB9z8iD8ww5RfQETcEfbRvRqf0
         8cOg7g+RoFkYmd72s0kz0Y7npYHjkVHFCes10szMyr3/cUoxxDFaaZFxza6vjfBVAtck
         C0sblLGcS8J029z5Xc65jCPJ33cWe9UTtejt49LNbSa+W8OSOOudw2W6pT29aVEQglut
         viTb1qyS1xG2RzzLS8C2iDuALnP7pD42qGT/oDTvlhDzlbRua3WmPmCmRsothPVbLevN
         QvZ5dUzOvBtNu52mYlXSq5+sG67vwEpqE8u9nnmZ+brwYfbfjVNtFo/CM6vO0U8F4ZDF
         xWpQ==
X-Gm-Message-State: AOJu0Yw2Ktf6t0z+qSzNcwHPHkM37HH/8SPTX80LKHvPYa8AJm49+ZdV
	bSFeSuU8QPQM8AIEikGpYJYfcW0el+EE0FaIhtBITOQEWEwFRl/XNfSRrnHU0H84K3IfsLtADRZ
	MXnwm8vQ=
X-Gm-Gg: ASbGnctKFsl7Mq2PLYwwY2h9daW8wIfJJNIxP7qVUdXfILDksWETY0Yi1Ut8ZYsTvoZ
	CTKjaj4s25uiH5fl6zNjiRZjsCRgOToX7clHTTGxi17bwK83spjZxoDmMkzir5vGcxK3/E67mdO
	E6KobdJIL/eQe9ar0VUlkcrPs8C2c/h4DYA1AAsQN2fijDjj9WeilVd89QhyUwGgJRrsVUuEiAT
	lkcdeGLNKWQGN+HtfO0DKShchfp7tUqSHEu6g7c05Dfgac2ilQV0CM0dFriwci1EZpR1e6p+su1
	fm8Y6IIVG0LZZ89eh/C83oZE9kXmo9ltNg2nMO2ywXvxybviaOqBgrjMsaORrC/f/HLgSvAwpLH
	C40cqWNjnxId3m5gj2Ezwjrx0yJ/r6W/AEJqB2VauoC9a+PpWjC+sQE8=
X-Google-Smtp-Source: AGHT+IFo6fF9R04E/EsGi0mYdQr5JrdmXURJYXr8mWHlQgZgaC6gTEar+1AXZwKe+QPZdxczzm8t3Q==
X-Received: by 2002:ac2:4bcc:0:b0:55f:4926:df1c with SMTP id 2adb3069b0e04-5705197acf7mr4253911e87.46.1758016472053;
        Tue, 16 Sep 2025 02:54:32 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-570ba3d222bsm3759858e87.104.2025.09.16.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:54:31 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] linux-firmware: fix wl1251 packaging
Date: Tue, 16 Sep 2025 12:54:15 +0300
Message-ID: <20250916095415.3014036-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223539

wl12xx package regex was taking all binaries also from wl1251
which ends up empty and install to images fails. For wl1251 only
license binary package was generated.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
index 7c413e2b7c..be38a8edf3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
@@ -1462,8 +1462,10 @@ FILES:${PN}-wlcommon = " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl127x-nvs.bin* \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl1271-nvs.bin* \
 "
+# All wl12* but wl125* which go to wl1251 package
 FILES:${PN}-wl12xx = " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12[012346789]* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl12[a-z]* \
 "
 FILES:${PN}-wl18xx = " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl18* \
-- 
2.34.1


