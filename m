Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 66B1677D88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 20:17:36 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v42so3436847wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dbEt9c1F8jNQ/UzwKrO1AXHxHG3b5WRedssfcatHI/k=;
	b=FcAXfkDd2aU7GdaBF02A5Gi541hyct6PXTJ3/p+st9/+qPW1KtIJbomjehx7BhVWR6
	7UFmQKUcfGFI6LHjZiQKN5C2wEfmcLnSgDEtjFklBo+v466pCzQgS/1rIsodi8DyPx4+
	0Ma/eNuAUrx7aXQhq2fDal7da0F441OY0nntMU3ujIgCFOtuJb2gX3D6XtTBF5gTYm43
	a7K36cwKnQTBPFofAfqHYOrOXtWHvWWJs+ZETMfwU1L9f4HIkxjTJLT4Xi1c9uVh0gy5
	lmKUr5NiWto5b/U+K6CEXyM4Obvxt9kjUzrb1kKUoc/E8aW7yLeDh819kIuUC5DI35F3
	moRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dbEt9c1F8jNQ/UzwKrO1AXHxHG3b5WRedssfcatHI/k=;
	b=MD1J4EaTtH8+5skDKrzjrvDVvrWkYNYwj7klPPwxW5/+YzPbrjiSe87wsvoxm6CZ5J
	5i6YUWaZwEXwFnh0a9NCraWxqoBnATZURYmeexoX8envclxf4LXh165ZvrUtWJgidoV/
	/pbKteBtriJS5ub76H/IefjH1AAiib9Kl9bT9SmD/9o35wQAA9/Ch/d6G6vVREH0P4x3
	fUAr2o6MBChzik8XmUPHS4YOyx99nNpePPgGLlkKuDY14QPnjspSMyjcT/NN+IMfMF6/
	TrwHuOlj6aHb2Wm75y2MEE4t2bZb6FZKSujMiXtdYtA+yR+1mtf9NQ9EAP4tBYO/e0/n
	5/KQ==
X-Gm-Message-State: AODbwcCv0QNf3Y8UTBiY4RfFQUL1M7OprpoWqpTBSCtv6SpVC4DU5937
	OnSctwCN4P2xUw==
X-Received: by 10.223.163.12 with SMTP id c12mr306667wrb.56.1495052257965;
	Wed, 17 May 2017 13:17:37 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	137sm3973807wmi.19.2017.05.17.13.17.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 13:17:37 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 22:16:52 +0200
Message-Id: <20170517201652.27476-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.9.3
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Wed, 17 May 2017 20:17:38 -0000

With rpm v4 in openembedded but on a host with existing /usr/include/rpm/db.h
the build fails to compile.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...01-don-t-pick-up-bundled-db-from-host-rpm.patch | 38 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_0.6.26.bb    |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch b/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch
new file mode 100644
index 0000000..e0eb36e
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-don-t-pick-up-bundled-db-from-host-rpm.patch
@@ -0,0 +1,38 @@
+From 7bd5f609ce63876e2d52dea26cd40cbd2cfb4532 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Sat, 7 May 2017 20:28:11 +0100
+Subject: [PATCH] don't pick up bundled db from host rpm
+
+With rpm v4 in openembedded but on a host with existing /usr/include/rpm/db.h
+the build is configured to have HAVE_RPM_DB_H but fails to compile.
+
+Fixes the following link errors:
+| ../ext/libsolvext.so.0: undefined reference to `db_create_rpmdb'
+| ../ext/libsolvext.so.0: undefined reference to `db_env_create_rpmdb'
+
+Observed on a openSUSE Leap 42.1 build host with rpm-devel installed.
+
+Upstream-Status: Inappropriate [cross build specific]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 838f9d0..b64bcd9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -205,8 +205,7 @@ IF (ENABLE_RPMDB)
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
+2.6.6
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


