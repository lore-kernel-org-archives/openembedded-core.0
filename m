Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZN-0005pS-3c
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:09 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3329310dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EXk6SyCLYp0f6H7ibzQR828CzlAetv/Q7R2GhY145EM=;
	b=c+a7/w4DSUHMHkXBFcM6TU/XDQVQE7P6U4PSEDJ4mfFB7sj1Q4IObz2EbLi9Xn91zN
	clijPowDtnVMpaCzIBhA4Lsc8kbtD6o1gfcwn+kpRYRp0QGeQenkyiBB5RtgcKeY0CL/
	Wwt/51TtWa+M7P9CK0oYp2d80vB3H26TIt62cUjPtjoxQC25V/o6RimsPzF7STV6BXbj
	bZA0oJwZmVg1Vxb7uUgq67UvOX1bpHhwhYnVUA9g4sPcAeJyssMfG0VKWPNUntsM4VIH
	fC/zRQM92mMMwjbqm7lOQ9ghAInakC44FOpCWnFbITz/54kIkMVXdthRQzo3MPN1p9J5
	+d4A==
Received: by 10.68.237.105 with SMTP id vb9mr11738028pbc.103.1340919435998;
	Thu, 28 Jun 2012 14:37:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:49 -0700
Message-Id: <b1a9f0374fb6dc37aa17bfe4cc2737281465c324.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 03/11] gcc-configure-sdk, gcc-configure-cross: Dont recompute USE_NLS
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
X-List-Received-Date: Thu, 28 Jun 2012 21:48:09 -0000

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



