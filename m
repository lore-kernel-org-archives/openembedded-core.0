Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 519 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Feb 2018 13:54:19 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8B35C700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 13:54:19 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w17Djep8029813
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Feb 2018 14:45:41 +0100
Received: from dev.sbt.siemens.com (sk1d124c.siemens.sk [163.242.57.217])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w17DjeWG003787;
	Wed, 7 Feb 2018 14:45:40 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 57685CDBD8;
	Wed,  7 Feb 2018 14:45:40 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Feb 2018 14:45:28 +0100
Message-Id: <1518011128-6874-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] fix(glibc): fix bug 22627
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
X-List-Received-Date: Wed, 07 Feb 2018 13:54:20 -0000

From: Radovan Scasny <radovan.scasny@siemens.com>

---
 ...030-Bug-22627-do-not-substitute-dst-twice.patch | 56 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-Bug-22627-do-not-substitute-dst-twice.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-Bug-22627-do-not-substitute-dst-twice.patch b/meta/recipes-core/glibc/glibc/0030-Bug-22627-do-not-substitute-dst-twice.patch
new file mode 100644
index 0000000..28855e2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-Bug-22627-do-not-substitute-dst-twice.patch
@@ -0,0 +1,56 @@
+glibc: Fix Bug-22627
+
+[No upstream tracking] -- https://sourceware.org/bugzilla/show_bug.cgi?id=22627
+
+elf: Check for empty tokens before dynamic string token expansion
+
+The fillin_rpath function in elf/dl-load.c loops over each RPATH or
+RUNPATH tokens and interprets empty tokens as the current directory
+("./"). In practice the check for empty token is done *after* the
+dynamic string token expansion. The expansion process can return an
+empty string for the $ORIGIN token if __libc_enable_secure is set
+or if the path of the binary can not be determined (/proc not mounted).
+
+Fix that by moving the check for empty tokens before the dynamic string
+token expansion. In addition, check for NULL pointer or empty strings
+return by expand_dynamic_string_token.
+
+The above changes highlighted a bug in decompose_rpath, an empty array
+is represented by the first element being NULL at the fillin_rpath
+level, but by using a -1 pointer in decompose_rpath and other functions.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=bb195224acc14724e9fc2dbaa8d0b20b72ace79b]
+Bug: 22627
+Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
+
+diff --git a/glibc/elf/dl-load.c b/glibc/elf/dl-load.c
+index 70c259b..c29257c 100644
+--- a/glibc/elf/dl-load.c
++++ b/glibc/elf/dl-load.c
+@@ -778,25 +778,7 @@ _dl_init_paths (const char *llp)
+     {
+       size_t nllp;
+       const char *cp = llp;
+-      char *llp_tmp;
+-
+-#ifdef SHARED
+-      /* Expand DSTs.  */
+-      size_t cnt = DL_DST_COUNT (llp, 1);
+-      if (__glibc_likely (cnt == 0))
+-	llp_tmp = strdupa (llp);
+-      else
+-	{
+-	  /* Determine the length of the substituted string.  */
+-	  size_t total = DL_DST_REQUIRED (l, llp, strlen (llp), cnt);
+-
+-	  /* Allocate the necessary memory.  */
+-	  llp_tmp = (char *) alloca (total + 1);
+-	  llp_tmp = _dl_dst_substitute (l, llp, llp_tmp, 1);
+-	}
+-#else
+-      llp_tmp = strdupa (llp);
+-#endif
++      char *llp_tmp = strdupa (llp);
+ 
+       /* Decompose the LD_LIBRARY_PATH contents.  First determine how many
+ 	 elements it has.  */
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 7eb56b3..e5c171c 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
            file://0029-malloc-add-missing-arena-lock-in-malloc-info.patch \
+           file://0030-Bug-22627-do-not-substitute-dst-twice.patch \
            file://CVE-2017-15671.patch \
            file://CVE-2017-16997.patch \
            file://CVE-2017-17426.patch \
-- 
2.1.4


