Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbpU3-0005qo-Mi
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 10:23:39 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3413149eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 01:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=oBX56AU1nBEPECpOjASGlxjDOICfgYCicaWdMzy8OWk=;
	b=d3L2qQM1BbHIed7FXzZ9IMb9FAoxZpi+yexrQjL2GxwSjFzoekXlC3s/2rldZn0VHc
	h+X5FrRcwvweHPlNVGvoDEp1w9RARY3n0i1la8iiHi1UnMbKEwo617vRzEicHvtOvHVd
	cjXJXqML2yQHAjfezZn0LiR34DtV6CW7rcqK6ilwTYZoUeH/aPHqdI8IB3nT0FcyiU2z
	+nO2J5JKuSkUQ3AP6IQCYBXUgc5IML7hu/HTLrmdw1DZBM6g4pH/VcRoRkiYEWkWbY/b
	eHZ6Xz8N+8AV8AWyZHFqxwL4cezZSj7lUBrC/UdaEEXnQeBl2B5xiQKr39NyACnZB8/W
	NZ0w==
Received: by 10.14.213.7 with SMTP id z7mr11121900eeo.39.1353661772305;
	Fri, 23 Nov 2012 01:09:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v47sm12365146eeo.9.2012.11.23.01.09.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Nov 2012 01:09:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 10:09:27 +0100
Message-Id: <1353661767-13873-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [RFC][PATCH] arch-armv4.inc: add --fix-v4bx to TARGET_LD_KERNEL_ARCH only for armv4 and strongarm1100
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 09:23:39 -0000

* without this patch it does apply --fix-v4bx not only to armv4, but
  also all higher (because they also have armv4 in TUNE_FEATURES)
* it causes SIGILL on armv4t
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/042298.html
* someone please test on armv4 device (I tested only bitbake -e output
  that it's correctly applied with DEFAULTTUNE == armv4
* maybe we can should fix this in binutils instead (both 2.22 and 2.23
  are affected)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-armv4.inc     | 2 +-
 meta/conf/machine/include/tune-strongarm1100.inc | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index cb747ac..f028ca6 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -4,7 +4,7 @@ ARMPKGARCH ?= "armv4"
 
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}"
-TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "", d)}"
+TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("DEFAULTTUNE", "armv4", "--fix-v4bx", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}"
 
 require conf/machine/include/arm/arch-arm.inc
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index 66bab8e..66885eb 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -8,5 +8,4 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "strongarm", "-mtune=stron
 AVAILTUNES += "strongarm"
 TUNE_FEATURES_tune-strongarm = "${TUNE_FEATURES_tune-armv4} strongarm"
 PACKAGE_EXTRA_ARCHS_tune-strongarm = "${PACKAGE_EXTRA_ARCHS_tune-armv4}"
-
-
+TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("DEFAULTTUNE", "strongarm", "--fix-v4bx", "", d)}"
-- 
1.8.0



