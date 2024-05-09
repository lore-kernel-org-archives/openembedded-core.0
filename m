Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC474C25B77
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:06:00 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.8414.1715256353288870000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OAqAIIlI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f4551f2725so705903b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256352; x=1715861152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPkBeof8T58RMd0o9HrzifLYTqNNMAWLfaoaEwRRexI=;
        b=OAqAIIlINtBFL/YuKIFVX5m0PRdjqluDPUm2xdUjo7xBac60lL0JtmnMhjzBpNO8++
         sq3tHbau3VOP7LYk0SaddmFgmofbeLT1ApY2SWHT441PD5YMlXsg93TsAUVBjbX6on/X
         LbjcR6hFEHMiupwHZVRES/5ePasMtkcbb0t02hTCLl5yV7ATVoszOwq4NqrcnU0IiVGP
         8DGifNY2YuAC8fAeyYcPyqrsZ86l1gO83MyT+u2BpHQGE1AimMCPQM+uhlh+pDwG6RlR
         sXD0NxCMuiwZF4I0B62JRC8hJA1YU/PRPAUU7HVparUho0uSgsJHJJnu7Z9y6TPysXx7
         Je3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256352; x=1715861152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPkBeof8T58RMd0o9HrzifLYTqNNMAWLfaoaEwRRexI=;
        b=texRoc4Lb4gPssoJM8YRXHmDCrX6ATZJNNRLzRyOV8z+Gi+irTHUtp5UQevxktfXsg
         5EysBdaMyo6lERU3dx9LxBM2NxuzO4OTymMQq4VIMXuxc5Pd69tB7IN70OYBC1s4RsKF
         po7au67eshcBDe9yB/sOwjjduE83iosSw//L/IeIc9x4kSWK/NDO+P5CV+79WrmRswS2
         C7z99APu3kTWQPlozQ/qsgmij7bJVM5KhbkBd0N65LHncvhGkjQ/40Yu0rgL0NgW+aZv
         ff2bAWXnFhMSpWRhl2JPoyWGwGVvlM1fp9hzs3XMnE4JDbdH9ah+7aWDMVSvgOiwgYKR
         FfAA==
X-Gm-Message-State: AOJu0YxRYATQ50ODvmBMv0sx+F+G2a3XPzXzMezYyYu8bye2442lPpgS
	/sa/mJESICuXK6AmA7Mh8xv/Mgvug27FSsN+CrVMvzxDDfjk4AY/rOFv3l0VgwYdQgxzAH2YPXs
	K
X-Google-Smtp-Source: AGHT+IHi5mdYi0bFohzg4zSst5C+YmZ74gMIhBc3zTdbOzPmH+C0blhenNmK3cg7D5xMDrjIVRBv7w==
X-Received: by 2002:a05:6a00:6985:b0:6ed:1c7:8c5d with SMTP id d2e1a72fcca58-6f49c21ef15mr5591638b3a.12.1715256352615;
        Thu, 09 May 2024 05:05:52 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/23] kernel.bbclass: check, if directory exists before removing empty module directory
Date: Thu,  9 May 2024 05:04:59 -0700
Message-Id: <4e4681b26e0d88ad219d72b75e598e6b81b430fc.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199168

From: Heiko <heiko.thole@entwicklung.eq-3.de>

If the kernel folder does not exist, find will result in an error.
This can occur if the kernel has no modules but, for example, custom modules are created.

Add check before deleting.

Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ef767d84d56b25498e45db83bb8f9d9caebeaf9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index dbd89057f3..988a489396 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -452,7 +452,7 @@ kernel_do_install() {
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm -f "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
 		# Remove empty module directories to prevent QA issues
-		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
+		[ -d "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" ] && find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
-- 
2.34.1


