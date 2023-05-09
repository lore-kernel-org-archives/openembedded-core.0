Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8583BC7EE2A
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:15 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3066.1683671587502639687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FwGNyse1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6434e65d808so6847742b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671586; x=1686263586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4ZrsBk3JJXX4uqlBW4mkV3D2xmWVc9dGk1tbApSB1k=;
        b=FwGNyse1fIxEHwmRNPGsPDl7EeAZOzI/3OIqrKYgEPHzn6xak7TAKiHwszxXFlEFE8
         poJZV92I++4SkhJyMz30ikYFAhJxCNRK2xxcDHAC9/SBTwXlKFn5izIpOmhHkQyxUd0j
         FlfDMMquqvHmqZqeN696sQqfk02dL8+YGyBCv0th/vLkdsSMwKNPDB1YpaIYI5wCliRo
         iIuWdo3Y8tzhvtzbxwK3RWTan295kseUWyaDCvcRcF89Y1wOp80xPGRY6mpDfBr1ckKw
         OSTvpmXPAaioFfKXBMzSzplSYJyQXocBx5gWe1EVR+qSTSadWWYD/RmtzbA6k8Vk6KUi
         wfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671586; x=1686263586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4ZrsBk3JJXX4uqlBW4mkV3D2xmWVc9dGk1tbApSB1k=;
        b=KWiLfBalj90qMuK5UjzR1lzCwp6PrgfH2sIoPgxSN6m32B+OBqZ6nhHTUlW09OfjIY
         322MemaAHMwUxhAffUkflGqzIo90/Q3wUJua8wzqRS/X+t2GxRjvINc19LUWoYND3Lf4
         A/1lTkLVfVgJ1BDhzb1cTB6Uv24R7gj7aVtjplBedlwXKaZtD2eOY1f9thX6mqpq9nof
         qq2bE4y4RxcHIy5IOIsP3HPY+i3zhUyE/QZVlIaafd3Hv2Qk7H9aYaI1OsUnS5Rj4+dB
         dJ+L0MPF5u/qpPQWYz1/yQfjPbmSHwZT4d96z6VS/tjqJBp7YpmGqF3XvY6zXcV1xRCt
         P4Zg==
X-Gm-Message-State: AC+VfDy9CIEPeF0XkFSpVP5V+tFXdM9FyDc5Xv7ocnnC8jPscMeCrDaK
	9sGCjMlKgJhQnkTzvwhqucpHdw+82dsXBJ0VmnY=
X-Google-Smtp-Source: ACHHUZ7WXna2z0WiYiZE8yo8B7LIJGL3hakKkUxmHTezWbIq9t3r5oO/v8yyLiPXEvX4QPG+ujepJA==
X-Received: by 2002:a05:6a00:1406:b0:62a:c1fa:b253 with SMTP id l6-20020a056a00140600b0062ac1fab253mr19342017pfu.31.1683671586580;
        Tue, 09 May 2023 15:33:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] populate_sdk_ext.bbclass: set METADATA_REVISION with an DISTRO override
Date: Tue,  9 May 2023 12:32:37 -1000
Message-Id: <adfc2ab998f27cb809235a137e9605e8788f58e8.1683671424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181096

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
 meta/classes/populate_sdk_ext.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a673af7e7b..ca1b7753cb 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -363,7 +363,8 @@ python copy_buildsystem () {
             f.write('BUILDCFG_HEADER = ""\n\n')
 
             # Write METADATA_REVISION
-            f.write('METADATA_REVISION = "%s"\n\n' % d.getVar('METADATA_REVISION'))
+            # Needs distro override so it can override the value set in the bbclass code (later than local.conf)
+            f.write('METADATA_REVISION:%s = "%s"\n\n' % (d.getVar('DISTRO'), d.getVar('METADATA_REVISION')))
 
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
-- 
2.34.1


