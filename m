Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id EB01973D59
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:38 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so36536216pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kWO9AaInHa+kGHufmNzdOpPoE0+x9ayZmXGm08dZ+MQ=;
	b=kmt8XQ+Tr1W13jxC6LmVqNCBByCEmZ5pQH3ixAt5L4wuDrWOCX0GfOlD+bFT9Hxv7/
	9ffGFJohK3Ivs0HQHsCftGVPV83fwZ2ttsIdDQrSlGWv2e0zsr5QVoqXa+REUQSkoZ9a
	PFig9RYAFGZtevlzn15NSvtxoHI3CEaj0Hd2qbk++ZoC3PuJWtDY+3kYZYZUN/YbjQH9
	5zjmdx75WUpFuM5kjuGOvYDXKbDh8qQZXZA3aH7zb9TY+AxMECL6VSIBOL1Dsej/rBW4
	uV28IBtp/JOFem/kk1DsXQC6MRuneS9SK52qLSy9jA2Htqi8uysQPMvFiUIA8mYpOeWQ
	UUIg==
X-Received: by 10.68.129.72 with SMTP id nu8mr10884616pbb.145.1429846540090;
	Thu, 23 Apr 2015 20:35:40 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:20 -0700
Message-Id: <555d7daead4c2ae18ac487b6b8ac0ad88b5ee476.1429846255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 02/14] insserv: Fix build with gcc5 and clang
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:39 -0000

Kill 2 bugs with one patch

| insserv.c:997:5: note: each undeclared identifier is reported only
once for each function it appears in
| insserv.c:997:15: error: expected ';' before 'char'
|      extension char buf[strlen(myname)+2+strlen(fmt)+1];
|                ^
| insserv.c: In function 'main':
| insserv.c:2379:5: error: 'extension' undeclared (first use in this
function)
|      extension char * argr[argc];
|      ^
| insserv.c:2379:15: error: expected ';' before 'char'
|      extension char * argr[argc];
|                ^
| insserv.c:2401:2: error: 'argr' undeclared (first use in this
function)
|   argr[c] = (char*)0;
|   ^

Change-Id: I36b7fb9e8baeda5a7cc252da10c0527401248226
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../161_bts777914_fix_undeclared_identifier.patch  | 36 ++++++++++++++++++++++
 meta/recipes-devtools/insserv/insserv_1.14.0.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch

diff --git a/meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch b/meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch
new file mode 100644
index 0000000..6ee9532
--- /dev/null
+++ b/meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Pending
+
+insserv (1.14.0-5.1) UNRELEASED; urgency=low
+
+  * Non-maintainer upload.
+  * moving definition of "extension" in listing.h outside of 
+    an if loop with condition related to __STDC_VERSION__.
+  * I observed that this gets build with gcc-4.9.2, as for gcc 
+    __STDC_VERSION__ is not defined.
+  * I got these error while using clang to build this package.
+  * I tested it with clang-3.5(__STDC_VERSION__ 199901L) and
+    clang 3.7(__STDC_VERSION__ 201112L) and getting same error 
+    described in in Bug #777914.
+
+ -- Mohit Bhakkad <mohit.bhakkad@gmail.com>  Sat, 04 Apr 2015 19:14:48 +0000
+
+ insserv (1.14.0-5) unstable; urgency=low
+ 
+   * Add +mountall-bootclean to $local_fs virtual facility definition in
+Index: insserv-1.14.0/listing.h
+===================================================================
+--- insserv-1.14.0.orig/listing.h
++++ insserv-1.14.0/listing.h
+@@ -47,9 +47,9 @@ typedef unsigned int uint;
+ # ifndef  asm
+ #  define asm			__asm__
+ # endif
+-# ifndef  extension
+-#  define extension		__extension__
+-# endif
++#endif
++#ifndef  extension
++# define extension             __extension__
+ #endif
+ #ifndef  attribute
+ # define attribute(attr)	__attribute__(attr)
diff --git a/meta/recipes-devtools/insserv/insserv_1.14.0.bb b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
index 4a33e16..b66e98b 100644
--- a/meta/recipes-devtools/insserv/insserv_1.14.0.bb
+++ b/meta/recipes-devtools/insserv/insserv_1.14.0.bb
@@ -11,6 +11,7 @@ PR = "r1"
 SRC_URI = "ftp://ftp.suse.com/pub/projects/init/${BPN}-${PV}.tar.bz2 \
            file://makefile.patch \
            file://disable_runtests.patch \
+           file://161_bts777914_fix_undeclared_identifier.patch \
            file://insserv.conf \
            file://run-ptest \
 "
-- 
2.1.4


