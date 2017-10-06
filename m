Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFB6780BD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:51:04 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id v13so9123444pgq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y8887ziTVaKR88syUL8rTzaUUR/1MNgAfEolbvVNL0A=;
	b=RxUYSB9EMvuEH3sRsrSfRn5kYXHalkn6fT/zY6T/mX+iUUgpzzim1hBb9/KgwFz7t9
	1JTXPZbjfYFzhb9W0C1qn2gdGVWwK2mQHr8MmWaAELBL6trXCMTJ4YbbGPRYJGISoG/Z
	ZNR/TWfP6vQQeUmK5fGnEYZS9f+XO7Cm53JfYdT0Rxi1pThQwPvZrh1Iz441Nepv3Rw6
	IrorB/GnV2BQ9+dvr7lWLnrt/0aYjXf0q5F6556nOqszCXfpluu6QogdoohExkjPZjmz
	3oC9GvDLa6pVOHu12r89dViWtokQhDZrHj6JyuOPbI6e03H6vNSw1UTTY1vYTm02ObmL
	wouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y8887ziTVaKR88syUL8rTzaUUR/1MNgAfEolbvVNL0A=;
	b=BiTEJstUfN3xPqD1eAk9sOcD/nDiHzkmAZhJOq9Mi9fOIBnZoLKBDRLhVXE6Na+5MC
	keij0LrtdfM8wOXjiRu6Xq9EbI6J4TOA0GNzq481zVIGfhCoAP7AyJ+jGZ2AACaZtc8X
	eFl+aiyY8qNookAvqpNVGZDvaYfTIjZLccX9m4juzzYBAuUHKpcf3dOxHn19zRb3A9op
	6TvHAfhz5SQqJB06gN5npebXETqHaagVvr5SO/CI/rwZmddmxRbXKC65H8sJdUewjVrj
	Xa7k/CpCYmybuTrizg7EFW0s5J9HWsIPpaz1oxtg05RnG+H/v7rFPVQfUvlsvEbihS8z
	xWYw==
X-Gm-Message-State: AMCzsaXj1TAQ48U5pQ2w4HsYJmS3QL7SYZay6zlll8lpblP9k36zxe0S
	9YY30xjHz969HbWqx7pXiHIWsg==
X-Google-Smtp-Source: AOwi7QCppX0q5grt/TZIxjOMPw7E5nZOzzBvDZNLup9XF+KITE1/zu6VtbU+SOqAJApSqaUHnbbnuw==
X-Received: by 10.84.235.76 with SMTP id g12mr408161plt.338.1507251066361;
	Thu, 05 Oct 2017 17:51:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.51.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:51:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:48 -0700
Message-Id: <05a4310d120918678aa3de7654ed21f2433f7e63.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 09/10] elfutils: Fix missing library on linker cmdline
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
X-List-Received-Date: Fri, 06 Oct 2017 00:51:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.170.bb   |  1 +
 ...0001-libasm-may-link-with-libbz2-if-found.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.170.bb b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
index 8a339e48c9..3b81e287b0 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.170.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.170.bb
@@ -17,6 +17,7 @@ SRC_URI += "\
         file://0005-fix-a-stack-usage-warning.patch \
         file://0006-Fix-build-on-aarch64-musl.patch \
         file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
+        file://0001-libasm-may-link-with-libbz2-if-found.patch \
 "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
new file mode 100644
index 0000000000..fb0b060b4b
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -0,0 +1,39 @@
+From 7672e363468271b4c63ff58770c5aac15ab8f722 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Oct 2017 22:30:46 -0700
+Subject: [PATCH] libasm may link with libbz2 if found
+
+This can fail to link binaries like objdump
+where indirect libraries may be not found by linker
+
+| /mnt/a/oe/build/tmp/work/riscv64-bec-linux/elfutils/0.170-r0/recipe-sysroot/usr/lib/libbz2.so.1: error adding symbols: DSO missing from command line
+| collect2: error: ld returned 1 exit status
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e03bc32..9b7e853 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -39,11 +39,11 @@ EXTRA_DIST += make-debug-archive.in
+ CLEANFILES += make-debug-archive
+ 
+ if BUILD_STATIC
+-libasm = ../libasm/libasm.a
++libasm = ../libasm/libasm.a $(zip_LIBS)
+ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.a -lz
+ else
+-libasm = ../libasm/libasm.so
++libasm = ../libasm/libasm.so $(zip_LIBS)
+ libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ endif
+-- 
+2.14.2
+
-- 
2.14.2


