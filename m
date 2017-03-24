Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 665E877AF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:40:52 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id p189so3213922pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=timanUMb4AjsQSPYJeqxsp3/PAsE58kh30oXUH7rOFo=;
	b=DQQ2r6/VSn8m1AHqvMv+DtySpBuFupHUSqvNcLh7IRPZjbbfjYrKwvi3XMKyWGo31S
	vlodTQAUkq/2Z9bZFFEgx0JScJG4O+xWm/0Y3w0a+2kA+fO7RyAqy8C5/pRfPaA5hVcQ
	mHNraI69h/2cvHB5yMND40ePzaI2MF3MOV8riNM5NgPQV6AjOd3jX4+9uRVFWndSpEOM
	3VNHFXzsRFTGL2iUkhfuA/N3dS3GvxkLLK22vayfuA2kQHuj5jMLo8j1hbErfdf1Z29/
	1TIpk0ctxKDrHP8iFGAoIfAGgF44bswHCq2+W3jHL6mhc59M1RpzvLmIQHJZ4ij8On3n
	rvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=timanUMb4AjsQSPYJeqxsp3/PAsE58kh30oXUH7rOFo=;
	b=sBm9sDKOMFtq3pq4i7ADo+2S2ycE4pYE1lZ6cx0SGQ03LnSnTySLAjiA44hCvn9srx
	sQWjnB/RQ5/tL8gBJHH4SSnDwWT8CldzICiFjv4UTBpIUmyDNYoI30sYz62rEOhzdDlB
	Ks0MkfDDIKIyL1k9bBpOk3oTDw3q9OxazyzRVKCTncR6n0q3c2Xw9hppAzS6/otok4Mo
	IHRXdxqs54IjzWYMPLohmK7cjK5jRi/9KgZJ3ViqQ7gBKaarEgUAJ0B4G0dWlLmds3iz
	v3E0QIGGXuaappcVztXKRE2R9ItFWLeJBiN8HmibK1krWZH467LEMt6ieWqskIG8II7y
	VaCQ==
X-Gm-Message-State: AFeK/H1eT4BZ91+IN35jJVqKY/JR4Zui7GLe7hl1JsVJZeNaubxMtW5uKg0PUxDBsr4DOQ==
X-Received: by 10.98.6.133 with SMTP id 127mr10515653pfg.65.1490373654220;
	Fri, 24 Mar 2017 09:40:54 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r12sm5716509pgn.26.2017.03.24.09.40.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Mar 2017 09:40:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 09:40:38 -0700
Message-Id: <20170324164038.30804-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH] openssl: Fix build with thumb2
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
X-List-Received-Date: Fri, 24 Mar 2017 16:40:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...build-with-clang-using-external-assembler.patch | 18 ++--
 pull-30041/0000-cover-letter.patch                 | 32 ++++++++
 ...ic-function-namespace-clash-with-clang-bu.patch | 84 +++++++++++++++++++
 ...ontain-gcc-specific-compiler-flags-using-.patch | 96 ++++++++++++++++++++++
 scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks |  7 ++
 tools/python                                       |  1 +
 tools/python-config                                |  1 +
 7 files changed, 226 insertions(+), 13 deletions(-)
 create mode 100644 pull-30041/0000-cover-letter.patch
 create mode 100644 pull-30041/0001-db-Fix-atomic-function-namespace-clash-with-clang-bu.patch
 create mode 100644 pull-30041/0002-libvorbis-Contain-gcc-specific-compiler-flags-using-.patch
 create mode 100644 scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks
 create mode 120000 tools/python
 create mode 120000 tools/python-config

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
index 47b83a5896..49fa8b1d63 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch
@@ -25,25 +25,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  crypto/modes/asm/ghash-armv4.pl | 7 +++++++
  1 file changed, 7 insertions(+)
 
