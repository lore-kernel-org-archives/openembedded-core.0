Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E1DC46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.25149.1672425544781758602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HiP/c/y7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id l26so14086781wme.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KlKDc5oAD44RD4DBPL6B1SPlX2BGhOdPd0+eJOqPE4=;
        b=HiP/c/y7ogBkFIVO18uI4TpPfopD2otHHI/ZM7iYRtbMGX2Em32rzTIPuAlSeOWuXI
         JVxTF0l49quFRgtLSC5vQG3L/fDQadFlgrkcT+Ip6NSlqW3PsUxh8aclfDYeVLIKSW+e
         uKM2RLxuYoHo+q+CWweOlE32B8I4CuozsURbWnxckVMjm3hSzb2Zb4KthuhqpYQm2r2B
         m602BuDQrM0CDotMKthV5tnOhbAV3v8V1bstBcFFv8UdyGtUIVtaKLUQBDE7ft7OxTfy
         cTuH4zF4ypdjJL46zhM+/V4JpcHmHpQAGAZMLVaYBSOxvH/27LI/CmW9zDCAghfzJ8yI
         /Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KlKDc5oAD44RD4DBPL6B1SPlX2BGhOdPd0+eJOqPE4=;
        b=xXpizLuMydyz82OKGno5s6Y/oQhWcF26S7o4mg978MVq+PTj93qHGp/AyTGwF8W/mn
         Iq3TXQ9EEO+wdOf2WLm3tFwvBP6qJc20tlsMuMw3sMjE9Kof7BFreoC7lvWV54C+zDi6
         cq5suYAwrV2/pYaDs8H81cUnSRY2pL5JhWAM8rgseqIz9M0UOP54bfBq9meMGNtmCoKI
         m5aPh9teHlu0xVkXnTyc2d7Rq+fXliqWaebg5JKsSO8BA3vrIelqYidDHwgNGftwkqGe
         9VjGGJ80DOj1ivFDqvCSTsqwNupuNItgl5pAPivsOUbq/Qg0WQMVzWa39GwYhkl85XXd
         bCIg==
X-Gm-Message-State: AFqh2kpm3RpPdaB8oPtNEfOPO6rW1Tl7tRBHSjHAzQqidsTubCT/rr8O
	uq0kDG6XtDvoZkT5ThKgFdOB58yvNF4=
X-Google-Smtp-Source: AMrXdXs257D31rv5hBXUbhjFtQl4ThO72ENxbPYkLtpPolyDJvjzmX4y3St8XNCzlq+1F51f1cu3EQ==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id s26-20020a7bc39a000000b003d20640c4e5mr22628761wmj.8.1672425543306;
        Fri, 30 Dec 2022 10:39:03 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/11] libportal: add from meta-openembedded/meta-gnome
Date: Fri, 30 Dec 2022 19:38:44 +0100
Message-Id: <20221230183850.3089510-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175168

This used to be required by epiphany, then it became
optional and was moved to meta-oe, now it is again required.

The recipe was originally provided by... actually me :-)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-gnome/libportal/libportal_0.6.bb | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-gnome/libportal/libportal_0.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index be96123ce6..0affa1bded 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -371,6 +371,7 @@ RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libpcre2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libpipeline = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libportal = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libptytty = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb
new file mode 100644
index 0000000000..9c628c457f
--- /dev/null
+++ b/meta/recipes-gnome/libportal/libportal_0.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
+DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
+with a familiar GObject API along side the D-Bus API"
+HOMEPAGE = "https://github.com/flatpak/libportal"
+BUGTRACKER = "https://github.com/flatpak/libportal/issues"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
+SRCREV = "13df0b887a7eb7b0f9b14069561a41f62e813155"
+S = "${WORKDIR}/git"
+
+inherit meson gtk-doc gobject-introspection vala features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+DEPENDS += "glib-2.0 glib-2.0-native gtk+3 gtk4"
+
+EXTRA_OEMESON = "-Dbackends=gtk3,gtk4"
-- 
2.30.2


