Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41F1C369A4
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:30:04 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.1465.1743784197204117125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 09:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uW+zzfwN;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549963b5551so2681999e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784195; x=1744388995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iToOKuBuSfo6pYT5W3DHUHLqyPFY5W8PRhcmQnKdR0=;
        b=uW+zzfwNIjK+2z3wF3LunTG581drjes2cHWmr6xpXc0/DH9hmYebbTdruy+BFCrTzo
         9QVKKII8zpZc6heSzQJgebkxe6T/S8muXunm28dV/jN+1fDVVZiok2scOLg6Njoww7Vl
         aTs+kPreabLXOJW6RbYcv8dkGxGiLOZBi4hLh8uQ3SzkXOpEc08BxjCpmahMzVgdAPsk
         lkKuJoBOyNOUj0/U0zq5Y+mim0GTj0WnqbGMU68Lzovb2ni9CoKz4qVoO3qXQKt9hJMP
         XA3M7/HtIV324LYtpKQBn3cZIkB8eQZ+QziTLAPr03SHaci+joNHwpO6Jh/l+aHPd5hY
         pJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784195; x=1744388995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iToOKuBuSfo6pYT5W3DHUHLqyPFY5W8PRhcmQnKdR0=;
        b=sD8QgX6h3l6awGGSUvPHdUYHoPZMWnkfDX4rkZntcQyly3L/NkFf5Jh42u+XZKsRZz
         L+QPLcsfvnkEy9r8TJ70EwrRvA9B3wSH/bzEODrQggdi1NtPNqlzDhAVTUmuU9r8kBxQ
         wqK2LE+sMvbtjKzYAWwEe5GoNZw5diUzQtImzqnNX7touOUW32Sg2HCWCPowe7XEba+0
         gT7tVmeuP3vooke3rCIS6NbPo9SkAgPnFfwBplXS5Cuj/LioZGeKFgVbhD5XnYZK4KVp
         61ektKi66vLzLfwvdUuO9h9bXcxMfagBqjv916G1oXh+TW9DKKYNOiWiD6Iw0V36EgV4
         ThsA==
X-Gm-Message-State: AOJu0Yzmv0f9aLKSaSM543BNpS4wZ5brR8tTWU0pEI89ULHcgK1SnAPD
	ohwKxcs2X6nvMrVg/p8VZ73huv+c8Kqfkcj9kyiSiLd4uKja4c6IYDQ6cOJU3Yz2nnasBjtgvFE
	6rkg=
X-Gm-Gg: ASbGncsKgpkz9AK4B+cCY9h2ukl0smrZZVLs63Mv3Y7nVuwAwZDQHF2ED5Q4zPToTiq
	7fR4+lCeveEk4TIOXO4KCLKmiNtOwVrwbB5JZmdOoKJcGYMRLWdn1rrVXXkEf5fkh484ChHBMrW
	cHQzNrrfvgrG9hT3o3E0RUZ3JlnP8ECVa6EaYUsDSsVqwqv4ZNcI3OwsNVPGn2ErcmyxuWBH7Hm
	/g7VU/A2HCQtd9pTagnZdSGs1a5j62jlOLm5TbzlJ6Mds1OZclNpCoQZRsDmU4wXruTGIockJeS
	AOeAJMtOyGATcKVPey8Ffdym+xcbsilMPc/L2eKq12HFuy5zeYDOL1nocL7++xB9LyOP4n9ZCij
	58iwFdrdbSLj7S70EP6t9BQ==
X-Google-Smtp-Source: AGHT+IG33SKg2ig0qX6Xk5t4ugw0iWkfATHnuJ0voRPSRhEfvHRSG6u3c1QTtBuRDDKRPozzZCENvQ==
X-Received: by 2002:a05:6512:10d1:b0:549:8f06:8239 with SMTP id 2adb3069b0e04-54c227fef60mr1142120e87.51.1743784195410;
        Fri, 04 Apr 2025 09:29:55 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e671f54sm469786e87.228.2025.04.04.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:29:55 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 05/11] core-image-initramfs-boot: don't install RRECOMMENDS to reduce size
Date: Fri,  4 Apr 2025 19:29:26 +0300
Message-ID: <20250404162932.447699-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 16:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214356

Disables recommends to only install important packages.
Disable machine specific additions which are meant for
full rootfs boot. For example on genericarm64, full
set of kernel modules and WiFi related firmware is
in the machine recommends and those are not needed when
booting to rootfs from an initrd. These reduce systemd
initrd size from 200Mb to 54Mb.

Since recommends are not automatically installed anymore,
explicitly add initramfs-module-rootfs, busybox-udhcpc and libkmod
to shell script based initrd. initramfs-module-rootfs is needed to
mount the rootfs. Installing busybox-udhcpc and libkmod
for backwards compatibility.

Not installing openssl-conf, openssl-ossl-module-legacy or
ldconfig packages since they don't seem essential in initrd
to mount the rootfs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/images/core-image-initramfs-boot.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
index c66c28db76..99388476ac 100644
--- a/meta/recipes-core/images/core-image-initramfs-boot.bb
+++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
@@ -2,7 +2,7 @@ SUMMARY = "Basic initramfs to boot a fully-featured rootfs"
 DESCRIPTION = "Small initramfs that contains just udev and init, to find the real rootfs."
 LICENSE = "MIT"
 
-INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev"
+INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev initramfs-module-rootfs"
 
 inherit image
 
@@ -20,8 +20,17 @@ PACKAGE_INSTALL = " \
         ${VIRTUAL-RUNTIME_dev_manager} \
     ', '${INITRAMFS_SCRIPTS}', d)} \
     base-passwd \
+    busybox-udhcpc \
+    libkmod \
 "
 
+# reduce size
+NO_RECOMMENDATIONS = "1"
+
+# don't install automatically, pick manually instead
+MACHINE_EXTRA_RDEPENDS = ""
+MACHINE_EXTRA_RRECOMMENDS = ""
+
 # Ensure the initramfs only contains the bare minimum
 IMAGE_FEATURES = ""
 IMAGE_LINGUAS = ""
-- 
2.43.0


