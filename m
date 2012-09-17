Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TDiUg-0001p3-RL
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 23:04:39 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so9391052pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 13:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4EWB/eHfoBjYrK7OplxEvOHC5AMd456LqDhCaHE9brI=;
	b=PjuBSPYnutmnbvIBMI6GYSUxkVMufgAk/v5LwgeaCIOXvgC6pQetirlg6vUxXTGef2
	RSUxN6bidbP0RTQw6aStfkTOpZKWGij2wYdMXpSrV7tkRtSTLd22/SXjnwgsJv8PUwCp
	U2LE+M/er45VrgAUMPjlSl1iNCMXmAthpjGuHjwsRtDTdVi6ErnGlzC4mRGdrghLTGio
	gmm/zc6+vMugN6pcuyo/x6VDOCvTcKCJMdEB05Gad4OpRoypRk8eljljFJdfkO6oLhYz
	/C1RrLJMfdy8SfKa9QKJZ3+pvG7VklxSBHO2LLv1KEmqsj2PRxUwotd/S4EjTvA93/6C
	zfFQ==
Received: by 10.66.84.6 with SMTP id u6mr21700325pay.75.1347915121539;
	Mon, 17 Sep 2012 13:52:01 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gv1sm7498229pbc.38.2012.09.17.13.51.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 13:52:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 13:50:48 -0700
Message-Id: <bffdd81ac7ad4886f01f1046953fde45d858e16c.1347914898.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <feb59cfcb48be1f8ad1e767a0a236f4f4fd92670.1347914898.git.raj.khem@gmail.com>
References: <feb59cfcb48be1f8ad1e767a0a236f4f4fd92670.1347914898.git.raj.khem@gmail.com>
In-Reply-To: <cover.1347914898.git.raj.khem@gmail.com>
References: <cover.1347914898.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 21:04:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch      |   44 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch b/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch
new file mode 100644
index 0000000..712b353
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch
@@ -0,0 +1,44 @@
+Create e5500 specific math_private.h and let it include when compiling for e5500/64bit core
+We prefefine __CPU_HAS_FSQRT to 0 and then in general ppc64 math_private.h we check if its
+already defined before redefining it. This way we can ensure that on e5500 builds it wont
+emit fsqrt intructions
+
+-Khem
+
+Upstream-Status: Pending
+
+Index: libc/sysdeps/powerpc/fpu/math_private.h
+===================================================================
+--- libc.orig/sysdeps/powerpc/fpu/math_private.h	2012-09-03 22:37:58.000000000 -0700
++++ libc/sysdeps/powerpc/fpu/math_private.h	2012-09-17 09:35:09.709124003 -0700
+@@ -25,10 +25,12 @@
+ #include <dl-procinfo.h>
+ #include_next <math_private.h>
+ 
+-# if __WORDSIZE == 64 || defined _ARCH_PWR4
+-#  define __CPU_HAS_FSQRT 1
+-# else
+-#  define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) != 0)
++# ifndef __CPU_HAS_FSQRT
++#  if __WORDSIZE == 64 || defined _ARCH_PWR4
++#   define __CPU_HAS_FSQRT 1
++#  else
++#   define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) != 0)
++#  endif
+ # endif
+ 
+ extern double __slow_ieee754_sqrt (double);
+Index: libc/ports/sysdeps/powerpc/powerpc64/e5500/fpu/math_private.h
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libc/ports/sysdeps/powerpc/powerpc64/e5500/fpu/math_private.h	2012-09-17 09:56:59.129124074 -0700
+@@ -0,0 +1,9 @@
++#ifndef _E5500_MATH_PRIVATE_H_
++#define _E5500_MATH_PRIVATE_H_ 1
++/* E5500 core FPU does not implement
++   fsqrt */
++
++#define __CPU_HAS_FSQRT 0
++#include_next <math_private.h>
++
++#endif /* _E5500_MATH_PRIVATE_H_ */
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 8f3d159..bc4f044 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r9"
+PR = "r10"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -30,6 +30,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://0002-eglibc-menuconfig-hex-string-options.patch \
            file://0003-eglibc-menuconfig-build-instructions.patch \
            file://0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch \
+           file://file://fsl-ppc-no-fsqrt.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.9.5



