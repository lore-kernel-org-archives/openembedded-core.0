Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25659C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:23:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.63995.1686586974872887589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 09:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AI0N/+0s;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f7f6341bf9so45542355e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 09:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686586973; x=1689178973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2TL7qQszHCz3vQD331jFQLpYZT0genDcGbCMaz5Wbk=;
        b=AI0N/+0sY6pM0C2MweUYYkRB1SJE2j5qChUgPwyAUtDy/JWIRI7HTjKsGkHeOEU+pR
         d7aFt5yxILRlF9U6o2qCMgTHzSurCmQAWKmVbSfGVZYQb2s5qG5628BxqKrNVzWqowBr
         vPNhJmzoUxcq804gfzsbe6M9Xgo6QPAjppBxiMH/V3aQ865SrhvT+FqBV31N/zknIV4G
         sF0bzfNEPox1weiTnP4twFoGkbFzPUOAiwVXr9Cv74LdqRmKfzVqRYZqva0/aYS0/O70
         boyBQiF4jbcs01qjwyKG+/vvT4ghoDS3hgrkr4Amj/mLwsUS1m8mFq1KDvQUdcB4nQMS
         91Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686586973; x=1689178973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2TL7qQszHCz3vQD331jFQLpYZT0genDcGbCMaz5Wbk=;
        b=TzsT6QsO+GRF13pwHKoGce+JUKT6hDKFOc5sxC+URpzor0b9ft3vJ2mnC6KkuttI5n
         frolYUi4cqsj+rVv/Lh48blYqoo5mXG3TCTCZzKNyChXeY+bMiERbbtyFPi1/xc15mj3
         T1qPAxzgL9NJQ/FZGHepU70v2FsJanA24PiniaVyBfKpuAr+8TDCvKv75OYSaxu9YRQZ
         0Kf7nOggsrtWsqDez60Ifu4d8tpnpNqEBKaIje1m7tp6Wb9+t+l7TtwpKLFDRnsrwtT1
         8uNpPIdRdlh/sm64miTbM5lPLdQAFytTjUU6G4gPbpvwqJKL9tMcMsPViZ8WcaYYfRPw
         Ntwg==
X-Gm-Message-State: AC+VfDwP3keGh/Uag9GolmqukPrwz3s3fZV524R/mlhQrGADOYTtCdSW
	/U8HjhvqrUiSh5PEqsKWPPnmrkmELxQ=
X-Google-Smtp-Source: ACHHUZ611MkNKNmaQ8tNsVzdt5ZXvplPvGZnhZT/4BjONiJ8Op8YalINFRzJwo/IToPLCnIPqdwl2g==
X-Received: by 2002:a05:600c:2242:b0:3f7:3685:1e10 with SMTP id a2-20020a05600c224200b003f736851e10mr7036215wmm.40.1686586973064;
        Mon, 12 Jun 2023 09:22:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u26-20020a05600c00da00b003eddc6aa5fasm11923566wmm.39.2023.06.12.09.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 09:22:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [resend][PATCH 1/3] selftest: multiconfig-image-packager: try to respect IMAGE_LINK_NAME
Date: Mon, 12 Jun 2023 18:22:46 +0200
Message-ID: <20230612162248.3763965-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 16:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182680

* this still assumes that IMAGE_LINK_NAME will contain IMAGE_BASENAME
  which will be BPN 'multiconfig-image-packager' and that replacing
  it with 'core-image-minimal' will match with the actual IMAGE_LINK_NAME
  from core-image-minimal recipe - there is no good way to query
  core-image-minimal's context, but this is still closer than assuming:
  core-image-minimal-${MCMACHINE}.${MCIMGTYPE}
  which works only with the current default:
  IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../multiconfig-image-packager_0.1.bb          | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
index daf2834958..d7785cee2e 100644
--- a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
+++ b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
@@ -7,15 +7,19 @@ MCIMGTYPE:virtclass-mcextend-musl = "ext4"
 MCIMGTYPE:virtclass-mcextend-tiny = "cpio.gz"
 
 MC_DEPLOY_DIR_IMAGE = "${TOPDIR}/tmp-mc-${MCNAME}/deploy/images/${MCMACHINE}"
+MC_DEPLOY_IMAGE_BASENAME = "core-image-minimal"
 
 do_install[mcdepends] += "mc::${MCNAME}:core-image-minimal:do_image_complete mc::${MCNAME}:virtual/kernel:do_deploy"
 
 do_install () {
     install -d ${D}/var/lib/machines/${MCNAME}
-    install ${MC_DEPLOY_DIR_IMAGE}/core-image-minimal-${MCMACHINE}.${MCIMGTYPE} ${D}/var/lib/machines/${MCNAME}/core-image-minimal.${MCIMGTYPE}
+    install ${MC_DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL}.${MCIMGTYPE} ${D}/var/lib/machines/${MCNAME}/${MC_DEPLOY_IMAGE_BASENAME}.${MCIMGTYPE}
     install ${MC_DEPLOY_DIR_IMAGE}/bzImage ${D}/var/lib/machines/${MCNAME}
 }
 
+# for IMAGE_LINK_NAME, IMAGE_BASENAME
+inherit image-artifact-names
+
 python () {
     mcname = d.getVar('MCNAME')
     if not mcname:
@@ -23,6 +27,18 @@ python () {
     multiconfigs = d.getVar('BBMULTICONFIG') or ""
     if mcname not in multiconfigs:
         raise bb.parse.SkipRecipe("multiconfig target %s not enabled" % mcname)
+
+    # these will most likely start with my BPN multiconfig-image-packager, but I want them from core-image-minimal
+    # as there is no good way to query core-image-minimal's context lets assume that there are no overrides
+    # and that we can just replace IMAGE_BASENAME
+    image_link_name = d.getVar('IMAGE_LINK_NAME')
+    image_basename = d.getVar('IMAGE_BASENAME')
+    machine = d.getVar('MACHINE')
+    mcmachine = d.getVar('MCMACHINE')
+    image_to_deploy = d.getVar('MC_DEPLOY_IMAGE_BASENAME')
+    image_link_name_to_deploy = image_link_name.replace(image_basename, image_to_deploy).replace(machine, mcmachine)
+    bb.warn('%s: assuming that "%s" built for "%s" has IMAGE_LINK_NAME "%s"' % (d.getVar('PN'), mcmachine, image_to_deploy, image_link_name_to_deploy))
+    d.setVar('IMAGE_LINK_NAME_CORE_IMAGE_MINIMAL', image_link_name_to_deploy)
 }
 
 BBCLASSEXTEND = "mcextend:tiny mcextend:musl"
-- 
2.41.0


