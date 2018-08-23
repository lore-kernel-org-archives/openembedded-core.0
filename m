Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19F4079513
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:00:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7N80lF0000937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:00:48 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:00:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:20 +0800
Message-ID: <9194951274a6dfb8cee8bbbe3a7f8a7de49beef3.1535011774.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535011774.git.liezhi.yang@windriver.com>
References: <cover.1535011774.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] strace: 4.23 -> 4.24
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
X-List-Received-Date: Thu, 23 Aug 2018 08:00:47 -0000
Content-Type: text/plain

Remove backported patch 0001-tests-fix-build-with-fresh-glibc.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-tests-fix-build-with-fresh-glibc.patch    | 42 ----------------------
 .../strace/{strace_4.23.bb => strace_4.24.bb}      |  5 ++-
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
 rename meta/recipes-devtools/strace/{strace_4.23.bb => strace_4.24.bb} (90%)

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
deleted file mode 100644
index ce6e567..0000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bba1b0085f2a2c83839647fee48628ee054aceb7 Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Sun, 15 Jul 2018 22:14:29 +0000
-Subject: [PATCH] tests: fix build with fresh glibc
-
-Workaround additional incompatibility between <sys/stat.h> and
-<asm/stat.h> introduced by glibc-2.27.9000-566-gfd70af4.
-
-* tests/xstatx.c (statx, statx_timestamp): Redefine before the inclusion
-of <sys/stat.h> to avoid conflicts between definitions provided by the
-linux kernel headers and the GNU libc.
-
-Upstream-Status: Backport [https://gitlab.com/strace/strace/commit/3dbffb7]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-
- tests/xstatx.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/tests/xstatx.c b/tests/xstatx.c
-index 7fb9326..441f4a8 100644
---- a/tests/xstatx.c
-+++ b/tests/xstatx.c
-@@ -64,10 +64,14 @@ typedef off_t libc_off_t;
- 
- # define stat libc_stat
- # define stat64 libc_stat64
-+# define statx libc_statx
-+# define statx_timestamp libc_statx_timestamp
- # include <fcntl.h>
- # include <sys/stat.h>
--# undef stat
-+# undef statx_timestamp
-+# undef statx
- # undef stat64
-+# undef stat
- 
- # undef st_atime
- # undef st_mtime
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/strace/strace_4.23.bb b/meta/recipes-devtools/strace/strace_4.24.bb
similarity index 90%
rename from meta/recipes-devtools/strace/strace_4.23.bb
rename to meta/recipes-devtools/strace/strace_4.24.bb
index d30d440..e6f7e9c 100644
--- a/meta/recipes-devtools/strace/strace_4.23.bb
+++ b/meta/recipes-devtools/strace/strace_4.24.bb
@@ -14,10 +14,9 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
-           file://0001-tests-fix-build-with-fresh-glibc.patch \
            "
-SRC_URI[md5sum] = "fad4bba0947553cef34d46a9fd78f039"
-SRC_URI[sha256sum] = "7860a6965f1dd832747bd8281a04738274398d32c56e9fbd0a68b1bb9ec09aad"
+SRC_URI[md5sum] = "8780136849c85acf76ad3a522aa4462a"
+SRC_URI[sha256sum] = "1f4e59fc1edfa2bfb4adf2a748623dc25b105ec79713dd84404199f91b0b0634"
 
 inherit autotools ptest bluetooth
 
-- 
2.7.4


