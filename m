Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11C6B60809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 15:07:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8GF76V3028559
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 08:07:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 16 Sep 2014 08:07:06 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 23:06:24 +0800
Message-ID: <f1a77eb073405fd9bcccc0dac37be98848ddf08b.1410879378.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410879378.git.kai.kang@windriver.com>
References: <cover.1410879378.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org, jslater@windriver.com
Subject: [PATCH 3/9] gcc-4.9: redefine dynamic linker for aarch64
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
X-List-Received-Date: Tue, 16 Sep 2014 15:07:06 -0000
Content-Type: text/plain

Redefine dynamic linker for aarch64 from /lib to /lib64.

BASELIB of aarch64 has to be defined with 'lib64', then linker file
ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
update it here too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../0056-redefine-dynamic-linker-for-aarch64.patch | 34 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 25778bd..c434a45 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
     file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
     file://0055-PR-rtl-optimization-61801.patch \
+    file://0056-redefine-dynamic-linker-for-aarch64.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
new file mode 100644
index 0000000..6933e2f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
@@ -0,0 +1,34 @@
+From 8fbb60d89e569b68b13e4fd419e20640eb49cabc Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 16 Sep 2014 16:01:31 +0800
+Subject: [PATCH] Redefine dynamic linker for aarch64
+
+Redefine dynamic linker for aarch64 from /lib to /lib64.
+
+BASELIB of aarch64 has to be defined with 'lib64', then linker file
+ld-linux-aarch64.so.1 is installed into /lib64 rather than /lib. So
+update it here too.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index a8f0771..2a6f06d 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -21,7 +21,7 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}.so.1"
++#define GLIBC_DYNAMIC_LINKER "/lib64/ld-linux-aarch64%{mbig-endian:_be}.so.1"
+ 
+ #define CPP_SPEC "%{pthread:-D_REENTRANT}"
+ 
+-- 
+1.9.1
+
-- 
1.9.1


