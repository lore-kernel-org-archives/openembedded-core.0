Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7359A73232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 19:56:58 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so44954287igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QMHHlQ6oG2Gq9Ap/cux3neWd3dLVnnG0ZC/a7sY+YG8=;
	b=t+kT61ay6F2WXhC3kZEvpoj8y7c95ycX+OV+tIoKW0UMKiLwnkoOs5ATShkbJoI/ZW
	NlQTL7VgVprIsA4sK6fg795g5OkaxOEqfxr2etW5oOvBnnDCF39OUAsFhOs/7pZ2YPp7
	XDqFBjlBMyDxciPlED5WHsZjU6Fp3jam4E/XR0r/k73XHRYGkHR7n2pumd2sNdjTehDz
	v2w3N9I21kmpjuwsxp6deKXhQxipnU1lkf/hMVFsqyKLyiQUFr3bx0oWEUY+OS0MRF/c
	WYpAMci+PpBG2hF/aRpgJzyJAYRpKe32hGbHQ5whMnVJVXCWo2IxSG/fe3GxAeK6BZ6N
	RQnA==
X-Received: by 10.50.132.33 with SMTP id or1mr7999018igb.31.1432324619444;
	Fri, 22 May 2015 12:56:59 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by mx.google.com with ESMTPSA id
	y124sm2508709iod.13.2015.05.22.12.56.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 12:56:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 12:56:52 -0700
Message-Id: <12b5a95ff9ea8e6f3ff82fa8a5426d195be128e3.1432324432.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
References: <29648ea4a7ec6d1d02cca78e9268e1629ee20fe9.1432324432.git.raj.khem@gmail.com>
In-Reply-To: <cover.1432324432.git.raj.khem@gmail.com>
References: <cover.1432324432.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] glibc: ignore for musl/uclibc but only for target recipes
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
X-List-Received-Date: Fri, 22 May 2015 19:57:01 -0000

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
index 0c28814..4b94cba 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -69,14 +69,11 @@ TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
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


