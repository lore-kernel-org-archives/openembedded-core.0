Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79E7C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 12:57:07 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.14932.1748437018913856865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 05:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XfP9dr/5;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549b116321aso5981484e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748437017; x=1749041817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRiGd37bfTlMUJgz/25jnkCfA1tENAd1vqe/mQYGDU0=;
        b=XfP9dr/59qC4UI9UocmBynhyuRwGweoYKsjXECPl1ivtThNi321c8CWdoHMtv1Y71w
         kEf3bOarPxzSpO9b9JvcefBXsaTbdHqYE+ufkIuK8EdzdhtIH0Hc1E079gkOsOdNJ5f0
         lP0lF5PX39vZQ7JCFdRX7kUGtXdrytbKAKTKsMrSGbyzfApYkMxEDi5LALyKSHuvkHfo
         MRerPVDzbQyJbCVzfWtW35EtnHR6SbBkKn9pAUPi5RDZaULTBpClWqEK4FhGWcloqEDY
         JjbmLIrte5sELLjSNf4DRlrRU7zNNsnMju6QAv85PyH+nZozwm87Da+W/+VUysV+atI+
         btFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437017; x=1749041817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRiGd37bfTlMUJgz/25jnkCfA1tENAd1vqe/mQYGDU0=;
        b=f9KNJYlL/uuBqjkqLxZ+jMmzdHo6IOBClAQPFpxgbvfRZeHpEs/y3y0ADY3TuQdLG9
         83gE9R7qtwSp4m4fIwn/0JzeYEbePoetM4anDw8EHaNMJLb2QjEi64Guke4Wo5Z552ZQ
         0a5I2RTHeZ1/PgY7NHMsR8MQpRBPfJr9KuAOoYPdEvcHf2TV3B3AG/YmFCkFAtg731/n
         79JWsVucJLYqsdQ5gKCrT5y4uba8rHHrm8wsRRd571/gLFelQpqxthDMwRN4zshL9RYl
         aIfecdRqCYycpg+cbWyl3AdW+OwWiOccMje3I2DU0xlsiDXxUe434x7CIFEX5J3+wPSj
         hRrQ==
X-Gm-Message-State: AOJu0Yzy0rA6T6i0J/IXU3//0UqkgKNw9kVyCvHwSBg5fi4U2v1Ryy2W
	147yvQu2wN3m87ek547O+4jJVrxiq/R5Ie48ewohXW0jfym70xpAMpGBvk6FJsdEAdUJGOml8ZT
	1gtyJHN0=
X-Gm-Gg: ASbGncu85w0HUdHzp5LbUaXD4/CdGZVZwijiiBojOz99e2P8k/1HKsUqV7ICBlGIkAJ
	BY9s9DhJ9WE7Gv4CdwTz6qXC0z+Tn69zyDRxhqG0ql/NVcWCulbI9nGKZ9rV2SN94CX928xDvGO
	94YiYE/y5z7OLehjLKIdIJ6QwgUDOFnDm5/62MQ/mdQ70fjVdwZaOAsqSjjhEBqIUQKyZx8r116
	v1//h86+yxsMM/Dp6yrPaBZIdHrzO9849T/3z8KvkRwHzjGJ5zLhiVf2JRkxw31Bgz9WI85tgsq
	j9LyPmUVSpbLikA/8ryJxXM/SLgBh8OMv92yUPNtDmTX0Sw/E+PkQk61pXzEK2mq+1Wzt2TI3cO
	VrTb+eu/jxUmuc1DVfp97qaEkIhCC
X-Google-Smtp-Source: AGHT+IHUJyVcplx/UVf6xuhwSSKEkcLiVnbRb3jmI9U/FeBTA9n06W8xYIBE+Uu9oczRWdWASJMWaQ==
X-Received: by 2002:a05:6512:23a9:b0:553:26a7:70e6 with SMTP id 2adb3069b0e04-55326a7731bmr2881255e87.0.1748437016952;
        Wed, 28 May 2025 05:56:56 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a504sm267869e87.146.2025.05.28.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:56:56 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 3/4] image_types_wic.bbclass: remove os-release from WKS_FILE_DEPENDS_BOOTLOADERS on x86 and x86_64
Date: Wed, 28 May 2025 15:56:34 +0300
Message-ID: <20250528125635.684302-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528125635.684302-1-mikko.rapeli@linaro.org>
References: <20250528125635.684302-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217346

os-release was needed with UKI generation when this was done
using wic plugin but now with separate uki.bbclass wic does
not need it anymore.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 90bf8c7a60..a64beda95e 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -113,8 +113,8 @@ WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
-WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
-WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot os-release"
+WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot"
+WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
 
 WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"
-- 
2.43.0


