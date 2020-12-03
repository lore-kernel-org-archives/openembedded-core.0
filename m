Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.10144.1607002657935285886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aiHOmwH1;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id bo9so3427542ejb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xTBDjK0HFjNVQ59vn3NK0ALpZZ2x81+5CcTwusitBIw=;
        b=aiHOmwH1Ja+HVpGkBndUFhmnaAwDf9LUgsZj+cHULe7MGisY4U48/4+fW5F9i4bBu/
         ZnwmalOeWCPXyuS1UIEw83+Zc56qsqd4vxlzBm7IKIGR3D0/94VwwmZCsWZ7A7hCb7TY
         PQ0u69yfnxjSXVxqE0hbAg4CQROGfJSirOqHZmRPOBTBUS0JlKKi7ffcL3wA+jhizVBF
         evLoQRu1I4iej7dJv+N4WR8e5CSCq5aeRrvX90QSSL4az0wMNEqk/JDw2dDoPdkY3mdC
         y4PsKp5dUDpU+GmKPx+GkZA/gmsu9axqQPImfhaxD/oNjCxzNRSE3clF4qz9ABq1lS3k
         iv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xTBDjK0HFjNVQ59vn3NK0ALpZZ2x81+5CcTwusitBIw=;
        b=olskFU8yqb9+WBoBp8K7OTjtBG1NvS8oyjCom/RMFU4NF4PICDjhvsDWE9w+bPwTn4
         L3Awkh9MWOssYlbSGh+tAF6KHOeDqNEOCB+mYO5wEE9rBc879c9a/eDien1DCAyQ7zJe
         DaTZIgH4jh9e0+AR41PJM+SAiZtQBKxYXZ2qYNO/TKU/PXNsPfo1n3fi3/WJUfOugQd8
         IXEaYrSML/rFnYYg87EocQINxunE8ThyPgnjWuKotU7aF6wWqluLIwDwdee5Rrhq7JwJ
         51gronqRY36GKyFTbdhRxdLYXcTQjzMYAeoockDF7rOzlwf1fI02uEEkyRdwtfTt6RTa
         bxXQ==
X-Gm-Message-State: AOAM531yNeF5yI8WcTFlaIjQZyOi/rzS5fjrZnQ/XsUr4W8Bj5jQSg7B
	GSE/wKDOs95GZTIcCbZsnWCdy2HvbouTDA==
X-Google-Smtp-Source: ABdhPJz3x1TXXP5cMgLa5qz3Yqc6dX3rE0xVd73JIqCcTo95Fr28eTs+HcSRanvGpo9bJzJgYpKwJg==
X-Received: by 2002:a17:906:1945:: with SMTP id b5mr2690167eje.388.1607002656218;
        Thu, 03 Dec 2020 05:37:36 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:35 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/11] kea: fix reproducibility
Date: Thu,  3 Dec 2020 14:37:18 +0100
Message-Id: <20201203133727.12936-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...er_unittest_support.cc-do-not-write-.patch | 27 +++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.7.10.bb   | 29 +++++++++++--------
 2 files changed, 44 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
new file mode 100644
index 0000000000..226bc5b311
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -0,0 +1,27 @@
+From 9985a03f13da4d7bb0a433f7305d2ffae3d82a27 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 15:57:03 +0000
+Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
+ path into binary
+
+This breaks reproducibility and is needed only in unit testing.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/lib/log/logger_unittest_support.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
+index 58dbef8..9a2929c 100644
+--- a/src/lib/log/logger_unittest_support.cc
++++ b/src/lib/log/logger_unittest_support.cc
+@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
+     const char* localfile = getenv("KEA_LOGGER_LOCALMSG");
+ 
+     // Set a directory for creating lockfiles when running tests
+-    setenv("KEA_LOCKFILE_DIR", TOP_BUILDDIR, 0);
++    //setenv("KEA_LOCKFILE_DIR", TOP_BUILDDIR, 0);
+ 
+     // Initialize logging
+     initLogger(root, isc::log::DEBUG, isc::log::MAX_DEBUG_LEVEL, localfile);
diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
index 1d011ace78..c9a11908e5 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -7,18 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
 
 DEPENDS = "boost log4cplus openssl"
 
-SRC_URI = "\
-    http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
-    file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
-    file://kea-dhcp4.service \
-    file://kea-dhcp6.service \
-    file://kea-dhcp-ddns.service \
-    file://kea-dhcp4-server \
-    file://kea-dhcp6-server \
-    file://kea-dhcp-ddns-server \
-    file://fix-multilib-conflict.patch \
-    file://fix_pid_keactrl.patch \
-"
+SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
+           file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
+           file://kea-dhcp4.service \
+           file://kea-dhcp6.service \
+           file://kea-dhcp-ddns.service \
+           file://kea-dhcp4-server \
+           file://kea-dhcp6-server \
+           file://kea-dhcp-ddns-server \
+           file://fix-multilib-conflict.patch \
+           file://fix_pid_keactrl.patch \
+           file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
+           "
 SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
@@ -50,6 +50,11 @@ do_configure_prepend() {
     sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
 }
 
+# patch out build host paths for reproducibility
+do_compile_prepend_class-target() {
+        sed -i -e "s,${WORKDIR},,g" ${B}/config.report
+}
+
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${systemd_system_unitdir}
-- 
2.29.2

