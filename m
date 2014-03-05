Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E61B56EF77
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 05:13:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s255DwuZ013995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Mar 2014 21:13:58 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 4 Mar 2014 21:13:57 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Mar 2014 13:14:32 +0800
Message-ID: <dbaff13c03d8f8dc3d182060374cc4be79f34560.1393996274.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393996274.git.Qi.Chen@windriver.com>
References: <cover.1393996274.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs: fix cross compilation problem
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
X-List-Received-Date: Wed, 05 Mar 2014 05:13:58 -0000
Content-Type: text/plain

When compiling e2fsprogs for qemumips64, we got compilation errors.
The root cause is that parse-types.sh script would fail for mips64.

However, the type size checking in parse-types.sh doesn't make much
sense in case of cross compilation. This is because that the typedef
statements in asm_types.h are for the target machine while the generated
binary in parse-types.sh script is executed on build machine.

This patch fixes such problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-e2fsprogs-fix-cross-compilation-problem.patch |   55 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch
new file mode 100644
index 0000000..73043be
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Pending
+
+Subject: e2fsprogs: fix cross compilation problem
+
+The checking of types in parse-types.sh doesn't make much sense in a
+cross-compilation environment, because the generated binary is executed
+on build machine.
+
+So even if asm_types.h has got correct statements for types, it's possible
+that the generated binary will report an error. Because these types are for
+the target machine.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ config/parse-types.sh |    6 ++++--
+ configure.in          |    6 +++++-
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/config/parse-types.sh b/config/parse-types.sh
+index 5076f6c..24d2a99 100755
+--- a/config/parse-types.sh
++++ b/config/parse-types.sh
+@@ -118,8 +118,10 @@ if ./asm_types
+ then
+     true
+ else
+-    echo "Problem detected with asm_types.h"
+-    echo "" > asm_types.h
++    if [ "${CROSS_COMPILE}" != "1" ]; then
++	echo "Problem detected with asm_types.h"
++	echo "" > asm_types.h
++    fi
+ fi
+ rm asm_types.c asm_types
+ 
+diff --git a/configure.in b/configure.in
+index 68adf0d..ed1697b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -953,7 +953,11 @@ AC_SUBST(SIZEOF_LONG)
+ AC_SUBST(SIZEOF_LONG_LONG)
+ AC_SUBST(SIZEOF_OFF_T)
+ AC_C_BIGENDIAN
+-BUILD_CC="$BUILD_CC" CPP="$CPP" /bin/sh $ac_aux_dir/parse-types.sh
++if test $cross_compiling = no; then
++  BUILD_CC="$BUILD_CC" CPP="$CPP" /bin/sh $ac_aux_dir/parse-types.sh
++else
++  CROSS_COMPILE="1" BUILD_CC="$BUILD_CC" CPP="$CPP" /bin/sh $ac_aux_dir/parse-types.sh
++fi
+ ASM_TYPES_HEADER=./asm_types.h
+ AC_SUBST_FILE(ASM_TYPES_HEADER)
+ dnl
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 0c8ec71..7e0c395 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://acinclude.m4 \
             file://fix-icache.patch \
             file://populate-extfs.sh \
             file://quiet-debugfs.patch \
+            file://0001-e2fsprogs-fix-cross-compilation-problem.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-- 
1.7.9.5


