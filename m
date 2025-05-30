Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2AFC5B556
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:38:35 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.4274.1748605109789807184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eX+9q1Oo;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5533302b49bso2651900e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748605108; x=1749209908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0mlCDrgYckIp92Y3FKrghSywetzTIukwUY7alTTUCc=;
        b=eX+9q1OoEsiVbSOtnl2X5i/2y6cpfU0nSW9liw9u3McUdUEjvIaZzWFyUKyDlnTR9P
         mwa7HSAXlV9uO2g8g30kDb7p+Crxkqwgnn0kTIYSnbSDhQgVeh0Yhx+c9cRA39beTjn3
         rtEW4bf8KRBi+H5xYGJz+9fcFVtA/4z036GF9Zs6iCDc+iOal1/4cXAmARJ43mOWlzST
         IRbYjwt4VJ4kEPp9Eldxqy1hJ9qxKNvJ3KlkhxhtG3WFIxpWabma7CQFZpFUTs3LoRU3
         2Hh6TMrx0GdFjGsS3aEnRrYZMEb9GCsse9TElJpgdyZom514sBklJ+v2PCEqTU2lFwOj
         djmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748605108; x=1749209908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0mlCDrgYckIp92Y3FKrghSywetzTIukwUY7alTTUCc=;
        b=cfBmw2qJr00rswqToBFvC5BhzzCTvujgf6mVAUgai2yjrh5yg1qJoANFLVqA2VXAlQ
         bg0WkrsVw70cNxM9RnTjFPMcp+zV4IGZmTO/fgIRL3aPCHi5WGFt4HX5LT08NtIw6jaa
         Ve/r1hd4SnTSFCvu5Gz0QiLnw/ZsjodB7XsFh8dR63U7IkSaOJ90iBDBBgg6CvVojUgs
         SjFjZkoQqsMCl+qFjiyQoFWl/orFDrhqTKFTPo8UpDhb5rrTG4LFXKXF1p23vphDX+Az
         ZL0pGIaAwerooqUk7yIlxuCmzPehY82hyvoySHpfvLoIvKTf6FoguHKy8yQGsHo8uLDf
         3PBQ==
X-Gm-Message-State: AOJu0YyDizAehCuVT6Z2+NTmDygdjIB584i1R9iSsK4Xy2MUykjz9xKn
	+JykwjQVPzNKGIMOJaVUpkPirTqacoRMx/B47NAgvwBlbK99BoKeNBLn9RjA3nVRbimzmCCo0yZ
	RoL7KTE0=
X-Gm-Gg: ASbGncuANysWgLV/yNTlxzKyKrZS2TE4sj7CUEXH21Yfj98M7aYHd/ThEhXtLvsouG0
	UtpMI01xwvzaH516kdQEzsM+eK3sT748zc7fqoX7fIwat37k4t/FXzSpxjUwJW7dqX8+iK9ujw2
	kf/RfE0N5LFOIFNpEEo0LFs2cZVTIpQkCyBKtgVJ5f8/dn1SAdQO2Jwfjm7ZCjrqIw698Ybb44v
	P7euvpSpggzqsgEK/DSJbu0gvxGv+6xv1Ws+pVj70RoMHrdUPqmY9UhJMjxhLKt/NdKxvNMpOq1
	RN4ndjwLr3xWFlmaW8jyKuAP5i3GmPSU4yiaebEjT+aMsufA1IDwovpDRvgvm2sS507FWVg+yG0
	FCM95KshXu87y9vd5BOTrXXVe05J5pc1ZCyv29VrdaJSkN3yeGg==
X-Google-Smtp-Source: AGHT+IHp9If0pZOk7hqToQ7v2HXugCp1KUZdf+V/vffIzhdBczoF7V0gGuv8/7Wz4CboXmotSfpNEw==
X-Received: by 2002:a05:6512:ad1:b0:553:2486:e0fd with SMTP id 2adb3069b0e04-5533b8f5559mr956853e87.23.1748605107842;
        Fri, 30 May 2025 04:38:27 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378f7sm676469e87.244.2025.05.30.04.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:38:27 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 3/5] image_types_wic.bbclass: remove os-release from WKS_FILE_DEPENDS_BOOTLOADERS on x86 and x86_64
Date: Fri, 30 May 2025 14:37:43 +0300
Message-ID: <20250530113745.778397-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530113745.778397-1-mikko.rapeli@linaro.org>
References: <20250530113745.778397-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217499

os-release was needed with UKI generation when this was done
using wic plugin but now with separate uki.bbclass wic does
not need it anymore.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

v7: no changes

v6: no changes

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 90bf8c7a60bc..a64beda95e5f 100644
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


