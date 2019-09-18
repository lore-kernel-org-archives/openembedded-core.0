Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3C87E52D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:17:29 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 7so7183687ljw.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8XvcoiOoOCLKPR2y9I44ErmQW2IXWycoPlPDp4XiXug=;
	b=n2pnhQQPCwqH+qBifaqRZxzOzuN4e5IG/6hc58GlPYKyw2TFi5EqNEfHm88dZgZ73v
	A1naRUAog8JxGVjzamEBNAlnkFNWkvQGOS0ePKLjOsDwObRkSugVXl7wFykPvjdAnRlB
	jIUITyVKxG9f7RSztLOhITXnE4NVrqjfZxdKZXjsyWWEiQ4VCa+2KXEOVNwQEQ2efGdu
	U1nVtRfRjt0K6h71riBs1axSPA29brfWnd39W2ifADpXx+R4QHHiwm2xgOYmqLyFdj0E
	aI6OPGxLBk+SaoR18lHL1SK8VqWPC7hatot2r45FnBF4YigoMb9WPVfU4lEp/cES2niQ
	w5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8XvcoiOoOCLKPR2y9I44ErmQW2IXWycoPlPDp4XiXug=;
	b=OZMv8xC84OV8ocKGOo/H1eJbGX6lXP6LwnUWxhWT8GEFiHArAiEZIzZTegbIWnDj4k
	QYOAXMoE3eK0zEQvf6qrancag8f/EUP/GKhnugGlFEP8hM9TKqMq0fWRfU+I62iGxJlh
	nFCWAD/syvLCYU12qMHiy/zpH49KPV1tURGK4jQTsg7soRbWlMBqySRg+LG7axKOA+zP
	ol37D70bSt/qE6leVM9x/vWrgy+AMcBi23PA3qEddbMKMvfV+yL7BEVo3fNlsSI3elJQ
	YucWGq7S1ND2iKyosCFxX3FLDKQvWjqmoZxdu4ZzscyZNs+WVjp+Kzav7Idxek5X+OGj
	FFUw==
X-Gm-Message-State: APjAAAXLpSTAQd5Op/SfFpVfGq2B/tspullKdOaG+Fm6109OHAA/1EVe
	F5YjkkbldejuOxW0PJcF0FcYj177
X-Google-Smtp-Source: APXvYqzqz7jMVv3WTmmHeJ1I9dFBMC/e0D++VL5X5uT8f8SJl19NNP6z9skbqoc0MU8tbyP2xMKb+Q==
X-Received: by 2002:a2e:7c17:: with SMTP id x23mr2122425ljc.210.1568812649663; 
	Wed, 18 Sep 2019 06:17:29 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.37])
	by smtp.gmail.com with ESMTPSA id u10sm999466lfk.34.2019.09.18.06.17.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:17:28 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:12:42 +0300
Message-Id: <20190918131247.26488-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918131247.26488-1-dbaryshkov@gmail.com>
References: <20190918131247.26488-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 2/7] grub-bootconf: switch to image-uefi.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Sep 2019 13:17:29 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from image-uefi.conf instead of hardcoding them in the
recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
index 9d5dab9aa808..572580313b26 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -9,6 +9,8 @@ RPROVIDES_${PN} += "virtual/grub-bootconf"
 
 inherit grub-efi-cfg
 
+require conf/image-uefi.conf
+
 S = "${WORKDIR}"
 
 GRUB_CFG = "${S}/grub-bootconf"
@@ -23,10 +25,8 @@ python do_configure() {
 do_configure[vardeps] += "APPEND ROOT"
 
 do_install() {
-	install -d ${D}/boot
-	install -d ${D}/boot/EFI
-	install -d ${D}/boot/EFI/BOOT
-	install grub-bootconf ${D}/boot/EFI/BOOT/grub.cfg
+	install -d ${D}${EFI_FILES_PATH}
+	install grub-bootconf ${D}${EFI_FILES_PATH}/grub.cfg
 }
 
-FILES_${PN} = "/boot/EFI/BOOT/grub.cfg"
+FILES_${PN} = "${EFI_FILES_PATH}/grub.cfg"
-- 
2.23.0


