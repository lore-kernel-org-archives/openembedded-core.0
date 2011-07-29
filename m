Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmqS9-0006iV-8K
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 19:02:25 +0200
Received: by gxk3 with SMTP id 3so2773346gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Gp9hylur6KggZXCW2iMpjcTBkGmcX21WmCT0qdWK5xQ=;
	b=UUPOmP1VsSGtYwG/v8aeNjmLTtXQwRpxmEMXAcRCEOYfH370VJwXw1vq1BT7GRxywz
	EfAT3mVOVsMFeRbGlW+8Y1F6/a3yogn2uppNfodd8NkPproXsgXh6iRvRX0Ax1VN4fJM
	X/pZwx5b3xwGanXtnwF8uNlvxTZJlSUygEA0g=
Received: by 10.143.99.17 with SMTP id b17mr903054wfm.352.1311958687303;
	Fri, 29 Jul 2011 09:58:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d14sm1350378wfh.13.2011.07.29.09.58.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 09:58:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 09:58:00 -0700
Message-Id: <1311958680-10604-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] feature-arm-thumb: Take ARM_INSTRUCTION_SET into account to decide thumb mode
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
X-List-Received-Date: Fri, 29 Jul 2011 17:02:25 -0000

This will decouple the compiling in thumb mode from having thumb
capable cores.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/machine/include/arm/feature-arm-thumb.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index b580168..533eab9 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -4,7 +4,10 @@
 # encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
-TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
+TUNEVALID[thumb] = "Use thumb instructions instead of ARM if ARM_INSTRUCTION_SET != arm"
+ARM_THUMB_M_OPT = "${@['-mthumb', '-mno-thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) != 'arm']}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "${ARM_THUMB_M_OPT}", d)}"
+
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "-mthumb", "-mno-thumb", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
-- 
1.7.4.1



