Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SrO6o-0003L0-LS
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 08:51:42 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so1867165pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 23:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=O4Czwi69JjBtwFI5kM8GqJL6JKqAsf/u3lYCWAe27UU=;
	b=vEetR6NGSK8wRvYf4HYN3sUYRLAwanjmeDyBAFfPxa7482YIHbqS9FWlH4IZhyrKqW
	9c9UD6O1VGmsx/nTV+iWZH9L5MKqKD5B+f766JLzFU8Z1mlNQIn5HVgqYVudulnnWbHF
	YhaikLC9lxPTyMQ07ma/8PA0qtrZBRnAxtNfMZRfpIvxxOAvFSasQ9rB38AAjtEDba9Y
	0UqyKjmaB+/PLnTnJiuxK0pHFEG2rDVXvf7OtN9ENIB0PUtr7TTXeLzfviWY2BqLNx6K
	LrKQjzcAsc08havokoDP9cx75Q7Q1MrMlb5aaAuyd9mjUA5nym08yLtR1a71SoW14ld1
	pXBg==
Received: by 10.68.227.40 with SMTP id rx8mr5032240pbc.6.1342593624091;
	Tue, 17 Jul 2012 23:40:24 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nu5sm12312410pbb.53.2012.07.17.23.40.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 23:40:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 23:39:40 -0700
Message-Id: <5b71a358dafc84c8ac1ed6dd48a48eefaf0328b1.1342593440.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342593440.git.raj.khem@gmail.com>
References: <cover.1342593440.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] eglibc: Fix build for e500 cores
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 06:51:42 -0000

e500 support needed to be updared to match eglibc 2.16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.16/e500-math_private.patch     |   31 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch b/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
new file mode 100644
index 0000000..9dbb26e
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
@@ -0,0 +1,31 @@
+Match with the latest math_private restructuring in glibc
+
+as done here
+
+http://sourceware.org/ml/libc-alpha/2012-03/msg00302.html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h
+===================================================================
+--- libc.orig/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h	2012-07-17 22:58:20.340405923 -0700
++++ libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h	2012-07-17 22:58:21.120405923 -0700
+@@ -1 +1 @@
+-#include <math/math_private.h>
++#include_next <sysdeps/generic/math_private.h>
+Index: libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c
+===================================================================
+--- libc.orig/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c	2012-07-17 23:15:15.872405939 -0700
++++ libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c	2012-07-17 23:18:42.760405602 -0700
+@@ -23,7 +23,7 @@
+ 
+ #undef feraiseexcept
+ 
+-#define __FERAISEEXCEPT_INTERNAL feraiseexcept
++#define __FERAISEEXCEPT_INTERNAL __feraiseexcept
+ #include "../spe-raise.c"
+ 
+-libm_hidden_def (feraiseexcept)
++libm_hidden_ver (__feraiseexcept, feraiseexcept)
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 09f5dbb..23a4130 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "19383"
 
 DEPENDS += "gperf-native"
-PR = "r0"
+PR = "r1"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -22,6 +22,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://eglibc_fix_findidx_parameters.patch \
            file://ppc_slow_ieee754_sqrt.patch \
            file://rpc-bootstrap.patch \
+           file://e500-math_private.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.9.5



