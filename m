Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9C9786B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 03:27:32 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t12so3737679pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 19:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BnkiC3ww1ECrLLLYY83d3CzFfK0uz+JiB+ssjfL6iI8=;
	b=Z2SOqS1XZcTv2+qlZp7M/cIxV5m6FnYKYHt5d3gD4XQArQ3YndC6CcN2NKDgZ0hmIe
	7JnSL5cPhDwhKljtDaLQRQ9Jcad1PKeBxGdO5x8TZ+pB79vJUuw9VcvgoVBn/5KoTpQd
	hppyjeFR0kCCd23cthofQHrfouD7TbEaGCWh51xuNpnWm2elAOYbiwacb9jKBt4zbd90
	owYe87d1ks1teW5BnM9pWrKZlU/RfKmhk8C1N2d7hf7ePV7FIR36+CZWxMyYBYxC0UE6
	1Q3bUnQMt4lQMtFpjrIG30AJkQNXQ1+pESlGpSPOyMhdSXuis4PrM6oZqZ6GhsL/qjCX
	CSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BnkiC3ww1ECrLLLYY83d3CzFfK0uz+JiB+ssjfL6iI8=;
	b=LuG74+HsEwL4s7VGEzVeICPxYI/H4uzE+x4Tp7Jpx5h77e4PxHXyUZqItg01nn5Opq
	KtHKxecHHU8lXfC8ST4AaK0GNjmYP8pLllXGTG8bBRHWMsI/tHalaO6hLwQaSWYzb57s
	ZRe/zWhov8nTv6AVlDW8oJi0DOv/7ojYp9nxMLSovwYLx1zX0l9fyvhT+OjA555BlnI/
	rAwppeH+EEupimZb1CIDy5R0QHoJXgIjibslTqiYJZuDBc64Vd//E5K+xeQKKQOzM4zj
	Ne2j0gXm8az4N2um6V7GZhg/q/uCY/3zeex+VgKQ3KNvlH/mfB7YbswnFvXyVeox2izc
	Aypw==
X-Gm-Message-State: AKwxytcHYcIP7c9c7gLvGVRtNsxyHtrJ+VzFr+AI/6jpknb0KgDB7szN
	PjQ0VtVNfOMweiRbz407bKAHuA==
X-Google-Smtp-Source: AH8x2274jDCUYCoUyr6TNGlASxmAA9ZPb8NZdaF2DB2JU4gqxgRlEBAYQIEcuOwaCtjW7SnmDc6/sQ==
X-Received: by 2002:a17:902:2845:: with SMTP id
	e63-v6mr19926537plb.438.1517196453315; 
	Sun, 28 Jan 2018 19:27:33 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	y5sm29184689pfd.163.2018.01.28.19.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 19:27:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 19:27:16 -0800
Message-Id: <2d45d8cdf8c9455e022a64322a242a9042a4e276.1517196242.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517196242.git.raj.khem@gmail.com>
References: <cover.1517196242.git.raj.khem@gmail.com>
Subject: [PATCH 5/8] systemd: Fix build with glibc 2.27
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
X-List-Received-Date: Mon, 29 Jan 2018 03:27:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ....c-Change-the-default-device-timeout-to-2.patch |  7 +++---
 ...update-header-file-to-detect-memfd_create.patch | 28 ++++++++++++++++++++++
 ...c-Check-if-memfd_create-is-already-define.patch | 27 +++++++++++++++++++++
 .../systemd/0003-fileio-include-sys-mman.h.patch   | 26 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |  3 +++
 5 files changed, 87 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
index 7f1bc447fe..b7b1ea0886 100644
--- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
+++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
@@ -1,8 +1,7 @@
-From f1b5a6f717bda6f80a6b5e3e4d50b450f6cc7b09 Mon Sep 17 00:00:00 2001
+From 9820c165a9e559cf851e3beb60fad2571de4ded2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 14 Dec 2015 04:09:19 +0000
-Subject: [PATCH 14/14] core/device.c: Change the default device timeout to 240
- sec.
+Subject: [PATCH] core/device.c: Change the default device timeout to 240 sec.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -30,5 +29,5 @@ index 77601c552..98bf49ba2 100644
          u->ignore_on_isolate = true;
  }
 -- 
-2.13.2
+2.16.1
 
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch b/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
new file mode 100644
index 0000000000..c6431209d0
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-update-header-file-to-detect-memfd_create.patch
@@ -0,0 +1,28 @@
+From 2207e1ffe4f7e2dcc5e745dadb48738aa1048d63 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 26 Nov 2017 02:17:06 +0900
+Subject: [PATCH 1/3] meson: update header file to detect memfd_create()
+
+---
+Upstream-Status: Backport
+
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 20b27c860..550dd4ad8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -414,7 +414,8 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+ endforeach
+ 
+ foreach ident : [
+-        ['memfd_create',      '''#include <sys/memfd.h>'''],
++        ['memfd_create',      '''#define _GNU_SOURCE
++                                 #include <sys/mman.h>'''],
+         ['gettid',            '''#include <sys/types.h>'''],
+         ['pivot_root',        '''#include <stdlib.h>'''],     # no known header declares pivot_root
+         ['name_to_handle_at', '''#define _GNU_SOURCE
+-- 
+2.16.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch b/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
new file mode 100644
index 0000000000..da798a79a3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
@@ -0,0 +1,27 @@
+From 025408c87869962f511de044dd41a1f4b1d80165 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jan 2018 11:53:38 -0800
+Subject: [PATCH 2/3] configure.ac: Check if memfd_create is already defined
+
+Upstream-Status: Inappropriate [upstream systemd uses meson]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 3674190fb..c7a184d72 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -340,6 +340,7 @@ AC_CHECK_DECLS([
+         [], [], [[
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <sys/mman.h>
+ #include <sys/mount.h>
+ #include <fcntl.h>
+ #include <sched.h>
+-- 
+2.16.1
+
diff --git a/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch b/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
new file mode 100644
index 0000000000..c466d0d87b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0003-fileio-include-sys-mman.h.patch
@@ -0,0 +1,26 @@
+From 52e922343faaa87b9efb8aa9ea578399ccc9bec9 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 26 Nov 2017 02:40:23 +0900
+Subject: [PATCH 3/3] fileio: include sys/mman.h
+
+---
+Upstream-Status: Backport
+
+ src/basic/fileio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/basic/fileio.c b/src/basic/fileio.c
+index 9a185e3e6..1015afd29 100644
+--- a/src/basic/fileio.c
++++ b/src/basic/fileio.c
+@@ -24,6 +24,7 @@
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/mman.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+-- 
+2.16.1
+
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 4132cdf40f..d12e94f463 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -48,6 +48,9 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0001-Use-uintmax_t-for-handling-rlim_t.patch \
            file://0001-core-evaluate-presets-after-generators-have-run-6526.patch \
            file://0001-main-skip-many-initialization-steps-when-running-in-.patch \
+           file://0001-meson-update-header-file-to-detect-memfd_create.patch \
+           file://0002-configure.ac-Check-if-memfd_create-is-already-define.patch \
+           file://0003-fileio-include-sys-mman.h.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.16.1


