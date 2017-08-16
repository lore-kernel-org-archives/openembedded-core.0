Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9CB7866D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:31:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7G8VbSO013995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 01:31:37 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 01:31:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 16 Aug 2017 04:31:19 -0400
Message-ID: <fa46e9d7f10c3c84ab339355ed7e1ac15b4dc477.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] libgcrypt: 1.7.8 -> 1.8.0
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
X-List-Received-Date: Wed, 16 Aug 2017 08:31:36 -0000
Content-Type: text/plain

Rebase patches:
- add-pkgconfig-support.patch -> 0001
- libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch -> 0002
- fix-ICE-failure-on-mips-with-option-O-and-g.patch -> 0003
- fix-undefined-reference-to-pthread.patch -> 0004

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...pkg-config-for-libgcrypt-instead-of-conf.patch} | 18 +++++++++-----
 ...x-building-error-with-O2-in-sysroot-path.patch} | 29 ++++++++++++++--------
 ...slope.c-workaround-ICE-failure-on-mips-w.patch} | 24 ++++++++++++------
 ...le.am-fix-undefined-reference-to-pthread.patch} | 11 ++++----
 .../{libgcrypt_1.7.8.bb => libgcrypt_1.8.0.bb}     | 12 ++++-----
 5 files changed, 59 insertions(+), 35 deletions(-)
 rename meta/recipes-support/libgcrypt/files/{add-pkgconfig-support.patch => 0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch} (94%)
 rename meta/recipes-support/libgcrypt/files/{libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch => 0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch} (55%)
 rename meta/recipes-support/libgcrypt/files/{fix-ICE-failure-on-mips-with-option-O-and-g.patch => 0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch} (73%)
 rename meta/recipes-support/libgcrypt/files/{fix-undefined-reference-to-pthread.patch => 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch} (70%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.7.8.bb => libgcrypt_1.8.0.bb} (75%)

diff --git a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch b/meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
similarity index 94%
rename from meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
rename to meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
index 69589f5..d41c3de 100644
--- a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
@@ -1,10 +1,16 @@
-Add and use pkg-config for libgcrypt instead of -config scripts.
+From 72b9e9040d58c15f0302bd8abda28179f04e1c5f Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 16 Aug 2017 10:43:18 +0800
+Subject: [PATCH 1/4] Add and use pkg-config for libgcrypt instead of -config
+ scripts.
 
-Upstream-Status: Denied [upstream have indicated they don't want a pkg-config dependency]
+Upstream-Status: Denied [upstream have indicated they don't want a
+pkg-config dependency]
 
 RP 2014/5/22
 
-Rebase to 1.7.0
+Rebase to 1.8.0
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac        |  1 +
@@ -14,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/libgcrypt.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index f683e21..566e1c8 100644
+index bbe8104..3d2de73 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2314,6 +2314,7 @@ random/Makefile
+@@ -2607,6 +2607,7 @@ random/Makefile
  doc/Makefile
  src/Makefile
  src/gcrypt.h
@@ -173,5 +179,5 @@ index 0000000..2fc8f53
 +Libs.private: -L${libdir} -lgpg-error
 +Cflags: -I${includedir} 
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
similarity index 55%
rename from meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
rename to meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
index a3e5403..d7554f3 100644
--- a/meta/recipes-support/libgcrypt/files/libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
@@ -1,25 +1,34 @@
-Upstream-Status: Pending
+From 97570ef271ea1fb7b5ca903eec88f68407b0ec76 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 16 Aug 2017 10:44:41 +0800
+Subject: [PATCH 2/4] libgcrypt: fix building error with '-O2' in sysroot path
 
-libgcrypt: fix building error with '-O2' in sysroot path
+Upstream-Status: Pending
 
-Characters like '-O2' or '-Ofast' will be replaced by '-O1' when compiling cipher.
-If we are cross compiling libgcrypt and sysroot contains such characters, we would
+Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
+compiling cipher.
+If we are cross compiling libgcrypt and sysroot contains such
+characters, we would
 get compile errors because the sysroot path has been modified.
 
-Fix this by adding blank spaces before and after the original matching pattern in the
+Fix this by adding blank spaces before and after the original matching
+pattern in the
 sed command.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Rebase to 1.8.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- cipher/Makefile.am |    2 +-
+ cipher/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index 76cdc96..9a89792 100644
+index 95c4510..bd52ec7 100644
 --- a/cipher/Makefile.am
 +++ b/cipher/Makefile.am
-@@ -69,7 +69,7 @@ rfc2268.c \
- camellia.c camellia.h camellia-glue.c
+@@ -116,7 +116,7 @@ gost-s-box: gost-s-box.c
+ 
  
  if ENABLE_O_FLAG_MUNGING
 -o_flag_munging = sed -e 's/-O\([2-9s][2-9s]*\)/-O1/' -e 's/-Ofast/-O1/g'
@@ -28,5 +37,5 @@ index 76cdc96..9a89792 100644
  o_flag_munging = cat
  endif
 -- 
-1.7.9.5
+1.8.3.1
 
diff --git a/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch b/meta/recipes-support/libgcrypt/files/0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch
similarity index 73%
rename from meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch
rename to meta/recipes-support/libgcrypt/files/0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch
index 582e62f..105df29 100644
--- a/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch
+++ b/meta/recipes-support/libgcrypt/files/0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch
@@ -1,4 +1,8 @@
-tests/bench-slope.c: workaround ICE failure on mips with '-O -g'
+From 7cc702c7b5a1ccc2b0091f3effa1391b6c3030fd Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Aug 2017 10:46:28 +0800
+Subject: [PATCH 3/4] tests/bench-slope.c: workaround ICE failure on mips with
+ '-O -g'
 
 Hit a ICE and could reduce it to the following minimal example:
 
@@ -24,31 +28,35 @@ END
 2. Only -O1 and -g on mips caused the issue:
 $ mips-poky-linux-gcc -O1 -g -o mipgcc-test mipgcc-test.c
 mipgcc-test.c: In function 'main':
-mipgcc-test.c:18:1: internal compiler error: in dwarf2out_var_location, at dwarf2out.c:20810
+mipgcc-test.c:18:1: internal compiler error: in dwarf2out_var_location,
+at dwarf2out.c:20810
  }
  ^
 Please submit a full bug report,
 with preprocessed source if appropriate.
 See <http://gcc.gnu.org/bugs.html> for instructions
 
