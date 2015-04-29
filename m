Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D061A73D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 05:34:30 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so39194739ied.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eG5V8dmBIsBxB9rJD5Gx239y98WEkeXLiQgbcZ3O8wY=;
	b=YbJdr1TjtfwpkCTvStkqA5Jigo/Zhy3b40ejaAszP8zOikaNOe96lAtX4kFjfZOz+o
	NcY3B46nQJzmu7eiRL0e9Je23vDe8IKGzIBf5/o0RStzy0zVsMipniT3da8zbP30PSeg
	i8ZGJjQYkEDhkfGubWVX8ab7LOA/WQ4YQVeW0jmpED4QNvkHc/uuZeTjq/dQLuVnYrzF
	4xkgkyVeYdpFGVAhhkwQOudNs445W2sygnP4/hhdPr2RjW07xPCHwcDjaUIZLVosEe+L
	oHqCV97jwAkUvZlMidzNNMbtKIGkFEodt/ss7/4RxIrDJvAsxmQ/g5XnuGf++4ZzjyKG
	R2SA==
X-Received: by 10.50.29.110 with SMTP id j14mr2010277igh.4.1430285671895;
	Tue, 28 Apr 2015 22:34:31 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id pg7sm3215242igb.6.2015.04.28.22.34.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Apr 2015 22:34:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 22:34:23 -0700
Message-Id: <c908ef675077815a75f8dbe800a9e9208d80737f.1430285475.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9594a8c72803b604619bc23672e227ec29b239f6.1430285475.git.raj.khem@gmail.com>
References: <9594a8c72803b604619bc23672e227ec29b239f6.1430285475.git.raj.khem@gmail.com>
In-Reply-To: <cover.1430285475.git.raj.khem@gmail.com>
References: <cover.1430285475.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] glibc: ignore for musl/uclibc but only for target recipes
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
X-List-Received-Date: Wed, 29 Apr 2015 05:34:33 -0000

we still need nativesdk  or native recipes for libc to come
from glibc, but only be ignored for target recipes types

Change-Id: Ibaf8114f2aef63f1eadf493b264e78cd928535a0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 3 +++
 meta/recipes-core/glibc/glibc_2.21.bb        | 9 +++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index f82db06..60655eb 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -17,3 +17,6 @@ do_compile[noexec] = "1"
 
 do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
 
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+COMPATIBLE_HOST_libc-uclibc_class-target = "null"
+
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 58a9601..5295ddd 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -64,14 +64,11 @@ TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
 #
-# We will skip parsing glibc when system C library selection is not glibc
+# We will skip parsing glibc when target system C library selection is not glibc
 # this helps in easing out parsing for non-glibc system libraries
 #
-python __anonymous () {
-    if d.getVar('TCLIBC', True) != "glibc":
-        raise bb.parse.SkipPackage("incompatible with %s C library" %
-                                   d.getVar('TCLIBC', True))
-}
+COMPATIBLE_HOST_libc-musl_class-target = "null"
+COMPATIBLE_HOST_libc-uclibc_class-target = "null"
 
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile \
-- 
2.1.4


