Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D81A478278
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 08:11:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="31887063"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Dec 2017 16:11:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 64BCA48AE9E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 16:10:59 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 20 Dec 2017 16:10:57 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Dec 2017 16:10:51 +0800
Message-ID: <1513757451-829-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 64BCA48AE9E5.A8894
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] glibc:CVE-2017-17426
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
X-List-Received-Date: Wed, 20 Dec 2017 08:11:02 -0000
Content-Type: text/plain

Fix the CVE-2017-17426.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...-overflow-in-malloc-when-tcache-is-enable.patch | 52 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch

diff --git a/meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch b/meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch
new file mode 100644
index 0000000..623bed7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch
@@ -0,0 +1,52 @@
+From 34697694e8a93b325b18f25f7dcded55d6baeaf6 Mon Sep 17 00:00:00 2001
+From: Arjun Shankar <arjun@redhat.com>
+Date: Thu, 30 Nov 2017 13:31:45 +0100
+Subject: [PATCH] Fix integer overflow in malloc when tcache is enabled [BZ
+ #22375]
+
+When the per-thread cache is enabled, __libc_malloc uses request2size (which
+does not perform an overflow check) to calculate the chunk size from the
+requested allocation size. This leads to an integer overflow causing malloc
+to incorrectly return the last successfully allocated block when called with
+a very large size argument (close to SIZE_MAX).
+
+This commit uses checked_request2size instead, removing the overflow.
+
+Upstream-status: Backport
+---
+ ChangeLog       | 6 ++++++
+ malloc/malloc.c | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index b55ed22..888f9fb 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2017-11-30  Arjun Shankar  <arjun@redhat.com>
++
++	[BZ #22375]
++	* malloc/malloc.c (__libc_malloc): Use checked_request2size
++	instead of request2size.
++
+ 2017-08-02  Siddhesh Poyarekar  <siddhesh@sourceware.org>
+ 
+ 	* sysdeps/sparc/sparc32/sparcv9/fpu/multiarch/s_llrint.S
+diff --git a/malloc/malloc.c b/malloc/malloc.c
+index 79f0e9e..0c9e074 100644
+--- a/malloc/malloc.c
++++ b/malloc/malloc.c
+@@ -3050,7 +3050,8 @@ __libc_malloc (size_t bytes)
+     return (*hook)(bytes, RETURN_ADDRESS (0));
+ #if USE_TCACHE
+   /* int_free also calls request2size, be careful to not pad twice.  */
+-  size_t tbytes = request2size (bytes);
++  size_t tbytes;
++  checked_request2size (bytes, tbytes);
+   size_t tc_idx = csize2tidx (tbytes);
+ 
+   MAYBE_INIT_TCACHE ();
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 135ec4f..36b2004 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
+           file://0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4




