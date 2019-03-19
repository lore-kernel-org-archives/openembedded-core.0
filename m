Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5D96BA11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 08:44:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2J8ifRG029330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Mar 2019 01:44:42 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 19 Mar 2019 01:44:41 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 19 Mar 2019 16:44:40 +0800
Message-ID: <1552985080-65398-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Tue, 19 Mar 2019 08:44:43 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

When DEBUG_BUILD = "1" added in local.conf, there
comes below build error when "bitbake gcc-sanitizers":
| ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
| ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|   return S_ISLNK (st.st_mode);

Initialize st_mode member to fix the above issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc              |  1 +
 .../0041-elf.c-initialize-st_mode-member.patch     | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index f7bf257..3501325 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
            file://0038-Re-introduce-spe-commandline-options.patch \
            file://0039-riscv-Disable-multilib-for-OE.patch \
            file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
+           file://0041-elf.c-initialize-st_mode-member.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch b/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch
new file mode 100644
index 0000000..8e80c4e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0041-elf.c-initialize-st_mode-member.patch
@@ -0,0 +1,33 @@
+From 960f3e1f104192ceb80a97e665fadffda5285aab Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Tue, 19 Mar 2019 16:23:04 +0800
+Subject: [PATCH] elf.c: initialize st_mode member
+
+Initialize st_mode member to fix the below
+build failure when -Og included in compiler flag.
+| ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
+| ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+   return S_ISLNK (st.st_mode);
+
+Upstream-Status: Submitted[https://gcc.gnu.org/ml/gcc-patches/2019-03/msg00900.html]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ libbacktrace/elf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libbacktrace/elf.c b/libbacktrace/elf.c
+index f4863f0..561bdc2 100644
+--- a/libbacktrace/elf.c
++++ b/libbacktrace/elf.c
+@@ -766,6 +766,7 @@ static int
+ elf_is_symlink (const char *filename)
+ {
+   struct stat st;
++  st.st_mode = 0;
+ 
+   if (lstat (filename, &st) < 0)
+     return 0;
+-- 
+2.7.4
+
-- 
2.7.4


