Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 54005731C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PDPwDI032002; Wed, 25 Jan 2017 13:25:58 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VJe_DvlzVBHm; Wed, 25 Jan 2017 13:25:58 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0PDPqEV031999
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Jan 2017 13:25:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cWNaC-0003VM-P3; Wed, 25 Jan 2017 13:25:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 13:25:50 +0000
Message-Id: <1485350750-13431-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] cross: Update MULTIMACH_TARGET_SYS to reflect modern recipes
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
X-List-Received-Date: Wed, 25 Jan 2017 13:25:59 -0000

Mixing PACKAGE_ARCH with BUILD_* has always seemed somewhat odd. This
comes into play when building different SDKMACHINES as the PN space
for the recipes did once overlap. With the modern build process we
use, this overlap is a thing of the past since PN has SDK_SYS appended
to it.

cross.bbclass sets PACKAGE_ARCH == BUILD_ARCH so this change only affects
crosssdk.bbclass where PACKAGE_ARCH == SDK_ARCH.

The current structure is quite confusing and this removes this artefact
of history, allowing other gcc cleanups rather than meaning we futher
complicate the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index d125f10..ee8e150 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -23,7 +23,7 @@ STAGING_DIR_HOST = "${RECIPE_SYSROOT_NATIVE}"
 
 PACKAGE_ARCH = "${BUILD_ARCH}"
 
-MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
+MULTIMACH_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 
 export PKG_CONFIG_DIR = "${exec_prefix}/lib/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = ""
-- 
2.7.4


