Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0D9C76195
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.18078.1678709754883925084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G4i18C4P;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id ek18so16709323edb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5c2E6WOxZ/Cw6BBC3253PXbKJVut+wrJI+KYSV7aXI8=;
        b=G4i18C4PEtZt/oBhCnWigxhcmAhvC48Cjx8mdkJXX2S5nHcfcMUefJh4A8c567K3JQ
         RbedvkLuNDqrV+t8QMJkhlOH9WND4yE/i7MJmP4Nkcs/RM65v/QJm1nC3ej+K2XPtuRF
         TF/zhubGmSPf3qqpSHnmQxwxgkFM8AG0mj3Vz1BG9OSSDt6UFB24uHZJ3xTLJFhxw+yT
         ofMkHfzqCi5N9bQUbjUrdPQfjdILxvlIS0cjHPWylDmq9/Nz9CZetfi0LNe/5+8o7GWo
         d2y+xz+c3PlWkTnbNqpClCKeaENUiwpTlFyQR/t2oGAMzA/drya7+MQAyKHOjez2iaTJ
         hhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c2E6WOxZ/Cw6BBC3253PXbKJVut+wrJI+KYSV7aXI8=;
        b=sQi9aek+xWUBox3oxAthMq+uQd2ElUD/T9CN/SxNXVQb0KJE9iyQLl807rTtf6d+yS
         THLJNWumWTxlFo8dLh59/+8ZP/L3rw+oYYRC8N8uiuIZMIyTg/62+Gulbemn0kfdevUg
         gCvqqOmk14XMGcHW3W7A82RJwEl+U5kGuRhr4XT3Ss2opi7LkKTx9r8Tfy+aHf/Vkana
         W5bKSajZjfqjzHsETrX8AlZ+5E0p/v5PoT3EjieKxy86BrHHOXdpVdRCfV/UMI6V9bg+
         f5q7BIMwSkwJ/Ox5BrXXSY54Q5O3NQAjigaiRjp3mDpMJx8TldvxKYja4NzDPJLZh6Rd
         FvpQ==
X-Gm-Message-State: AO0yUKW6q88tI514vspObLY8A50pTshYcaLNaLDt4DejUAWIHoNrmU6n
	upwwkoEOHAECrSKiTEE9l6dONbhxKEQ=
X-Google-Smtp-Source: AK7set/7OHoRdZOkfThPsO6fGtVH/4lwbZE9T3i5T76CuYrwmTkZAR+Y8IGLpJMgPHtawVAkHfGaxw==
X-Received: by 2002:a17:906:1c1b:b0:92a:3b19:9a4c with SMTP id k27-20020a1709061c1b00b0092a3b199a4cmr2393776ejg.27.1678709756764;
        Mon, 13 Mar 2023 05:15:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lf17-20020a170907175100b008db605598b9sm3377708ejc.67.2023.03.13.05.15.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] selftest: multiconfig-image-packager: try to respect IMAGE_LINK_NAME
Date: Mon, 13 Mar 2023 13:15:33 +0100
Message-Id: <5984d0506771aa4016478e94a62d49882d4dffdd.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178438

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
2.39.2


