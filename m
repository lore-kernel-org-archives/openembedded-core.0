Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D566FC7EE24
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:04 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.30355.1683300063313458926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=TKeAFxua;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-52c6f8ba7e3so1707631a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300062; x=1685892062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzhG3wPAvPd5NVDg8FP4jGjWF74CFxFleJONBynjvRQ=;
        b=TKeAFxuaREiFtj0zZ7aC1XTIEyJEI7M7BhnsYIyQH4c0FnIHXSztxkv6CXVwhqunwR
         V2hFqUc9AV+kPLPaKa4BUxPAtJfv2EoLLYqmNy0HaMtY827xYIggLvrU7nqlSrFF1iRE
         RQkr8584KwHHmp5s/5M41TTLIOEDQSK4RLZJpdQVX4TbZ1F/ijla+LW6Ta+RsNEPZxPi
         Eq091bM7x9eiyLlZPXXi+vJj8BYRCTIDCo00/ObPJa0bOw6C2X6MBBommGWINjNRg/di
         vPhAGVNyejE+8sxKwRZfkSxApahQ0Zi5pJxVu+CExqoR4cXGoarKubVwi91d9+LUczRS
         hh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300062; x=1685892062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzhG3wPAvPd5NVDg8FP4jGjWF74CFxFleJONBynjvRQ=;
        b=flC2EKt6fnjH10JjnAb/8M5BltMdbpvNhJVT4sL8/lhOWk/rdV7dezyk88+8eTDraY
         spi66T9REwV+8YHgdOdRRzA3t7ZPk6dCv80mPaGwu8NTRXrAr6A70cnRsGgHtZVCPbTY
         cSQsteQuqyCvL+t/YjOosIgKeqH4PGhFVUNIoxFjp/QNTqk0c/upmtgxsKQryktaZxW5
         bCTkAQsW0VhiFYqoOIU0gsG7ZPDSsepcqLiQLSe+AtziB9q1c/QgBFvdAH76NZeMnc6J
         joIrpfiDEdC01+dRpYfd+WZsj9yTsbl/gF3GrbeYa2TVG9cSIqMEA2kDNqh0TZ2VvJLi
         DyiQ==
X-Gm-Message-State: AC+VfDwvjjMie5pgsBR4gtpsvZoaNrGtAisFPsbhpCu4CTXcYt6PvBtm
	2tKp+GIx93S3flKjwmqs1gJ7F0rQ6T4N7DhjBms=
X-Google-Smtp-Source: ACHHUZ5/nglI81vjXgxlFnfVxbfWZFJPWdbf0NZcxR8744fJS174WPoeo6Hfl1khDvldUi9RVSq+SQ==
X-Received: by 2002:a05:6a20:ce43:b0:f0:718f:8eee with SMTP id id3-20020a056a20ce4300b000f0718f8eeemr1750293pzb.59.1683300062438;
        Fri, 05 May 2023 08:21:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:21:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 30/35] populate_sdk_ext.bbclass: set METADATA_REVISION with an DISTRO override
Date: Fri,  5 May 2023 05:19:41 -1000
Message-Id: <a857360c078aa5e03cf113dc2dc87069b0e0201c.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180950

From: Martin Jansa <Martin.Jansa@gmail.com>

* otherwise it ends '<unknown>' inside esdk, because of parsing order:
  # $METADATA_REVISION [3 operations]
  #   set /OE/build/test-D/conf/local.conf:43
  #     "f2da54ef432eac89b0f18eaad68e602b6990b5de"
  #   immediate /OE/build/test-D/layers/poky/meta/classes/metadata_scm.bbclass:9
  #     "${@oe.buildcfg.detect_revision(d)}"
  #   set /OE/build/test-D/layers/poky/meta/classes/metadata_scm.bbclass:10
  #     [vardepvalue] "${METADATA_REVISION}"
  # pre-expansion value:
  #   "<unknown>"
  METADATA_REVISION="<unknown>"

* This causes base-files.do_install and following tasks to have different
  signatures between esdk and the build directory where this esdk was created:

  bitbake-diffsigs {test-D,poky/build-uninative-disabled}/tmp/stamps/qemux86_64-poky-linux/base-files/*do_install*sigdata*
  NOTE: Starting bitbake server...
  basehash changed from 5b6981cf58bfd57d416b0e31611b73a26baae635dd1ac31c08d46f95064c3ffc to dbdce042da4d7813d632b6d1cc87a16f728ad20e55fecbc392830e6acf72babd
  Variable METADATA_REVISION value changed from '<unknown>' to 'f2da54ef432eac89b0f18eaad68e602b6990b5de'

  and an warning from "python3 /OE/build/test-D/ext-sdk-prepare.py" when eSDK is being prepared for use:
  WARNING: The base-files:do_install sig is computed to be 83b9c9a6ef1145baac5a1e0d08814b9156af239c58fc42df95c25a9cd8a7f201,
    but the sig is locked to 3dc22233059075978e5503691e98e79e7cc60db94259dfcd886bca2291c0add7 in SIGGEN_LOCKEDSIGS_t-qemux86-64

[RP: Add commit about why we need the override for future reference]
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 675ea7281c17f77bf5dea17cfd4d9da0928382a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 2e6673bcd9..476876e03d 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -369,7 +369,8 @@ python copy_buildsystem () {
             f.write('BUILDCFG_HEADER = ""\n\n')
 
             # Write METADATA_REVISION
-            f.write('METADATA_REVISION = "%s"\n\n' % d.getVar('METADATA_REVISION'))
+            # Needs distro override so it can override the value set in the bbclass code (later than local.conf)
+            f.write('METADATA_REVISION:%s = "%s"\n\n' % (d.getVar('DISTRO'), d.getVar('METADATA_REVISION')))
 
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
-- 
2.34.1


