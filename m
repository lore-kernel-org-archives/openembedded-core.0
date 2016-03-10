Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40C5B731A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:24:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A7OBcS014517
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 23:24:12 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:24:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:22 -0500
Message-ID: <1fd2c2598da726c85da663ed675e4fa86cbbfd39.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 17/18] openssl: fix buildpath QA issue
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
X-List-Received-Date: Thu, 10 Mar 2016 07:24:12 -0000
Content-Type: text/plain

- The openssl records $CC and $CFLAGS in source code which
  caused buildpaths QA issue:
  In crypto/cversion.c
  ...
      if (t == SSLEAY_CFLAGS) {
          return (CFLAGS);
          return ("compiler: information not available");
      }
  ...
  We should remove build path in the above source code.

- Remove build paths in ${PTEST_PATH}/Makefile  and
  ${PTEST_PATH}/Configure

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssl/remove-build-path-in-source-code.patch | 44 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2g.bb |  7 ++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch b/meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch
new file mode 100644
index 0000000..fd5531b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch
@@ -0,0 +1,44 @@
+From b937d7581a1793cdebbf5829bdaea787ed4128db Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 7 Mar 2016 01:11:42 -0500
+Subject: [PATCH] crypto/Makefile: remove build path in source code
+
+Openssl records $CC and $CFLAGS in source code which
+caused buildpaths QA issue:
+In crypto/cversion.c
+...
+    if (t == SSLEAY_CFLAGS) {
+        return (CFLAGS);
+        return ("compiler: information not available");
+    }
+...
+
+We should remove build path in the above source code.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ crypto/Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 17a87f8..ee630e8 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -54,8 +54,11 @@ top:
+ 
+ all: shared
+ 
++NO_BUILDPATH_CCFLAGS=`echo "$(CC) $(CFLAGS)" | \
++         sed -e 's:--sysroot=[^ ]*::g' \
++             -e 's:-fdebug-prefix-map=[^ ]*::g'`
+ buildinf.h: ../Makefile
+-	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
++	$(PERL) $(TOP)/util/mkbuildinf.pl "$(NO_BUILDPATH_CCFLAGS)" "$(PLATFORM)" >buildinf.h
+ 
+ x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
+ 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
index 290f129..7b27b47 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://ptest_makefile_deps.patch  \
             file://configure-musl-target.patch \
             file://parallel.patch \
+            file://remove-build-path-in-source-code.patch \
            "
 
 SRC_URI[md5sum] = "f3c710c045cdee5fd114feb69feba7aa"
@@ -47,6 +48,12 @@ SRC_URI[sha256sum] = "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e895
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 
+inherit fix_buildpaths
+PACKAGE_BUILDPATH_TEXT_FILES ?= " \
+        ${PTEST_PATH}/Makefile \
+        ${PTEST_PATH}/Configure \
+"
+
 # The crypto_use_bigint patch means that perl's bignum module needs to be
 # installed, but some distributions (for example Fedora 23) don't ship it by
 # default.  As the resulting error is very misleading check for bignum before
-- 
1.9.1


