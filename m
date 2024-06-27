Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7514C3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:11:11 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.3175.1719475866280569900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 01:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bpK49iEa;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso1458224a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 01:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1719475864; x=1720080664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pnzC/bGAfzyEbQ6X5j3OPTsX6EuOEgoMZTeY8rLgvk=;
        b=bpK49iEaPhOLywBfwuq4D9E8ml5mrESyN/+hYW20bOA5JRQtXXG0vr7tIa61dA/Mjf
         aj2r09FzXQeQaxHjWQj2zx8Wc1SmCRy7pvnzKgptfBbiyhdXoh0/RSvL+yNfUDtUpS7C
         BosbG7PMpdIw2xnY1fOY/mGlVP3EpGj7sxSsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475864; x=1720080664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pnzC/bGAfzyEbQ6X5j3OPTsX6EuOEgoMZTeY8rLgvk=;
        b=tHaGEhOb5ZfpFAcnYCEGgMIT09Rj5QzU91TrmQsSFcvu/cip/Jz9f4TTVtDXCuHR0b
         basgI4ZdA+JtdGLVaoJ6VYUc7al7I4fwCP6A3Jw8XYGjo5OC0OzHasqDZ0MO2QGWpY7o
         NyKCSwgZhsjQdM3FomIZV2K0jcN2Klc0KAA6/RTDZ2Q79g+z6ovfT/bFWiAhabtnbPl6
         fKIWjNYut8G6nkff/mloXJHVq6wkT24KcVFCNELrqjyMVlbharvVHhGctnJv+78EmPZj
         jJYfBDxfeVsP8D4EI/af2K/utJjYF96RF7znnj4nG+8MIaZ/eybKAgpKvQabRfYf/eQz
         wc2A==
X-Gm-Message-State: AOJu0YzxHmjWyP1SqbJGL7i7IUWav5MmC1iNk7K2XWv2OvaPvTtlZURI
	i9KOT8P25Pvx3oG7oReIvwRwsz9IkbMv7NCJ2llHPDYgUZ8MiZxEzBjyGGezazhDBIUMUOJwjoi
	q
X-Google-Smtp-Source: AGHT+IEIjWYQKPvgGKm6ngFL+BRhwjvHtwtmYKvjdW+RBkeuGBPwvM7UGToLKUeKqNDYTh12MUJODA==
X-Received: by 2002:a50:a6d9:0:b0:579:e6ff:c61f with SMTP id 4fb4d7f45d1cf-57d4bd79eb6mr10081398a12.25.1719475864343;
        Thu, 27 Jun 2024 01:11:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58553908d18sm132248a12.21.2024.06.27.01.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 01:11:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [[PATCHv2] u-boot.inc: WORKDIR -> UNPACKDIR transition
Date: Thu, 27 Jun 2024 11:11:01 +0300
Message-Id: <20240627081101.2346550-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 08:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201193

Replace references of WORKDIR with UNPACKDIR and B for U-Boot script
and variable UBOOT_ENV_BINARY, for example for boot.scr.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 45d700fbdd..ce14847b33 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -92,7 +92,7 @@ do_compile () {
 
     if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
     then
-        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_ENV_BINARY}
+        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
     fi
 }
 
@@ -188,7 +188,7 @@ do_install () {
 
     if [ -n "${UBOOT_ENV}" ]
     then
-        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
+        install -m 644 ${B}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
         ln -sf ${UBOOT_ENV_IMAGE} ${D}/boot/${UBOOT_ENV_BINARY}
     fi
 
@@ -324,7 +324,7 @@ do_deploy () {
 
     if [ -n "${UBOOT_ENV}" ]
     then
-        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
+        install -m 644 ${B}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
     fi
-- 
2.39.2


