Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 16ADE60BC4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 23:23:31 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00VNNVEk018932
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 17:23:32 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 17:23:31 -0600
Message-Id: <20200131232331.117030-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131232331.117030-1-mark.hatle@kernel.crashing.org>
References: <20200131232331.117030-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 2/2] microblaze tune: cleanup +=
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
X-List-Received-Date: Fri, 31 Jan 2020 23:23:32 -0000

From: Mark Hatle <mark.hatle@xilinx.com>

Various += were used, refactor these to be either = or .= depending on
usuage.

CONFLICTS should be '=', as no leading space is required and they are not
amending any other conflict settings.

The TUNE_CCARGS should be .= so that if the feature does not define a CCARG
blank spaces are not added to the CFLAGS.  This is consistent to how the arm
tuning is implemented.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../include/microblaze/arch-microblaze.inc    | 22 +++++++++----------
 .../microblaze/feature-microblaze-math.inc    | 12 +++++-----
 .../feature-microblaze-versions.inc           |  2 +-
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
index 55ce158f12..19cc2b59b9 100644
--- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
+++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
@@ -9,34 +9,34 @@ MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "microblaze
 
 # Endian
 TUNEVALID[bigendian] = "Use Microblaze Big Endian"
-TUNECONFLICTS[bigendian] += "v10.0"
+TUNECONFLICTS[bigendian] = "v10.0"
 
 MBPKGARCH_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
 
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-mbig-endian", "-mlittle-endian", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mbig-endian", " -mlittle-endian", d)}"
 
 # General features
 TUNEVALID[barrel-shift] = "Enable Hardware Barrel Shifter"
 TUNEVALID[pattern-compare] = "Enable Pattern Compare Instructions"
 TUNEVALID[reorder] = "Enable Reorder Instructions"
-TUNECONFLICTS[reorder] += "v8.00 v8.10 v8.20"
+TUNECONFLICTS[reorder] = "v8.00 v8.10 v8.20"
 
 # Core configuration tune optimizations
 TUNEVALID[frequency-optimized] = "Enabling tuning for frequency optimized core (AREA_OPTIMIZED_2)"
-TUNECONFLICTS[frequency-optimized] += "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
+TUNECONFLICTS[frequency-optimized] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
 
 # Feature compiler args
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-mxl-barrel-shift", "-mno-xl-barrel-shift", d)}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-mxl-pattern-compare", "-mno-xl-pattern-compare", d)}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-mxl-frequency", "", d)}"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "microblaze64", "-m64", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", " -mxl-barrel-shift", " -mno-xl-barrel-shift", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", " -mxl-pattern-compare", " -mno-xl-pattern-compare", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", " -mxl-frequency", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "64-bit", " -m64", "", d)}"
 
 # Disable reorder for v8.30 if pattern-compare is not enabled
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
         bb.utils.contains("TUNE_FEATURES", "v8.30", \
             bb.utils.contains("TUNE_FEATURES", "pattern-compare", \
-                "-mxl-reorder", "-mno-xl-reorder", d), \
-            "-mxl-reorder", d), "-mno-xl-reorder", d)}"
+                " -mxl-reorder", " -mno-xl-reorder", d), \
+            " -mxl-reorder", d), " -mno-xl-reorder", d)}"
 
 # Feature package architecture formatting
 MBPKGARCH_TUNE = ""
diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-math.inc b/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
index a31516659c..cba0ae67e3 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
@@ -13,14 +13,14 @@ TUNECONFLICTS[fpu-hard] = "fpu-soft"
 TUNECONFLICTS[fpu-hard-extended] = "fpu-soft"
 
 # Compiler args
-TUNE_CCARGS += "${@bb.utils.contains_any('TUNE_FEATURES', ['multiply-low', 'multiply-high'], '-mno-xl-soft-mul', '-mxl-soft-mul', d)}"
-TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'multiply-high', '-mxl-multiply-high', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', ['multiply-low', 'multiply-high'], ' -mno-xl-soft-mul', ' -mxl-soft-mul', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'multiply-high', ' -mxl-multiply-high', '', d)}"
 
-TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'divide-hard', '-mno-xl-soft-div', '-mxl-soft-div', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'divide-hard', ' -mno-xl-soft-div', ' -mxl-soft-div', d)}"
 
-TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', '', '', d)}"
-TUNE_CCARGS += "${@bb.utils.contains_any('TUNE_FEATURES', ['fpu-hard', 'fpu-hard-extended'], '-mhard-float', '', d)}"
-TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard-extended', '-mxl-float-convert -mxl-float-sqrt', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', '', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', ['fpu-hard', 'fpu-hard-extended'], ' -mhard-float', '', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard-extended', ' -mxl-float-convert -mxl-float-sqrt', '', d)}"
 
 # Set target fpu (bitbake known target) to soft or hard (basic or extended)
 TARGET_FPU = "${@bb.utils.contains_any('TUNE_FEATURES', 'fpu-hard fpu-hard-extended', 'fpu-hard', 'fpu-soft', d)}"
diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 003fde3e07..6638accc98 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -64,6 +64,6 @@ TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3
 TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
 
 # Version flags
-TUNE_CCARGS += "${@'-mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
+TUNE_CCARGS .= "${@' -mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
 MBPKGARCH_VERSION = "${@'-${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
 
-- 
2.17.1


