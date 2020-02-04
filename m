Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 67C47610E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 21:06:38 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 014L6UMt009706;
	Tue, 4 Feb 2020 15:06:38 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 15:06:26 -0600
Message-Id: <20200204210630.41960-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
References: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH v4 1/5] microblaze tune: change microblazeeb to microblaze
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
X-List-Received-Date: Tue, 04 Feb 2020 21:06:38 -0000

From: Mark Hatle <mark.hatle@xilinx.com>

Using microblazeeb breaks a number of autoconf recipes, including newlib
components.  'microblaze' is defined as the big-endian version, while
microblazeel is defined as the little-endian version.

config.sub: 2018-07-03

...
        | maxq | mb | microblaze | microblazeel | mcore | mep | metag \
...
        | microblaze-* | microblazeel-* \
...
        microblaze*)
                basic_machine=microblaze-xilinx
...

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/conf/machine/include/microblaze/arch-microblaze.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
index eab7171cb2..89e9484190 100644
--- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
+++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
@@ -45,8 +45,8 @@ MBPKGARCH_TUNE .= "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized",
 require conf/machine/include/microblaze/feature-microblaze-versions.inc
 require conf/machine/include/microblaze/feature-microblaze-math.inc
 
-# Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
-TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
+# Architecture name, either 'microblaze' or 'microblazeel' depending on endianess
+TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
 
 # Package Architecture formatting
 TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
-- 
2.17.1


