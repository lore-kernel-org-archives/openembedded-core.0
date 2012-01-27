Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rqdiv-0006fr-1A
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 05:47:41 +0100
Received: by mail-pw0-f47.google.com with SMTP id a13so1102556pba.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bzO4luXEwYH1xRXA4J46DzADTohmuQtiaQfRRkNFK9k=;
	b=XNeOHnN2pBol2BluPAuzv/tDzKPFfpFaTcJNEk3prMY0xWNiRqDfz2VrtGwyecnBcq
	emSPfwhwzM+MZgTnsIGB8LCMhrf4/VyVPB3soyo6u9xLn+NO7je4cUG4Z8fo+7oXD6Wz
	Bb8ueiimzHsD+6xhKj6y8SyRSKq7PuIzlXGUc=
Received: by 10.68.193.167 with SMTP id hp7mr11475008pbc.3.1327639194418;
	Thu, 26 Jan 2012 20:39:54 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x8sm16846627pbr.11.2012.01.26.20.39.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 20:39:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 20:39:32 -0800
Message-Id: <2d742b218dc7f2ae5a08da4fba398bc32a8daca5.1327638861.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
References: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327638861.git.raj.khem@gmail.com>
References: <cover.1327638861.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] tune-thumb.inc: Delete
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
X-List-Received-Date: Fri, 27 Jan 2012 04:47:41 -0000

The same functionality is provided by
machine/include/arm/feature-arm-thumb.inc
Setting ARM_INSTRUCTION_SET = "thumb"
in distro configs should be enough

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-thumb.inc |   32 ------------------------------
 1 files changed, 0 insertions(+), 32 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc

diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
deleted file mode 100644
index 214e3b6..0000000
--- a/meta/conf/machine/include/tune-thumb.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-#tune file for thumb instructions
-
-ARM_INSTRUCTION_SET ?= "arm"
-# "arm" "thumb"
-#    The instruction set the compiler should use when generating application
-#    code.  The kernel is always compiled with arm code at present.  arm code
-#    is the original 32 bit ARM instruction set, thumb code is the 16 bit
-#    encoded RISC sub-set.  Thumb code is smaller (maybe 70% of the ARM size)
-#    but requires more instructions (140% for 70% smaller code) so may be
-#    slower.
-
-THUMB_INTERWORK ?= "yes"
-# "yes" "no"
-#    Whether to compile with code to allow interworking between the two
-#    instruction sets.  This allows thumb code to be executed on a primarily
-#    arm system and vice versa.  It is strongly recommended that DISTROs not
-#    turn this off - the actual cost is very small.
-
-OVERRIDE_THUMB = "${@['', ':thumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][d.getVar('THUMB_INTERWORK', 1) == 'yes']}"
-OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
-
-#    Compiler and linker options for application code and kernel code.  These
-#    options ensure that the compiler has the correct settings for the selected
-#    instruction set and interworking.
-ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][d.getVar('THUMB_INTERWORK', 1) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
-
-#
-TUNE_CCARGS +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
-TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -marm"
-
-- 
1.7.8.3



