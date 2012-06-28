Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sk3QN-0005sU-3N
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 03:21:35 +0200
Received: by pbbrq2 with SMTP id rq2so2239835pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 18:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EXk6SyCLYp0f6H7ibzQR828CzlAetv/Q7R2GhY145EM=;
	b=0gQ3JAJe4FX/0N5+DGtV9t6+cRpDp0GyQtozspOxTIGGVdV5E+5v6R9rzlSEDqj9B9
	N5g7Ap16q4B0gC3GVqefEQkcfsxvnkWy316oLQ61MZe7o+NJqEjSO/H2vbqFk3eZHB5v
	gpafLX6oMeNBaipgx9DvRUaR3RFDdd3ZRLZdKwN+rsXzbKjjpXehQOOwB+se0OCPCscn
	tvSzmIf3YXQeQbavHtkdT0ZYyKk3w1Ru8OpQRVMQUIvXkeJA7a6bOBHbBftSwWWaqiSE
	PNqrVSgxubd5Z+q1B+hwmW0qh+YnYW/gUyPFtsQXY4cgFd2kxHyySTnh0rrw7Vl3PFTS
	GEMw==
Received: by 10.68.232.161 with SMTP id tp1mr1300952pbc.44.1340845840361;
	Wed, 27 Jun 2012 18:10:40 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gj8sm368275pbc.39.2012.06.27.18.10.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 18:10:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 18:10:20 -0700
Message-Id: <5a95b99d459788545469d482af3c92be737e6903.1340845612.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
References: <ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340845612.git.raj.khem@gmail.com>
References: <cover.1340845612.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] gcc-configure-sdk, gcc-configure-cross: Dont recompute USE_NLS
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
X-List-Received-Date: Thu, 28 Jun 2012 01:21:35 -0000

This was needed because on eglibc based builds we did not
define USE_NLS but now we define it in default config to have
a valid value so we do not need this here. Moreover it was
wrong and was not covering all cases of uclibc triplets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-cross.inc |    2 --
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc   |    4 ----
 2 files changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index 3cb3452..243ee55d 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -1,7 +1,5 @@
 require gcc-configure-common.inc
 
-USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
-
 EXTRA_OECONF += " --enable-poison-system-directories \
 		"
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index 90e20f5..51c0217 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -1,9 +1,5 @@
 require gcc-configure-common.inc
 
-# The two lines below conflict, this needs fixing - RP
-USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
-USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
-
 EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++ \
                       --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
                       --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
-- 
1.7.9.5



