Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.21439.1604970000115665020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 17:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tibm3K+z;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id e7so9817953pfn.12
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 17:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/twsafPYAXjxNqj6vX473r2Jyp1flZ+JIwP1AQKsyI=;
        b=Tibm3K+zNC3NI+6BqJdSE+0wmEoZRmWoTpU9NoattHAiqREhVoV/hJdrzoF7d/LJIk
         nOpODEo052DEFF5VdUbaeq6KoycK2l7UXtYFLTdmEst3TvGxZ2YJy3dsMe8jtSa+/IcH
         wfbKrwlNUqMv1Z1vWkKnbBmZfH/JIuGKuZFR+kc/d4dUdl4IeDGn6JBkkt4+2ndMQjB0
         z282u6x8wbQkg8n823vQjD6bzQabNcftOavY6NnJitxj+i8KkDCx8TMBg+li5NzW4Xv/
         PNQLxgbIHOrl4l8zPxZoGgTUcZEuVVBRbGGyRkQN8FFOnANF8E5gpXrorQu4HowSyPx2
         gzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/twsafPYAXjxNqj6vX473r2Jyp1flZ+JIwP1AQKsyI=;
        b=dbKTziuiY+ARTyHqLZt8qAAIz9J/VqUXZetq7REgXx+av4BnMumKe1KVkutT/EOXvP
         SOtDooNRfOSnQ8R9Ugcm+oQ5y/JgBx/oG9EWbz73f4PQ6TkUAeFYFGet5IajvISuy9pD
         1tTJ8xeDztDgcSDi/gFvuxiXNuvQBynZ1huRK3EogCZf1hwp+S4tenWxCWBdFFQ4c551
         JcrsWqdvJIzChRWeDdrrXdqpP2MuOpP//5iKXtRXsp1TEEpOiI3mLeOCFMQgCaInp4MN
         nTNqSCEux56q4wZWx9hqYO7G7b8eYNvFvVahD7fNqYdfLXODzDpr2zaij+e89q0kCdGj
         OS9w==
X-Gm-Message-State: AOAM532QWoDlrgG0C9JU3QRe9NVhlVTqQJPyjdLaSidq6oe0Eslm8pCj
	xy3eZxOUX+fSijlFFbqAsbBABkgMW3ayww==
X-Google-Smtp-Source: ABdhPJxkBW6zpRlAadgGwshix9gNxCLtJba3Hj5E1jQQnlRT09Z76sXesyTehFPLZV6B0CYdUxw3cQ==
X-Received: by 2002:a05:6a00:2126:b029:18b:6372:d444 with SMTP id n6-20020a056a002126b029018b6372d444mr16590747pfj.26.1604969999271;
        Mon, 09 Nov 2020 16:59:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id e14sm10936747pgv.64.2020.11.09.16.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 16:59:58 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libical: Fix build with icu-68
Date: Mon,  9 Nov 2020 16:59:56 -0800
Message-Id: <20201110005956.2972007-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

icu-68.1 removed TRUE and FALSE public macro definitions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-icu-68.1.patch        | 46 +++++++++++++++++++
 meta/recipes-support/libical/libical_3.0.8.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch

diff --git a/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
new file mode 100644
index 0000000000..8f3a6e1563
--- /dev/null
+++ b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
@@ -0,0 +1,46 @@
+From 6fa716bb11d16a7b073f35a36651c6ef23a7fdac Mon Sep 17 00:00:00 2001
+From: Lars Wendler <polynomial-c@gentoo.org>
+Date: Fri, 30 Oct 2020 11:24:34 +0100
+Subject: [PATCH] Fix build with icu-68.1
+
+icu-68.1 removed public macro definitions for TRUE and FALSE
+
+Upstream-Status: Pending
+Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
+---
+ src/libical/icalrecur.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/libical/icalrecur.c b/src/libical/icalrecur.c
+index 7317845..bd1046f 100644
+--- a/src/libical/icalrecur.c
++++ b/src/libical/icalrecur.c
+@@ -143,6 +143,7 @@
+ #include <stdlib.h>
+ 
+ #if defined(HAVE_LIBICU)
++#include <stdbool.h>
+ #include <unicode/ucal.h>
+ #include <unicode/ustring.h>
+ #define RSCALE_IS_SUPPORTED 1
+@@ -1018,7 +1019,7 @@ icalarray *icalrecurrencetype_rscale_supported_calendars(void)
+ 
+     calendars = icalarray_new(sizeof(const char **), 20);
+ 
+-    en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
++    en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
+     while ((cal = uenum_next(en, NULL, &status))) {
+         cal = icalmemory_tmp_copy(cal);
+         icalarray_append(calendars, &cal);
+@@ -1411,7 +1412,7 @@ static int initialize_rscale(icalrecur_iterator *impl)
+         }
+ 
+         /* Check if specified calendar is supported */
+-        en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
++        en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
+         while ((cal = uenum_next(en, NULL, &status))) {
+             if (!strcmp(cal, rule.rscale)) {
+                 is_hebrew = !strcmp(rule.rscale, "hebrew");
+-- 
+2.29.2
+
diff --git a/meta/recipes-support/libical/libical_3.0.8.bb b/meta/recipes-support/libical/libical_3.0.8.bb
index efb9433412..6230f09eca 100644
--- a/meta/recipes-support/libical/libical_3.0.8.bb
+++ b/meta/recipes-support/libical/libical_3.0.8.bb
@@ -11,6 +11,7 @@ SECTION = "libs"
 SRC_URI = " \
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-Use-our-hand-build-native-src-generator.patch \
+    file://0001-Fix-build-with-icu-68.1.patch \
 "
 SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
 SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
-- 
2.29.2

