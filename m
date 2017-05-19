Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 822CB60777
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 15:49:53 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 6so3355658wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VqgnpD2OoeczS9Y1qb8uLtCgRDIZWnAsCyO5CeChPl4=;
	b=U6Bj7t9GIhauSlNmmraj8mPkpVle6KFoq1AtNiDZubo5Dp0dDOiwteW/OTLnIWEPao
	p8yNlMkd8qHGbatAhYBl+LZewTolq83bTCsN/EZNQpwdoHRcYBAzVGEbCjpGT3j/4PMJ
	t1CmjV+Sbdnn2Zw/zHBvn7OrHnhyYQAXJM41n98AQkR8LN6fHd4DVL9AFPivO0QqcfrI
	jAzCGNG4sRqVZyTEGs4d+b7z1h4QthJznxAKvdqYyeWHvIYVVJCPQXkiGMaYHZJuxCfq
	zPcPnN3PZ2Fv9P2I855vZPZ+xQBn7e3senh73mjrMqGyy5uNrI2GA4lj+5NeITRoMA7j
	Y/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VqgnpD2OoeczS9Y1qb8uLtCgRDIZWnAsCyO5CeChPl4=;
	b=FvF2Z5EuuLOGqRp8/dq0ciYpsfOYSo8mA4dsCRu/O7fRS3U4Ba8YKBVS6NA8nLl2Kn
	vVdGxIfLjLN+fKF4coY1CrZXS3y4zzr/P2aTPmz/TZumsV2t6x7n/bpI5W78zcE6Hy9m
	bisOMVYfkb6rhnqd4wPeKUf3emc7pP5y1vWOlzT5dJOg/PX/opXh0ZrZWaAnm7yEThhV
	MRVXsxCwawIGgPAbK10VydZF2lpT02tmsmunziE9J3cgjZ0HPlLuPpdo5YU0AET9c/Pu
	ELV4PcUSWjrOZ0eD8OYMOLeaO2dp0ONOjqOJUP7HaovFlgIms5gKQrY+yQ3NDRzPWPDM
	h+/Q==
X-Gm-Message-State: AODbwcAaeCurZUeNk3dI82PnalmTsKc4Ed7WPbDsV3kWknPIcwrXs84H
	mJQsTVsf3XNRIg==
X-Received: by 10.223.173.74 with SMTP id p68mr3391676wrc.163.1495208994125;
	Fri, 19 May 2017 08:49:54 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id j1sm5089584wmf.6.2017.05.19.08.49.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 08:49:53 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 17:48:56 +0200
Message-Id: <20170519154856.21505-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.3
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH v2] libsolv: don't pick up bundled db from host rpm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 May 2017 15:49:53 -0000

With rpm v4 in openembedded but on a host with existing /usr/include/rpm/db.h
the native build fails to compile.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...01-don-t-pick-up-bundled-db-from-host-rpm.patch | 51 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.26.bb    |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch

changes in V2:

- instead of unconditionally assume db is not bundled
  evaluate the actually linked librpm.so
- fix commit text to include that libsolv-native is failing
  (but not libsolv and nativesdk-libsolv)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch b/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch
new file mode 100644
index 0000000..f99cdca
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch
@@ -0,0 +1,51 @@
+From f815c166f08f8a0a257630e91c0bcc20409f42cf Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Sun, 7 May 2017 20:28:11 +0100
+Subject: [PATCH] don't pick up bundled db from host rpm
+
+For libsolv-native with rpm v4 in openembedded but on a host with
+existing /usr/include/rpm/db.h the build is configured to have
+HAVE_RPM_DB_H because of the existing header file from the host,
+but linking against the librpm.so in recipe-sysroot-native fails.
+
+Check for a bundled db by testing if librpm.so provides one of
+the db functions.
+
+Fixes the following link errors:
+| ../ext/libsolvext.so.0: undefined reference to `db_create_rpmdb'
+| ../ext/libsolvext.so.0: undefined reference to `db_env_create_rpmdb'
+
+Observed on a openSUSE Leap 42.1 build host with rpm-devel installed.
+
+Upstream-Status: Inappropriate [oe build specific]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 838f9d0..1ded881 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -185,7 +185,7 @@ IF (ENABLE_RPMDB)
+ SET (ENABLE_RPMPKG ON)
+ ENDIF (ENABLE_RPMDB)
+ 
+-INCLUDE (CheckIncludeFile)
++INCLUDE (CheckLibraryExists)
+ IF (ENABLE_RPMDB)
+   FIND_LIBRARY (RPMDB_LIBRARY NAMES rpmdb)
+ 
+@@ -206,7 +206,7 @@ IF (ENABLE_RPMDB)
+   ENDIF (RPM5)
+ 
+   # check if rpm contains a bundled berkeley db
+-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
++  CHECK_LIBRARY_EXISTS(rpm.so db_create_rpmdb "" HAVE_RPM_DB_H)
+   IF (NOT HAVE_RPM_DB_H)
+     FIND_LIBRARY (DB_LIBRARY NAMES db)
+     IF (DB_LIBRARY)
+-- 
+2.12.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.26.bb b/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
index a33c251..ccd9cfa 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.26.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib rpm"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
-           "
+           file://0001-don-t-pick-up-bundled-db-from-host-rpm.patch \
+          "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
-- 
2.9.3


