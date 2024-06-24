Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97EFC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 20:32:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.152631.1719261154965001902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 13:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UuDtk8pN;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-421d32fda86so52788385e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 13:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719261153; x=1719865953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K/W8tc5hoV+ZE8koDHMkuUW8EXGfqu1ZTlrXugw5P8M=;
        b=UuDtk8pNn0sXk5PZH5+rz7gWcgXFXokFlO0j49ZarWoRHEoY2gg8jcjAMzXoBJMlBC
         xfvr0rB/4Sj2iJWcRYgp/y5awGBq9Rxrq1zecGGgWflz/N+kElqUHQD/ua6hG7i9Q+v9
         qLGJ5gGcMWITXzC+C7soflHfk2Hd15omb1wlRnq6nqvNyJJt0MoUaoMvZ9LTREZQJpa2
         Cwm3tew4IiwkLt9COqycE1dyTydSIC2hS2RmLLqk5EbXpfV74zeNLw5g9mKznQdkuCLF
         z0grvV4K3Ck/NxuUvtWzOEs1Ss5HFRi2DVkXufodvdAR7P1l8WxQ7NOQNggZhE/3o/qf
         HMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719261153; x=1719865953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/W8tc5hoV+ZE8koDHMkuUW8EXGfqu1ZTlrXugw5P8M=;
        b=LB11IPcPzBK93T+7uQfh3B10XJuQtoCadVstJO3erket7Fh0NH6WinfVPkU+v5hoXc
         AjqkkE8UcqMQBFhr1ZFCepMrCGCvqFiko6upm9gmvoEuCLsiUd3J8Bloe7Fqr6kpCDut
         GSNDTSrcDvlIbPs9rXr0E4xZx8nFNp18sYtZ5jufs50bx73ocd+GvN+X12D/VuFwmJ47
         sDeOugd6zGPAzJX8z85tGM1TihCH7BnDheTs78ZL9HtKDHIYWWe6xNhCzPb9HRohNMBu
         L4aMP8pkzj/19NL0rELFhlcxvtaOBvt1ZXjE8XboC7EFDoPtoraUninR6NWv6pY3Z9z/
         th/g==
X-Gm-Message-State: AOJu0YwSkd+FfMEy0FP2JKNgetthZPp6U0OLCikQ8bQ+s/Okpnsx8d1D
	9xh2b9A5Qm+sOZIFVRdgij74xGLdcnTNUChhb8H3+/WjJzZJ5guC8K5IAw==
X-Google-Smtp-Source: AGHT+IFRoOzxbe2VBtlHDbsrozWvj9Rp8yx7J1VMZsyau7/7wbcsSeB+QOIB3Ao17APoYKEg+uh9Mg==
X-Received: by 2002:a05:600c:354f:b0:424:798a:f803 with SMTP id 5b1f17b1804b1-4248cc586f7mr45906305e9.30.1719261152824;
        Mon, 24 Jun 2024 13:32:32 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a9981sm151199155e9.17.2024.06.24.13.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 13:32:32 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] gobject-introspection: split tools and giscanner into a separate package
Date: Mon, 24 Jun 2024 20:32:15 +0000
Message-Id: <20240624203215.2470081-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 20:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201113

The tools and giscanner require python3-setuptools at runtime. This increases
the image size quite a bit (on my end ~1.7MB compressed). Most users don't need
these tools in the final image so make them optional.

This commit introduces a new packcage gobject-introspection-tools

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../gobject-introspection_1.80.1.bb           | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
index 582ac248fd..9c1945d639 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
@@ -26,7 +26,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
-DEPENDS += " libffi zlib python3 flex-native bison-native"
+# setuptools are required to provide distutils to build the tools
+DEPENDS += " libffi zlib python3 python3-setuptools flex-native bison-native"
 DEPENDS:append:class-native = " glib-2.0"
 DEPENDS:append:class-target = " glib-2.0-initial"
 
@@ -169,6 +170,20 @@ gi_package_preprocess() {
 
 SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
 
+PACKAGES =+ "\
+        ${PN}-tools \
+"
+
+FILES:${PN}-tools = "\
+        ${bindir}/g-ir-annotation-tool \
+        ${bindir}/g-ir-compiler \
+        ${bindir}/g-ir-generate \
+        ${bindir}/g-ir-generate \
+        ${bindir}/g-ir-inspect \
+        ${bindir}/g-ir-scanner \
+        ${libdir}/gobject-introspection/giscanner \
+"
+
 # .typelib files are needed at runtime and so they go to the main package
 FILES:${PN}:append = " ${libdir}/girepository-*/*.typelib"
 
@@ -190,7 +205,9 @@ FILES:${PN}-dev:append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
 FILES:${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
 FILES:${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
 
+RDEPENDS:${PN} = "python3-pickle python3-xml glib-2.0"
+
 # setuptools can be removed when upstream removes all uses of distutils
-RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools glib-2.0"
+RDEPENDS:${PN}-tools = "${PN} python3-setuptools"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


