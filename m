Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.3858.1596654503658204994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 12:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=etbr9C3y;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id c6so5163555pje.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RVyV3AAocSDlEJmSpq+ZUn6dyMcdyRKQ6QavqBfZAFQ=;
        b=etbr9C3ypbLzz4xhe+0nQeyhCMIConCx24vCC78H/WNVSNA6O/IigTv9gRTbFkLZ9g
         ob4HjYBX5fc+G44b9jicMMVh/RKsswqr7zg6X5q6D9Jxd93j4Fm5vEgR176ReNaL/s9u
         A3sC3VJGDOlna/HPObzEpwoWL4LIUJWRXkyJbFrXzEimySjReiksp13ZhYEhAhW2rdlg
         f1ggBVP5fIviduCavjwsOmDINKy6ALXDWaSJL3qV1G+VzKC76zo2W+mLlH7j5ciLkAA1
         apqju7r0qxnloD5ZsoTfwiKiF502LKfa7yB3sX0g4oxtebife/h0O9RIHw37FVelLI8+
         wPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RVyV3AAocSDlEJmSpq+ZUn6dyMcdyRKQ6QavqBfZAFQ=;
        b=WiGYV08bKWBHtLHdY+V3bvRgQUjlIyuldv2zPUlQ7oskzeztmp4vNuL1IqppbWGzmj
         0lc1KRI7d/oefad+vIIvijwf/rbaLA6YUke/CIkSDSx4ZsLgevLc8ZfEsruL5DWLS2MH
         mZvegF8X4GuVxOOOe/ckyEBwN+0XkzbVFRZK2so3KToj0Kz6/sXzRaZNH30lHZawWijA
         Y9l08vXiRH5SM4URYW8Nc9vGDuW9HW7cmodfAMIR7okxr1Oai5wdUWaJRSiS67D2ke2J
         OyIYlfPpGqbuezrM22bA7Nzg4SKz/qgtt3eDNmrmVvaQpm9Smghy5GrML4yxrgZ7OdMf
         oqrA==
X-Gm-Message-State: AOAM530YAYUKqJtZxVJqQKWtSqXgyL0W0OYMdZ8LDceGwNks53VyS1Tz
	pIhEsSvkKGma+STwfac2KhAVcoMUB/I=
X-Google-Smtp-Source: ABdhPJy8h36Y09CNw3NbCK0lK7PBAHdQMv6DxnLl17oejBIR8xWLK0SprD1NUUDYBPTb9aw2vxN2bg==
X-Received: by 2002:a17:90a:be17:: with SMTP id a23mr4707425pjs.84.1596654502768;
        Wed, 05 Aug 2020 12:08:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id b13sm4243790pjl.7.2020.08.05.12.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 12:08:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] libacpi: Fix build with -fno-common
Date: Wed,  5 Aug 2020 12:08:19 -0700
Message-Id: <20200805190819.935438-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200805190819.935438-1-raj.khem@gmail.com>
References: <20200805190819.935438-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-libacpi-Fix-build-witth-fno-commom.patch | 68 +++++++++++++++++++
 meta/recipes-bsp/libacpi/libacpi_0.2.bb       |  4 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch

diff --git a/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch b/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch
new file mode 100644
index 0000000000..32808fb92a
--- /dev/null
+++ b/meta/recipes-bsp/libacpi/files/0001-libacpi-Fix-build-witth-fno-commom.patch
@@ -0,0 +1,68 @@
+From 9839c169f513e65fc711646257b3e8588cce623c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Aug 2020 12:06:01 -0700
+Subject: [PATCH] libacpi: Fix build witth -fno-commom
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libacpi.c | 16 ++++++++++++++++
+ libacpi.h |  6 +++---
+ 2 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/libacpi.c b/libacpi.c
+index 4e34725..9344ea4 100644
+--- a/libacpi.c
++++ b/libacpi.c
+@@ -14,6 +14,22 @@
+ #include "libacpi.h"
+ #include "list.h"
+ 
++/**
++ * Array for existing batteries, loop until
++ * globals->battery_count
++ */
++battery_t batteries[MAX_ITEMS];
++/**
++ * Array for existing thermal zones, loop until
++ * globals->thermal_count
++ */
++thermal_t thermals[MAX_ITEMS];
++/**
++ * Array for existing fans, loop until
++ * globals->fan_count
++ */
++fan_t fans[MAX_ITEMS];
++
+ static int read_acpi_battinfo(const int num);
+ static int read_acpi_battalarm(const int num);
+ static int read_acpi_battstate(const int num);
+diff --git a/libacpi.h b/libacpi.h
+index 9334b79..5242d3d 100644
+--- a/libacpi.h
++++ b/libacpi.h
+@@ -183,17 +183,17 @@ typedef struct {
+  * Array for existing batteries, loop until
+  * globals->battery_count
+  */
+-battery_t batteries[MAX_ITEMS];
++extern battery_t batteries[MAX_ITEMS];
+ /**
+  * Array for existing thermal zones, loop until
+  * globals->thermal_count
+  */
+-thermal_t thermals[MAX_ITEMS];
++extern thermal_t thermals[MAX_ITEMS];
+ /**
+  * Array for existing fans, loop until
+  * globals->fan_count
+  */
+-fan_t fans[MAX_ITEMS];
++extern fan_t fans[MAX_ITEMS];
+ /**
+  * Finds existing batteries and fills the
+  * corresponding batteries structures with the paths
+-- 
+2.28.0
+
diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 5e7f7fa8e0..fa9e3d4894 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -11,7 +11,9 @@ SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 	   file://makefile-fix.patch \
 	   file://libacpi_fix_for_x32.patch \
 	   file://use_correct_strip_in_cross_environment.patch \
-	   file://ldflags.patch "
+	   file://ldflags.patch \
+           file://0001-libacpi-Fix-build-witth-fno-commom.patch \
+           "
 
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
-- 
2.28.0

