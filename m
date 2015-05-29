Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B400975745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:32:20 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so19914108igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 10:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QMHHlQ6oG2Gq9Ap/cux3neWd3dLVnnG0ZC/a7sY+YG8=;
	b=HAKwJgEMa/7FRy6TJ1WJh+XeqM/PSExdOWgiDli1WhtGDn86gozS/VhZPYp553nBaz
	Tot7q6HjaRm78gGjVhFvTg9uXwK22YvAkMXZ4qmUtm9+utZkV2WkOOnV2v2HcqEEXbjE
	5mLhkPzyOfpyUn4bJB/HRPEHqwbXhSEe46b/7yg77HoOH7L3j8TwIt/NzYM6yTXlB41Z
	/8OacJsoa5Q0dd9Ai7o79F6AKSboFZNLiZC2r2vdWeM8ZonDfIr0UWPwuxPG2qqTLnmA
	tDiWt/VZQQud9k+wPPp9GxPo3BOuWs/U7yE/P3Xj851T3Zsnw8vlJbWyXqVtsHBtFMv2
	p0wA==
X-Received: by 10.50.102.68 with SMTP id fm4mr5456669igb.25.1432920741516;
	Fri, 29 May 2015 10:32:21 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id n14sm4628876ion.5.2015.05.29.10.32.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 May 2015 10:32:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2015 10:32:11 -0700
Message-Id: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1432920208.git.raj.khem@gmail.com>
References: <cover.1432920208.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] glibc: ignore for musl/uclibc but only for target recipes
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
X-List-Received-Date: Fri, 29 May 2015 17:32:20 -0000

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


