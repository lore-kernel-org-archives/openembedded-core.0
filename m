Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EACC52D71
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:52 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.30104.1722791387722638965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u4gLyv2e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70f5ef740b7so5375953b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791387; x=1723396187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3rxRmSt7FAFexg+FxWx4LzHIlLTt0s+jJBjPeCt24Q=;
        b=u4gLyv2eGhj3302VVRD9TSE5Cb/0tXgRluJBAoxHUmmuIjlhe5MCo2FUu79ZVQA4JJ
         v7lC4srJa6tgOBYBPiIiTNsULEbazxruEWMuCDtDOODMj7XMFf3oz08QqRnnktZnzgQP
         WNIKNfFviacg7Fn4vzn5QnEhm0EnlQiMgXzFd9l0P9m33jOvweVdoeNANL6kDkOo5fQO
         pVsmxSf8m8/yDroVrGPoLnk/8dnGKPKaczInj2va7YxPSWQk7lISRpfLswEtLAztbe2m
         JUo36pnngjyzlWcrZlrd+J6ZrAie2JX1nSMTcFXqMdg4gHz3Qg57zYTzsWitcuFqS0fg
         0JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791387; x=1723396187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3rxRmSt7FAFexg+FxWx4LzHIlLTt0s+jJBjPeCt24Q=;
        b=UW5yhA3uAilgQCchbWOUw/oMW2ICPVi8ssKKPvoQta+HHxWSqbtyfgg+lt8BoaNIkx
         iTQaew0RCTWIE8xwukfrZt3BKREGGztEwp7SgqV02omdP3ZnLhdY4c/R+pxw32GedCwW
         zxu6va7FCxQva2dJdIsM0lgg9ZnFLhJQ2U9LGmreI3mYv2V520V+XKKbUVcUuihSD+aU
         ygkPS3hPVrZLvm0G5KP8AeLFnN8POxHECNEqoqZfeMmNNp+lPoq+tFptL1Y93wdQsQmP
         iwLENM2VY9pZzaG8QyH+d86sASTezO/PUl7q8CfIWxWvSA00r6o3NwJdicyitiX6gIfj
         3JEg==
X-Gm-Message-State: AOJu0YxI5MbEhsSqEZx3++I/vmkQYBLQCRPmzefdVuqIw6LL5IGEKNFz
	VP08LZYcTo+0ArZnqTfoAj971NmXy3DuQTYZZOhGCMHsez8dOStIm61E7tZEzmzTt749UBYQA49
	q5FMqvA==
X-Google-Smtp-Source: AGHT+IE/2Orawekv/OLclMxR1xQeg2pDmCGkQaT62E9syzgs40fgcedWytqnEpEvQa0A6SRlXquPlQ==
X-Received: by 2002:a05:6a21:7896:b0:1c4:818c:299d with SMTP id adf61e73a8af0-1c699554699mr14458207637.11.1722791386965;
        Sun, 04 Aug 2024 10:09:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/18] gpgme: move gpgme-tool to own sub-package
Date: Sun,  4 Aug 2024 10:09:18 -0700
Message-Id: <09fe1a471c570c09e8219c6cc57eb5252a5caa54.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202974

From: Patrick Wicki <patrick.wicki@siemens.com>

The gpgme-tool binary is licensed GPL-3.0-or-later. Split it out into
its own package that can be opted out of.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bbcd56bace90f4a148960a7108dc8d0e6c364903)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gpgme/gpgme_1.23.2.bb | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
index d8807b3af2..55f164e4a9 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -3,11 +3,18 @@ DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to G
 HOMEPAGE = "http://www.gnupg.org/gpgme.html"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
+LICENSE:${PN} = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-cpp = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-tool = "GPL-3.0-or-later"
+LICENSE:python3-gpg = "GPL-2.0-or-later & LGPL-2.1-or-later"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
                     file://src/gpgme.h.in;endline=23;md5=2f0bf06d1c7dcb28532a9d0f94a7ca1d \
-                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
+                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d \
+                    file://src/gpgme-tool.c;endline=21;md5=66c5381e0e05475792e24982d15e7ce8 \
+                    "
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
@@ -33,6 +40,8 @@ RDEPENDS:${PN}-cpp += "libstdc++"
 
 RDEPENDS:python3-gpg += "python3-unixadmin"
 
+RRECOMMENDS:${PN} += "${PN}-tool"
+
 BINCONFIG = "${bindir}/gpgme-config"
 
 # Default in configure.ac: "cl cpp python qt"
@@ -61,9 +70,10 @@ export PKG_CONFIG='pkg-config'
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGES =+ "${PN}-cpp python3-gpg"
+PACKAGES =+ "${PN}-cpp ${PN}-tool python3-gpg"
 
 FILES:${PN}-cpp = "${libdir}/libgpgmepp.so.*"
+FILES:${PN}-tool = "${bindir}/gpgme-tool"
 FILES:python3-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
 
-- 
2.34.1


