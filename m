Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rqdit-0006fp-3J
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 05:47:39 +0100
Received: by mail-pz0-f47.google.com with SMTP id f10so910492dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1Hrs5mG8+hQh0oXr/Laz5vIgOSzS2VqQn3debFm/+/g=;
	b=N+kQNDj2O3mjJR6jZbU4ClFvGP5EvGaLYaGpeUZJ/1vEPqeE8YLpd/UXd2z4SbQA8k
	WTrvAOph1DWIkioDN3cRJemtPwJD/0VYJhZ033fOlhjNv6vKr5u4/+OoRvIMZ1hmG3n8
	BScLTabmBwYBkWvpdnIgvTLC19CKQdImLnJhA=
Received: by 10.68.217.230 with SMTP id pb6mr11075039pbc.70.1327639192508;
	Thu, 26 Jan 2012 20:39:52 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x8sm16846627pbr.11.2012.01.26.20.39.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 20:39:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2012 20:39:31 -0800
Message-Id: <f05af93ff466f2e1e4db1a8b0387a673af432961.1327638861.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
References: <384784ee3806d7d356631a03a116bb6db20b28d9.1327638861.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327638861.git.raj.khem@gmail.com>
References: <cover.1327638861.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] tunearch/arm: Differentiate between thumb code generation and thumb capability
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
X-List-Received-Date: Fri, 27 Jan 2012 04:47:39 -0000

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
index da29102..cb6f4e7 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -4,10 +4,20 @@
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
+TUNE_FEATURES_tune-thumbmode += "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", "thumbmode", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", "-mthumb", "-marm", d)}"
+OVERRIDES .= "${@bb.utils.contains("ARM_INSTRUCTION_SET", "thumb", ":thumb", "", d)}"
+
+TUNEVALID[thumb] = "THUMB instruction set capable ARM core"
 
 # Note armv7 will hit on armv7a as well
 ARMPKGSFX_THUMB .= "${@bb.utils.contains("TUNE_FEATURES", [ "armv4", "thumb" ], "t", "", d)}"
-- 
1.7.8.3



