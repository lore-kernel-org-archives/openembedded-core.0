Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7A1C5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:25:35 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.3994.1748604333432247528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nY2css2t;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55324587a53so3696033e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748604331; x=1749209131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taZJM352csUu8TsRZrmDcVxhygmZ595xbtxpAb/3epw=;
        b=nY2css2tvNPwzsH4gKhS/2PHi/dqxUSM3ktgAYLy+mJsGAa9pW8mLvLDhSrqGo+074
         aOqBkfUke4JZmtD/qs4RawkVEaD/jh9Z1jYGJgb4PkMDCAccBMroyy6pL6aUngsL4uDa
         FePAegXZ1pjUcLdkFlmv/URjmsVuRQvnJGzHmZj2B+yC/P/ShBHce7YXPVU881n72mUZ
         5lDSk+fjCc2CY836Qxv8D+Ty6PeI0wuRrG0OLcxqYTtzRAtqxmIWX8F67on0sGAw3nf1
         x1Gri7awEyWqvAT75LDhSKg7HGaARWBosHCKzV64jF82+9zVF2GuWOlsnwSr+i6VX/ud
         5ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748604331; x=1749209131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taZJM352csUu8TsRZrmDcVxhygmZ595xbtxpAb/3epw=;
        b=i9Gc9fFfI4jEz7Fi6eGMisYFokVCYhx2YwpzpwXjU9DSQmcWSY6aYd87y9n6ISmFgv
         QPSg2JCqWFcOzQn04xJORZM1F+ExtjVjourMhrSa9gc9MgcgOpiuvOIWBfHp5nXIPpGm
         J3FwiMdBNz+XSdcWwFyE6Q26wo+MZrxzkH/DjaFRpg6EUhpv+n1g22x8UKel/mpE5j6i
         rWbcjclvA8TvkkqexZ0VFFwOHlw6bISVifptep7WOXoJLiR1Eog66Ih5uFnPzb5wuFxr
         tr6054DISfdNVB4tcchqYsJxTDL3qY8xrmJu6Q0L0YXb7jgvkKREzvekim1OWVE5+3pj
         /mXw==
X-Gm-Message-State: AOJu0Yypn0bjA/ImKmPLxxHsKK52YK4YxgO59zZ5b33HUuahWk/BjFiF
	+tfA7KZY04tmbXsUi7sEA5Jj5REeSQJLQj12/1S7cF5pTygakGrUSi7F7yD9XGXm6w+ukQogguC
	Z9C677Ow=
X-Gm-Gg: ASbGncs4JcGc+B1IArdkLdv+LoU+lg35C7UgPTSzlP1BsKfE8h8sTpefHMiQNIKB1bw
	QVC0iBfjwGBEV3+ok15G9rdimH2UKiumYsjnh2EHY5KmIKcv0wslXUSgZl03FeJPKWqxpUjtfUM
	bNHHjFzfo6KxgqFMVKVoPhBX/OGsXhKrqA7n52jwQ2MkwWBnaB2pScsYiUjmj1zrBdFE8WmsyaZ
	r1ryNxzJdT/Aim+S1OVg+s/6RnD6+5DeT+hgEkALU8CLmwJ7uC93hDTY8b6RuJpSXLNHOx8kvph
	9+tBwiQ874txiNrsn9F8JmUnrRYKbhRTQPW78yY+ZSRuZsE/eL1ZNbxGIjPT7TMG1cIVZXIVkZy
	vU4lXLYZ5pbNqQJAu3Ls+zJZLfvre
X-Google-Smtp-Source: AGHT+IECJg/KCsyHs9FC0c2Y4skYH1f8SinWuDyubPNuIPMyGUfnHONoK7vm1em8usbesPnNYaMWYA==
X-Received: by 2002:a05:6512:3987:b0:550:ea48:a4af with SMTP id 2adb3069b0e04-55335b1180fmr2440349e87.11.1748604331529;
        Fri, 30 May 2025 04:25:31 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d35dsm667377e87.46.2025.05.30.04.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:25:31 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v6 3/5] image_types_wic.bbclass: remove os-release from WKS_FILE_DEPENDS_BOOTLOADERS on x86 and x86_64
Date: Fri, 30 May 2025 14:24:57 +0300
Message-ID: <20250530112459.776330-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530112459.776330-1-mikko.rapeli@linaro.org>
References: <20250530112459.776330-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217494

os-release was needed with UKI generation when this was done
using wic plugin but now with separate uki.bbclass wic does
not need it anymore.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


