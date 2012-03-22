Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SAjdS-00035V-T9
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 16:09:07 +0100
Received: by ghbz2 with SMTP id z2so1839547ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FtsT4czXPVIUsdZ/+kKQfAf1MfmsAk/bAufZvtEFAr0=;
	b=lOfEU3BTqyu1AxOYWa9NvAHai2dp/PN1QufzBcA58+CZ6gxZo63HFzyW5yfcM2BvMM
	6UnuFbm38AV8JxSTdEKDUFHoB8fkKv6OSCU9NACFOIMDdlyjUvm3mWlgv2/ZDZFqG9DL
	ZxdLwQltikhVhXAkla7RfXn8a63FbG3XUZaMV2ZZN9jxAiYayrOd43mCjuOvcfpGgDss
	omzRq0GsK6NGs0EWmXFUg3wT7/IVSpu3gaSi3V/3ihDKxwYxbCJAgZb9dv2PdIhqaLFw
	L+aJzawkL4uMeCzl7QiGbK0dPFABX21WiuJYd/tHhMR3sdkm3evjRtzMHyMF9DduyShg
	wyUg==
Received: by 10.60.3.34 with SMTP id 2mr10085576oez.27.1332428411418;
	Thu, 22 Mar 2012 08:00:11 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id ch5sm4882349obb.16.2012.03.22.08.00.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 08:00:10 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 10:00:03 -0500
Message-Id: <1332428403-25048-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] powerpc: fix overly aggressive TUNE_PKGARCH set
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
X-List-Received-Date: Thu, 22 Mar 2012 15:09:07 -0000

From: Christopher Larson <chris_larson@mentor.com>

There's a problem in arch-powerpc.inc today, wherein it directly sets
TUNE_PKGARCH, rather than setting TUNE_PKGARCH_tune-<tuning>. As a result,
more specific tuning files (e.g. ppce500mc) then see their
TUNE_PKGARCH_tune-<tuning> variable definitions no longer obeyed. As
a consequence, the TUNE_PKGARCH ends up as 'powerpc' or 'powerpc-nf' rather
than 'ppce500mc', which in turn causes a 'TUNE_PKGARCH not in PACKAGE_ARCHS'
failure in the build.

To fix, the .inc now sets TUNE_PKGARCH_tune-powerpc and
TUNE_PKGARCH_tune-powerpc-nf rather than TUNE_PKGARCH.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index c9b2829..f811a3e 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -21,13 +21,14 @@ ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) in ['ppc-efd', 'ppc-e
 PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
 
 PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
-TUNE_PKGARCH ?= "${PPCPKGARCH}"
 
 # Basic tune definitions
-AVAILTUNES += "powerpc powerpc-nf" 
+AVAILTUNES += "powerpc powerpc-nf"
 TUNE_FEATURES_tune-powerpc-nf ?= "m32 fpu-soft"
+TUNE_PKGARCH_tune-powerpc-nf = "${PPCPKGARCH}"
 BASE_LIB_tune-powerpc-nf = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
 TUNE_FEATURES_tune-powerpc ?= "m32 fpu-hard"
+TUNE_PKGARCH_tune-powerpc = "${PPCPKGARCH}"
 BASE_LIB_tune-powerpc = "lib"
 PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
-- 
1.7.7



