Received: from e06smtp16.uk.ibm.com ([195.75.94.112])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1Re4Sr-0006ZP-Ud
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 13:43:10 +0100
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Fri, 23 Dec 2011 12:25:55 -0000
Received: from d06nrmr1507.portsmouth.uk.ibm.com ([9.149.38.233])
	by e06smtp16.uk.ibm.com ([192.168.101.146]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Fri, 23 Dec 2011 12:25:50 -0000
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1507.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id pBNCPnfC2490482
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 12:25:50 GMT
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id pBNCPnjj024245
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 05:25:49 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-224-84.boeblingen.de.ibm.com [9.152.224.84])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id pBNCPnef024230; Fri, 23 Dec 2011 05:25:49 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 13:25:42 +0100
Message-Id: <1324643142-29474-2-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1324643142-29474-1-git-send-email-ken.werner@linaro.org>
References: <1324643142-29474-1-git-send-email-ken.werner@linaro.org>
x-cbid: 11122312-3548-0000-0000-0000007F48BC
Subject: [PATCH] Change -mno-thumb to -marm
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
X-List-Received-Date: Fri, 23 Dec 2011 12:43:10 -0000

Recent versions of the GCC reject the -mno-thumb option. In order to prevent
the compiler from generating code for the Thumb instruction set the -marm
switch should be used instead. For details see GNU bug #47930.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 .../conf/machine/include/arm/feature-arm-thumb.inc |    4 ++--
 meta/conf/machine/include/tune-thumb.inc           |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index cd34199..b7d6061 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -5,7 +5,7 @@
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
 TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
+ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
 
@@ -23,4 +23,4 @@ TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", ":thumb-interwork", "", d)}"
 
-TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -mno-thumb"
+TARGET_CC_KERNEL_ARCH += "-mno-thumb-interwork -marm"
diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
index 85473ce..214e3b6 100644
--- a/meta/conf/machine/include/tune-thumb.inc
+++ b/meta/conf/machine/include/tune-thumb.inc
@@ -24,9 +24,9 @@ OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
 #    options ensure that the compiler has the correct settings for the selected
 #    instruction set and interworking.
 ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][d.getVar('THUMB_INTERWORK', 1) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
+ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
 
 #
 TUNE_CCARGS +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
-TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -mno-thumb"
+TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -marm"
 
-- 
1.7.5.4



