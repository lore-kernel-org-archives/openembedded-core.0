Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7870760043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 22:13:14 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00VM7plN018660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 16:07:51 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 16:07:50 -0600
Message-Id: <20200131220751.106516-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] microblaze tune: Correct two minor issues with the microblaze tune
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
X-List-Received-Date: Fri, 31 Jan 2020 22:13:14 -0000

From: Mark Hatle <mark.hatle@xilinx.com>

TUNE_ARCH - microblazeeb is not a valid architecture, microblaze is big
            endian, microblazeel is the little endian version.

Version arguments:
  If a version feature is not defined, then we don't want to set either
  TUNE_CCARGS or MBPKGARCH_VERSION.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/conf/machine/include/microblaze/arch-microblaze.inc      | 2 +-
 .../include/microblaze/feature-microblaze-versions.inc        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
index eab7171cb2..265898b6b6 100644
--- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
+++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
@@ -46,7 +46,7 @@ require conf/machine/include/microblaze/feature-microblaze-versions.inc
 require conf/machine/include/microblaze/feature-microblaze-math.inc
 
 # Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
-TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
+TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
 
 # Package Architecture formatting
 TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 3221e2aab7..003fde3e07 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -64,6 +64,6 @@ TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3
 TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
 
 # Version flags
-TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
-MBPKGARCH_VERSION = "-${@microblaze_current_version(d)}"
+TUNE_CCARGS += "${@'-mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
+MBPKGARCH_VERSION = "${@'-${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
 
-- 
2.17.1


