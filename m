Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.344.1591994752320110998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 13:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e-labworks-com.20150623.gappssmtp.com header.s=20150623 header.b=zOJDiQN+;
 spf=none, err=SPF record not found (domain: e-labworks.com, ip: 209.85.128.66, mailfrom: sergio.prado@e-labworks.com)
Received: by mail-wm1-f66.google.com with SMTP id r9so9077676wmh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 13:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=e-labworks-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=6apk4jgKDQoLbR12tw5sYtHUICczTL6knrz0uNt//Yc=;
        b=zOJDiQN+lYv2bSgZhQXb3+9m/8tE3xW6N7KBGzCXNYkb7oCluUl9wwNKDfZXhKn5UJ
         6OxpeF0d/pE3MWODAsb47e5jzfx8S/sMUrib9REn0TgwrQJmPyOipZPCsGlLflE0zQZR
         08RpJnFATm6y3GOA9PK78yfmPd1tQVl6wU3Zv2UHcvBsqzjMonJYPi0GPTb+K1qYvfRK
         aHV3HI/QOshy0MTOjmireZGpODRefL+PTXarUmAF7YiANB+OAVAHf64pX27Qz9ThdeEC
         CrZjGJ+EidDFE+2nBvo5iJ1lH4+ClurzVAA3mMfc4MGHWmRLinuaJfZ8EGZDIutzgGNj
         E7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6apk4jgKDQoLbR12tw5sYtHUICczTL6knrz0uNt//Yc=;
        b=MxlvCwpUjPhzCUo679XM8DYsNchfajJFn8/yQQeYUkKBn6JxJdzeWwfxvMX+DFoRyg
         u6s52IRlFjXLMOJdeFcOkpYEbFTnvh3ea51JVSHnNQ17E+lRLUuRulb4AnsyAuDS0/jn
         9YiOOzwLnO145pORcESm1qJGQOVuSCVMRONxtGsDsy6NygysawSK3Cay7t3hTch/Ie6S
         HQYIzMyYWcICQXaIn97EL541X6dDGnqUu45VyizRipWQgIPfhIBk+lev2ZeoMg2D/Ue0
         MfeRsTxaxKcx1vnNmwre1yO1elurYrMin0ldYBPUj2CPApEbN2Edz/JM5mzGpIgRsJE2
         9SBA==
X-Gm-Message-State: AOAM532VRF1ppmogKfLXQbNPew9QOyovjVaG3mF5Sw9V6pCUfk6SaOMh
	FNx+4F41RhHgZy9MUgZVb5bMMG3qjnM=
X-Google-Smtp-Source: ABdhPJy9ncZKuk/8Km/jheSS2MVBNeBcsOFeBiO6PUYy3RVJmOC1pGAqyxQbNLa30fwpWuKt5sBdiw==
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr728575wme.129.1591994750496;
        Fri, 12 Jun 2020 13:45:50 -0700 (PDT)
Return-Path: <sergio.prado@e-labworks.com>
Received: from localhost.localdomain ([189.62.45.221])
        by smtp.gmail.com with ESMTPSA id n23sm10065335wmc.0.2020.06.12.13.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 13:45:49 -0700 (PDT)
From: "Sergio Prado" <sergio.prado@e-labworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH] zlib: build and package minigzip
Date: Fri, 12 Jun 2020 17:45:20 -0300
Message-Id: <20200612204520.7818-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.17.1

minigzip is a minimal implementation of the gzip utility that simulates
gzip using the zlib compression library.

Having a package with minigzip could be useful in some cases.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 meta/recipes-core/zlib/zlib_1.2.11.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index ef9431ae475c..3ecb90de2b5f 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -19,6 +19,14 @@ CFLAGS += "-D_REENTRANT"
 
 RDEPENDS_${PN}-ptest += "make"
 
+PACKAGES =+ "${PN}-minigzip"
+
+FILES_${PN}-minigzip += "\
+                         ${sbindir}/minigzip \
+                         ${sbindir}/minigzipsh \
+                         ${sbindir}/minigzip64 \
+                         "
+
 inherit ptest
 
 do_configure() {
@@ -26,11 +34,16 @@ do_configure() {
 }
 
 do_compile() {
-	oe_runmake shared
+	oe_runmake shared minigzip minigzip64
 }
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
+
+	install -d ${D}${sbindir}
+	install -m 0755 ${B}/minigzip ${D}${sbindir}
+	install -m 0755 ${B}/minigzipsh ${D}${sbindir}
+	install -m 0755 ${B}/minigzip64 ${D}${sbindir}
 }
 
 do_install_ptest() {
-- 
2.17.1

