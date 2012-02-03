Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtEle-0000vj-Q2
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:15 +0100
Received: by mail-pw0-f47.google.com with SMTP id b4so2433695pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=99JQC5qsDUTB2HKCeY+Hn8EGNrp9LGPwtmrMhcPBfLg=;
	b=GY4Hf6+qlI+3luYOZKCMoUtTjIlSmeqjkOWHh/DkGYHflfXY6R2C8yLJQ4rqu9sGma
	2ENn3bOLzciq8g6Dtk3Vo+HzaVEEQ426PIyUbB+DvNpLIaRyeV7opw6EYIHjuVhnQOY7
	th5k9/C68GQ0kvAktWlVQSqZMit5fcqGn2SEo=
Received: by 10.68.72.69 with SMTP id b5mr15674644pbv.120.1328258239607;
	Fri, 03 Feb 2012 00:37:19 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:10 -0800
Message-Id: <e6c6aba2271c205b5721d033f8e941e5805b4d2f.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 05/14] tune-thumb.inc: Delete
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:15 -0000

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
1.7.5.4



