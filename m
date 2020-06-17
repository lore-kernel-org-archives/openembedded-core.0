Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.4325.1592388992578592671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 03:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QHP0vxFu;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l27so1733296ejc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+lFNRB1ncq3KPyUmNNFUiJ6KzVfV0I2F6LBLmINpHDU=;
        b=QHP0vxFunObICv74SrVpLnuIFtuPsJLdjl3gvNOdi/3JLNG2YAGku2xPdOhUXlheca
         EsQVPKITwUVgB4jmmDPr8haZ145LvTrtOTsQeO03264WqVPjC393RZpOOootxOxy7QUd
         19XqnWPzhOl93KoQFU+DziC6/I2eLmalUBHiCfvqw0AzG+JzF+dzofus2WC3FwQRhOnf
         5sBeL9RZsK9fukHBi4ldjnJOXiXavd5ubt35/yejfy2tJ1smu3a65/9EsgJdADrQa+vb
         9CKUin7r/IK5P4+I5xePsp7QpqHlJZ5LYER7WATCRPJN0vJBnXwAFcpWqEtD1lvycvY0
         U18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+lFNRB1ncq3KPyUmNNFUiJ6KzVfV0I2F6LBLmINpHDU=;
        b=hjS92CupHmsv8LGZuhwrkBcQtnuM+j7Ad6Fhdd86xTJctbA5mP05w4MUVspOVKwGhw
         TwnKdKCd27SiEB/MYgVKkO2vDoS5HoGrhceEvhBy/oyOPi70Il8f/tjm0/hpjulIvMr0
         rB/heTkafRiro4okt/1lWCx1HaufvtbdfdadiLAnLm+5k+MHQYsTxWPurvcunY73fBcR
         yUnkuQ4q88/uYCTgKY/7J74GKeDMiWd3LcwD68RZvjYZMyp8OP4c0laQDREIMDO2O7Zj
         Xrn61Mfhmc3MQnG5aZQ5/woFGEwLC5CpP2XU80cC/rn/QZvBC+rCvaqbZZI5/0XIsMAY
         V2qw==
X-Gm-Message-State: AOAM532ssRxq5/YOwIXIR+NljVFqC372XBC/zdeun87lfNUr2pee5RkU
	m6HW08NxoTGiPexX/UFLjMChxY7jkPk=
X-Google-Smtp-Source: ABdhPJyvMFmpiQWzFEqXHHZPSjUdjwq04vvxpJkD8XE1SSjD4E19Z9f4zHqv6kWfjZUkXm03Gi0nww==
X-Received: by 2002:a17:907:7014:: with SMTP id wr20mr4974778ejb.251.1592388990906;
        Wed, 17 Jun 2020 03:16:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id q12sm13031985ejn.23.2020.06.17.03.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:16:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] gobject-introspection: add a patch to fix a build race
Date: Wed, 17 Jun 2020 12:15:52 +0200
Message-Id: <20200617101552.23867-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617101552.23867-1-alex.kanavin@gmail.com>
References: <20200617101552.23867-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ency-for-g-ir-compiler-for-building-.patch | 33 +++++++++++++++++++
 .../gobject-introspection_1.64.1.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
new file mode 100644
index 0000000000..adb357b5ec
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
@@ -0,0 +1,33 @@
+From 56ba5656258b82dbc069ab3a61e597c931a16a83 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 17 Jun 2020 11:43:16 +0200
+Subject: [PATCH] gir: add a dependency for g-ir-compiler for building .girs
+
+meson inserts the dependency if the compiler is used directly, but
+fails to do so if the compiler is run through a wrapper. This leads
+to build race errors between building the compiler and using it.
+
+Fix provided by Quentin Schulz <quentin.schulz@streamunlimited.com>
+
+Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/228]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gir/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gir/meson.build b/gir/meson.build
+index b37fdb81..557e5517 100644
+--- a/gir/meson.build
++++ b/gir/meson.build
+@@ -448,7 +448,7 @@ foreach gir : gir_files
+   typelibs += custom_target('generate-typelib-@0@'.format(gir).underscorify(),
+     input: gir,
+     output: '@BASENAME@.typelib',
+-    depends: [gobject_gir, ],
++    depends: [gobject_gir, gircompiler, ],
+     command: gircompiler_command,
+     install: true,
+     install_dir: typelibdir,
+-- 
+2.27.0
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
index 9dfb55e055..7eefdd3e27 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
+           file://0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch \
            "
 
 SRC_URI[md5sum] = "3419dfd086efcf83768e0579ab6abd2b"
-- 
2.27.0

