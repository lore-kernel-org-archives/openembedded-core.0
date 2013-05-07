Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UZlbW-0003hN-F5
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:23:09 +0200
Received: by mail-ea0-f178.google.com with SMTP id m14so452145eaj.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=0P9BopXh4P62K4wsVlpvOU2HCitY9HsgkV+c1WlPPp8=;
	b=qQ7OzTusLvC/NMUutQpLw17OkJBicp5C3mhipqtb7P1IxzgpTP2MN+Uh15DzxMMq5R
	oQOgnPES0uzZ146i12JXnFG8hHQl3OukNbuKhUyh7dMTN+otIVo65JYg7lZolTJzvKdB
	rbzYa2xaQHFeE9QGspmdw1ajASwsjTqeQPYMUsYF1/8JxY+C4shmCl3uaNWKMwG4eUEo
	Q2DfwjTel+yJGIfY2/GFTrtx0Di1JrXRU6y85A9ZWOAavpUCWpVeAzIlS+i5nE8E5NYL
	IFgPc2QcfOXAxh2h0/4IpqUIsZrFzKCV9gzj3Hc705365c0bVtuGzDT2tbYIpwvfGrBn
	w2TQ==
X-Received: by 10.14.3.137 with SMTP id 9mr7416389eeh.0.1367946278489;
	Tue, 07 May 2013 10:04:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm34108277eeg.14.2013.05.07.10.04.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 May 2013 10:04:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 19:04:29 +0200
Message-Id: <c996e358de314f78db08b6e92a7cbd152584681c.1367946177.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367946177.git.Martin.Jansa@gmail.com>
References: <cover.1367946177.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367946177.git.Martin.Jansa@gmail.com>
References: <cover.1367946177.git.Martin.Jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 1/2] tune-thumb.inc: Remove, replaced by arm/feature-arm-thumb.inc
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
X-List-Received-Date: Tue, 07 May 2013 17:23:27 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/tune-thumb.inc | 32 --------------------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc

diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
deleted file mode 100644
index a2392c2..0000000
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
-OVERRIDE_THUMB = "${@['', ':thumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][d.getVar('THUMB_INTERWORK', True) == 'yes']}"
-OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
-
-#    Compiler and linker options for application code and kernel code.  These
-#    options ensure that the compiler has the correct settings for the selected
-#    instruction set and interworking.
-ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][d.getVar('THUMB_INTERWORK', True) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True) == 'thumb']}"
-
-#
-TUNE_CCARGS +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
-TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -marm"
-
-- 
1.8.2.1



