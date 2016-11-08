Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 16D9871A87
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:42 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 197C7B1317BB2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 17:12:39 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 8 Nov 2016 17:12:42 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 17:12:23 +0000
Message-ID: <20161108171235.41837-3-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch v2 02/14] arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Nov 2016 17:12:43 -0000
Content-Type: text/plain

In some cases, each MIPS variant in a recipe requires a duplicate
line. Even if the passed flag is the same.

Add global MACHINEOVERRIDES variables for the following
 * mipsarch		: All MIPS
 * mipsarch{eb,el}	: All MIPS Big/Little Endian
 * mipsarchr6		: All MIPS R6
 * mipsarcho32		: All MIPS o32 Endian Independent
 * mipsarchn32		: All MIPS n32 Endian Independent
 * mipsarchn64		: All MIPS n64 Endian Independent
 * mipsarcho32{eb,el}	: All MIPS o32 Big/Little Endian
 * mipsarchn32{eb,el}	: All MIPS n32 Big/Little Endian
 * mipsarchn64{eb,el}	: All MIPS n64 Big/Little Endian

This is intended to reduce duplications in recipes

[YOCTO #10404]

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/conf/machine/include/mips/README        |  3 +++
 meta/conf/machine/include/mips/arch-mips.inc | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/conf/machine/include/mips/README b/meta/conf/machine/include/mips/README
index 62fa156..f36e87b 100644
--- a/meta/conf/machine/include/mips/README
+++ b/meta/conf/machine/include/mips/README
@@ -32,6 +32,9 @@ MIPSPKGSFX_BYTE - This is defined as either blank and "64" for MIPS64 CPUs.
 MIPSPKGSFX_ENDIAN - For bigendian hardware this is blank, otherwise it's
 defined as "el".
 
+MIPSPKGSFX_ENDIAN2 - For bigendian hardware this is "eb", otherwise it's
+defined as "el".
+
 MIPSPKGSFX_VARIANT_tune-<tune> - In the default tunings it is set to the
 same value as TUNE_ARCH.  In custom, optimized tunings, the value should
 be modified to more precisely describe the tuning.
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 6069ca1..d8b2bcb 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -39,6 +39,7 @@ TUNEVALID[mipsisa32r6] = "Use 32r6"
 
 # Package naming
 MIPSPKGSFX_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el', d)}"
+MIPSPKGSFX_ENDIAN2 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'eb', 'el', d)}"
 MIPSPKGSFX_BYTE = "${@bb.utils.contains('TUNE_FEATURES', 'n64' , '64', '', d)}"
 MIPSPKGSFX_BYTE .= "${@bb.utils.contains('TUNE_FEATURES', 'n32' , '64', '', d)}"
 MIPSPKGSFX_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard' , '', '-nf', d)}"
@@ -50,6 +51,17 @@ MIPSPKGSFX_32R6 = "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', 'isa32',
 TUNE_ARCH = "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}"
 TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
 
+# Various Global Machine Overrides
+MACHINEOVERRIDES =. "mipsarch:"
+MACHINEOVERRIDES =. "mipsarch${MIPSPKGSFX_ENDIAN2}:"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
+
 # Base tunes
 AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
 TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
-- 
2.10.2


