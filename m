Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeDWC-0006N9-I4
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:27:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so8324614eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 15:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/F5g4aH0EcvFTAXuQu1nk/LjsjqzMwVvX5ArbnumbvQ=;
	b=IIIH8Iyz+vfhHpW740dUl4o/bBPiurmTmMUVUdgT1l8VNuZ/XXCYH9Kyjb4HzEsRqw
	lOgedSJFu3gO0nLrLUgPu1+kwH5WxElIqJs6O/shEWuCi4h/2OfXu6TUBy+40pFWlz39
	YYI6gd2zDdtzFkN99ZvIg/LI4jLPBgavRI+LZ0W8Q3joiYjIUrDJHArncECDO8YxjtL2
	qFqMPErB/xt7HXMjCty+MINK4HhnGexdtSHtldFOTonrY2+l/soTW2Jb7YXkkTZnbAVa
	x9SQdSxTneXAWwdp+Arozqa69elXPOLyKEcojjM+G6D/m61EcjJgfaME71M8CNW6U2JU
	uUjA==
Received: by 10.14.218.69 with SMTP id j45mr87044465eep.35.1354230810567;
	Thu, 29 Nov 2012 15:13:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm6729059eem.3.2012.11.29.15.13.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 15:13:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:12:37 +0100
Message-Id: <1c50032fb830b11307081aa9acddd2a372c2d9d0.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/8] arch-armv4.inc: add --fix-v4bx to TARGET_LD_KERNEL_ARCH only for armv4 and strongarm1100
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
X-List-Received-Date: Thu, 29 Nov 2012 23:27:45 -0000

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
 meta/conf/machine/include/arm/arch-armv4.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index bfa2377..fcd56d7 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,7 +2,13 @@ DEFAULTTUNE ?= "armv4"
 
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
1.8.0



