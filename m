Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id A26CD78332
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 09:52:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id k134so4124510pga.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 01:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=ljmO/rk+RvfvF7XEjBGOORe0iuFoj0UjJ+fl6KNHTOE=;
	b=R2oaF17AfjWHs4xZur6D50l/XuJSmcSVOscCvuygTopN91SE27Xj/pnUp7MXdD+OOB
	0t09hoeL212L/ZifRApcl3r4XUHkPbnIZ5G2jnXfuqwxbXG2RYOR7f9qQTQ3lYN+njdK
	lngBinIymFNKjGYxy1omydhUF/BTlrpdY9/V4RdvzgMNOFwz/jlnkppv5IPdCzsYdonp
	frJ4dESTbacp/KN7rTAPaNpj+fxbJLInEQE24esCixIoMvGZY54ewhzjUEni/2vX/qgW
	bU4Z13WyynVKE5Rdxwo+hAlIXDdwOXL3yFvK7hJi7sQ7MzGoQa17KELlbEcFiuGv/RSX
	TQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=ljmO/rk+RvfvF7XEjBGOORe0iuFoj0UjJ+fl6KNHTOE=;
	b=aIpb/tPjBUSNYgrp/exjC0O0qyH0CqNuOBtmaQRnElxslz2eAUrIBSouFxctGfonVF
	wUwjSJeUf4cAlSgcb0NlQSnzcGpn0Zu08CLsT/UpQk6GItprbYp1xG36/g9nHXVLJ0fE
	As5OipsGZUl3kGdQynAVEsK3wS5oUShmiMSt3plFck7mLKOQIW8zOqxLRFPI3ZNGkjAM
	LVgOo25DPgUmcuGNih0eo0QlhPO57g+C414FKf+9LPwJA+bsN+Nf/I2sFf7nkMP5XXab
	Pw/vd7zAVwlV0+ulRLlAuyGWuNLq0tqVqC0AQb6RJi8NqPMNK8gJFIUqRre/1IJ6y15y
	OnWw==
X-Gm-Message-State: AJaThX7BZsIFZgSpf/OCOXW2z7dzT1sarKCQlCj+ZoD681Fv0qHOhk0g
	ooEe+V6hSkl+geKowuKVK2gTbFvlmbw=
X-Google-Smtp-Source: AGs4zMal3f9n5yvnQ01vDWugRcbUvLVx33LXs1dwsLvyMU06d+zsSN5ttTVaTb1jFNtzVoYh6NyZ0A==
X-Received: by 10.84.138.193 with SMTP id 59mr25645138plp.446.1512640353205;
	Thu, 07 Dec 2017 01:52:33 -0800 (PST)
Received: from [127.0.1.1] ([58.165.131.151])
	by smtp.gmail.com with ESMTPSA id m9sm7902555pff.3.2017.12.07.01.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 01:52:32 -0800 (PST)
Date: Thu, 07 Dec 2017 19:52:24 +1000
Message-Id: <20171207095224.7325-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] conf/machine/include/microblaze: Add MicroBlaze architecture includes
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
X-List-Received-Date: Thu, 07 Dec 2017 09:52:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add architecture and tune includes for MicroBlaze. This covers
architecture configuration as well as tune configuration and features.

The Xilinx MicroBlaze architecture is a soft-core CPU architecture
designed for implementation on Xilinx FPGAs. Because the CPU is a
soft-core it can be configured differently depending on resource and
performance constraints which affect the ABI and supported instructions.
The architecture is also used in other Xilinx products where the core is
implemented as part of fixed silicon (e.g. Xilinx ZynqMP).

The default tune include 'tune-microblaze.inc' provides the baseline (no
features enabled) tune configuration for a target machine. This is
similar to other architectures such that the machine.conf includes a
tune-*.inc. However due to the customizability configuration is
specifically handled on a per machine basis. A machine should configure
the available tune features by setting the available features directly
by appending to the 'TUNE_FEATURES_tune-microblaze' variable.

This tune configuration approach is preferred to avoid the definition of
an otherwise large set of possible tune configurations for the available
features (14 CPU versions and 11 feature configurations), which would
otherwise require >1024 predefined tune configurations.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 .../machine/include/microblaze/arch-microblaze.inc | 53 +++++++++++++++++
 .../include/microblaze/feature-microblaze-math.inc | 33 +++++++++++
 .../microblaze/feature-microblaze-versions.inc     | 67 ++++++++++++++++++++++
 meta/conf/machine/include/tune-microblaze.inc      |  8 +++
 4 files changed, 161 insertions(+)
 create mode 100644 meta/conf/machine/include/microblaze/arch-microblaze.inc
 create mode 100644 meta/conf/machine/include/microblaze/feature-microblaze-math.inc
 create mode 100644 meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
 create mode 100644 meta/conf/machine/include/tune-microblaze.inc

diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
new file mode 100644
index 0000000000..eab7171cb2
--- /dev/null
+++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
@@ -0,0 +1,53 @@
+# MicroBlaze architecture tune feature configuration
+
+# Architecture feature and override
+TUNEVALID[microblaze] = "MicroBlaze"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "microblaze", "microblaze:", "", d)}"
+
+# Endian
+TUNEVALID[bigendian] = "Use Microblaze Big Endian"
+TUNECONFLICTS[bigendian] += "v10.0"
+
+MBPKGARCH_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
+
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-mbig-endian", "-mlittle-endian", d)}"
+
+# General features
+TUNEVALID[barrel-shift] = "Enable Hardware Barrel Shifter"
+TUNEVALID[pattern-compare] = "Enable Pattern Compare Instructions"
+TUNEVALID[reorder] = "Enable Reorder Instructions"
+TUNECONFLICTS[reorder] += "v8.00 v8.10 v8.20"
+
+# Core configuration tune optimizations
+TUNEVALID[frequency-optimized] = "Enabling tuning for frequency optimized core (AREA_OPTIMIZED_2)"
+TUNECONFLICTS[frequency-optimized] += "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
+
+# Feature compiler args
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-mxl-barrel-shift", "-mno-xl-barrel-shift", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-mxl-pattern-compare", "-mno-xl-pattern-compare", d)}"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-mxl-frequency", "", d)}"
+
+# Disable reorder for v8.30 if pattern-compare is not enabled
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
+        bb.utils.contains("TUNE_FEATURES", "v8.30", \
+            bb.utils.contains("TUNE_FEATURES", "pattern-compare", \
+                "-mxl-reorder", "-mno-xl-reorder", d), \
+            "-mxl-reorder", d), "-mno-xl-reorder", d)}"
+
+# Feature package architecture formatting
+MBPKGARCH_TUNE = ""
+MBPKGARCH_TUNE .= "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-bs", "", d)}"
+MBPKGARCH_TUNE .= "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-cmp", "", d)}"
+MBPKGARCH_TUNE .= "${@bb.utils.contains("TUNE_FEATURES", "reorder", "-re", "", d)}"
+MBPKGARCH_TUNE .= "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-fo", "", d)}"
+
+# Additional features
+require conf/machine/include/microblaze/feature-microblaze-versions.inc
+require conf/machine/include/microblaze/feature-microblaze-math.inc
+
+# Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
+TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
+
+# Package Architecture formatting
+TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
+
diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-math.inc b/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
new file mode 100644
index 0000000000..a31516659c
--- /dev/null
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
@@ -0,0 +1,33 @@
+# This include describes the math features (integer and floating point) that
+# are available for the MicroBlaze ISA
+
+TUNEVALID[multiply-low] = "Hardware multipler with 32 bit result"
+TUNEVALID[multiply-high] = "Hardware multipler with 64 bit result"
+TUNEVALID[divide-hard] = "Hardware divider"
+TUNEVALID[fpu-soft] = "Software FPU"
+TUNEVALID[fpu-hard] = "Hardware FPU in basic mode"
+TUNEVALID[fpu-hard-extended] = "Hardware FPU in extended mode (conversion and square root instructions)"
+
+TUNECONFLICTS[fpu-soft] = "fpu-hard fpu-hard-extended"
+TUNECONFLICTS[fpu-hard] = "fpu-soft"
+TUNECONFLICTS[fpu-hard-extended] = "fpu-soft"
+
+# Compiler args
+TUNE_CCARGS += "${@bb.utils.contains_any('TUNE_FEATURES', ['multiply-low', 'multiply-high'], '-mno-xl-soft-mul', '-mxl-soft-mul', d)}"
+TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'multiply-high', '-mxl-multiply-high', '', d)}"
+
+TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'divide-hard', '-mno-xl-soft-div', '-mxl-soft-div', d)}"
+
+TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', '', '', d)}"
+TUNE_CCARGS += "${@bb.utils.contains_any('TUNE_FEATURES', ['fpu-hard', 'fpu-hard-extended'], '-mhard-float', '', d)}"
+TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard-extended', '-mxl-float-convert -mxl-float-sqrt', '', d)}"
+
+# Set target fpu (bitbake known target) to soft or hard (basic or extended)
+TARGET_FPU = "${@bb.utils.contains_any('TUNE_FEATURES', 'fpu-hard fpu-hard-extended', 'fpu-hard', 'fpu-soft', d)}"
+
+# Package Architecture formatting
+MBPKGARCH_MATH = ""
+MBPKGARCH_MATH .= "${@bb.utils.contains('TUNE_FEATURES', 'multiply-high', '-mh', bb.utils.contains('TUNE_FEATURES', 'multiply-low', '-ml', '', d), d)}"
+MBPKGARCH_MATH .= "${@bb.utils.contains('TUNE_FEATURES', 'divide-hard', '-div', '', d)}"
+MBPKGARCH_MATH .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard-extended', '-fe', bb.utils.contains('TUNE_FEATURES', 'fpu-hard', '-fb', '', d), d)}"
+
diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
new file mode 100644
index 0000000000..955674fff9
--- /dev/null
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -0,0 +1,67 @@
+# MicroBlaze versions are defined as features, the features are setup to
+# conflict with other versions as well as unavailable features for particular
+# versions.
+#
+# Versions before v9.0 of MicroBlaze use a versioning scheme of "vX.YY.Z"
+# (where Z = [abc]). For v8.* versions of MicroBlaze the revision (Z) changes
+# did not affect ABI and are ignored by this tune configuration. Though this
+# format is expected by GCC including the revision, but this is defaulted to
+# ".a".
+#
+# Since v9.0 of MicroBlaze the revision (Z) part of versions was entirely
+# dropped and the version scheme was changed to "vX.Y".
+
+def microblaze_current_version(d, gcc = False):
+    import re
+    # find the current version, and convert it to major/minor integers
+    version = None
+    for t in (d.getVar("TUNE_FEATURES") or "").split():
+        m = re.search("^v(\d+)\.(\d+)", t)
+        if m:
+            version = int(m.group(1)), int(m.group(2))
+            break
+
+    # format the version string in generic or GCC specific formats
+    if version:
+        if version[0] <= 8:
+            return ("v%d.%02d" % version[0:2]) + (".a" if gcc else "")
+        else:
+            return "v%d.%d" % version[0:2]
+    return ""
+
+# MicroBlaze versions
+TUNEVALID[v8.00] = "MicroBlaze version 8.00"
+TUNEVALID[v8.10] = "MicroBlaze version 8.10"
+TUNEVALID[v8.20] = "MicroBlaze version 8.20"
+TUNEVALID[v8.30] = "MicroBlaze version 8.30"
+TUNEVALID[v8.40] = "MicroBlaze version 8.40"
+TUNEVALID[v8.50] = "MicroBlaze version 8.50"
+TUNEVALID[v9.0]  = "MicroBlaze version 9.0"
+TUNEVALID[v9.1]  = "MicroBlaze version 9.1"
+TUNEVALID[v9.2]  = "MicroBlaze version 9.2"
+TUNEVALID[v9.3]  = "MicroBlaze version 9.3"
+TUNEVALID[v9.4]  = "MicroBlaze version 9.4"
+TUNEVALID[v9.5]  = "MicroBlaze version 9.5"
+TUNEVALID[v9.6]  = "MicroBlaze version 9.6"
+TUNEVALID[v10.0] = "MicroBlaze version 10.0"
+
+# Version conflict matrix
+TUNECONFLICTS[v8.00] = ""
+TUNECONFLICTS[v8.10] = "v8.00"
+TUNECONFLICTS[v8.20] = "v8.00 v8.10"
+TUNECONFLICTS[v8.30] = "v8.00 v8.10 v8.20"
+TUNECONFLICTS[v8.40] = "v8.00 v8.10 v8.20 v8.30"
+TUNECONFLICTS[v8.50] = "v8.00 v8.10 v8.20 v8.30 v8.40"
+TUNECONFLICTS[v9.0]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50"
+TUNECONFLICTS[v9.1]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0"
+TUNECONFLICTS[v9.2]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1"
+TUNECONFLICTS[v9.3]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2"
+TUNECONFLICTS[v9.4]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3"
+TUNECONFLICTS[v9.5]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4"
+TUNECONFLICTS[v9.6]  = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5"
+TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
+
+# Version flags
+TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
+MBPKGARCH_VERSION = "-${@microblaze_current_version(d)}"
+
diff --git a/meta/conf/machine/include/tune-microblaze.inc b/meta/conf/machine/include/tune-microblaze.inc
new file mode 100644
index 0000000000..41f0afe668
--- /dev/null
+++ b/meta/conf/machine/include/tune-microblaze.inc
@@ -0,0 +1,8 @@
+DEFAULTTUNE ?= "microblaze"
+
+require conf/machine/include/microblaze/arch-microblaze.inc
+
+AVAILTUNES += "microblaze"
+TUNE_FEATURES_tune-microblaze = "microblaze"
+PACKAGE_EXTRA_ARCHS_tune-microblaze = "${TUNE_PKGARCH}"
+
-- 
2.15.0



