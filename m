Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB781EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:34:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.835.1689374047675900351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=umU+6xal;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b852785a65so15686045ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374046; x=1691966046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdSlXZf0AcceewIeBdpD6YD5r0qtWkoouDVFdwqmNAA=;
        b=umU+6xalfv7uWykrBFy7IDc2UOEuYLMN79KWUpekBZ05JxhkgB4F1J5zk/nHTsqf1R
         pl+TFRCkLKBqOCm+wjgoLWXOXBxDLMkObfgYjM4FT6VuuTApmPHZzWFwX03GTlhpQHY5
         fQCdjME78BXDuAWo7DKYnxR/OBexsknqqLhc0r1/MyPJl33OUZ8YQS4O/slrt57Xq6eP
         8jIFFT0q+biv1rsNqmk5ia6kGTcHbc28a68fhAuxcGv0M69J5hlK+4wGE2Q4OA/f3S+L
         1z5eb4ST1AGawB6u6T/Zcug3BHWL6b6qf32YT3ZKfQuor2LRDWo3B0BgkhEUbjyK0Szu
         9paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374046; x=1691966046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdSlXZf0AcceewIeBdpD6YD5r0qtWkoouDVFdwqmNAA=;
        b=VAf4lDmCc7beN7Nbnrae/P4wj+zauX6pfSLKO27NulHiZhRl48+pscGBqisjuVzDVX
         COqapUYI5+3tzpbENoU+qh0jlkYxLMlmS8dZXKf6pNxuGDY7wCP7yF9k9bb2o/5YT8CG
         TShL7eJn3a/YOOMLN+c5/U3ydKvDYTceYyuic34RO9HRCvi/dafx1R6i8ra60wpN9Z72
         t4SKlQQJExXlR4gLP/38WufRlcxvWu4+K9lJPYCMFifWn2iuHzV0O9C4noj+HR7xz1KC
         ZxvtMH9IwOJAicfWqiaVcdZtPqMZ4qj9feOEc2tSz84jgrVR1wYCc2LAYX0HY4WghE8j
         JiDQ==
X-Gm-Message-State: ABy/qLbp3DvhkSWiuitjBOfc0e61lZ2GuEmemUar4NQf4aQoWdGXaAMt
	SI/vR3VKdoxqGNl6ntPeRMQj85gJDl/Nn4TOYFI=
X-Google-Smtp-Source: APBJJlEfQZjKi0coHjWMbVlYbLzJtnli+xVAdFd0xkU4VV+Da25oOSbkXl0fM0thdBaGC/2cpr8iMQ==
X-Received: by 2002:a17:902:d502:b0:1b8:865e:44e7 with SMTP id b2-20020a170902d50200b001b8865e44e7mr5029285plg.20.1689374046572;
        Fri, 14 Jul 2023 15:34:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.34.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:34:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/26] selftest: multiconfig-image-packager: try to respect IMAGE_LINK_NAME
Date: Fri, 14 Jul 2023 12:32:59 -1000
Message-Id: <b000c0d76666627a538b9e6e2142f51af1c60f62.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184307

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4403365af6a5b9aa3b87ef8fd689d3bbcd23318)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


