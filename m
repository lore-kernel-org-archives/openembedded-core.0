Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id D70AE61107
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 21:06:44 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 014L6UMv009706;
	Tue, 4 Feb 2020 15:06:39 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 15:06:28 -0600
Message-Id: <20200204210630.41960-4-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
References: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH v4 3/5] microblaze tune: Enable 64-bit
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
X-List-Received-Date: Tue, 04 Feb 2020 21:06:45 -0000

From: Mark Hatle <mark.hatle@xilinx.com>

64-bit is not yet available in Linux, but some non-Linux uses exist.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../machine/include/microblaze/arch-microblaze.inc    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
index 89e9484190..0349caac0a 100644
--- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
+++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
@@ -4,6 +4,11 @@
 TUNEVALID[microblaze] = "MicroBlaze"
 MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "microblaze", "microblaze:", "", d)}"
 
+# 64-bit
+TUNEVALID[64-bit] = "64-bit MicroBlaze"
+TUNECONFLICTS[64-bit] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "microblaze64:", "", d)}"
+
 # Endian
 TUNEVALID[bigendian] = "Use Microblaze Big Endian"
 TUNECONFLICTS[bigendian] += "v10.0"
@@ -26,6 +31,7 @@ TUNECONFLICTS[frequency-optimized] += "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-mxl-barrel-shift", "-mno-xl-barrel-shift", d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-mxl-pattern-compare", "-mno-xl-pattern-compare", d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-mxl-frequency", "", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "-m64", "", d)}"
 
 # Disable reorder for v8.30 if pattern-compare is not enabled
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
@@ -48,6 +54,9 @@ require conf/machine/include/microblaze/feature-microblaze-math.inc
 # Architecture name, either 'microblaze' or 'microblazeel' depending on endianess
 TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
 
+# Add 64-bit to the PKGARCH if enabled.
+MBPKGARCH_SIZE = "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "64", "", d)}"
+
 # Package Architecture formatting
-TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
+TUNE_PKGARCH = "microblaze${MBPKGARCH_SIZE}${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
 
-- 
2.17.1


