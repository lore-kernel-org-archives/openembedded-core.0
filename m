Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC282C61DF4
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.18447.1700657123534188357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K01mfdWU;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so9207779a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657122; x=1701261922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ncpDvRpt5O+kIEZCaxsM31oezdTO4eqZmifCN73B8Q=;
        b=K01mfdWURqLDdj8hRySbJVaNWA/sEGHzj6hlmh9zCyUHK02aJKDKctuqlRvnyptmrm
         OcrY23+ovzDZB5SvR3kR5SLluLVfQq1y1K10tsHN120jz9rkDOV+RWtBKf0Q51vuKWhi
         qL4IkwlSqVbmDXo2BU1F0Fe+oidnJN4DDEWyb4ZWK9hDBzJQXxm8SbAUub2GAkpKiSr6
         4nsv9mqwre4ti4fI0t+nD+rkSxoSf/pZnVfTGtJdMu5wPmrii4kba+lvSiUC1QOs3Oxp
         PwEbECbGCWGBF3dSIYUY0I69piwaacDTkAOOFwHg5/FnRaUZ14jfmyFvb8+Qzen9Zt+C
         X2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657122; x=1701261922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ncpDvRpt5O+kIEZCaxsM31oezdTO4eqZmifCN73B8Q=;
        b=K0R+iNSRY9WbuzdIr61ctvkI7V69o6FaTaq5qISRNq0RdXV0y3xUiq9Ln4IR+nke3V
         ha0YHGR30vupM14EU33lZxuuugE4CLt45pnWeupJN5qqz3id7YLMQXYWfmrQ6aD7zmi1
         3nvNkCvvpNRQYock/3P73HsJDd6WBMhe934wmtki+ZptdyVnYAlWYQ3xA+6d7AdzbXYa
         Jn7X71eV9yH9oHqooMQKqDIuenx38sif+v//prDwnVvpDiyoMPe0Lwat3MILPfolUtJT
         6vk+qbQwsFdUNpagmLWGvoQFJTXAD1wCeKSEta36J6MDewVrgq2tQ/4nU9EGlvs3cSjY
         Fwxg==
X-Gm-Message-State: AOJu0YxxKvudbZ+ryZy1Frwu5BzKj3r4EXAi6MsE3MdUR+X2yt87OfnP
	8scLrIOJBcka8qY6dDYhlk/WeBqCMJc=
X-Google-Smtp-Source: AGHT+IEMEpwwzvaAnBrrTZiiIkdKnTSFBJ61+PRIY5DHro3n0C397coXjgzuVuHf90m4pIQuIqGLYA==
X-Received: by 2002:a17:906:535b:b0:9da:ee00:a023 with SMTP id j27-20020a170906535b00b009daee00a023mr1407912ejo.30.1700657122010;
        Wed, 22 Nov 2023 04:45:22 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y23-20020a170906471700b009fcd13bbd72sm4374923ejq.214.2023.11.22.04.45.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/21] selftest: multiconfig-image-packager: use IMAGE_NAME instead of IMAGE_LINK_NAME
Date: Wed, 22 Nov 2023 13:44:48 +0100
Message-ID: <17dccf417aa6d8ec1fadae328bdd29a0ee7aeb78.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191095

* the IMAGE_LINK_NAME now contains PKGV, PKGR in the filename, but the
  multiconfig-image-packager and MC_DEPLOY_IMAGE_BASENAME
  (e.g. core-image-minimal) has different PKGV value causing:

  | DEBUG: Executing shell function do_install
  | install: cannot stat 'tmp-mc-musl/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs--0.1-r0-20110405230000.ext4': No such file or directory
  ...
  | install: cannot stat 'tmp-mc-tiny/deploy/images/qemux86/core-image-minimal-qemux86.rootfs--0.1-r0-20110405230000.cpio.gz': No such file or directory

  because the actual filenames are:
  tmp-mc-musl/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs--1.0-r0-20110405230000.ext4
  tmp-mc-tiny/deploy/images/qemux86/core-image-minimal-qemux86.rootfs--1.0-r0-20110405230000.ext4

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../multiconfig/multiconfig-image-packager_0.1.bb    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
index d7785cee2e..b53b6a4b26 100644
--- a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
+++ b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
@@ -13,11 +13,11 @@ do_install[mcdepends] += "mc::${MCNAME}:core-image-minimal:do_image_complete mc:
 
 do_install () {
     install -d ${D}/var/lib/machines/${MCNAME}
-    install ${MC_DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL}.${MCIMGTYPE} ${D}/var/lib/machines/${MCNAME}/${MC_DEPLOY_IMAGE_BASENAME}.${MCIMGTYPE}
+    install ${MC_DEPLOY_DIR_IMAGE}/${IMAGE_NAME_CORE_IMAGE_MINIMAL}.${MCIMGTYPE} ${D}/var/lib/machines/${MCNAME}/${MC_DEPLOY_IMAGE_BASENAME}.${MCIMGTYPE}
     install ${MC_DEPLOY_DIR_IMAGE}/bzImage ${D}/var/lib/machines/${MCNAME}
 }
 
-# for IMAGE_LINK_NAME, IMAGE_BASENAME
+# for IMAGE_NAME, IMAGE_BASENAME
 inherit image-artifact-names
 
 python () {
@@ -31,14 +31,14 @@ python () {
     # these will most likely start with my BPN multiconfig-image-packager, but I want them from core-image-minimal
     # as there is no good way to query core-image-minimal's context lets assume that there are no overrides
     # and that we can just replace IMAGE_BASENAME
-    image_link_name = d.getVar('IMAGE_LINK_NAME')
+    image_name = d.getVar('IMAGE_NAME')
     image_basename = d.getVar('IMAGE_BASENAME')
     machine = d.getVar('MACHINE')
     mcmachine = d.getVar('MCMACHINE')
     image_to_deploy = d.getVar('MC_DEPLOY_IMAGE_BASENAME')
-    image_link_name_to_deploy = image_link_name.replace(image_basename, image_to_deploy).replace(machine, mcmachine)
-    bb.warn('%s: assuming that "%s" built for "%s" has IMAGE_LINK_NAME "%s"' % (d.getVar('PN'), mcmachine, image_to_deploy, image_link_name_to_deploy))
-    d.setVar('IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL', image_link_name_to_deploy)
+    image_name_to_deploy = image_name.replace(image_basename, image_to_deploy).replace(machine, mcmachine)
+    bb.warn('%s: assuming that "%s" built for "%s" has IMAGE_NAME "%s"' % (d.getVar('PN'), mcmachine, image_to_deploy, image_name_to_deploy))
+    d.setVar('IMAGE_NAME_CORE_IMAGE_MINIMAL', image_name_to_deploy)
 }
 
 BBCLASSEXTEND = "mcextend:tiny mcextend:musl"
-- 
2.43.0


