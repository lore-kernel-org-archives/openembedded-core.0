Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7297C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 18:50:44 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.4599.1719341434547645506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 11:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6gQIwra;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: gudni.m.g@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cd6784aa4so5035842e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 11:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719341432; x=1719946232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4EnXBC4YibyCd/Cm9in6z4EXbtHqCPtbvb/o9EqFi0=;
        b=L6gQIwra9TzpIRAr2vfDVJwfEV+bq4orlEJ++vhZaX6yN5J26M+UAp7FruAORDoKj/
         6MaQATaqh6+Ls/1Z9PiMblCoOhFL7mF91qgrUItMAyEu2vuy21M+9H5lIBReYt3BtFNL
         2K8RA9NfoLtpHb/0DG+DdwdqP51BCOMenfb/1U6q4ijoP9ZqJKlP1N8q6yI2RiBNxHNj
         QmRsXmVqJQtoo1w6mFS914Z+Y+zy1hEHmR0GfmIG2Jn0dd3ttJVjH7qb2tdERykmVWiS
         j/71Qq/smS8qi10VfDhkAE+tv9XoVL7dC6YJAVYj5X+OuO+N9zSQcFglL+8CCiS/5qlU
         eoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719341432; x=1719946232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4EnXBC4YibyCd/Cm9in6z4EXbtHqCPtbvb/o9EqFi0=;
        b=p65CVsC4+qsJtMRfX6os3wSh+PdhIX+7C3Q6Uf+04HNV5T1laCtZ1SYcemTfNrKNli
         JWPtcCq5iYlq0TBnERiSyniwGTF12oVlt0S2W2i/gtjks21sntgTYFQfObgdbBeuEkFs
         7HmqpoG06zUEp6cKMr5W5tNydprCbd5+9OhB/DGYg4JZitF2Sttf7GuFrIzAhioBfw5d
         9CUtCegKDAaaf58Ssv0albslkSs7Knx9Fc4mjtw0WkNt/lWYcR3LZ9NQ0DK7e/d5v2LQ
         lfrFrBdht9sHBS1dijdJKL89eXpQt5VXSQrtNDQlZRdefF5OjT43s4kQm92KEhAW93U5
         0xfA==
X-Gm-Message-State: AOJu0YzXe0912ZmXJLa6FVU4j28kxaYvCSuFl8hjFjavVftbUaoTH8Uw
	FNdAADb2F1mZIUUrU4rrTPgRhGETsyi4Q/doDd3d5hFDcF2+avFzsD0nYg==
X-Google-Smtp-Source: AGHT+IHwUgOhw7tkcJwBOc/KtjIiIsi8d7Kz4bkAawSnfvOsNYaVrp/rAtNRVK8v8WJcXwBMshUTdg==
X-Received: by 2002:ac2:5299:0:b0:52c:c9ce:be8d with SMTP id 2adb3069b0e04-52ce186482cmr5310051e87.57.1719341432095;
        Tue, 25 Jun 2024 11:50:32 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b4682sm180201525e9.22.2024.06.25.11.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:50:31 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCHv2] gobject-introspection: split tools and giscanner into a separate package
Date: Tue, 25 Jun 2024 18:50:02 +0000
Message-Id: <20240625185002.1407358-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 18:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201144

The tools and giscanner require python3-setuptools at runtime. This increases
the image size quite a bit (on my end ~1.7MB compressed). Most users don't need
these tools in the final image so make them optional.

This commit introduces a new packcage gobject-introspection-tools

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../gobject-introspection_1.80.1.bb           | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
index 582ac248fd..e161f3ca2d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
@@ -26,7 +26,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
-DEPENDS += " libffi zlib python3 flex-native bison-native"
+# setuptools are required to provide distutils to build the tools
+DEPENDS += " libffi zlib python3 python3-setuptools flex-native bison-native"
 DEPENDS:append:class-native = " glib-2.0"
 DEPENDS:append:class-target = " glib-2.0-initial"
 
@@ -169,6 +170,15 @@ gi_package_preprocess() {
 
 SSTATE_SCAN_FILES += "g-ir-scanner-qemuwrapper g-ir-scanner-wrapper g-ir-compiler-wrapper g-ir-scanner-lddwrapper Gio-2.0.gir postinst-ldsoconf-${PN}"
 
+PACKAGES =+ "\
+    ${PN}-tools \
+"
+
+FILES:${PN}-tools = "\
+    ${bindir} \
+    ${libdir}/gobject-introspection/giscanner \
+"
+
 # .typelib files are needed at runtime and so they go to the main package
 FILES:${PN}:append = " ${libdir}/girepository-*/*.typelib"
 
@@ -190,7 +200,15 @@ FILES:${PN}-dev:append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
 FILES:${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
 FILES:${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
 
+# glib-2.0 is required for libgirepository
+RDEPENDS:${PN} = "glib-2.0"
+
 # setuptools can be removed when upstream removes all uses of distutils
-RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools glib-2.0"
+RDEPENDS:${PN}-tools = "\
+    glib-2.0 \
+    python3-pickle \
+    python3-setuptools \
+    python3-xml \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


