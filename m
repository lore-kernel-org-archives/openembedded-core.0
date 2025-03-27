Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFF4C36013
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 19:44:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5473.1743104681676721587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 12:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LZCJfEph;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240b4de12bso40821885ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743104681; x=1743709481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaqZHoMjCtU4RdhVR2O9oKeczw97AJ3GbyAaIckClpk=;
        b=LZCJfEphu1FoiD9tcZk2rNaLk7cPKza4pWNeR/k6gbjYfBg0R9F/J+SpfwZ8Ci3zSO
         Di/b0mGfxSKBiOGg1brsUdCIRczHezeKOc/x+T0AVqfwPt1SE6wEQ97m51eiDvOcJbgM
         T9qrR32F/YUEMky2e+gl8/v53f2hGFiVOGvt0vmRUtSz4QEdjiaQmeCd9GnfPLX/3WFX
         QmDMYVGwOgwCDeYbPr752Qnp/eJE0ssSsyjBp9Wx2dLBvjvBVkSprEtdYxwu69o7DB5/
         V8tQxQapPx6onxTZ/Ty89GmKMF5RsfCZ1cF6LMFEI9HQIbZkT70Ns+U7+QbzMqM6hBDN
         BMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104681; x=1743709481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaqZHoMjCtU4RdhVR2O9oKeczw97AJ3GbyAaIckClpk=;
        b=GngP8fudRbYUwG8Nfz9gP2KTZ8AcGz0ZZrMHD2yTdpojLSk5KRBBBGjjo4iCF4BlOM
         6dNMg+4ubF+hSD+X0/EGnSVM0ZQQQmzrB8mssclh/VF6ZxplWZwq+N6wMhjBHIRDTmlI
         WGWj5gWHvoz3afIe8Atvn/39VQRl88A4+jZ2VkDMXGRoJGvWQdvjvIHoIcQZ+c0SFjZh
         +JPcvBbnHDztz99bBbC356gM/BOoVkwGs7onsbEyOwqm9cXaZRAwIVzERgu3p4GkXtd6
         FnS9g2Gm16LmlZWVxjkQTdhWGnNxhvrBTV/NPou81fL9vVsCx8zVBzo5X5gc4IYoUzrn
         k7Pw==
X-Gm-Message-State: AOJu0Yz84A2HiIn0RXGhhJ/+PSDKsHqgD//G7sZEjNv2/jFxFRgsMLuV
	+ZG9mEgDZIKhK7FqWMSWwwBYC7UfCP5w2M1SOus04m0/pRY0vypYApr5o/4jzhgUgNgvV/X1JXz
	2
X-Gm-Gg: ASbGncsRhQH9IA2BRCfcO78MVGQoyBy7raRJ+rtIOWQAHLwrJQ9upxv86Sil1ue5LzL
	JbkgEZwVTEvmCtHOUVj8oD8UgHCanHrMav+KsyMWzPycFMZJ7e5WxTinYtPGB5kRXL8MXtLQx5F
	eQmGnmDyBGqb59Zqo4Kep3VAiAELzFbvp5khImqp0JI9YI5xup+V531h86FFjXU7XP5EH7a13Fw
	QP92SduH2E9mSXp1G2IXQkcRVolvrRrxpz5DMilXgkhsYJGhTFnQHdSP3F+MN6ZKAEtjUvNqpw/
	siKfZ5sdl4gP8zwO6/xhZmA8evxBcecsXRzngOdAL7JYjw==
X-Google-Smtp-Source: AGHT+IF3wVjtGXMzOzvqhS1hGMLKjbRTjNea9bx0l9pzoqf3oBLrOTB40k/SNtwx8/CxktGQbFFKfg==
X-Received: by 2002:a17:903:41d2:b0:21f:7e12:5642 with SMTP id d9443c01a7336-22804855243mr55016555ad.18.1743104680866;
        Thu, 27 Mar 2025 12:44:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm3865875ad.75.2025.03.27.12.44.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:44:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/10] kernel-arch: add macro-prefix-map in KERNEL_CC
Date: Thu, 27 Mar 2025 12:44:15 -0700
Message-ID: <58eb15cdc2dd95bf5eb0bed2a0f1c43bf29cf273.1743104524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743104524.git.steve@sakoman.com>
References: <cover.1743104524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 19:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213786

From: Stefan Mueller-Klieser <S.Mueller-Klieser@phytec.de>

When building external modules, macros can include absolute names of
kernel headers. The macro-prefix-map for the STAGING_KERNEL_DIR is
currently missing. Add it in the same way as its done in bitbake.conf.

This fixes reproducible builds and following build error:
ERROR: cryptodev-module-1.14-r0 do_package_qa: QA Issue: File <..>
cryptodev.ko <..> contains reference to TMPDIR [buildpaths]

(From OE-Core rev: a741e11751bfb8f52be58cf51abeddca4559e5e9)

Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index b32f6137a2..36a6e0a60a 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,7 +71,13 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
+KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+ -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
+ -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -fmacro-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+ -fmacro-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+"
 KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
-- 
2.43.0


