Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B63E7F156
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 10:48:36 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.14481.1695984512499502596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 03:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f5YlR7RD;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5333fb34be3so17380362a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695984511; x=1696589311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K3+su7O2QnKSkcUWA0TV0Qd2UF1t13HTGkVaDOanCso=;
        b=f5YlR7RDn+MfIIpLBdpamtluT5sQbC7uD/eaggcEMPHjWT+CYtOSjlZv8xJ6zWpwPa
         R0mo0wtHwve+uL+CJW+0d8HNdLb8UoKg1r++HVEiRTCeSNoVN0KmkWpr0CCdZGEC0x9O
         J0JzIOdT31Et2kdwfdwWDF1EZMwHWs6DD8Ktx4Of9NVq3Lhqm+8DsKbYfzbEETcfzYkt
         42p6KQ+mREZHkaSFuFr0D4UCdLJ5Gtv7WaRX+uARyWzXkbUP/SzVgVq0mfPBUf8+2w1a
         6jFMlDJ/b6gQUqzp7q+G90FnNfsi9kRf+BVJOz0s77wtFNqEm5gCoHC5wPhiyBqL7YMx
         kcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695984511; x=1696589311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3+su7O2QnKSkcUWA0TV0Qd2UF1t13HTGkVaDOanCso=;
        b=b7Xq8ov+Bqw5z2gUvB7/ANpjPKIdRqASbNTJQ5G4L0NgOkjftriiL4vgqJsOSQeBmv
         p4GcgujP3yeYQ1lXr6DUSDWyUd3UlY5ILgssxPStUqeFyOU0SD3JlHxbapJuZySp5cZD
         a04uM8QLfPtJYMOI4IbPaa3qge8HZrHOlSg78E+5h+ZGxvAQKhsPXURRs6Eo+aWEwCVp
         4CC7S5uuSur4+qt5VKF6PUj+3OR92bYgu5DLkPOsLRvgv1ySrlU5Brne3s7cgDI0+j4v
         DNTGSpZAAgaaNY5pWQ/0fcUNRPEATiXB44K2WaPJynTagdNOey5p4uJbfRu5SY9o9Qcr
         DZOQ==
X-Gm-Message-State: AOJu0Yz4G6AHpJWIdKSMj+JjVKagPdxZkwHqPok8hkpKYDMMyFoqeMn+
	2U6st4gHIIIzgKNCHjHeHdlMsfDTIcM=
X-Google-Smtp-Source: AGHT+IHHcY8C5Sc91/NFW6WTJXD4otDP2j+kVFGTGmLSASKwgL5WQDUmKJOjIEjc7HB+mFHi7sWmJQ==
X-Received: by 2002:a05:6402:1608:b0:531:10df:97da with SMTP id f8-20020a056402160800b0053110df97damr2899988edv.42.1695984510677;
        Fri, 29 Sep 2023 03:48:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402160b00b005231e3d89efsm11051505edv.31.2023.09.29.03.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:48:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] fontcache.bbclass: avoid native recipes depending on target fontconfig
Date: Fri, 29 Sep 2023 12:48:26 +0200
Message-ID: <20230929104826.1995042-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 10:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188400

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
 meta/classes/fontcache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 442bfc7392..34688591f4 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -7,6 +7,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
+FONT_PACKAGES:class-native = ""
 FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 FONTCONFIG_CACHE_PARAMS ?= "-v"
-- 
2.42.0


