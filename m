Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79397C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.9300.1635325678652145136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iJrlz/Mn;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id z14so2878243wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iRHUs9OYdf0gnpRWKTIwDt+Ro+G8N31ML2bdReJITAU=;
        b=iJrlz/MnEXd+vqFdb7RD+Q5pdAT1GvJsSlbvcEh/W17EFsORXOCHeb9p2GyAuIwkfU
         /42azp3DCFnT1Vb1I0DKD0YrW/0Y241b/QRC3zb6XxM8MXCS5jjnfC9sxQOfnEhn9oNN
         gvl6RuZKtulSJAlNVz71H8r5SKOzNPHbQXX/vuqgda+wiB+oDxGb5EQLJS/NFVdb2S5x
         szmK6bB1NbQeGW2H7TKZ5Bfba+k/ymT22UdXQw9z1lKIdovVwdxzral0bDumb501witu
         EcQOme7XF044/cOXyf3SelMQ4WD6UR6DILIFHWTLAl3BwxfMQ192QPmJDPV6XIbmb5tf
         Kgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iRHUs9OYdf0gnpRWKTIwDt+Ro+G8N31ML2bdReJITAU=;
        b=Kk6oJ0klmbaveOuKRkTETKDm2YBj7CM3GdYEpYDUGU/1GmJXkMqxk2XL5OcBT20XIv
         PMcuKxdBNIg6rSAaJx4AbGPZuw09Zxj8gEaWbhNP5s3ifcPvzC9xxm7VpGUT1GJ1ZCgF
         jjdjZVBAIvQ5obG6/h06G3ajV4+TWwv7JPU/1NBl12ktH6Do1yU2ryJT29IAQXoR/50e
         h9q41kqpN1nnF78ch5K5QVzeZKgsNUzkYpK6TpYPDbm1fGghHeJeaNSu4x9JEDbzz+qr
         H6JoLW5dFDRC7pkFSbYU05ZWu/VAT7ieJN+g997QLJjPt+Gh9qOfL7u4J6fjXQccgD8U
         thtA==
X-Gm-Message-State: AOAM530Q1fUMCwO7W1LaYqClQWoIrJsVFH0xtwQi+jEwCqY7982J8gBE
	61Nox4yNkw4VBDg6hskVjPbwtFwk3lk=
X-Google-Smtp-Source: 
 ABdhPJxYSDLdFrS86gi6iRwZGiPfYorWJQnzi5gzu9X0aboar38AckFUaCb1B2hchmB1YIlcOzK12A==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr38147612wru.242.1635325677246;
        Wed, 27 Oct 2021 02:07:57 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/30] python3-pygobject: do not supply unknown g-i options
Date: Wed, 27 Oct 2021 11:07:34 +0200
Message-Id: <20211027090736.2546759-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157504

meson 0.60 turns unknown options into them hard errors, so instead of relying on g-i class
(where the options are mandatory) add g-i dependencies explicitly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-pygobject_3.42.0.bb              | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index 461ddcfe31..7ff7c5b4dd 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -6,10 +6,19 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
+inherit gnomebase distutils3-base upstream-version-is-even
 
 DEPENDS += "python3 glib-2.0"
 
+# Generating introspection data depends on a combination of native and target
+# introspection tools, and qemu to run the target tools.
+DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
+
+# Even though introspection is disabled on -native, gobject-introspection package is still
+# needed for m4 macros.
+DEPENDS:append:class-native = " gobject-introspection-native"
+DEPENDS:append:class-nativesdk = " gobject-introspection-native"
+
 SRCNAME="pygobject"
 
 SRC_URI = " \
@@ -18,8 +27,6 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
 
-UNKNOWN_CONFIGURE_WHITELIST = "introspection"
-
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
-- 
2.20.1


