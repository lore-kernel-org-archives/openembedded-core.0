Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9477B77040
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:54:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1J5sw42023357
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 18 Feb 2016 21:54:58 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 21:54:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Feb 2016 00:54:42 -0500
Message-ID: <7b8897f9835061bdf8efc8c2ae182d2536622be5.1455860789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455860789.git.hongxu.jia@windriver.com>
References: <cover.1455860789.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] openssl: substitute buildpath in source code
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
X-List-Received-Date: Fri, 19 Feb 2016 05:54:59 -0000
Content-Type: text/plain

The openssl records $CC and $CFLAGS in source code which
caused buildpaths QA issue:
In crypto/cversion.c
...
    if (t == SSLEAY_CFLAGS) {
        return (CFLAGS);
        return ("compiler: information not available");
    }
...

We should do substitution in the above source code which
use string TOPDIR to replace variable $TOPDIR.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |  2 +-
 .../substitute-buildpath-in-source-code.patch      | 41 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2f.bb |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/substitute-buildpath-in-source-code.patch

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 1282115..f17bf94 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -28,7 +28,7 @@ CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_END
 export DIRS = "crypto ssl apps"
 export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+EXTRA_OEMAKE = "-e MAKEFLAGS= TOPDIR=${TOPDIR}"
 
 inherit pkgconfig siteinfo multilib_header ptest
 
diff --git a/meta/recipes-connectivity/openssl/openssl/substitute-buildpath-in-source-code.patch b/meta/recipes-connectivity/openssl/openssl/substitute-buildpath-in-source-code.patch
new file mode 100644
index 0000000..f08b9a9
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/substitute-buildpath-in-source-code.patch
@@ -0,0 +1,41 @@
+From 099594013421f98ec011d131580c9adb1031bd6f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 18 Feb 2016 04:02:42 -0500
+Subject: [PATCH] crypto/Makefile: substitute buildpath in source code
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
+We should do substitution in the above source code.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ crypto/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 17a87f8..cd43810 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -55,7 +55,8 @@ top:
+ all: shared
+ 
+ buildinf.h: ../Makefile
+-	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
++	COMPILE_OPT="$(shell echo $(CC) $(CFLAGS) | sed 's#$(TOPDIR)#TOPDIR#g')"; \
++		$(PERL) $(TOP)/util/mkbuildinf.pl "$$COMPILE_OPT" "$(PLATFORM)" >buildinf.h
+ 
+ x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
+ 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2f.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2f.bb
index fbc78e1..32b9f97 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2f.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
             file://configure-musl-target.patch \
+            file://substitute-buildpath-in-source-code.patch \
            "
 
 SRC_URI[md5sum] = "b3bf73f507172be9292ea2a8c28b659d"
-- 
1.9.1


