Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 93ABB6CBA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 08:17:01 +0000 (UTC)
Received: from localhost.localdomain (91-157-208-114.elisa-laajakaista.fi
	[91.157.208.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id D3A1226553;
	Mon, 21 Oct 2013 10:17:02 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 11:16:54 +0300
Message-Id: <1382343415-30035-2-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
References: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
Cc: patches@linaro.org
Subject: [PATCH 2/3] ltp: Fix aarch64 build
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
X-List-Received-Date: Mon, 21 Oct 2013 08:17:01 -0000

Add backported patch from upstream to allow building on ltp Aarch64.
---
 meta/recipes-extended/ltp/files/fix-arm64.patch | 59 +++++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130904.bb       |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/files/fix-arm64.patch

diff --git a/meta/recipes-extended/ltp/files/fix-arm64.patch b/meta/recipes-extended/ltp/files/fix-arm64.patch
new file mode 100644
index 0000000..383467d
--- /dev/null
+++ b/meta/recipes-extended/ltp/files/fix-arm64.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Backport
+
+commit e5c18eaa4b8f9f73516eaf68213d6beee80cf3b5
+Author: Riku Voipio <riku.voipio@linaro.org>
+Date:   Fri Oct 11 12:09:08 2013 +0300
+
+    Remove bogus Aarch64 system call numbers
+    
+    Aarch64 build fails with:
+    
+    cacheflush01.c:52:26: fatal error: asm/cachectl.h: No such file or directory
+     #include <asm/cachectl.h>
+    
+    This is caused by bogus definitions of cacheflush and set_tls, which are
+    private 32bit ARM system calls. These should not be used on native
+    Aarch64 binaries. If they need to be tested, it is better done using ltp
+    compiled for 32bit ARM.
+    
+    Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+    Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+
+
+Index: ltp-full-20130904/testcases/kernel/include/aarch64.in
+===================================================================
+--- ltp-full-20130904.orig/testcases/kernel/include/aarch64.in	2013-09-04 10:18:22.000000000 +0300
++++ ltp-full-20130904/testcases/kernel/include/aarch64.in	2013-10-11 11:20:47.565921406 +0300
+@@ -253,5 +253,3 @@
+ syncfs 267
+ setns 268
+ sendmmsg 269
+-cacheflush 0x1002
+-set_tls 0x1005
+Index: ltp-full-20130904/testcases/kernel/include/linux_syscall_numbers.h
+===================================================================
+--- ltp-full-20130904.orig/testcases/kernel/include/linux_syscall_numbers.h	2013-09-04 10:18:22.000000000 +0300
++++ ltp-full-20130904/testcases/kernel/include/linux_syscall_numbers.h	2013-10-11 11:22:20.013925880 +0300
+@@ -801,12 +801,6 @@
+ # ifndef __NR_sendmmsg
+ #  define __NR_sendmmsg 269
+ # endif
+-# ifndef __NR_cacheflush
+-#  define __NR_cacheflush 0x1002
+-# endif
+-# ifndef __NR_set_tls
+-#  define __NR_set_tls 0x1005
+-# endif
+ #endif
+ 
+ 
+@@ -12754,9 +12748,6 @@
+ # ifndef __NR_settimeofday
+ #  define __NR_settimeofday __LTP__NR_INVALID_SYSCALL
+ # endif
+-# ifndef __NR_set_tls
+-#  define __NR_set_tls __LTP__NR_INVALID_SYSCALL
+-# endif
+ # ifndef __NR_setuid
+ #  define __NR_setuid __LTP__NR_INVALID_SYSCALL
+ # endif
diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
index 43fe780..cf016f9 100644
--- a/meta/recipes-extended/ltp/ltp_20130904.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -22,6 +22,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 DEPENDS = "attr libaio libcap acl openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ltp/LTP%20Source/ltp-${PV}/ltp-full-${PV}.tar.bz2 \
+           file://fix-arm64.patch \
            "
 
 SRC_URI[md5sum] = "0cf2ccb7199f8318d413c62a085629f0"
-- 
1.8.3.1