-3. The quick workround is trying to enlarge the size of array with larger
+3. The quick workround is trying to enlarge the size of array with
+larger
 than 2.
 
-4. File a bug to GNU, but it could not be reproduced on there environment.
+4. File a bug to GNU, but it could not be reproduced on there
+environment.
 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=60643
 
 Upstream-Status: Inappropriate [oe specific]
 
+Rebase to 1.8.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  tests/bench-slope.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/bench-slope.c b/tests/bench-slope.c
-index bd05064..28c2438 100644
+index 75e6e43..4e70842 100644
 --- a/tests/bench-slope.c
 +++ b/tests/bench-slope.c
-@@ -1197,7 +1197,7 @@ static struct bench_ops hash_ops = {
+@@ -1463,7 +1463,7 @@ static struct bench_ops hash_ops = {
  };
  
  
@@ -57,7 +65,7 @@ index bd05064..28c2438 100644
    {"", &hash_ops},
    {0},
  };
-@@ -1349,7 +1349,7 @@ static struct bench_ops mac_ops = {
+@@ -1629,7 +1629,7 @@ static struct bench_ops mac_ops = {
  };
  
  
@@ -67,5 +75,5 @@ index bd05064..28c2438 100644
    {0},
  };
 -- 
-1.8.1.2
+1.8.3.1
 
diff --git a/meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
similarity index 70%
rename from meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch
rename to meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index e7de8ba..8622df3 100644
--- a/meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,7 +1,8 @@
-From cc0e2b403d33892963513a3ba98e4ae5a05a4d3c Mon Sep 17 00:00:00 2001
+From e20dbdb0b8f0af840ef90b299c4e2277c52ddf87 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 12 Jun 2016 04:44:29 -0400
-Subject: [PATCH] tests/Makefile.am: fix undefined reference to `pthread_create'
+Subject: [PATCH 4/4] tests/Makefile.am: fix undefined reference to
+ `pthread_create'
 
 Add missing '-lpthread' to CFLAGS
 
@@ -13,15 +14,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index d462f30..bef6dd7 100644
+index 1744ea7..04cf425 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -62,4 +62,4 @@ EXTRA_DIST = README rsa-16k.key cavs_tests.sh cavs_driver.pl \
+@@ -64,4 +64,4 @@ EXTRA_DIST = README rsa-16k.key cavs_tests.sh cavs_driver.pl \
  
  LDADD = $(standard_ldadd) $(GPG_ERROR_LIBS)
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS)
 -t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
 +t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
 -- 
-2.8.1
+1.8.3.1
 
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.8.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
similarity index 75%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.7.8.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
index ec8b875..1797d95 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.7.8.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb
@@ -16,13 +16,13 @@ DEPENDS = "libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
-           file://add-pkgconfig-support.patch \
-           file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
-           file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
-           file://fix-undefined-reference-to-pthread.patch \
+           file://0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch \
+           file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
+           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
+           file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
 "
-SRC_URI[md5sum] = "5588b89b75b1353e2454b04c7b8368f3"
-SRC_URI[sha256sum] = "cb076b2efc7ba752f3d4c663c9ee0589a98b1d614fe90878b1facd607a45fd43"
+SRC_URI[md5sum] = "110ce4352f9ea6f560bdc6c5644ae93c"
+SRC_URI[sha256sum] = "f6e470b7f2d3a703e8747f05a8c19d9e10e26ebf2d5f3d71ff75a40f504e12ee"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.8.1


