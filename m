Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5516FD39413
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 10:44:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12910.1775126678962149162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 03:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ASRmbPjO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so6284075e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775126677; x=1775731477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO5NHiGUdUYdSXDBh1YzVkF0yaKz6bbWdRYvM/+Mrxc=;
        b=ASRmbPjOs2g8WloTOG0strrqu4OjUDFTDBHAS2FQDifYiPwOt9azLQZwfv9HESWMYp
         XRVNfRBCQEn2xv3a7K/sl9QeOK2X/A268ytCv4WhS/cFHbHHrygEt4kiHl7Bh3joTUgb
         fPpFY0i2N3eFkgLRBnFq/KJh19b7AONrsmgDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126677; x=1775731477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vO5NHiGUdUYdSXDBh1YzVkF0yaKz6bbWdRYvM/+Mrxc=;
        b=SQGqLhHrUgh+07Jowy94U+KCJz8fgryIKlBNJWxaAR/Nxf4cyPqOAB/IcT5NwsOonp
         MJ/OaQoWwJV0lNLlSG5crXTL7GhP+82NfTVTD8AyS1c1sgYGXpUiyJ0WfeLeVP/w+fiQ
         mLgnn3P5ZythFteNsWvXJGkRpCeUbUohMw2wWyek6bTw7ubE7kbxN/HLbaib6I85+cg0
         bSwdQV4dGextSg5hn/7mDNcLuVJuOuD6qjPM2UCBNXshBjYOHj55B7RO+uyhbhHBz/I1
         dkgEOe4qZTvvDNAe767IFikkHz2/DRrm9LW74KzbkBywaBqRLmwWfCgkLfFXzcJb6zfo
         aAmw==
X-Gm-Message-State: AOJu0Yx5FUB8XXlAifzIqXwtVahFmx/Gt9vYfa+mMno1HYbRuTKAlvBA
	qLtOCc3FU/DqE9tuOy6adGwPKCeJKX0CuDg8b9EraaRYZrmJjY8xWoBaaW34jKO4cpT2AQeOKLY
	bhCm7
X-Gm-Gg: ATEYQzwZDXib/iZNrZH7FSOIuAjbT7sOcAuBA0OAUakd3aVgDBNpJBxEw2fJ0+Gv0wL
	vg3zXCHpn7dgJ4c4eWCRAafkBMDy+zcr7SZorLvIG8Rj50WGD8UQzVF6jt37ksIH0FtUdTb4cHD
	nd9zesO5/6deRgfNj9PFb4mCJg02ifcBZVm+9Xju4tZICX4mpQJV+lOQ95AfOicYiqoCQSnLNBP
	IBU8PNfCRvNi6BW4rbj/wySnFjw6+5+f6h9j08zqVAHQM4kmoPXMWLN6LLudUMGTGhlLG1BlF6h
	aGwSstjbMXRxUbnPwy3468f7kM+qRC/6xxtIdgHgOsXOUG7fFHBKKwr5L5VjRpKS9uCtH0CoM6f
	JuwjM2y6SO823nDyfVH6OHI38BW28KLKwpBY+UwK89lM3/IebxTmc4DG6zPGrgPJcei85qx97CY
	vKTxyYN39XGCIRjTw3IYR3q8ly+JBsdQnJJq4R8lpEbhXoSm/kdILO
X-Received: by 2002:a05:600c:4fcb:b0:485:3e20:4013 with SMTP id 5b1f17b1804b1-488835d539cmr122804975e9.28.1775126676765;
        Thu, 02 Apr 2026 03:44:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a695:b092:8c54:d70f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm259750855e9.15.2026.04.02.03.44.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:44:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] conf/packagegroups: Drop pcmcia from DISTRO_FEATURES to MACHINE_FEATURES
Date: Thu,  2 Apr 2026 11:44:33 +0100
Message-ID: <20260402104434.3525234-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402104434.3525234-1-richard.purdie@linuxfoundation.org>
References: <20260402104434.3525234-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 10:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234514

Whilst the intention was good, nobody really needs to exclude "pcmcia" from a distro
level any more, it is sufficient to have it as a machine feature which configuraitons
could disable.

At the distro level it just confuses people and looks very dated, so
drop it to a machine feature only.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/default-distrovars.inc      |  2 +-
 meta/recipes-core/packagegroups/packagegroup-base.bb | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index daa4d2a74dd..468028587dd 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -26,7 +26,7 @@ DISTRO_FEATURES_OPTED_OUT:append:microblaze = "seccomp"
 DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = "seccomp"
 
 DISTRO_FEATURES_DEFAULTS ?= " \
-    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 pcmcia usbgadget usbhost \
+    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 usbgadget usbhost \
     wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
     gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
     "
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index fd61ba4437b..5bd73ca17a4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -50,12 +50,13 @@ RDEPENDS:packagegroup-base = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'packagegroup-base-acpi', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'keyboard', 'packagegroup-base-keyboard', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'phone', 'packagegroup-base-phone', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
+
     \
     ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'packagegroup-base-alsa', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'ext2', 'packagegroup-base-ext2', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base-vfat', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-pci', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
@@ -199,10 +200,10 @@ RRECOMMENDS:packagegroup-base-bluetooth = "\
     kernel-module-hci-uart \
     kernel-module-sco \
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
     "
 
 SUMMARY:packagegroup-base-usbgadget = "USB gadget support"

