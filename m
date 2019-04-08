Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BAC46D230
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 06:40:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x386ebud023128
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Apr 2019 23:40:37 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 7 Apr 2019 23:40:36 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>
Date: Mon, 8 Apr 2019 14:40:34 +0800
Message-ID: <1554705634-56387-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Mon, 08 Apr 2019 06:40:39 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

When DEBUG_BUILD = "1" added in local.conf, there
comes below build error when "bitbake gcc-sanitizers":
| ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
| ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|   return S_ISLNK (st.st_mode);

Initialize struct stat to fix the above issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc              |  1 +
 .../0041-elf.c-initialize-struct-stat.patch        | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-struct-stat.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index f7bf257..317c6af 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
            file://0038-Re-introduce-spe-commandline-options.patch \
            file://0039-riscv-Disable-multilib-for-OE.patch \
            file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
+           file://0041-elf.c-initialize-struct-stat.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-struct-stat.patch b/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-struct-stat.patch
new file mode 100644
index 0000000..56d62c9
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-struct-stat.patch
@@ -0,0 +1,34 @@
+From eae259e4722a1c4606a1e6df7ee84a311a91f4a6 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Mon, 8 Apr 2019 14:19:31 +0800
+Subject: [PATCH] elf.c: initialize struct stat
+
+Initialize struct stat to fix the below
+build failure when -Og included in compiler flag.
+| ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
+| ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+   return S_ISLNK (st.st_mode);
+
+Upstream-Status: Submitted[https://gcc.gnu.org/ml/gcc-patches/2019-04/msg00261.html]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ libbacktrace/elf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libbacktrace/elf.c b/libbacktrace/elf.c
+index f4863f0..8c57047 100644
+--- a/libbacktrace/elf.c
++++ b/libbacktrace/elf.c
+@@ -765,7 +765,7 @@ elf_syminfo (struct backtrace_state *state, uintptr_t addr,
+ static int
+ elf_is_symlink (const char *filename)
+ {
+-  struct stat st;
++  struct stat st = {0};
+ 
+   if (lstat (filename, &st) < 0)
+     return 0;
+-- 
+2.7.4
+
-- 
2.7.4


