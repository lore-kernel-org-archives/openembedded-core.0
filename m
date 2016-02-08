Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 92AEA60119
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:32:43 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id s4so1990106oif.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GVlwhyoTFRZAMTsqG4rBtsaHICWJve5fJOyPuptUEYo=;
	b=hkNeMHniMz7B2y3/zL8QeOl2kvAezVVzt7XPSD9mxyLtOnr7sEfFJ08L/GIUJU/bCU
	pPE7RT6dpApF6f7cPsnPeuYr5kjOYn4KRk50ylgV0ujmKcDkQUc7WlJI+JNJNeV0KVcW
	b/UojfcXikKvQRk6UjnJBMs3uFLy2rgtmAIeLQHhsUKx77P292TAMprW9n9ydwnTTp5n
	jRy+m4hSVILbiP4C4/CxPJ3TUhjS2W9CaIlP+resYIGGelwANuMaa0sUZOOTHcLcjiPc
	xNA1J9FvDMNWADwXIHxz7ywzTT3KEkPGbhnn4djVggUKOUhujh9bkDKjNzQ6vAovrww7
	wJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GVlwhyoTFRZAMTsqG4rBtsaHICWJve5fJOyPuptUEYo=;
	b=C7F7UqRJ0eLDKzLNzwhV4OIcIY2I18AklAF4nQ+lU0EH4PsKxDxlEKgobiCggFWjfr
	0O7EJQQn6djfCv9Ksf/NyBy9tDmWgfh6HLpY28wL3eQC9M20I6Rv4oNxTFK5XJBjPpc2
	4DE6AFoxjuHM0WG1nNj0wfmERCXdK/5hzCA6/9Bu/VJOdvwBZgCmRkEvQQEe0Ln5vfGQ
	xXj+CTnwqM2WcAw0tl0DT6OIT8El52BzFMmmuEelbL+OZJ3KxY2DIp1LeKfjhhTeZcys
	qlkrn9Rt9iH6A3ZgZaYTn0THHHMbDvd4gXcWFCAHNBd+0cvfeYCUStf3ggGKKrHkbw5N
	r0Eg==
X-Gm-Message-State: AG10YOSMAHDZcKb5qyU8KpIHl2Vox8WFulbUUn7JV8CX3bWjOVbc859Gag8SoEt0n5gAeA==
X-Received: by 10.202.91.135 with SMTP id p129mr422378oib.23.1454959963748;
	Mon, 08 Feb 2016 11:32:43 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ur2sm18319086obc.11.2016.02.08.11.32.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 11:32:42 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 11:32:37 -0800
Message-Id: <1454959957-18277-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] strace: build fix for MIPS + musl libc
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
X-List-Received-Date: Mon, 08 Feb 2016 19:32:43 -0000

The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
but not by musl. Regardless of the libc, the kernel headers provide
<asm/sgidefs.h> which provides the same definitions, so use that
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../strace/strace/use-asm-sgidefs.h.patch          | 51 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.11.bb        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch

diff --git a/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch b/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
new file mode 100644
index 0000000..db83d11
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
@@ -0,0 +1,51 @@
+From 2995245d7e3f46e8b3995002995ebd28beca7d55 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 5 Feb 2016 14:00:00 -0800
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc.
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1524b9b..287e03d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -196,20 +196,20 @@ AC_SUBST(arch_mx32)
+ if test "$arch" = mips; then
+ 	AC_CACHE_CHECK([for _MIPS_SIM], [st_cv__MIPS_SIM],
+ 		       [AC_COMPUTE_INT([st_cv__MIPS_SIM], [_MIPS_SIM],
+-				       [#include <sgidefs.h>],
++				       [#include <asm/sgidefs.h>],
+ 				       [AC_MSG_ERROR([_MIPS_SIM cannot be determined])])])
+ 
+ 	AC_CACHE_CHECK([for MIPS ABI], [st_cv_mips_abi],
+ 		[AC_COMPILE_IFELSE(
+-			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
++			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
+ 					 [[int i[_MIPS_SIM == _MIPS_SIM_ABI32 ? 1 : - 1];]])],
+ 			[st_cv_mips_abi=o32],
+ 		[AC_COMPILE_IFELSE(
+-			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
++			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
+ 					 [[int i[_MIPS_SIM == _MIPS_SIM_NABI32 ? 1 : - 1];]])],
+ 			[st_cv_mips_abi=n32],
+ 		[AC_COMPILE_IFELSE(
+-			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
++			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
+ 					 [[int i[_MIPS_SIM == _MIPS_SIM_ABI64 ? 1 : - 1];]])],
+ 			[st_cv_mips_abi=n64],
+ 			[st_cv_mips_abi=unknown])])])])
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index a72a1f9..95d13e6 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -8,6 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
            file://more-robust-test-for-m32-mx32-compile-support.patch \
            file://update-gawk-paths.patch \
+           file://use-asm-sgidefs.h.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
           "
-- 
1.9.1


