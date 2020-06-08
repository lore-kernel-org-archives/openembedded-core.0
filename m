Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.25191.1591602528113919268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P17CNXat;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id m32so7403027ede.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b4y/JHVrMtRm7lUu/PisB7nA5XpLKaoDWYnZ5ohmmds=;
        b=P17CNXatUd1qoM2FL0gYZKiPSqkkVRvfbshdJOE0FJpXwUfg8cNrkEbUuRyI49OvQ9
         Ds5M4wrCuZHIrEqRw1OPJIPEfQg3BOTAfExOYFw3LjRvfGYYWQFavjFkSLPDOPep9GOL
         8b6nJk/kxQiyOMiMhY8e5e57kRvXkBCCzXfnp2ndInpSX3NVBzVTL07wM3QM71BcweXg
         4vaTRo+SNzyrVfGcVyQZMs9SlJCNJ7//jUA2XHqxUyI4HBf+z6m9C1mratPa01uulTkV
         qWOIA3s85XU70I5tXPiO6l9uxM/QzY6HHDhXRWkT0q64X/C6FlOjQiNh6xe52x9qLk/E
         JjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b4y/JHVrMtRm7lUu/PisB7nA5XpLKaoDWYnZ5ohmmds=;
        b=rXd8kC3GJSKj8YWM/CKmgN4W1KoCqAm5FDulN9LK7d2dKtyCHGba3fqz1d3UkPuBgZ
         4J1lQF98xUQMkcNMlkJ7A5KU4kS1Jx22vtaNyno3g6xLQK0swYm+GRfWLlbEKmJmXvVQ
         SNlH0FbzXFI5o0u1hCAwcHiOQ68j4GIlPph6b3jHzrmSwiUbgitD2x1x8OriIYJG+BkY
         vb7MshPHTA5XpAzVXXXhKwUKMI/bs+EHJdWJ0wz0gHB6vR5E0v7OvUDw0ZxPl+8mG0qP
         cebQLL93Mn1nATcj8spmKiYpLenSUS3MFwDkD+pTIoQiz5eOM1XUpc4a2uD3p3CkHYzh
         LcfQ==
X-Gm-Message-State: AOAM533+aprVBoZSButAESrBcemU4lZwH1S3+jRA4LM142ZW4YP+Ltjz
	sQN5rziZqFbsIu7q5xfW+kcL4C0CRLk=
X-Google-Smtp-Source: ABdhPJzt8bN1LsBZMwDMW181pWYH8JMzi2HfARrpCQLWj+QHuwc59NPoK3vhZ8rvFoo4ruEUCCWAhw==
X-Received: by 2002:aa7:d6c1:: with SMTP id x1mr16425458edr.154.1591602526446;
        Mon, 08 Jun 2020 00:48:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/42] shared-mime-info: upgrade 1.15 -> 2.0
Date: Mon,  8 Jun 2020 09:46:54 +0200
Message-Id: <20200608074659.7051-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to meson, replace custom call to
update-mime-database with a built-in meson option.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../shared-mime-info/shared-mime-info_git.bb  | 24 +++++--------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index f0d5bc62e9..e82c818e5c 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -5,19 +5,19 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native"
+DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https"
-SRCREV = "829b26d85e7d89a0caee03046c3bce373f04c80a"
-PV = "1.15"
+SRCREV = "ef58b2b2f7ad4070171c6e45e3b3764daa3ff2c1"
+PV = "2.0"
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gettext python3native mime
+inherit meson pkgconfig gettext python3native mime
 
-EXTRA_OECONF = "--disable-update-mimedb"
+EXTRA_OEMESON = "-Dupdate-mimedb=true"
 
 FILES_${PN} += "${datadir}/mime"
-FILES_${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc"
+FILES_${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc ${datadir}/gettext/its"
 
 # freedesktop.org.xml is only required when updating the mime database,
 # package it separately
@@ -25,16 +25,4 @@ PACKAGES =+ "shared-mime-info-data"
 FILES_shared-mime-info-data = "${datadir}/mime/packages/freedesktop.org.xml"
 RDEPENDS_shared-mime-info-data = "shared-mime-info"
 
-do_install () {
-	autotools_do_install
-
-	update-mime-database ${D}${datadir}/mime
-}
-
-do_install_class-native () {
-	autotools_do_install
-
-	${B}/update-mime-database ${D}${datadir}/mime
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.26.2

