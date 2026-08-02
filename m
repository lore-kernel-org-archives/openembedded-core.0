Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D02C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21344.1785666564906800672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jxobq3AZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso4648375e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666563; x=1786271363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ltsO6fot+TGXGXgN2CjrYGDn4AD7nJ+1VLf0hoCmh3Q=;
        b=Jxobq3AZJm2UfjDdvoBI1mJOQ7QcdLMvgv8xnYzZ5Nvq/Q1pl42SmpkNvFxBWNi/kd
         OLBbOLdWkh31l4xAQxeHPLtLBx0CZQeuRwuh8CzEoMkac7JLWThbAvkix34U0srFd8nZ
         b4Nz0eywCnOe4ldez2xoHgFD/vqtaQbEshYaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666563; x=1786271363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ltsO6fot+TGXGXgN2CjrYGDn4AD7nJ+1VLf0hoCmh3Q=;
        b=qi9ZTma+MPPkdM6nKUaZ/qvItEpFaCjVkVy4LllW41A1bcD8BBGpZu9FvwWLzhDwWl
         1Gd3sMnvtHM80pT8uOzVZr6dOhDhq/Mkco5NPJ/KCSz6ue/OIcXFCTxBXdMIj8x4Wdl/
         A+NMinL7adojjQJhFxugX4xKF0mDJXZiM+JCPYp4X1Dg755zemOsVy2pHMazstlhExm2
         2TKPzLPVlHcpGC05R5dPRel/s7ivrI4/+FaPLa4FsbqBj4yvJ1OrzMz0mLt4qh2XM1OQ
         kJaqOHpUZgoekua6pRIgyX8fYLRTnBYXb/MgRK8NzxUwD0kTWAXhP2ADHbEKEMlucV+N
         l9lw==
X-Gm-Message-State: AOJu0Yzyu3/qJPU/5sj5EBAHckQWg8UMjcHS5tvCnfIJS6jBDzdsEu1C
	upLFXxA8GzGtAM92PETFOinIc3/PwT1iyKTTDEeko+efYtVWS31qQGuQ9otb3M1o2iIKAUjioyt
	Pmsy9l2Q=
X-Gm-Gg: AR+sD13MdNqwKoz5sHmTNxntEVzH37+6hd9U/TM2CoWRtr3PnA/Rl0ViInsHTNdxfEc
	HDchVvjR7yoT7NasCevdm0V7/gj83NL8OlYq+rh/uZlffowxQrhaBlaxtY03qLlha+BvmOmXqs4
	iYP6iSWSUfjgJmdxlXKTuyO0KPUF9xE3AByz39zuYS7LjTLjIm1oQnl6bUKtgcBIcRR0rVLzNXt
	WKtx6yUfoqWNw1pcV9RntmTwMEDyJ6fUZzQsAxGiBF+owYBcNJzx/d0+4R93Xf18jdJlLvfYEOg
	0euBW4SCIQJk3/clQpcZm5nMrNhC3kydCPZd8gI/COFcnNMthayQ3xtbLnbf35K3PKjd8jQTbDf
	3z+/p1v9/NcdKGH/vddm9ArXkCyV/rUWerFdBaQQHN9scIXzdDcXTWONAKocpSAp4jGt+ZWOQim
	wcDMYjggqaEUR/VW6TMyb0W87N5O3/4iVCZhkm1sIawcTojTWgHr/YE3H9HZIlhWo3EVQVSBroU
	hiqgE5BYMjkF9KhflUZrrktk2f6eA==
X-Received: by 2002:a05:600c:8b14:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4980c66d8e5mr125469105e9.3.1785666562578;
        Sun, 02 Aug 2026 03:29:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/25] kernel-devicetree: Add missing function prefixes
Date: Sun,  2 Aug 2026 11:28:49 +0100
Message-ID: <20260802102854.3952760-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242545

There is an implicit ordering problem with this class and kernel.bbclass,
since kernel.bbclass uses EXPORT_FUNCTIONS on these function and if the
inherit ordering is wrong, the functions get broken.

The class is always included and always wants to append them. Therefore
target the real functions we want to change.

This makes the inherit order less fragile.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-devicetree.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index eff052b4029..49c39e27ec1 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -44,7 +44,7 @@ get_real_dtb_path_in_kernel () {
 	echo "$dtb_path"
 }
 
-do_configure:append() {
+kernel_do_configure:append() {
 	if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
 		if echo ${KERNEL_IMAGETYPE_FOR_MAKE} | grep -q 'zImage'; then
 			case "${ARCH}" in
@@ -66,7 +66,7 @@ do_configure:append() {
 	fi
 }
 
-do_compile:append() {
+kernel_do_compile:append() {
 	if [ -n "${KERNEL_DTC_FLAGS}" ]; then
 		export DTC_FLAGS="${KERNEL_DTC_FLAGS}"
 	fi
@@ -77,7 +77,7 @@ do_compile:append() {
 	done
 }
 
-do_install:append() {
+kernel_do_install:append() {
 	install -d ${D}/${KERNEL_DTBDEST}
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
@@ -91,7 +91,7 @@ do_install:append() {
 	done
 }
 
-do_deploy:append() {
+kernel_do_deploy:append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_ext=${dtb##*.}

