Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SPGJ0-0001gE-OL
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:52:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q41GgI0v013524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 09:42:18 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 May 2012 09:42:18 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 May 2012 11:42:15 -0500
Message-ID: <653164e1a29a9ff35f139c60bf762f166f45d526.1335890271.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1335890271.git.peter.seebach@windriver.com>
References: <cover.1335890271.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] conf/machine: Clean up configuration values.
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
X-List-Received-Date: Tue, 01 May 2012 16:52:03 -0000
Content-Type: text/plain

This cleans up and/or corrects a few values from machine includes
for consistency with future toolchain sanity checks, and also adds
the TUNEVALID and TUNECONFLICTS to documentation.conf.
---
 meta/conf/documentation.conf                     |    3 +++
 meta/conf/machine/include/README                 |    4 ++++
 meta/conf/machine/include/arm/arch-armv5-dsp.inc |    1 +
 meta/conf/machine/include/arm/arch-armv7a.inc    |    2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc     |    2 +-
 meta/conf/machine/include/mips/arch-mips.inc     |    6 +++---
 meta/conf/machine/include/tune-c3.inc            |    2 +-
 7 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index f4d6241..3e40a77 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -34,6 +34,9 @@ TARGET_CC_ARCH[doc] = "FIXME"
 TARGET_FPU[doc] = "Floating point option (mostly for FPU-less systems), can be 'soft' or empty \
 for hardware floating point instructions."
 
+TUNEVALID[doc] = "Descriptions of valid tuning features, stored as flags."
+TUNECONFLICTS[doc] = "List of conflicting features for a given feature."
+
 ASSUME_PROVIDED[doc] = "List of packages (recipes actually) which are assumed to be implicitly available.\
  These packages won't be built by bitbake."
 ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib packages in ASSUME_PROVIDED,\
diff --git a/meta/conf/machine/include/README b/meta/conf/machine/include/README
index 6a3a63d..e4b59c9 100644
--- a/meta/conf/machine/include/README
+++ b/meta/conf/machine/include/README
@@ -24,6 +24,10 @@ TUNEVALID[feature] - The <feature> is defined with a human readable
 explanation for what it does.  All architectural, cpu, abi, etc tuning 
 features must be defined using TUNEVALID.
 
+TUNECONFLICTS[feature] - A list of features which conflict with <feature>.
+New sanity checks will try to reject combinations in which a single
+tuning ends up with features which conflict with each other.
+
 TUNE_FEATURES - This is automatically defined as TUNE_FEATURES_tune-<tune>.
 See TUNE_FEATURES_tune-<tune> for more information.
 
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index 9f03a0f..0f64562 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -1,4 +1,5 @@
 ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
+TUNEVALID[dsp] = "ARM DSP functionality"
 
 require conf/machine/include/arm/arch-armv5.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 629960d..c90aff5 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "armv7a"
 
 ARMPKGARCH ?= "armv7a"
 
-TUNEVALID[armv7-a] = "Enable instructions for ARMv7-a"
+TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNE_CONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
 MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index a5dae88..15f67d7 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -27,7 +27,7 @@ TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
-TUNECONFLICT[m64] = "m32 mx32"
+TUNECONFLICTS[m64] = "m32 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
 
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 8758ecd..9f12920 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -12,15 +12,15 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-meb", "-mel
 
 # ABI flags
 TUNEVALID[o32] = "MIPS o32 ABI"
-TUNECONFLICT[o32] = "n32 n64"
+TUNECONFLICTS[o32] = "n32 n64"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "o32", "-mabi=32", "", d)}"
 
 TUNEVALID[n32] = "MIPS64 n32 ABI"
-TUNECONFLICT[n32] = "o32 n64"
+TUNECONFLICTS[n32] = "o32 n64"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n32", "-mabi=n32", "", d)}"
 
 TUNEVALID[n64] = "MIPS64 n64 ABI"
-TUNECONFLICT[n64] = "o32 n32"
+TUNECONFLICTS[n64] = "o32 n32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "n64", "-mabi=64", "", d)}"
 
 # Floating point
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index 06fac8f..79bb67b 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/ia32/arch-ia32.inc
 
 TUNEVALID[c3] = "VIA Cyrix III or VIA C3 specific optimizations"
-TUNECONFLICT[c3] = "m64 mx32"
+TUNECONFLICTS[c3] = "m64 mx32"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "c3", "-march=c3 -mtune=c3", "", d)}"
 
 AVAILTUNES += "c3"
-- 
1.7.0.4



