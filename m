Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC1978AD2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 19:55:39 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id f6-v6so4718079plo.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 12:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x3fEsMrREJqqevQ3ZDx+9MKfk76vE9aiq/kQJ2HmClM=;
	b=Oo4NW0mDi2bRUsWqORKbWSxNILo5i3q8qSFVv2oO3pd1n69Wqq+jbTX53zbUXuelSu
	/LKAxReNjL+kgiFZpDHGZ+tmH+09kUJvblPt68twFkMr3ON54a78L+zb2zZsZWETKbX5
	K/Tufta1nrdiBA2babdVvoX76xkPtfpeajMJoqLZmTh1Vq03eSErxF26TZLteDl9f94H
	SQzbQZfx/aVh8rKbPXvT1+Jk3SutVyTlFACTep39kzJxvFWzlznCfXU/1SnyiUUg8APk
	xBHrroZLHuoDEUY2lVxfzDzrrEeoqavUWXJZy29+hg6o518HXcy4Ud8+pZJIS/bOfgfF
	N6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x3fEsMrREJqqevQ3ZDx+9MKfk76vE9aiq/kQJ2HmClM=;
	b=qVXWmR3BtQyE1M4HB53PvoS86vuhI8TzqoT5DqQinYIOekPVBAhJi6gth74SMqPmXd
	T/MuuVrgROvLEZdeZZ6YEmB+rd+NYYUkxnEdxQeOXeW52LXFpJoW8tCtxwWnvjqnh+PO
	rcWU9BGEDVYouV2B0ehA7eGFcs4XbLIzUIBWXuMnAy2yFnTjPQ7jbnn8ApagNXGArfkd
	0HX+/n/Qok3iOR0MYOMbx7ogYF57Bpa4qsQs1IvGfZA083KPt+H+r/ogpshm6g4qkl4h
	iKnxqh05bmxi+VNkrydlyBrLjDi9yp/9gKIjW7mhEHsDtkXPIOnEjdnCNCUwJwqusUqb
	AIug==
X-Gm-Message-State: AOUpUlG1yhKXtjuWXWdM9knBVBBfyQz9jcQuVlSEywyYkhiZTnGG5HTL
	jPGd+7xdCq3K/eUFZeJM2Bnjp2Wd
X-Google-Smtp-Source: AAOMgpflDYJr6zuIC8Qvre7ya5s1dZN9r2Py7YoymOF9dYKgpyehdodrxCtkYQQkHTPHzFHNJgSZYg==
X-Received: by 2002:a17:902:2702:: with SMTP id
	c2-v6mr11581988plb.248.1533498940028; 
	Sun, 05 Aug 2018 12:55:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	d9-v6sm17553917pfb.86.2018.08.05.12.55.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 12:55:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2018 12:55:31 -0700
Message-Id: <20180805195531.14449-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] strace: Fix build with glibc 2.28
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
X-List-Received-Date: Sun, 05 Aug 2018 19:55:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Backport an upstreamed patch to fix the same instead

 ...001-tests-fix-build-with-fresh-glibc.patch | 41 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.23.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
new file mode 100644
index 0000000000..020380ff31
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
@@ -0,0 +1,41 @@
+From bba1b0085f2a2c83839647fee48628ee054aceb7 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Sun, 15 Jul 2018 22:14:29 +0000
+Subject: [PATCH] tests: fix build with fresh glibc
+
+Workaround additional incompatibility between <sys/stat.h> and
+<asm/stat.h> introduced by glibc-2.27.9000-566-gfd70af4.
+
+* tests/xstatx.c (statx, statx_timestamp): Redefine before the inclusion
+of <sys/stat.h> to avoid conflicts between definitions provided by the
+linux kernel headers and the GNU libc.
+---
+Upstream-Status: Backport [https://gitlab.com/strace/strace/commit/3dbffb7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ tests/xstatx.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/tests/xstatx.c b/tests/xstatx.c
+index 7fb9326..441f4a8 100644
+--- a/tests/xstatx.c
++++ b/tests/xstatx.c
+@@ -64,10 +64,14 @@ typedef off_t libc_off_t;
+ 
+ # define stat libc_stat
+ # define stat64 libc_stat64
++# define statx libc_statx
++# define statx_timestamp libc_statx_timestamp
+ # include <fcntl.h>
+ # include <sys/stat.h>
+-# undef stat
++# undef statx_timestamp
++# undef statx
+ # undef stat64
++# undef stat
+ 
+ # undef st_atime
+ # undef st_mtime
+-- 
+2.18.0
+
diff --git a/meta/recipes-devtools/strace/strace_4.23.bb b/meta/recipes-devtools/strace/strace_4.23.bb
index 0c159fc6f6..d30d440abc 100644
--- a/meta/recipes-devtools/strace/strace_4.23.bb
+++ b/meta/recipes-devtools/strace/strace_4.23.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
+           file://0001-tests-fix-build-with-fresh-glibc.patch \
            "
 SRC_URI[md5sum] = "fad4bba0947553cef34d46a9fd78f039"
 SRC_URI[sha256sum] = "7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad"
-- 
2.18.0


