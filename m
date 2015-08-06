Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8886E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 00:30:32 +0000 (UTC)
Received: by pdber20 with SMTP id er20so24742747pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 17:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=etNTZIi8rs82/l+EJyS0EsvdqAot55qJxjunyBDSRTs=;
	b=buZ0ig3qn70ew5ujhsplRRrDK9vMvP8kXbpD2DB/KcOZ7WKmOxlnlJH2VR2OpOjVKq
	r1s4uhch7Pdfq+1iQsnGqvwY9vJF2LyBqA8SjGXLH/yzLMj1GNJMboD07eH/7fRuQAoK
	rj+/4RHh/YQB/aX3simeB15aZC7TXd1PLZiTnswcg8bSFxjzVPmxOGG0PxUemdgaOeyW
	2ozRXQ1v2FpcrSk4TFhsR6/D5CcMTwZLL7SosPd0zta/yKO6IlygGieC21s2EcB6n8jA
	4I4JUzP+hZfQF2c7tzL9/fAn8xVUwC/JrJywpRuwRFrqX4nr8rgICOhY3q3bqiJms0Ql
	nOwQ==
X-Received: by 10.70.34.171 with SMTP id a11mr24772349pdj.18.1438821032441;
	Wed, 05 Aug 2015 17:30:32 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	oi17sm4210446pdb.74.2015.08.05.17.30.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 17:30:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:30:26 -0700
Message-Id: <1438821026-21929-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] uclibc: backport upstream fix for SH4
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
X-List-Received-Date: Thu, 06 Aug 2015 00:30:36 -0000

Backport upstream fix for building uclibc for SH4 with recent gcc:

  http://git.uclibc.org/uClibc/commit/?id=2c8a7766681b704e710f51c0817534e3f9a952d1

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---

Assuming everything works out OK in master, fido needs this fix too.

 meta/recipes-core/uclibc/uclibc-git.inc            |  1 +
 .../ldso-mark-_dl_exit-as-noreturn.patch           | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 8308e60..3c48940 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -25,5 +25,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://0002-wire-setns-syscall.patch \
 	file://0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch \
 	file://0001-timex-Sync-with-glibc.patch \
+	file://ldso-mark-_dl_exit-as-noreturn.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch b/meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch
new file mode 100644
index 0000000..5279f8a
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/ldso-mark-_dl_exit-as-noreturn.patch
@@ -0,0 +1,48 @@
+From 2c8a7766681b704e710f51c0817534e3f9a952d1 Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Thu, 26 Mar 2015 00:02:58 +0100
+Subject: [PATCH] ldso: mark _dl_exit as noreturn
+
+Otherwise gcc might not understand that oom() ended control-flow and
+might emit an (untaken) reference to abort() in _dl_update_slotinfo()
+on e.g. SH4 which breaks linking ld-uClibc.so.
+Arguably -ffreestanding should prevent GCC from emitting this
+'.global abort' but alas, it does not, which is another bug..
+
+Also mark the function cold to further lower the incoming frequency and
+branch probability.
+
+Upstream-Status: Backport
+
+  http://git.uclibc.org/uClibc/commit/?id=2c8a7766681b704e710f51c0817534e3f9a952d1
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ ldso/include/dl-syscall.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
+index 675b93a..e556f7b 100644
+--- a/ldso/include/dl-syscall.h
++++ b/ldso/include/dl-syscall.h
+@@ -52,7 +52,15 @@ extern int _dl_errno;
+    dynamic linking at all, so we cannot return any error codes.
+    We just punt if there is an error. */
+ #define __NR__dl_exit __NR_exit
+-static __always_inline _syscall1(void, _dl_exit, int, status)
++static __always_inline attribute_noreturn __cold void _dl_exit(int status)
++{
++	INLINE_SYSCALL(_dl_exit, 1, status);
++#if defined __GNUC__
++	__builtin_unreachable(); /* shut up warning: 'noreturn' function does return*/
++#else
++	while (1);
++#endif
++}
+ 
+ #define __NR__dl_close __NR_close
+ static __always_inline _syscall1(int, _dl_close, int, fd)
+-- 
+1.9.1
+
-- 
1.9.1


