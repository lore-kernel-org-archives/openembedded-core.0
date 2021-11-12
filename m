Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D45C433FE
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 21:03:52 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1853.1636751030588356438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aAUfdqdV;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id g19so9502415pfb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 13:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvVkWvZUgfRHAZnoBdLZcg30OSBLvSZCXouQlBl4GiQ=;
        b=aAUfdqdV6Fq+euMifqnmprFaU8YO5E8Nh5IOvGPved935y87/vf0z6eD+65F3a3XHb
         LLUeYLSl1Yy6VAlOMdumyh2IxbrAF4vamsFMW7SQC7C3OBLa3HsvP220pVP2jaPqXhkD
         43RXPXnWxROnHUbm4pRedMehtnAId/I5ATPKAnzGKiOFrjsCTs8J9/yZhzuMxaaJJIGl
         5uZeH/Nrb083bOCweQ2BYy4ShQygFO0kdxCCTYP3/prr3qC4F/iqo5Vl3B6zRL/Q0h3q
         XhU2X84FnGMs9L+xxiXOXK9X5w5qN0JAf1iees0jGZOw3zzQSHXoOexy+wHBwqaEtZKb
         rktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvVkWvZUgfRHAZnoBdLZcg30OSBLvSZCXouQlBl4GiQ=;
        b=MesqjgnnsblmAm2c2bHcJGVUVI1ENmspFtsBoY4oRoqNDdjOCTIOkpl1+iPdGSCxq2
         tglBANqL/4EjVkCp+sK+ZXjtGxB439UDWa/kyifDV8cioIp5U/r+NkLlDkWkpoW2/xxX
         93G5KhlJ9Fd+MCRdl/xnRjiA78NbbguauF6CYJhKw752slueBZ/4IgKFVuoxYKq0X63d
         oUAGpXdFq6dXeshJRezcrrIDQ6yuFwpeniOv8ogOtaiPBK1wdwidDFv3ypDlBcnxfO8e
         rxpW/qKUodipawTvwd7CpCaGra10438E48Ih+vzBe4cGwj3BcakAfy39YgXc3SuFXI9K
         rYaw==
X-Gm-Message-State: AOAM531PEvZUR7xAWNyK7hbWrwS7CYq/aCMUWEe1s2KRk5hn3zVkU5Sl
	1u0e4kkk4Ul52TfZ+ToJytBYqFudVK8=
X-Google-Smtp-Source: 
 ABdhPJxvwbTpNj4p0WSYugeSWlPDbb/5m5KvtP4WSgrbEus8DH/UIgQ4lzUntTvLuJKuGoPJmgIWGQ==
X-Received: by 2002:a05:6a00:1681:b0:46f:6fc0:e515 with SMTP id
 k1-20020a056a00168100b0046f6fc0e515mr16492247pfc.11.1636751029419;
        Fri, 12 Nov 2021 13:03:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 w24sm5705310pgi.81.2021.11.12.13.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 13:03:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] Revert "gstreamer1.0-python: do not supply unknown g-i
 options"
Date: Fri, 12 Nov 2021 13:03:44 -0800
Message-Id: <20211112210347.2004455-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 21:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158232

This reverts commit f4bbbf2cd3e711875489b19f9b55b52ebd7be4bd.
---
 .../gstreamer/gstreamer1.0-python_1.18.5.bb          | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
index a32805d1298..74dd15b3eb0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
@@ -21,14 +21,6 @@ EXTRA_OEMESON += "-Dlibpython-dir=${libdir}"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
 
-inherit meson pkgconfig distutils3-base upstream-version-is-even features_check
-
-# Generating introspection data depends on a combination of native and target
-# introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
-
-# Even though introspection is disabled on -native, gobject-introspection package is still
-# needed for m4 macros.
-DEPENDS:append:class-native = " gobject-introspection-native"
-DEPENDS:append:class-nativesdk = " gobject-introspection-native"
+inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
-- 
2.33.1