-diff --git a/crypto/modes/asm/ghash-armv4.pl b/crypto/modes/asm/ghash-armv4.pl
-index 8ccc963ef..442fed4da 100644
---- a/crypto/modes/asm/ghash-armv4.pl
-+++ b/crypto/modes/asm/ghash-armv4.pl
-@@ -124,7 +124,14 @@ $code=<<___;
+Index: openssl-1.0.2k/crypto/modes/asm/ghash-armv4.pl
+===================================================================
+--- openssl-1.0.2k.orig/crypto/modes/asm/ghash-armv4.pl
++++ openssl-1.0.2k/crypto/modes/asm/ghash-armv4.pl
+@@ -124,6 +124,9 @@ $code=<<___;
  #include "arm_arch.h"
  
  .text
 +#if defined(__thumb2__) || defined(__clang__)
 +.syntax	unified
 +#endif
-+#if defined(__thumb2__)
-+.thumb
-+#else
  .code	32
-+#endif
  
  #ifdef __clang__
- #define ldrplb	ldrbpl
--- 
-2.12.0
-
diff --git a/pull-30041/0000-cover-letter.patch b/pull-30041/0000-cover-letter.patch
new file mode 100644
index 0000000000..7ab29d50ae
--- /dev/null
+++ b/pull-30041/0000-cover-letter.patch
@@ -0,0 +1,32 @@
+From 48d4089afac5042cfa742120e79f561f9b415d2b Mon Sep 17 00:00:00 2001
+Message-Id: <cover.1490240196.git.raj.khem@gmail.com>
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 20:36:36 -0700
+Subject: [PATCH 0/2] Misc fixes
+
+clang finds couple of more issues to weed out
+
+The following changes since commit d1d55041e38b12d40f896834b56475ea19a6047f:
+
+  sstate: Ensure installation directory is empty before execution (2017-03-22 10:12:10 +0000)
+
+are available in the git repository at:
+
+  git://git.openembedded.org/openembedded-core-contrib kraj/pu
+  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu
+
+Khem Raj (2):
+  db: Fix atomic function namespace clash with clang builtins
+  libvorbis: Contain gcc specific compiler flags using configure option
+
+ .../libvorbis/0001-configure-Check-for-clang.patch | 56 ++++++++++++++++++++++
+ .../libvorbis/libvorbis_1.3.5.bb                   |  4 +-
+ ...me-local-__atomic_compare_exchange-to-avo.patch | 45 +++++++++++++++++
+ meta/recipes-support/db/db_5.3.28.bb               |  1 +
+ 4 files changed, 105 insertions(+), 1 deletion(-)
+ create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+ create mode 100644 meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
+
+-- 
+2.12.1
+
diff --git a/pull-30041/0001-db-Fix-atomic-function-namespace-clash-with-clang-bu.patch b/pull-30041/0001-db-Fix-atomic-function-namespace-clash-with-clang-bu.patch
new file mode 100644
index 0000000000..6c1355b715
--- /dev/null
+++ b/pull-30041/0001-db-Fix-atomic-function-namespace-clash-with-clang-bu.patch
@@ -0,0 +1,84 @@
+From e417cf062902f6271bd1c5d08af939eabc386fea Mon Sep 17 00:00:00 2001
+Message-Id: <e417cf062902f6271bd1c5d08af939eabc386fea.1490240196.git.raj.khem@gmail.com>
+In-Reply-To: <cover.1490240196.git.raj.khem@gmail.com>
+References: <cover.1490240196.git.raj.khem@gmail.com>
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 15:34:33 +0000
+Subject: [PATCH 1/2] db: Fix atomic function namespace clash with clang
+ builtins
+
+Rename local function to avoid conflicts with compiler intrinsics
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ...me-local-__atomic_compare_exchange-to-avo.patch | 45 ++++++++++++++++++++++
+ meta/recipes-support/db/db_5.3.28.bb               |  1 +
+ 2 files changed, 46 insertions(+)
+ create mode 100644 meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
+
+diff --git a/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
+new file mode 100644
+index 0000000000..571708e03e
+--- /dev/null
++++ b/meta/recipes-support/db/db/0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch
+@@ -0,0 +1,45 @@
++From 29621d637e30982489693f2e207ce6a1790e3337 Mon Sep 17 00:00:00 2001
++From: Khem Raj <raj.khem@gmail.com>
++Date: Wed, 22 Mar 2017 15:32:26 +0000
++Subject: [PATCH] atomic: Rename local __atomic_compare_exchange to avoid clash
++ with builtins
++
++Helps building with clang
++
++Fixes
++
++../db-5.3.28/src/dbinc/atomic.h:179:19: error: definition of builtin function '__atomic_compare_exchange'
++static inline int __atomic_compare_exchange(
++
++Upstream-Status: Pending
++
++Signed-off-by: Khem Raj <raj.khem@gmail.com>
++---
++ src/dbinc/atomic.h | 4 ++--
++ 1 file changed, 2 insertions(+), 2 deletions(-)
++
++diff --git a/src/dbinc/atomic.h b/src/dbinc/atomic.h
++index 6a858f7..1b49de5 100644
++--- a/src/dbinc/atomic.h
+++++ b/src/dbinc/atomic.h
++@@ -144,7 +144,7 @@ typedef LONG volatile *interlocked_val;
++ #define	atomic_inc(env, p)	__atomic_inc(p)
++ #define	atomic_dec(env, p)	__atomic_dec(p)
++ #define	atomic_compare_exchange(env, p, o, n)	\
++-	__atomic_compare_exchange((p), (o), (n))
+++	__db_atomic_compare_exchange((p), (o), (n))
++ static inline int __atomic_inc(db_atomic_t *p)
++ {
++ 	int	temp;
++@@ -176,7 +176,7 @@ static inline int __atomic_dec(db_atomic_t *p)
++  * http://gcc.gnu.org/onlinedocs/gcc-4.1.0/gcc/Atomic-Builtins.html
++  * which configure could be changed to use.
++  */
++-static inline int __atomic_compare_exchange(
+++static inline int __db_atomic_compare_exchange(
++ 	db_atomic_t *p, atomic_value_t oldval, atomic_value_t newval)
++ {
++ 	atomic_value_t was;
++-- 
++1.8.3.1
++
+diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
+index b7232fc894..26065bbb0b 100644
+--- a/meta/recipes-support/db/db_5.3.28.bb
++++ b/meta/recipes-support/db/db_5.3.28.bb
+@@ -21,6 +21,7 @@ PE = "1"
+ SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
+ SRC_URI += "file://arm-thumb-mutex_db5.patch \
+             file://fix-parallel-build.patch \
++            file://0001-atomic-Rename-local-__atomic_compare_exchange-to-avo.patch \
+            "
+ 
+ SRC_URI[md5sum] = "b99454564d5b4479750567031d66fe24"
+-- 
+2.12.1
+
diff --git a/pull-30041/0002-libvorbis-Contain-gcc-specific-compiler-flags-using-.patch b/pull-30041/0002-libvorbis-Contain-gcc-specific-compiler-flags-using-.patch
new file mode 100644
index 0000000000..36e4c28196
--- /dev/null
+++ b/pull-30041/0002-libvorbis-Contain-gcc-specific-compiler-flags-using-.patch
@@ -0,0 +1,96 @@
+From 48d4089afac5042cfa742120e79f561f9b415d2b Mon Sep 17 00:00:00 2001
+Message-Id: <48d4089afac5042cfa742120e79f561f9b415d2b.1490240196.git.raj.khem@gmail.com>
+In-Reply-To: <cover.1490240196.git.raj.khem@gmail.com>
+References: <cover.1490240196.git.raj.khem@gmail.com>
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Mar 2017 16:10:03 +0000
+Subject: [PATCH 2/2] libvorbis: Contain gcc specific compiler flags using
+ configure option
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../libvorbis/0001-configure-Check-for-clang.patch | 56 ++++++++++++++++++++++
+ .../libvorbis/libvorbis_1.3.5.bb                   |  4 +-
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+ create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+
+diff --git a/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+new file mode 100644
+index 0000000000..7dad0cd8a5
+--- /dev/null
++++ b/meta/recipes-multimedia/libvorbis/libvorbis/0001-configure-Check-for-clang.patch
+@@ -0,0 +1,56 @@
++From 44b4511784f9b51c514dff4ceb3cbeaf9c374d08 Mon Sep 17 00:00:00 2001
++From: Khem Raj <raj.khem@gmail.com>
++Date: Wed, 22 Mar 2017 16:06:55 +0000
++Subject: [PATCH] configure: Check for clang
++
++Disable gcc specific options if using clang
++
++Signed-off-by: Khem Raj <raj.khem@gmail.com>
++---
++Upstream-Status: Pending
++
++ configure.ac | 19 +++++++++++++++++--
++ 1 file changed, 17 insertions(+), 2 deletions(-)
++
++diff --git a/configure.ac b/configure.ac
++index eddd02d..00ecba5 100644
++--- a/configure.ac
+++++ b/configure.ac
++@@ -93,6 +93,16 @@ AC_ARG_ENABLE(examples,
++  	
++ AM_CONDITIONAL(BUILD_EXAMPLES, [test "x$enable_examples" = xyes]) 
++ 
+++AC_MSG_CHECKING([whether C compiler is clang])
+++$CC -x c /dev/null -dM -E > conftest.txt 2>&1
+++if grep "__clang__" conftest.txt >/dev/null 2>&1; then
+++  AC_SUBST([CC_CLANG], [1])
+++   AC_MSG_RESULT([yes])
+++ else
+++   AC_SUBST([CC_CLANG], [0])
+++   AC_MSG_RESULT([no])
+++fi
+++
++ dnl --------------------------------------------------
++ dnl Set build flags based on environment
++ dnl --------------------------------------------------
++@@ -127,10 +137,15 @@ else
++ 	AC_MSG_RESULT([$GCC_VERSION])
++ 	case $host in 
++ 	*86-*-linux*)
+++		if test "$CC_CLANG" = "1"; then
+++			ieeefp=""
+++		else
+++			ieefp="-mno-ieee-fp"
+++		fi
++ 		DEBUG="-g -Wall -Wextra -D_REENTRANT -D__NO_MATH_INLINES -fsigned-char"
++-		CFLAGS="-O3 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char"
+++		CFLAGS="-O3 -ffast-math -D_REENTRANT -fsigned-char ${ieefp}"
++ #              	PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math -D_REENTRANT -fsigned-char -fno-inline -static"
++-		PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math -mno-ieee-fp -D_REENTRANT -fsigned-char -fno-inline"
+++		PROFILE="-Wall -Wextra -pg -g -O3 -ffast-math ${ieefp} -D_REENTRANT -fsigned-char -fno-inline"
++ 
++ 		# glibc < 2.1.3 has a serious FP bug in the math inline header
++ 		# that will cripple Vorbis.  Look to see if the magic FP stack
++-- 
++1.8.3.1
++
+diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+index 636e0f307b..56c5b0a9cb 100644
+--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
++++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
+@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d2c487d2fc7dd3e3c7c465a5b7f6217 \
+                     file://include/vorbis/vorbisenc.h;beginline=1;endline=11;md5=d1c1d138863d6315131193d4046d81cb"
+ DEPENDS = "libogg"
+ 
+-SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz"
++SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.xz \
++           file://0001-configure-Check-for-clang.patch \
++          "
+ SRC_URI[md5sum] = "28cb28097c07a735d6af56e598e1c90f"
+ SRC_URI[sha256sum] = "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
+ 
+-- 
+2.12.1
+
diff --git a/scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks b/scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks
new file mode 100644
index 0000000000..a5a1429fc4
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/sdimage-bootpart-8g.wks
@@ -0,0 +1,7 @@
+# short-description: Create SD card image with a boot partition
+# long-description: Creates a partitioned SD card image. Boot files
+# are located in the first vfat partition.
+
+part /boot --source bootimg-partition --ondisk mmcblk --fstype=vfat --label boot --active --align 4 --size 64M --extra-space 0
+part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4 --size 7500M --overhead-factor 1 --extra-space 0
+bootloader
diff --git a/tools/python b/tools/python
new file mode 120000
index 0000000000..f62ea68d97
--- /dev/null
+++ b/tools/python
@@ -0,0 +1 @@
+/usr/bin/python2
\ No newline at end of file
diff --git a/tools/python-config b/tools/python-config
new file mode 120000
index 0000000000..251247a8b5
--- /dev/null
+++ b/tools/python-config
@@ -0,0 +1 @@
+/usr/bin/python2-config
\ No newline at end of file
-- 
2.12.1


