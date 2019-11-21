Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 241987F9E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:58:02 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id i11so4193568iol.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EidsidDJRU9oN/rt5nzIAsZxaXBTjKWyCy9HiGHYEPs=;
	b=iyOECEa3sNYvQ88FvJK5vEKPQ9XnvZjZLwpfKiYpWo6X8SpgU6GjA6gbjutiNZNMqg
	Grnf4mkuvaB3JV688NgJJWoviBsSEW4OQwHIdftzujg2zdd1DTckKEXe39hpuXzJyvik
	HtRCOqVKKrFuSnFGdRAbSDgeV8LweoBSh+JGVKohZQ0GBDdA3XdrsmSpnYe7ujrDAVAZ
	3Qy47x2c82cYBQMsLYwTkyno8G6weR/8Oi5feGun9lXTWITNcoigcDNRJ7eBjcpYYFEA
	d/r1yf2q5C8TcaIVIOohfgGjIS1gJdL2b1SOVCz2oeep5GfsUzo4aSuSaIrUpdsvqde/
	A8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EidsidDJRU9oN/rt5nzIAsZxaXBTjKWyCy9HiGHYEPs=;
	b=pDdLBtvNdGPwPoGX7STr84JtVJdBvWPwKecA5/pt2TPn5Jmg1iyZSKWdBtqrTAQzvc
	s4kvECyQrqcijjN96qb2sfncvIC8EK1D2fU0map+XTkfwGUs4WMFayYhRe+DJKrBtNAd
	0Qrm16igpbwTn7arZ4ooFp434GjwLshzTtj2SPSGD2kaMRnUVYpCVi49lqlCHmTSDuOo
	b6jqlWhIdj2tdQYKUnWCDCi+2nbbofQRcnX9c+YMfXRWVNqTXrQC7x/U/Ui5RO3sB2ZH
	t9AkbG0jcpy8LfDL//cgFWu7uI4PvTpYft/gTvyu+QbtviGAhv6NsVsPGLyvGT9fnw9O
	AvFg==
X-Gm-Message-State: APjAAAVZs9Zf8NLlLgL1ia/Gyfeo5gO/f0lMZgmTHyQmqr1BtdKo3Ws8
	CVqZ3SENSyoaf8XglAUGmi0/lT0n4GQ=
X-Google-Smtp-Source: APXvYqx0tTQN2de/PjmsRTrcm5NmBN5rHh+m8ZvobBL4ZRf/pLxxSCut1P9woda72oC+tzaUPm5T3g==
X-Received: by 2002:a02:58c8:: with SMTP id f191mr9277893jab.94.1574355482981; 
	Thu, 21 Nov 2019 08:58:02 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id x9sm1372479ilp.43.2019.11.21.08.58.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:58:02 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:58:00 -0600
Message-Id: <20191121165800.1220005-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] gobject-introspection: Fix reproducibility
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
X-List-Received-Date: Thu, 21 Nov 2019 16:58:03 -0000
Content-Transfer-Encoding: 8bit

Adds a patch to remove build paths from gobject-introspection

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../0001-Fix-build-reproducibility.patch      | 50 +++++++++++++++++++
 .../gobject-introspection_1.62.0.bb           |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch
new file mode 100644
index 00000000000..743693e9dff
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Fix-build-reproducibility.patch
@@ -0,0 +1,50 @@
+From 59d2cbb54c012b25adeb965a94b6585d911a4539 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Wed, 20 Nov 2019 09:03:47 -0600
+Subject: [PATCH] Fix build reproducibility
+
+ba744068 ("Make meson.override_find_program working on more complex use
+cases") made the build no longer reproducible by encoding a build system
+path into the output. This shouldn't be necessary anyway, since it
+should be possible to add new paths to search for gir files by setting
+the XDG_DATA_DIR environment variable.
+
+Closes #318
+
+Upstream-Status: Pending [https://gitlab.gnome.org/GNOME/gobject-introspection/merge_requests/192]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ girepository/girparser.c | 4 ----
+ meson.build              | 1 -
+ 2 files changed, 5 deletions(-)
+
+diff --git a/girepository/girparser.c b/girepository/girparser.c
+index fb47e75c..53450baf 100644
+--- a/girepository/girparser.c
++++ b/girepository/girparser.c
+@@ -309,10 +309,6 @@ locate_gir (GIrParser  *parser,
+   if (g_file_test (path, G_FILE_TEST_EXISTS | G_FILE_TEST_IS_REGULAR))
+     return path;
+   g_free (path);
+-  path = g_build_filename (UNINSTALLED_GIR_DIR, girname, NULL);
+-  if (g_file_test (path, G_FILE_TEST_EXISTS | G_FILE_TEST_IS_REGULAR))
+-    return path;
+-  g_free (path);
+   return NULL;
+ }
+ 
+diff --git a/meson.build b/meson.build
+index d6231c5f..2f248579 100644
+--- a/meson.build
++++ b/meson.build
+@@ -90,7 +90,6 @@ endif
+ girdir = join_paths(gir_dir_prefix, 'gir-1.0')
+ config.set_quoted('GIR_DIR', girdir)
+ config.set_quoted('GOBJECT_INTROSPECTION_LIBDIR', join_paths(get_option('prefix'), get_option('libdir')))
+-config.set_quoted('UNINSTALLED_GIR_DIR', join_paths(meson.current_build_dir(), 'gir'))
+ 
+ foreach type : ['char', 'short', 'int', 'long']
+   size = cc.sizeof(type)
+-- 
+2.23.0
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
index a9739cc552b..b1371776af4 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.62.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
            file://0001-Port-cross-compilation-support-to-meson.patch \
            file://0001-meson.build-disable-tests-when-cross-compiling.patch \
+           file://0001-Fix-build-reproducibility.patch \
            "
 
 SRC_URI[md5sum] = "37278eab3704e42234b6080b8cf241f1"
-- 
2.23.0


