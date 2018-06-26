Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 46ADD74740
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:44:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41506802"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2018 13:44:26 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 635C74B41EF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 13:44:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 26 Jun 2018 13:44:24 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jun 2018 13:44:17 +0800
Message-ID: <1529991857-76866-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 635C74B41EF0.A829A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] glibc: fix CVE-2018-11237
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
X-List-Received-Date: Tue, 26 Jun 2018 05:44:28 -0000
Content-Type: text/plain

glibc: fix CVE-2018-11237

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-core/glibc/glibc/CVE-2018-11237.patch | 82 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb              |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-11237.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2018-11237.patch b/meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
new file mode 100644
index 0000000..632aa56
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2018-11237.patch
@@ -0,0 +1,82 @@
+From 9aaaab7c6e4176e61c59b0a63c6ba906d875dc0e Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Tue, 22 May 2018 10:37:59 +0200
+Subject: [PATCH] Don't write beyond destination in
+ __mempcpy_avx512_no_vzeroupper (bug 23196)
+
+When compiled as mempcpy, the return value is the end of the destination
+buffer, thus it cannot be used to refer to the start of it.
+
+2018-05-23  Andreas Schwab  <schwab@suse.de>
+
+       [BZ #23196]
+       CVE-2018-11237
+       * sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
+       (L(preloop_large)): Save initial destination pointer in %r11 and
+       use it instead of %rax after the loop.
+       * string/test-mempcpy.c (MIN_PAGE_SIZE): Define.
+
+CVE: CVE-2018-11237
+Upstream-Status: Backport
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ ChangeLog                                               | 9 +++++++++
+ string/test-mempcpy.c                                   | 1 +
+ sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S | 5 +++--
+ 3 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index fa0a07c..bc09dec 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,12 @@
++2018-05-23  Andreas Schwab  <schwab@suse.de>
++
++	[BZ #23196]
++	CVE-2018-11237
++	* sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
++	(L(preloop_large)): Save initial destination pointer in %r11 and
++	use it instead of %rax after the loop.
++	* string/test-mempcpy.c (MIN_PAGE_SIZE): Define.
++
+ 2018-05-09  Paul Pluzhnikov  <ppluzhnikov@google.com>
+ 
+ 	[BZ #22786]
+diff --git a/string/test-mempcpy.c b/string/test-mempcpy.c
+index c08fba8..d98ecdd 100644
+--- a/string/test-mempcpy.c
++++ b/string/test-mempcpy.c
+@@ -18,6 +18,7 @@
+    <http://www.gnu.org/licenses/>.  */
+ 
+ #define MEMCPY_RESULT(dst, len) (dst) + (len)
++#define MIN_PAGE_SIZE 131072
+ #define TEST_MAIN
+ #define TEST_NAME "mempcpy"
+ #include "test-string.h"
+diff --git a/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S b/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
+index 23c0f7a..a55cf6f 100644
+--- a/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
++++ b/sysdeps/x86_64/multiarch/memmove-avx512-no-vzeroupper.S
+@@ -335,6 +335,7 @@ L(preloop_large):
+ 	ja	L(preloop_large_bkw)
+ 	vmovups	(%rsi), %zmm4
+ 	vmovups	0x40(%rsi), %zmm5
++	mov     %rdi, %r11
+ 
+ /* Align destination for access with non-temporal stores in the loop.  */
+ 	mov	%rdi, %r8
+@@ -366,8 +367,8 @@ L(gobble_256bytes_nt_loop):
+ 	cmp	$256, %rdx
+ 	ja	L(gobble_256bytes_nt_loop)
+ 	sfence
+-	vmovups	%zmm4, (%rax)
+-	vmovups	%zmm5, 0x40(%rax)
++	vmovups %zmm4, (%r11)
++	vmovups %zmm5, 0x40(%r11)
+ 	jmp	L(check)
+ 
+ L(preloop_large_bkw):
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index fe23eb6..b14c02c 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -46,6 +46,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-plural_c_no_preprocessor_lines.patch \
            file://CVE-2017-18269.patch \
            file://CVE-2018-11236.patch \
+           file://CVE-2018-11237.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4




