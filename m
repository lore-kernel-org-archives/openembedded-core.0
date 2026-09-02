Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A48C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5535.1788326803308695607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vgjEGuUe;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso4672805e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326801; x=1788931601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xDbFATsXoVStQLnH+1BYbNXQqzOTI4aw00zn18kdJm8=;
        b=vgjEGuUeVvX1vW0pWWFTde4JeQLm8jqfjHmSnfL3kX7/LUdH9ShaRyoeZ+vpfjRUWu
         DDf4Ns+UjmkxvhHpt3HDkyhEKiTGh9ver5YLr/CyN0fy9HXpJTTBQrTT4qDHv1RSHrHT
         pd4EB7iTOHlrpfNQS26HJg6hzJCCHcrAA7uxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326801; x=1788931601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xDbFATsXoVStQLnH+1BYbNXQqzOTI4aw00zn18kdJm8=;
        b=FFGFzypRk0WuMKtXFF/0+8uG+AGSrOMH9K9WqDOGPdaJJoKm2ay4QTyjElc9+vsH6y
         COw8H9pYtsI2/JT2UnUh5mXe6NglIJstTld5k5ad1Vw/pTThpUkEmqbjZk+o3BL0ThSy
         /XNchEMl1OunMlGaWYqqE2B/p3GS+tPG8d49ADGfuNIRyg6ejg16DlAwQm7/uq6ntayo
         WeW4Um6fXAQfU5k0bCVe4W3RK8CyDROwzMtQIHWFtv2Y00UiizB8N4ByeKUPDG1qecTR
         8v1hYSsr/eFs7rMLNHLIOgMD5KvdoJvp/7qBXYbpmRpyAdS5GK4FtagTreZW0EgVBccO
         EAog==
X-Gm-Message-State: AFuF++lawz/a7blLNKyCwoWEWUmHgr3t8CfOiDiS37+zaGz+/KvhcADV
	1qvv7xcCJQmC9M/gjdhwZ5phnLVPuCZ0G6wJgb/Khw85f3GmOtmz4u/ASU+0/8Ld2PZkTN5P1Ax
	YXj5Qd4I=
X-Gm-Gg: AR+sD130P9Q/X/KR6U2N1vqhh/bjL5CZAdSuKI2VGc/vLync1w7NeRpr8UzGFc5Ln8X
	TsufpdXnykRllwXiW9u63XIQOJ7oR/a27Ww/PBTDT0P4oAsQquri5rv8WDFfogOY3aGcL7Iu2Yw
	/OCFoXuN+V5wZ/Dp7ER9NxggCSsKLeuC0DACpp/NO14enNJX3Tg8nVFZiCw/W3ksM+q62yaJLo0
	HoO9R38FXo8jzIiv5/t/mR6j5mQy2ax3Jwjk6TwpnwFCLX7+9/cQWl9oeeWboOGBd++hqqRueCa
	zEfFqJhiAV09pWzNdqtXJvpmd6lhO0FbiwJ6Nk/2wOAnfFcMpmjbARfkiKAzNFQl8TXbveyHnA8
	n/AjNP7ZNhFQxBlMsFDjxM+1WwvTUFlhsvUbqmWzb87a2tk2XeQX+mX+0hOD9klne/M+h+/DsXB
	XlLT94/gePHfp4L9uM0tOBobVr5yduAVzWNMVk6CHbmK5vb8JfdoBYlhxQ3RXK/UUcWFY6ISXE3
	Fjd34bOYXYFf5765g==
X-Received: by 2002:a05:600c:3b25:b0:49c:cfae:34d2 with SMTP id 5b1f17b1804b1-49ce55fb5f7mr34317385e9.4.1788326801577;
        Tue, 01 Sep 2026 22:26:41 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/27] systemd: upgrade 255.21 -> 255.22
Date: Wed,  2 Sep 2026 07:25:24 +0200
Message-ID: <846292594d7513e0ffbec5e0481084844505b51c.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244858

From: Peter Marko <peter.marko@siemens.com>

Full changelog (36 commits):
* https://github.com/systemd/systemd-stable/compare/v255.21...v255.22

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed changelog URL]
---
 ...temd-boot-native_255.21.bb => systemd-boot-native_255.22.bb} | 0
 .../systemd/{systemd-boot_255.21.bb => systemd-boot_255.22.bb}  | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../systemd/{systemd_255.21.bb => systemd_255.22.bb}            | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.21.bb => systemd-boot-native_255.22.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.21.bb => systemd-boot_255.22.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.21.bb => systemd_255.22.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.21.bb b/meta/recipes-core/systemd/systemd-boot-native_255.22.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.21.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.22.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.21.bb b/meta/recipes-core/systemd/systemd-boot_255.22.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.21.bb
rename to meta/recipes-core/systemd/systemd-boot_255.22.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 28392b6b09d..42e51913da4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "70500d37992a01d3275b1c414c3ed161d6f91f9e"
+SRCREV = "356c54394add8c6a1d52773852c23656590dc33b"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.22.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.21.bb
rename to meta/recipes-core/systemd/systemd_255.22.bb

