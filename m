Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA290C001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:50 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.8991.1690468600636481217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=C6g0DNP1;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5222bc91838so1402142a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468599; x=1691073399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QKHWuyNGrvffD4ej82S4uyqB9PFeFK6YAS5XOdwJjM=;
        b=C6g0DNP1hE0PjhEamjGj9r1i7Pwb1KAoTnehdhppxLESWM/2TiipN88cu6gaJnDsRA
         EZq9OWoB0Vlw1OAHFQgdrIbD4vx7DgRdvKwgnUYx2r+7zoQMa/HFe+rGOM0TOSBf6I/X
         LU5IvKVZmomAJFJipy0p0X9fYLRDHHDAAPz63PmZX8g5vLRzr9SrmJwPY4CNe6BHm0Gv
         zCFkMEcYfdn76rWyPivL5LgLKgS6zpDgytK4l+GQB27Y+2XiHVki8J+JVUqDnac8lZ+s
         5ULgvyaNfbfks48Hm+9PIGDkL2hbpwZBMTb9wXi7UUpCv1WzJ1a7/b7EU2jjlRRLNIgC
         4ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468599; x=1691073399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QKHWuyNGrvffD4ej82S4uyqB9PFeFK6YAS5XOdwJjM=;
        b=YpTTiHAzCJ3/2a2LR0wAUt+o0VelW3SD1RTllVItsfill4KTKRqdh3XfhHoTKbG2iT
         zuJ9xpyOU1f8d7QDIe9MrC4mFe8eP0w2ndgtlOX6FFmYnXE1FultFn6BvKFClO0iNzA6
         MsAEjp8J3PloosZioRJO7CrDuhlGSqcrDxcCBDb3wZt/smpXi9l9HFSdfs1W3gTHtCbY
         Jb5CHfxYk0HfFjw/ckAUSfU6vw+hsHzDuOy0ZuJL00cc/m0I+pxpZlk1QC8FrGmLFMwr
         ETnOotxNgSmbc7eFu3CjJrdJ9Rbn/QwEPTcPXUzTe6jCKXipodQOU4LdwUJePejqnrY6
         uP5A==
X-Gm-Message-State: ABy/qLYO1LbMJ5FgK3/yO2++Jv5+KkFBC/aaaFXxLVZ3i96QhK3ENBQ0
	bKU14HyTycVhu6aXT6/0cH/O9LFgGr4=
X-Google-Smtp-Source: APBJJlHIacI+UrscIbpMLoXuylY4/j/TaaUrnFV2JH4XwyKweaoNPjc7SMlNHYMj7gxp0MuNFJsmbQ==
X-Received: by 2002:a17:907:770c:b0:99b:ca24:ce42 with SMTP id kw12-20020a170907770c00b0099bca24ce42mr2028720ejc.44.1690468599018;
        Thu, 27 Jul 2023 07:36:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/21] libadwaita: add recipe from meta-gnome
Date: Thu, 27 Jul 2023 16:36:22 +0200
Message-Id: <20230727143627.3718496-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184956

This is a requirement of latest epiphany 44.x.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libadwaita/libadwaita_1.3.3.bb            | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-gnome/libadwaita/libadwaita_1.3.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 17f038c71ef..d472849265b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -305,6 +305,7 @@ RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-liba52 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libacpi = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libadwaita = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libaio = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-libassuan = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.3.3.bb b/meta/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
new file mode 100644
index 00000000000..8ec5258c736
--- /dev/null
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.3.3.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Building blocks for modern GNOME applications"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/libadwaita"
+LICENSE="LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+DEPENDS = " \
+    gtk4 \
+"
+
+inherit gnomebase gobject-introspection gi-docgen vala features_check
+
+SRC_URI[archive.sha256sum] = "3fb9f6f8f570e543ab2dafb8b4b94d8b376c59ad565efadfede44557e3f3a9e1"
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_OPTION = 'gtk_doc'
+
+PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
+
+FILES:${PN} += "${datadir}/metainfo"
-- 
2.30.2


