Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.5305.1619377713104896690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 12:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jmTBUjL6;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id e2so23447105plh.8
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 12:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TmC42+ejN5WMJirVxAJ/JBweio+ofdvGiP1KXDHVD08=;
        b=jmTBUjL6EL/7ZXi0t1ojNMiwVHNLZ7tDffL/+xHREDQjkYnn0BmZ657wyRMuiht+5f
         6xeg19i4OXGLE3V3GbxHvXPs9ir1njZIqkGXdW+DSKz8nWLXm7bA7I0Xb5/tbtznlQUn
         5WRoCI2Mzt8nSMeaXh9/fLfkmYs9A0Y94FMyhH6td/fpoO2p7t5gNc0d2JjmAh+QqBVl
         bIiH783RDiudJMw18u1MLy7vQG0JbfMVO+xjTL36Qb5hYwta01QWAQj1Y6WUkOWzPjeS
         oIRQm/CXh/GgfIQfACJWaXKT9Fc3WA3bIWHf8N1yhoqFtEXbKETJU9dfSLkJEgLXX4DI
         y4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TmC42+ejN5WMJirVxAJ/JBweio+ofdvGiP1KXDHVD08=;
        b=C3nZjKOx19ncla+GHTa04IROaXj/lpkcLTAWtrNVzsmiZR6WeVui599hb2ymLCRCay
         yyU8B3U74rTb4P5IuZut/3Xnddr8hpHLbcW2NxFxL0oT+tKimuekwiM+ABsG1EYejo/C
         PHQLH4UQ7l+BMsxZuBlG1iPXCd9TIwMsByp8Od9Ga6LCf/uT72PTyg1LDiWq3nCPmK0k
         xqLIEGY98eKj1nENmc9+s5rtAshHaIbib2zS0uPi8WGQ3uLabhgRlXlYbdDMxVrunO0z
         O+z0mvxWkXantdCeXQdtW6b9S944HUJsYeOlGOqD7eVk7lnQzyoTD0ka3dFjEDvuk3cu
         Nyyg==
X-Gm-Message-State: AOAM531xCYcisFmuMtyRWO3WwYUPBhvHRChmjiuNrENENM63IoH9A+Pr
	Q3GVXdMIAckZJk8k7HHAzByxED+2RWQBpw==
X-Google-Smtp-Source: ABdhPJxfw50gum6DdMCDUkgKcqp/a/DFb9ha20AgajF8/UDn8iCEENfkpqnQGcR2AXNH/TSpG8MmDw==
X-Received: by 2002:a17:90a:4a8f:: with SMTP id f15mr16870318pjh.19.1619377712356;
        Sun, 25 Apr 2021 12:08:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id g185sm9136349pfb.120.2021.04.25.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 12:08:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] gcc-target: Create a LTO plugin symlink in bfd-plugins directory
Date: Sun, 25 Apr 2021 12:08:26 -0700
Message-Id: <20210425190829.2056705-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This directory is scanned by binutils provided ar,ranlib,nm for plugins
that it can load automatically, putting liblto_plugin.so in their means
we do not need gcc-ar, gcc-nm, gcc-ranlib particularly as normal
ar/ranlib/nm tools will work equally well as they can now use this
linker plugin by default

This also mean we can revert back to using ar/ranlib/nm as default
providers for AR/NM/RANLIB on target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 164a669aad..0ee3e83d42 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -54,6 +54,7 @@ FILES_${PN} = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
+    ${libdir}/bfd-plugins/*.so \
 "
 INSANE_SKIP_${PN} += "dev-so"
 RRECOMMENDS_${PN} += "\
@@ -215,7 +216,8 @@ do_install () {
 	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
 	ln -sf g++ c++
 	ln -sf gcc cc
-
+	install -d ${D}${libdir}/bfd-plugins
+	ln -sf ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto_plugin.so ${D}${libdir}/bfd-plugins/liblto_plugin.so
 	chown -R root:root ${D}
 }
 
-- 
2.31.1

