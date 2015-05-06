Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 00EFE73DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:05:05 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so8413854igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eG5V8dmBIsBxB9rJD5Gx239y98WEkeXLiQgbcZ3O8wY=;
	b=HQLPgVMF6Nnuldfg3MKDeGuwYONgepi1o4NMPKf11QUJYQ91TXNsytXEKMLbHtfuLd
	cqwtDcRwYfX00yQ6jirpiRMSDhgc1Ybypps3RIlnJ/ZiG30jPlX9suwFTDai+nQny99j
	JCmgI5LK1e/t694FYqXg0sj1C8T5p7/YahNt7nhmSAWaFSAzORDRE1Wv5peiV7OLasPM
	O3vCkggK3bEIlc0kj6UR+cmxZwsyMjDAjT4jDr26euCLhxq2xuVn54kJrqh4ll2zRQEX
	vtkUf8cWA9R4eIkK089JxjZcuZXWwqLTf/V12gXoLfdv4eDn9WQ2c1mUcSpvAeaYSp5d
	6vYg==
X-Received: by 10.42.187.65 with SMTP id cv1mr1161179icb.87.1430895906841;
	Wed, 06 May 2015 00:05:06 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id m5sm622733ioi.4.2015.05.06.00.05.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 May 2015 00:05:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 00:04:54 -0700
Message-Id: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430895556.git.raj.khem@gmail.com>
References: <cover.1430895556.git.raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 06 May 2015 07:05:08 -0000

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


