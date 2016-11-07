Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 094ED71A6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 15:16:52 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id B8631527FB340;
	Mon,  7 Nov 2016 15:01:37 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Mon, 7 Nov 2016 15:01:40 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 15:01:23 +0000
Message-ID: <20161107150135.40266-2-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 01/13] arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
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
X-List-Received-Date: Mon, 07 Nov 2016 15:16:53 -0000
Content-Type: text/plain

In some cases, each MIPS variant in a recipe requires a duplicate
line. Even if the passed flag is the same.

Add global MACHINEOVERRIDES variables for the following
 * mipsarch		: All MIPS
 * mipsarchr6		: All MIPS R6
 * mipsarcho32{el}	: All MIPS o32
 * mipsarchn32{el}	: All MIPS n32
 * mipsarchn64{el}	: All MIPS n64

This is intended to reduce duplications in recipes

[YOCTO #10404]

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 6069ca1..5b42841 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -50,6 +50,13 @@ MIPSPKGSFX_32R6 = "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', 'isa32',
 TUNE_ARCH = "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}"
 TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
 
+# Various Global Machine Overrides
+MACHINEOVERRIDES =. "mipsarch:"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarch64${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
+
 # Base tunes
 AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
 TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
-- 
2.10.2


