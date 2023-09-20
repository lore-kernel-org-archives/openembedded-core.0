Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BD3CE79BD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:10:46 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.34237.1695204643583765453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDMQoCpl;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9aa2c6f0806so870572866b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695204642; x=1695809442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXuN87Lm3d6DiXdyQTZRKcfA5X8MQcPvmIGIcbMR2CU=;
        b=lDMQoCplabotvSOPxAqszvTNzQjI4fak4ztWP0FCgLkdEfrXzHuKPsbseSiMfhBqQT
         63DNWmIvLBbDhLQUrRLPhYOtWGasHWyRysJtFhL9uCeT50Ge6ZBkU1GP6nNERgA9qPAA
         J9ArqQreWkHMZJwbb/bLN0ce5S/K3766A/G7NiS/SR5lPwjsy4eDWVshSckhrqLUJ/cp
         ErPMUjz1Nr20n4iTwi3ULUY5YekyNvyfMO7qycsFZ+w/16EUhxqyzu7XXI8N9XosoH+A
         jqBLcvhv9bxONGcvH1WY2bxHrMl4cjuR3mOETdfjVXTMutW3jWIbIobUWfdnTamBlOVg
         Pu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204642; x=1695809442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXuN87Lm3d6DiXdyQTZRKcfA5X8MQcPvmIGIcbMR2CU=;
        b=etjnTTpr44kao25kSvZyGxMvJpgpYc6Fg+TbigSOpat0Mo1p/Or2XZqU3nujdl5fzo
         7FqBQewmu/QTGImlKZsBv1q94Jgcb4E8mUAeobOCVdlCmiyV0gvshfZj6LuYc2mDU8No
         4+Ixm0AsdchBcJ+iKjCJTPmp9jpZp6EvyKbLKntbWp4d2OdJa56urOCj4yrL9RqhX9l9
         sA4C/LyfEbwv830hh1fkMhcCO20O0eOwWIsCPTQna+qSlJ8FziOPA4ykikQAQ8JwBwgg
         XgZBR8Y3fgwnj75GGECZt7zRWPKNzaWmSG3xLghwEEHaARagoQGVuh2fpVSqZS72kYPa
         05dw==
X-Gm-Message-State: AOJu0Yyp7n83SV+bilRBz4/EKWQHnWepCBvHjQhtPb1HshOwZE066gY4
	gEgMAGafAu55bJoSS3r+YpMANZkoW7I=
X-Google-Smtp-Source: AGHT+IFckEgl2CsKQotspTaL3utU1wJ4elhbgglGEoSavewNyusXE085H8kWtOOZE1DvSJkoPbR5ZA==
X-Received: by 2002:a17:907:2cf8:b0:9a1:d79a:418e with SMTP id hz24-20020a1709072cf800b009a1d79a418emr1823953ejc.40.1695204641807;
        Wed, 20 Sep 2023 03:10:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gq5-20020a170906e24500b0099bca8b9a31sm9070978ejb.100.2023.09.20.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:10:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] fontcache.bbclass: avoid native recipes depending on target fontconfig
Date: Wed, 20 Sep 2023 12:10:35 +0200
Message-ID: <20230920101035.703945-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187915

* this caused liberation-font-native to depend on TUNE_PKGARCH target fontconfig
  because ${MLPREFIX}fontconfig-utils is added to RDEPENDS in anonymous python

* the dependency tree for liberation-font-native got much shorter
  (just quilt-native and liberation-font-native itself):
   2 after/pn-buildlist
  78 before/pn-buildlist

* fixes graphviz-native signature issue as well as detected with sstate-diff-machines.sh

  $ bitbake-diffsigs \
    sstate-after/mako/x86_64-linux/graphviz-native/8.1.0.do_populate_sysroot.sigdata.184d4fd355f1e7a2d7d929ef4b5f62b94e2071df9dd674b2067ec21bfc7bcc1b \
    sstate-after/qemux86-64/x86_64-linux/graphviz-native/8.1.0.do_populate_sysroot.sigdata.35da674d2dbc275bac02869dfce4165466315023910bdef65a6026e2cb942a46
  Hash for task dependency liberation-fonts-native:do_populate_sysroot changed from 310d3da04ad9abf8ee99997e53d1ffa71c2b7d9d60fb0e8de85171a9ab6a77d3 to 048420ad1410c2b8d95498fc3c11681207335a2c722836f1f3e683cc449814da

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/fontcache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
index 0d496b72dd..6f4978369d 100644
--- a/meta/classes-recipe/fontcache.bbclass
+++ b/meta/classes-recipe/fontcache.bbclass
@@ -13,6 +13,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
+FONT_PACKAGES:class-native = ""
 FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 FONTCONFIG_CACHE_PARAMS ?= "-v"
-- 
2.42.0


