Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 870D178BB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:33 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id e11-v6so6252441plb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JB8orQ2MiNtPbdXuSOmVd4nnQPZKGoHQ9VbMWICjYMM=;
	b=Bp4YpVnEH0OQgvtTtpm6EMmmuRsYPCwWAFmELFvDemgRJwwjykseo9hsik79k/YKOe
	GUt0w2VBD+EsUu/Pj9oNcjCvETxIQqcF9tVYFiowE+Ku4uTwiYmkMbF6TzzGdm0zbYib
	TNS6AUgCeqk/Gj7sxpYWkiTIl9NKgVreKAHZk8t8bbfOuKz8d4Ol3f+WhlR8K5Olzl8L
	4dJKiTcVuF5aAHiXOnYXjr8hXeKcWrvqdOErJrQG5wpe2dgorUcOd1x2bWQkN1ZFfWC3
	i8a0M5hXR0xNPKqQ2i6pgNNhgGDrnUnspvA88jPYq1JKExiV4kpzdOxdJzziZGdpeApI
	W5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JB8orQ2MiNtPbdXuSOmVd4nnQPZKGoHQ9VbMWICjYMM=;
	b=Rn3nWV6xx0aNU7l9UhYG+ApiBCyBqm7+vQsyOvWnUsVL2mKB/NQAFz1l8YnDgg5NlZ
	1uYJtIcuTIK5cQauc/gZcndWMlN1X9GtIIKrdd0kzIWIFdGTOfV9DEvP6of38LUDSMyF
	GkFCFuiHJA9O1V8SOnWh+PYPTlzmJFGqoYuYzkOaSWFDh+dBtnQ0wblhe7fMTCXR725g
	0XbqEPdxp+Ecas0rihM1V13MMdRCq084ApAhc3R0YaoUEoqdEm38+uO7EsISn5t3ICx9
	TJEzabHjrieurRUofKgCfcx3sEISRz2PbCq/AroFFKGL3khkunCw+RKB70Qy5Js0tWRe
	wwEA==
X-Gm-Message-State: AOUpUlEYe980AihAr936hCKhgTCJ+OCWDqeeZGmNxbhfLnfhXmKRkkK4
	vqrPH5jzJfqJd9N+EWBPmuE2FcTc
X-Google-Smtp-Source: AAOMgpeFODuK8zElfNf0lKO4CQMPOKN+vfyV5v5SmatQXbeK42KKbe90M8YsFE1C5EoD1swH+oi7lg==
X-Received: by 2002:a17:902:8482:: with SMTP id
	c2-v6mr15615936plo.45.1533596254265; 
	Mon, 06 Aug 2018 15:57:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:05 -0700
Message-Id: <b9df34fabd8b908df7767261bdac250a5cf164e5.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 08/18] strace: Fix build with glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-tests-fix-build-with-fresh-glibc.patch | 42 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.23.bb   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
new file mode 100644
index 0000000000..ce6e567da0
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
@@ -0,0 +1,42 @@
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
+
+Upstream-Status: Backport [https://gitlab.com/strace/strace/commit/3dbffb7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
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


