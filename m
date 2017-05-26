Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D6E7177F73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:37:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d127so5826728wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ss+6auivLCZlVK4hFIl9VcGh50zCkOSci087+XmTH8g=;
	b=Xndj/7rk+jFrIzjCRmfeFTNqmHcbE3CkMsBDrLm15tL2MSdtOt+AH1iQ1Il1WNF9h6
	1CEJDNOenfDcdwxI0mpGbmj9IwAB9iWnO0ZWygCbnTM/oM5mUBZLjztyH/YL75X0Qm7H
	yyRe01DU3l7RQxQsNm5vbeuLzUT/3GDetTR8rs9Gj+m+I2XRExeNZo1AEWIAG2KcpYES
	y1/iHdSynr/JtOZMpOCdkzptv3uaZsOcovMgB51Gdz9jRNhd/GxtSAHbmwZFe8otOLmF
	b7q4djOrh2SyBaSCro9j0vDaLVuOaNKjqmne7hYbL6IFmAeH5eDRZXI9W/iOaQ8HVAcN
	b1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ss+6auivLCZlVK4hFIl9VcGh50zCkOSci087+XmTH8g=;
	b=GWn5oNV1N4dxtP9tbVvTp2ZTslT/qq/Qqbyqurg76Ca6bxskA1zc39gQJZGbLp1MeN
	P22QkMaHHcyo3PC7DzPxqlqPBdyFXcgNU8xuKSSoxZkcvDYShfy47V7TvSWwMfIImJya
	GFrFJStQSh9a8EH1A8VHWhMsEY46pbXbcgq4fdjg59J7iY03rgu1GZZKSjbKfca3GEmF
	WsihMYbAF7tTcfQo2d47iHB4daQcufA9r+FFYyuLG7uhPEXvKM+Sif1iOQ15X4Lip/Nt
	aaPxC26oSt/LLpyEdiodHiFiDngsXM8Cvm/K3xOJBtRLIXHDPCp1WqVtrCCd3Q+a+xrZ
	8+tw==
X-Gm-Message-State: AODbwcBnGjSCI+n27hpT8kniG4xuVuiVv48eUKLCzbWXqN5iVdAZP8Pw
	CV90ucFmqOpJ3o+I
X-Received: by 10.28.66.23 with SMTP id p23mr3022140wma.38.1495831047732;
	Fri, 26 May 2017 13:37:27 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	y16sm2670128wry.46.2017.05.26.13.37.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 13:37:26 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 22:35:37 +0200
Message-Id: <20170526203537.30721-1-max.krummenacher@toradex.com>
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
X-List-Received-Date: Fri, 26 May 2017 20:37:28 -0000

With rpm v4 in openembedded but on a host with existing /usr/include/rpm/db.h
the native build fails to compile.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...01-don-t-pick-up-bundled-db-from-host-rpm.patch | 43 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.27.bb    |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch b/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch
new file mode 100644
index 0000000..41656fa
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch
@@ -0,0 +1,43 @@
+From d5ff23ec64bc8b79d5335a2e0cd4b481b63fd95f Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Sun, 7 May 2017 20:28:11 +0100
+Subject: [PATCH] don't pick up bundled db from host rpm
+
+For libsolv-native with rpm v4 in openembedded but on a host with
+existing /usr/include/rpm/db.h the build is configured to have
+HAVE_RPM_DB_H because of the existing header file from the host,
+but linking against the librpm.so in recipe-sysroot-native fails.
+
+Skip the check for rpm/db.h and assume that rpm is provided without
+a bundled berkley db.
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
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bcdeee6..1ca7b41 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -220,8 +220,7 @@ IF (ENABLE_RPMDB)
+     ENDIF (RPMMISC_LIBRARY)
+   ENDIF (RPM5)
+ 
+-  # check if rpm contains a bundled berkeley db
+-  CHECK_INCLUDE_FILE(rpm/db.h HAVE_RPM_DB_H)
++  set(HAVE_RPM_DB_H 0)
+   IF (NOT HAVE_RPM_DB_H)
+     FIND_LIBRARY (DB_LIBRARY NAMES db)
+     IF (DB_LIBRARY)
+-- 
+2.9.3
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.27.bb b/meta/recipes-extended/libsolv/libsolv_0.6.27.bb
index 7ddd533..0f988dc 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.27.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.27.bb
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


