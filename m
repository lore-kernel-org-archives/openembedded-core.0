Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109C3D39411
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 10:44:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12911.1775126680090161377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 03:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cToXbTKI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486ff201041so6808405e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775126678; x=1775731478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71qRV1qSTmCZLTNfURY+FcoG0J0RoCpluwBEpJnf30k=;
        b=cToXbTKIgth+k30t1fbutI5nWvBIaARwphwcL2GDXUuUVA8yc/Nix4KGYRg/YAbEuJ
         1uRIME7H3xFBOezGaaRfgpGT3P5mGkESuRmL8KbfjHQ04jzIzHex+zHsV3ExXrOEcjVi
         /0B3U2nZ52yXVuEXdo/esix/+8fnmC2jptPFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126678; x=1775731478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=71qRV1qSTmCZLTNfURY+FcoG0J0RoCpluwBEpJnf30k=;
        b=YNcNPcP1FUPWoQjZxEEbGrVOyTZV7M3Hcbts2ns9mEy0TTunknlMMexUvDg8gHeree
         5S1JIfYtx0aox1A/KecW99NNUtZTq4q/gbEtNsukjHKZ6Z6pSlsNYilB5IjPArn6Bm18
         ErHR6l9yfWZ414Yu5lBhzsiVFGj/4QP6MPv+5f2U4TAEGXttN+eXsxqoA0k0y5/LaERg
         nkuAVUAWMMJHYFRgbxMaMdjd9EXEncpdjqpLJeyVI0NS5x/EPFJ7fD7Ym9EIMzaupJiH
         yi9Dzb/ImsdxglpOxgoq3AEuOotGRyaBdyd02DE7AUHh0XWsWwKrC7Ch72x7XJQZrtky
         p2Pg==
X-Gm-Message-State: AOJu0YxiiQC7YroV4PSNgtIftVSsTP8RgmOozbhfBoI7ZY0WJ0OHtOXC
	cZggBoNQqC4yvgnrDISLyef1sdznW0TtA5/QshlTNy6hOFwbuIWeRR1H2g9ClWBUPG+Wnn8Ow/8
	NNL0z
X-Gm-Gg: ATEYQzxm+9ix+xEH9PxvGyPpU9ThxuvcgU1HRxIaMnpH8Itd6o6pfRWRxsyDNBKSn+L
	0SkpWvPk4X52HcnOWWBz09LBpDMmbQLj7/IN+oSHfmRvyvk2dbr8y3xx/sQHNN4LlbI3+OxX5Rj
	b4E5tqF1vMNIkEGZIPAbJ9/RHJYujwUy5AvXH2rDRjjTQCMsgsvUe6hYlqrw14IRv9stwaeK0k/
	W8T02cpbn+UZlGHzViZnnYlXm+94dVl/DpT0UDtJmeEu2SnhBlcWgbP/rBrGyRKyk8PaVv+apl7
	gwiuAKpF2a9NxD1gq7L0xOpsqPB78e1x/xq0mBRlG1FYgBMCYxtXdtdla8PXtiDVi34gHJcHMAl
	jQ3vFhx4SeCIJxgXSXO/yj5lukFqSVcDqltWIZtZfBsE9giZzmp8zske9SbDiYaO9SQPikoWqg/
	g/52goBLktsrbe/EQY+aPiKqmnluf0fFDGX3Emi7PiyjnXnRGMBAh+
X-Received: by 2002:a05:600c:c83:b0:485:2fc5:3a5 with SMTP id 5b1f17b1804b1-4888b7ab5efmr39493715e9.26.1775126677934;
        Thu, 02 Apr 2026 03:44:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a695:b092:8c54:d70f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm259750855e9.15.2026.04.02.03.44.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:44:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] conf/packagegroups: Drop usbhost/usbgadget from DISTRO_FEATURES to MACHINE_FEATURES
Date: Thu,  2 Apr 2026 11:44:34 +0100
Message-ID: <20260402104434.3525234-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402104434.3525234-1-richard.purdie@linuxfoundation.org>
References: <20260402104434.3525234-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 10:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234515

Whilst the intention was good, nobody really needs to exclude usbhost/usbgadget from a distro
level any more, it is sufficient to have it as a machine feature which configuraitons
could disable.

At the distro level it just confuses people and looks very dated, so
drop it to a machine feature only.

Instead, for distro level control you could simply now do:

MACHINE_FEATURES:remove = "usbgadget usbhost"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/default-distrovars.inc      | 2 +-
 meta/recipes-core/packagegroups/packagegroup-base.bb | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 468028587dd..4bfe2469e28 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -26,7 +26,7 @@ DISTRO_FEATURES_OPTED_OUT:append:microblaze = "seccomp"
 DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = "seccomp"
 
 DISTRO_FEATURES_DEFAULTS ?= " \
-    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 usbgadget usbhost \
+    acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
     wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
     gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
     "
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 5bd73ca17a4..65f75b4404b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -51,14 +51,14 @@ RDEPENDS:packagegroup-base = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'keyboard', 'packagegroup-base-keyboard', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'phone', 'packagegroup-base-phone', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
 
     \
     ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'packagegroup-base-alsa', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'ext2', 'packagegroup-base-ext2', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base-vfat', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-pci', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'wifi', 'packagegroup-base-wifi', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', '3g', 'packagegroup-base-3g', '',d)} \
@@ -199,7 +199,7 @@ RRECOMMENDS:packagegroup-base-bluetooth = "\
     kernel-module-hidp \
     kernel-module-hci-uart \
     kernel-module-sco \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
@@ -265,7 +265,7 @@ RDEPENDS:packagegroup-base-wifi = "\
 "
 
 RRECOMMENDS:packagegroup-base-wifi = "\
-    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
     kernel-module-ieee80211-crypt \
     kernel-module-ieee80211-crypt-ccmp \
     kernel-module-ieee80211-crypt-tkip \

