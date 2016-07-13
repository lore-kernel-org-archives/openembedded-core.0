Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09F566E667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 06:38:56 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hh10so2451350pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AWnshyBrj9Y/qQ6sS9LrR8/599eCm+DqFJrq8DFw6as=;
	b=h0866/SQ/CEfl36QdfyORTVd2EM7C4fA3eIPk4RKYEQoLnFzwiKyrk3IKjfhMubKHo
	oSUcS0RtA//4QfkV03PJWTvP4TUVk8WNDpkMALgrlEkE8MajbdxFMXIviDra3T3/7zIP
	0kj4hUcWg5yi+VC83PKOT8JjeZJj1dKPA44KMaaALdZh/bXvRnZTGjPMuNgw4kBEwptL
	J5xs/GGVqN0zeQb5nXtxsAciVVI37E+2uuqRrqg5/5bphEFwPjkPoWCK4MMmetd56wh0
	UjQeeOUbaYb6Y0myvgaI9kJHuTE8oyq9azrWVHn8v3tt4dlhkUApqwwe2ujUX3ShjvRI
	sOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AWnshyBrj9Y/qQ6sS9LrR8/599eCm+DqFJrq8DFw6as=;
	b=fH843fS+k2iZ5ZQxiQ1ynLYIpoZ+iOPWD5DjdCSvmteVnOKX06e3EtCowA+KVhQQYy
	osaSxUSTNeCoZlNaaGujo2r2GLRKy7/blMNGnpT6zim/ASl7IFeNFEgObchaHmoKp3Am
	EKeKqG5bDgHs+k7+/meI+rc9+fJmwJCHulh57cbSs6SzbCwbxdHBBtdBG4yWrPKEIvv1
	evsMTeGQbZ8OZcEPdcHKWzLbDCvhTnqriE6pJb4CY2YPdfxdFvhm0hQTjYy+M+vg7wg2
	NycdD0mo6WWo945cAguYXM3eogL/fXjgORfWmuZbnMxgV/OpXE3ioY4QyYgzcevgjARD
	a6dw==
X-Gm-Message-State: ALyK8tIFhLC2mpJOgfxsgAq/1G/zoimPLdibic4nr7mvFsNumG1qYe+ctY77yQ7eK/oMfQ==
X-Received: by 10.66.47.133 with SMTP id d5mr10670769pan.48.1468391936975;
	Tue, 12 Jul 2016 23:38:56 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id j8sm1718040paj.22.2016.07.12.23.38.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 23:38:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 23:38:49 -0700
Message-Id: <20160713063850.31283-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 1/2] nss: Fix build with clang
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
X-List-Received-Date: Wed, 13 Jul 2016 06:38:59 -0000

Add a patch to disable a clang specific warning
and avoid passing clang options to gcc when we have
cross compiler is clang but host compiler is gcc
We do not need to use target cflags when building
native pieces and hence avoid the inter-mixing of
compiler options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nss/nss/disable-Wvarargs-with-clang.patch      | 33 ++++++++++++++++++++++
 .../nss/nss/nss-fix-nsinstall-build.patch          | 11 ++++----
 meta/recipes-support/nss/nss_3.24.bb               |  2 ++
 3 files changed, 41 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch

diff --git a/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch b/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
new file mode 100644
index 0000000..86b1b60
--- /dev/null
+++ b/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
@@ -0,0 +1,33 @@
+clang 3.9 add this warning to rightly flag undefined
+behavior, we relegate this to be just a warning instead
+of error and keep the behavior as it was. Right fix would
+be to not pass enum to the function with variadic arguments
+as last named argument
+
+Fixes errors like
+ocsp.c:2220:22: error: passing an object that undergoes default argument promotion to 'va_start' has undefined behavior [-Werror,-Wvarargs]
+        va_start(ap, responseType0);
+                     ^
+ocsp.c:2200:43: note: parameter of type 'SECOidTag' is declared here
+                                SECOidTag responseType0, ...)
+
+see
+https://www.securecoding.cert.org/confluence/display/cplusplus/EXP58-CPP.+Pass+an+object+of+the+correct+type+to+va_start
+for more details
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: nss-3.24/nss/coreconf/Werror.mk
+===================================================================
+--- nss-3.24.orig/nss/coreconf/Werror.mk
++++ nss-3.24/nss/coreconf/Werror.mk
+@@ -54,7 +54,7 @@ ifndef WARNING_CFLAGS
+     ifdef CC_IS_CLANG
+       # -Qunused-arguments : clang objects to arguments that it doesn't understand
+       #    and fixing this would require rearchitecture
+-      WARNING_CFLAGS += -Qunused-arguments
++      WARNING_CFLAGS += -Qunused-arguments -Wno-error=varargs
+       # -Wno-parentheses-equality : because clang warns about macro expansions
+       WARNING_CFLAGS += $(call disable_warning,parentheses-equality)
+       ifdef BUILD_OPT
diff --git a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
index 866de07..181c69a 100644
--- a/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
+++ b/meta/recipes-support/nss/nss/nss-fix-nsinstall-build.patch
@@ -16,11 +16,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 ===================================================
-diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
-index 1850bcb..5aee84f 100644
---- a/nss/coreconf/nsinstall/Makefile
-+++ b/nss/coreconf/nsinstall/Makefile
-@@ -18,6 +18,12 @@ INTERNAL_TOOLS  = 1
+Index: nss-3.24/nss/coreconf/nsinstall/Makefile
+===================================================================
+--- nss-3.24.orig/nss/coreconf/nsinstall/Makefile
++++ nss-3.24/nss/coreconf/nsinstall/Makefile
+@@ -18,6 +18,13 @@ INTERNAL_TOOLS  = 1
  
  include $(DEPTH)/coreconf/config.mk
  
@@ -29,6 +29,7 @@ index 1850bcb..5aee84f 100644
 +# to clean the '-m64' from ARCHFLAG and LDFLAGS.
 +ARCHFLAG =
 +LDFLAGS =
++CFLAGS =
 +
  ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
  PROGRAM		=
diff --git a/meta/recipes-support/nss/nss_3.24.bb b/meta/recipes-support/nss/nss_3.24.bb
index 95a33f2..caed7fa 100644
--- a/meta/recipes-support/nss/nss_3.24.bb
+++ b/meta/recipes-support/nss/nss_3.24.bb
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-fix-nsinstall-build.patch \
+    file://disable-Wvarargs-with-clang.patch \
     file://nss.pc.in \
     file://signlibs.sh \
 "
@@ -62,6 +63,7 @@ do_compile_prepend_class-native() {
 do_compile() {
     export CROSS_COMPILE=1
     export NATIVE_CC="gcc"
+    export NATIVE_FLAGS="${HOST_CFLAGS}"
     export BUILD_OPT=1
 
     export FREEBL_NO_DEPEND=1
-- 
2.9.0


