Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtEld-0000vi-2T
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:13 +0100
Received: by mail-pw0-f47.google.com with SMTP id b4so2433690pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UWPs0fxUnik1gmm9qRAcnRcypf9xm04OSLTZqf24nbE=;
	b=eBXOgZuyMofBJBGlIhWFB53bJBp65RiDSLKzBmNCNdGj5Ar1DZjrCP7h0leGkAJiBa
	Hx/Ck8TorlmexJKSrDtdkrAWw1j7/5Bb/lcPqThEPY0YvnM88gBiYlMjSIA8NK06dKuw
	/pdrbZ8jNTuYy+ytBjVnkwCZmHwjmcSwapcyk=
Received: by 10.68.227.198 with SMTP id sc6mr15603501pbc.131.1328258237832;
	Fri, 03 Feb 2012 00:37:17 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:09 -0800
Message-Id: <4e3c2f0d03af9bcbb775b11e0e26fb0f0cb9b675.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 04/14] tunearch/arm: Differentiate between thumb code generation and thumb capability
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:13 -0000

We have diverged a bit from oe.dev where thumb in OVERRIDES meant
the code was being compiled in thumb mode. With tunearch this got
a different meaning where it meant that if a core is capable of
generating thumb code them we will have this in overrides. With this
patch I am trying to address the problem where 'thumbmode' in TUNE_FEATURES
means that code will be compiled in thumb mode by default and
'thumb' is to denote that core is capable of thumb instruction set.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/machine/include/arm/feature-arm-thumb.inc |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index da29102..68a8e73 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -4,10 +4,19 @@
 # encoded RISC sub-set. Thumb code is smaller (maybe 70% of the ARM size)
 # but requires more instructions (140% for 70% smaller code) so may be
 # slower.
-TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
-ARM_THUMB_M_OPT = "${@['-marm', '-mthumb'][d.getVar('ARM_INSTRUCTION_SET', 1) == 'thumb']}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}"
-OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "thumb", ":thumb", "", d)}"
+
+# 'thumbmode' in TUNE_FEATURES means default ISA for code generation is thumb
+# 'thumb' in TUNE_FEATURES means the core supports thumb ISA but code
+# generation can happen in arm or thumb
+# having 'thumbmode' would imply 'thumb' naturally
+
+TUNEVALID[thumbmode] = "Use THUMB instruction set instead of ARM"
+ARM_INSTRUCTION_SET ?= "arm"
+AVAILTUNES += "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", "thumbmode", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", "-mthumb", "-marm", d)}"
+OVERRIDES .= "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", ":thumb", "", d)}"
+
+TUNEVALID[thumb] = "THUMB instruction set capable ARM core"
 
 # Note armv7 will hit on armv7a as well
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
@@ -20,6 +29,7 @@ ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv7", "thumb" ],
 # arm system and vice versa. It is strongly recommended that DISTROs not
 # turn this off - the actual cost is very small.
 TUNEVALID[no-thumb-interwork] = "Disable mixing of thumb and ARM functions"
+AVAILTUNES += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "no-thumb-interwork", "thumb-interwork", d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}"
 OVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "", ":thumb-interwork", d)}"
 
-- 
1.7.5.4



