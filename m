Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TnpmE-0003dR-6R
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 13:08:20 +0100
Received: by mail-ea0-f182.google.com with SMTP id a14so3400664eaa.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=1DE0PX6W9GCgfZteBSiyND+y72aVDiBDEUUH+4EgY8s=;
	b=wtissynuoPVkmka9JMXJpqZOUWefcmKoK1S2tytWrJNqFpqDg2I3qtoxLXtkZ2m1bQ
	/X9FEveg7e7Ldz1q0h2hWr36facMQ0XBzdKxkguK3RmUKvfEWJIZ5ax8e0OkDvHSYP55
	fzc9uN/B+wb1u9QLayvrQSPmhsQ9Qc70wReCgGNLLlHpfKOKQKj9jF4Q2m4SG2U0Smpp
	04LC2IRAQWgyWXJx37bXHgMzSaFy/6xsYTIg8gwkYmIH3Z9s85oFQQHiSX65BZzqCzMX
	MNuTHFmDhNgkeFHHTMfLF2lXCNYvNzXKva2Efy6O6it1+BChC7Iy6nc8S2d8Vw8txCtE
	w8fA==
X-Received: by 10.14.215.197 with SMTP id e45mr70165737eep.0.1356522789713;
	Wed, 26 Dec 2012 03:53:09 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm52840004eel.17.2012.12.26.03.53.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 03:53:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2012 12:52:52 +0100
Message-Id: <1356522772-14197-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH][for-danny] arch-armv4.inc: add --fix-v4bx to TARGET_LD_KERNEL_ARCH only for armv4 and strongarm1100
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
X-List-Received-Date: Wed, 26 Dec 2012 12:08:20 -0000

* without this patch it does apply --fix-v4bx not only to armv4, but
  also all higher (because they also have armv4 in TUNE_FEATURES)
* it causes SIGILL on armv4t
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-November/042298.html
* someone please test on armv4 device (I tested only bitbake -e output
  that it's correctly applied with DEFAULTTUNE == armv4
* maybe we can should fix this in binutils instead (both 2.22 and 2.23
  are affected)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/arm/arch-armv4.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index cb747ac..075366a 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -4,7 +4,13 @@ ARMPKGARCH ?= "armv4"
 
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}"
-TARGET_LD_KERNEL_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "", d)}"
+# enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
+# maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
+# checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
+FIX_V4BX_ARMV4 = "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "", d)}"
+FIX_V4BX_ARMV5 = "${@bb.utils.contains("TUNE_FEATURES", "armv5", "", "${FIX_V4BX_ARMV4}", d)}"
+FIX_V4BX = "${@bb.utils.contains("TUNE_FEATURES", "thumb", "", "${FIX_V4BX_ARMV5}", d)}"
+TARGET_LD_KERNEL_ARCH += "${FIX_V4BX}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", ":armv4", "" ,d)}"
 
 require conf/machine/include/arm/arch-arm.inc
-- 
1.8.0.2



