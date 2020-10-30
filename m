Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.2264.1604096782728858827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 15:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=STs1cMsT;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id p93so8238965edd.7
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 15:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTz8uDT8wepHvA8SkDKlXOaj9+9wfw+2F5F+UbRs0f0=;
        b=STs1cMsT87hIwOG2F9qsl7yOcgARNcXaM7l1siLPT3ubhxMeQmDFMrQcfBtCNo3t8n
         b/K6vPqCGsskm8yVV/vg2fpzHrcbrXHzRqOYTETE7PrjCZ2uDkcoj5Rm2Cuj5uQCON3I
         cIzIJSHn3M3bELZGV6kvYTIrkFh/pqRVuq2Z8JjRmf/jPBaKOgse8AnYoxvyqqYsLsHz
         XiIEagHUzCDBLiN5A+2v4kEG4v1sCvH9l1GcXQB3iwL//WLD28EEVy0rKs64ghRqM4UG
         LEFNrgS5meGLJym+IZuio42YHXNqz8Ly+Fy4jVY65Ogt6rgfaygQpzGAf1EkdQagutEC
         1sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTz8uDT8wepHvA8SkDKlXOaj9+9wfw+2F5F+UbRs0f0=;
        b=LNNN/DMVyJSSjIMFbSle3xNh/KU6SUak23i1jDmGzXDoZauxwPgcKfnER06ENqygNS
         noJRg9taAWUZLZ7tfXOoN0cNZ/cDARCvr4L6IVGs3Cny5SaP2QPCifarbW7LQcE2h/ec
         Fo72OeLFOtpgCiB/HzcPw94UftKTPtlWQ/JLOezm2h09ISoXcT+RAG4lN6eQt9UhJiBu
         V7d+xWFeP4dsbopAsMNq/p27s9WDRnQ0dCf4YIG2o6hJWIZpa1yXb47Z2sZCXwlaSzSJ
         XZ38xihnwVOgiykRjEdsfm2QY4v3i80xjXORdOru4i8zr+12+ZNv7ah1EQAmFazQRR5u
         VuSw==
X-Gm-Message-State: AOAM533p9RnWtRPWHFYKEGCbGhzlKQ9uSjLAdUrg6nWUEAliwItH41Da
	I0pYDZxQWIxnFyXuXybUdd/B5KZY7UXVuw==
X-Google-Smtp-Source: ABdhPJyhd1Vw5fPXnJcqGRsdus8WYhBdAfoo1nS0/mJwX6H4BEt35Rxny0qS6Sl7V88UG+psOgEFzw==
X-Received: by 2002:aa7:ccc8:: with SMTP id y8mr4944578edt.325.1604096780690;
        Fri, 30 Oct 2020 15:26:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id o11sm3594617edt.87.2020.10.30.15.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 15:26:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] json-glib: fix reproducibility
Date: Fri, 30 Oct 2020 23:26:13 +0100
Message-Id: <20201030222613.22778-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...num-types.c.in-fix-build-reproducibi.patch | 30 +++++++++++++++++++
 .../json-glib/json-glib_1.6.0.bb              |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch b/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
new file mode 100644
index 0000000000..e5bfdcd4b7
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib/0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch
@@ -0,0 +1,30 @@
+From 0f06c4cb4a57083c08312144b03c8346cf620be6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Oct 2020 22:15:29 +0000
+Subject: [PATCH] json-glib/json-enum-types.c.in: fix build reproducibility
+
+Changes the comment and include to reference the file basename
+instead of the full path. This ensures that the generated file is
+reproducible when it is included in source packages meant for debugging.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ json-glib/json-enum-types.c.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/json-glib/json-enum-types.c.in b/json-glib/json-enum-types.c.in
+index da07c46..7b39290 100644
+--- a/json-glib/json-enum-types.c.in
++++ b/json-glib/json-enum-types.c.in
+@@ -9,8 +9,8 @@
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
+-#include "@filename@"
++/* enumerations from "@basename@" */
++#include "@basename@"
+ 
+ /*** END file-production ***/
+ 
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
index 3cb637f220..82f983f3c5 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
@@ -19,7 +19,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
-SRC_URI += " file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch"
 SRC_URI[archive.sha256sum] = "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc955f652a50d3753b08494e73"
 
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.29.0

