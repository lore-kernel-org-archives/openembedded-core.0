Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9999CCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 18:22:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.26214.1759861366675252055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 11:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FV/QuYFN;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso44871695e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759861365; x=1760466165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jnx1jWaJTrCgS9bTqw0uHVbRCCi0Hvv17Mgf1r2jUTg=;
        b=FV/QuYFNnjvE4XQUY/epvXHq7ZcFzAj+qNb9egxY6hQLSikc/PJkq0Pi0vkVN+YmoZ
         ls2P+0WFA/ao7Ftktz1tIoOVI9MY8wseCYMSMwh2RDWEkl1XsBSNDRS0hhYp7fY3qCRm
         CNM1rL0PdWMHA5RwaYUoMnblvl+YFl3xNcsFrTLc67d9ptVgfve9wr1lXVyXM6K9BiYH
         2hGMHYT5EPYGbjNTj4KDKeydGf3RgXmHM0sPToz0trT7vzTLAgHbnFi+PpLpSlfbACGh
         ndqvpoafV9ixDpOZf50ILKW7y2Kz+hFrOrwxrzFWsAku8yujVawpglIpQoExny9h+Yy5
         bl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861365; x=1760466165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnx1jWaJTrCgS9bTqw0uHVbRCCi0Hvv17Mgf1r2jUTg=;
        b=sZyp5ITRpIfQkyHOM29Gh6gOtQBBo4lwvM1hG6mSzLdxlYBr2BEtM1WTUPBkxyaF85
         aaCmH18puEPR5zlfrvxiaLtE035ytenjMGPv96KdKYCOboGi3TwcqmFQIhOVNTIN0OrN
         H4mZr5b2KdghkwQyI3HjawdnWOyub9FloSdwrdl2h48ty0do5ttOM0EaG789KkjJ3oUz
         LWiloPxDUsY15VtjLnHAIFMPv2j5MwQRZdIIq6qXzsvQtrJ5I9FKfl37eip8BjhitSO2
         XkHi2RVyQPgB9Gi9dhV5qPSoBSAsl+96jA48JsADlUUi13dhzf0CYBeR4iowcQBd6xSu
         rs4g==
X-Gm-Message-State: AOJu0YwKLQbtKapzEVfPP4z558kjN43DLaKnHH2JO7aDaXiGp0559zBI
	3w1+VIBB534XBXfHhupw7oEvXAt2saMd6dyp16UyMQYYp+H6P5ZHfvWhKLfMkQ==
X-Gm-Gg: ASbGncuGP6EUE6Ly9d9qZ5wnBquF1JrCLL+chmfRNzGANPWa+JKJ/ExQHZbhVmFBf80
	qa8wa0OUDkELSnV/OBCJzY0OueJXNEQQKWgQ/8f0m0OmhpBtmNz4WyDgf0FhjMKdlPu1t87jjwA
	Ly7zHXh07wCS77YlHprPv7UdLvyBDGu+aMOS4SDJM8TdGTg0txG6z/qI1kc7qVpBN4s/aHxaJFj
	L8n2+ue0FtpFNu1EU49hHwq6ivxpeD0x8gnQG8CpkGwr9ZRJnn7NEZjH8gVekCfMjBKvJCMjJRV
	nM7X9QYYrLfA0qo3xdTTS/p0zA5aoDrjkHCUKCjKHcnqvHtHKUwlYXpMI2zTJVziw7h6JZO59fF
	3Pj2T/QefAIBt2iPgH891/vxfnUph39ztHQc5frfVQMRJIcEukWqO9aTkP0ErGAy1N4v0SVjHuM
	7tbl1L3V161m6Kc/ILpNmJIGle8k2ib9t8uLOmQNj3gUwnYAAzzG/czyQPY8GkRuVA7s21cPUms
	OoOV1nARw==
X-Google-Smtp-Source: AGHT+IFWgsqzhSsig/YdhcQtBphIWV9T1oM5aruAU7W9NiKR0RtTe24GkIhpuzCAMLrLtYnogWQjHQ==
X-Received: by 2002:a05:600d:f:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-46fa9b9a84fmr2878955e9.29.1759861364803;
        Tue, 07 Oct 2025 11:22:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c0e35dsm4410935e9.8.2025.10.07.11.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:22:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] meta/classes-recipe/toolchain-scripts.bbclass: eliminate bash-ism
Date: Tue,  7 Oct 2025 20:21:42 +0200
Message-Id: <20251007182143.1235445-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 18:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224549

From: Alexander Kanavin <alex@linutronix.de>

Sourcing a script with arguments is a non-standard bash extension
and doesn't work with other shells (e.g. dash, which is used on
Debian and derivatives). This used to work by coincidence when
running against integrated poky repo without having to separately
specify where bitbake is, but no longer does.

Using set is a POSIX standard.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index ec040b5ebbe..8c062ef0e74 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -92,7 +92,7 @@ toolchain_create_tree_env_script () {
 	touch $script
 	echo 'standalone_sysroot_target="${STAGING_DIR}/${MACHINE}"' >> $script
 	echo 'standalone_sysroot_native="${STAGING_DIR}/${BUILD_ARCH}"' >> $script
-	echo "orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR} $bitbakedir; cd \$orig" >> $script
+	echo "orig=`pwd`; cd ${COREBASE}; set ${TOPDIR} $bitbakedir; . ./oe-init-build-env; cd \$orig" >> $script
 	echo 'export PATH=$standalone_sysroot_native/${bindir_native}:$standalone_sysroot_native/${bindir_native}/${TARGET_SYS}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$standalone_sysroot_target' >> $script
 	echo 'export PKG_CONFIG_PATH=$standalone_sysroot_target'"$libdir"'/pkgconfig:$standalone_sysroot_target'"$prefix"'/share/pkgconfig' >> $script
-- 
2.39.5


