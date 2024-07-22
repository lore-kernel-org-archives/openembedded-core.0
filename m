Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6C1C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 08:15:33 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.13468.1721636126965045028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 01:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RPMvzO9f;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77abe5c709so385849766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721636125; x=1722240925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufJBtcrA3SKfs8K7W+1jPIHL/mX3cDeJD9kXseCkUOk=;
        b=RPMvzO9fpQ7N/TTxprDODbVhDkMtVfwWTwD44vC6UOLxVeDcffs6rA/L2B06redHA0
         D9L/eRJLCXTFLhx9kzjLvlX+ISV+L05AT7wyUnKWJLO6bkcQY5mQv/XskPAGnRzoVp3s
         WJNcLqKhPPNC4qh84oEg4rxMCr1hdz78r3wKMZy+I4sTaFEHQ0iBZJ/fk8soz/U5A/aY
         stjQAGMgwCfuvQ1wsyaEcDajYVlhTLZG3eKU2mVxLhYB6EKvJzR3ogEq83VuWtu1DfiO
         PDhrO1tz0/CfvXVQtHl4p66Vr6t9nRgyrZhKiQD+xK92siI9Y8YzJZptPkFr8PfjuoWh
         XsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721636125; x=1722240925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufJBtcrA3SKfs8K7W+1jPIHL/mX3cDeJD9kXseCkUOk=;
        b=ou47yo9ZcZpAvFwBEIemPpo+Wq4VZyI3OF7CAn1cZc0FaHssnNvTbTg1bPAelLF61p
         OiubYDSkpC/lAgAZ3MfLoOoGIbQFAzDqndPTvaKWpGnqaa3XrZ9rWN5aRJ6TbG5zL8BY
         lFRgxm7Xg/I1ai6Y2CgC37enkdPKHwpDIYhlOPMhpvXb99dqtyKqKz52oTOgAJCJBugK
         IzrJvR96DvaaloNWQW6wtDL1xSxeJHXDPnGNIfoMCrXLwS7nX86GV+DHMUrYSdPcjzOF
         her6RioLzGGbI3VERpfZMhV26g6qsic83my6HhGOYDB8E7ypBOyys1iwClsc4n6A6SJY
         OJPA==
X-Gm-Message-State: AOJu0YwbG+swDzcSly6RfNmXjJIouMM6K/9jxPpI4S7e0sxYUTtwjJmp
	XXX1E59wh4amt5XEovAC/TZk+lqEG5LIkAMvEcVVeJfg4uRZJQLs9Vl4uA==
X-Google-Smtp-Source: AGHT+IEjhW+MUhcPjTcjq9pzHwot/nByEFnoV61XlYTLMTzoCNA6BgtqY1kGa/zYYzm7iOYrdseXfA==
X-Received: by 2002:a17:906:f5a5:b0:a77:d201:b894 with SMTP id a640c23a62f3a-a7a4c4768a3mr375875166b.62.1721636125022;
        Mon, 22 Jul 2024 01:15:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c91db91sm392787966b.152.2024.07.22.01.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 01:15:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] kernel.bbclass: add original package name to RPROVIDES for -image and -base
Date: Mon, 22 Jul 2024 10:15:11 +0200
Message-ID: <20240722081511.1329330-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 08:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202309

* -image and -base change PKG to:
  PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar(KERNEL_VERSION))}"
  PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar(KERNEL_VERSION))}"

* but only when debian.bbclass is inheritted they add the original package name into RPROVIDES by:
  https://git.openembedded.org/openembedded-core/commit/?id=3409c4379559afbb1d1d29045582995147a33bbc

* fixes the build if some packagegroup or something RDEPENDS on kernel-image or kernel-base
  and the DISTRO doesn't inherit debian.bbclass

* as shown in pkgdata:
  linux-raspberrypi $ egrep "^(PKG:)|(RPRO)" 6.6.36+git-*/pkgdata/runtime/kernel-image
  6.6.36+git-debian/pkgdata/runtime/kernel-image:RPROVIDES:kernel-image:  kernel-image (=6.6.36+git@PRSERV_PV_AUTOINC@+733366844f_769634f344)
  6.6.36+git-debian/pkgdata/runtime/kernel-image:PKG:kernel-image: kernel-image-6.6.36-v8
  6.6.36+git-without-debian/pkgdata/runtime/kernel-image:PKG:kernel-image: kernel-image-6.6.36-v8

  linux-raspberrypi $ egrep "^(PKG:)|(RPRO)" 6.6.36+git-*/pkgdata/runtime/kernel-image-image
  6.6.36+git-debian/pkgdata/runtime/kernel-image-image:RPROVIDES:kernel-image-image:  kernel-image-image (=6.6.36+git@PRSERV_PV_AUTOINC@+733366844f_769634f344)
  6.6.36+git-debian/pkgdata/runtime/kernel-image-image:PKG:kernel-image-image: kernel-image-image-6.6.36-v8
  6.6.36+git-without-debian/pkgdata/runtime/kernel-image-image:PKG:kernel-image-image: kernel-image-image-6.6.36-v8

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 2a4f3defda..4464155b73 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -720,9 +720,10 @@ RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})
 # not wanted in images as standard
 RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
+RPROVIDES:${KERNEL_PACKAGE_NAME}-image += "${KERNEL_PACKAGE_NAME}-image"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
 PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
-RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
+RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION} ${KERNEL_PACKAGE_NAME}-base"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
-- 
2.45.2


