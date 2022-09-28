Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686D2C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 22:13:41 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web09.3833.1664403217924261356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 15:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qHZPB4XH;
 spf=pass (domain: gmail.com, ip: 209.85.166.48,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id n192so10103207iod.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LjS8Z+DWYBPlOzx2NOAg/YpJQEOLNZUZT32y8sayi1s=;
        b=qHZPB4XHlA8rBGujWjYdBRckTBHI5hYHJjnl+FqhIDFv3gOSNZwhRelYuv6wPq7SrL
         5yzitVid/wQymZrCbAEs4VJdfwcMi9jEZr85C8Yyy955IuKlWtJdS8uCwGslzirIRy36
         aWFRJfBg1pX/zv2h5HzokVTAVxujJfOJ4dUejN96twCPB7q7gObV4IY/pjJw8CuBCxPZ
         nqBYtpT1xoT0zNwQ2paFfPtX+AF0sf3HE5tHTjl4J98QZH1FHxh+OC1RZnwpICngKFwR
         isapiLSSpXcBWP8yH3tp4WZmWUrWSq9GDK1Ny/soGWU9UWHiowPvxUspSkbTn3DtxGZe
         tKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LjS8Z+DWYBPlOzx2NOAg/YpJQEOLNZUZT32y8sayi1s=;
        b=sXjCyQZgH3Qa42ddkEFjfllwy4dvjA0xu/aMSLPau99MugznmUrPYhJxowyJt6LTxL
         4LFq5Eu58lk6fdv+Lhf+qiVs2HZS9XSP0F/OKxC+9IalTz+DyCCVaetJNv570xqE062z
         VVvBn0NiTaOQ9HbJr3mHeo3ndWJhCcvIUcqmatamaJqsA8jmStKv2SCZy5cOn387Ok9m
         ydSMtKviG0DRPsrB3IGtDEgRpMspU1xLUtQQjV3czcNDfoNgE/Owve3leqeJveTWpCVd
         hJGII80TpQ2iSA4b1UrM3HsLTZyRfbjuXTQOykPCQpOVxNG0ZGgRelPokH35LP1RC4/X
         Kd5A==
X-Gm-Message-State: ACrzQf3M/i2308gc2AJNBKl+XwyMAFHe5vWMEQ98IzSccBllDxcOV9yQ
	tKskb4eTiGDo6kJ05lay5BA0WHzmdRo=
X-Google-Smtp-Source: 
 AMsMyM5xBWUbwjekAOvf5gx5evA6KlCSNyWEiur3wdC81lEYXeOA0IEuPNEeyK3wP78NK/Ss+4MLvQ==
X-Received: by 2002:a6b:b296:0:b0:69e:70d9:a58a with SMTP id
 b144-20020a6bb296000000b0069e70d9a58amr36066iof.88.1664403217129;
        Wed, 28 Sep 2022 15:13:37 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 g39-20020a02852a000000b0035b0af5783dsm2191931jai.32.2022.09.28.15.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 15:13:36 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 2/3] gcc: set the default target arch
Date: Wed, 28 Sep 2022 16:13:19 -0600
Message-Id: <20220928221320.1763684-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928221320.1763684-1-danismostlikely@gmail.com>
References: <20220928221320.1763684-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 22:13:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171157

From: Daniel McGregor <daniel.mcgregor@vecima.com>

The default x86-64 architecture for target gcc (ie, the one in poky
build appliances) is native. Since we have a variety of build systems
it will occasionally produce instructions that don't work on all of
our development system.

Instead, set gcc's default architecture to the one specified in
TUNE_CC_ARCH, that guarantees that gcc-runtime and any binaries
produced are compatible with the target machine type.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 10 ++++++++++
 meta/recipes-devtools/gcc/gcc-target.inc |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 2abc0e355d7..d3b36937bf4 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -32,6 +32,16 @@ def get_gcc_float_setting(bb, d):
 
 get_gcc_float_setting[vardepvalue] = "${@get_gcc_float_setting(bb, d)}"
 
+def get_gcc_x86_64_arch_setting(bb, d):
+    import re
+    march = re.match(r'^.*-march=([^\s]*)', d.getVar('TUNE_CCARGS'))
+    if march:
+        return "--with-arch=%s " % march.group(1)
+    # The earliest supported x86-64 CPU
+    return "--with-arch=core2"
+
+get_gcc_x86_64_arch_setting[vardepvalue] = "${@get_gcc_x86_64_arch_setting(bb, d)}"
+
 def get_gcc_mips_plt_setting(bb, d):
     if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'mips', 'mipsel' ] and bb.utils.contains('DISTRO_FEATURES', 'mplt', True, False, d):
         return "--with-mips-plt"
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index cc65e995c30..7dac3ef422c 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -19,7 +19,7 @@ EXTRA_OECONF:append:armv6:class-target = " --with-arch=armv6${ARMFPARCHEXT}"
 EXTRA_OECONF:append:armv7a:class-target = " --with-arch=armv7-a${ARMFPARCHEXT}"
 EXTRA_OECONF:append:armv7ve:class-target = " --with-arch=armv7ve${ARMFPARCHEXT}"
 EXTRA_OECONF:append:arc:class-target = " --with-cpu=${TUNE_PKGARCH}"
-EXTRA_OECONF:append:x86-64:class-target = " --with-arch=native"
+EXTRA_OECONF:append:x86-64:class-target = " ${@get_gcc_x86_64_arch_setting(bb, d)}"
 
 # libcc1 requres gcc_cv_objdump when cross build, but gcc_cv_objdump is
 # set in subdir gcc, so subdir libcc1 can't use it, export it here to
-- 
2.37.3


