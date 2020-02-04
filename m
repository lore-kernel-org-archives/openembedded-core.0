Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7930D610FB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 21:06:39 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 014L6UMu009706;
	Tue, 4 Feb 2020 15:06:38 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 15:06:27 -0600
Message-Id: <20200204210630.41960-3-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
References: <20200204210630.41960-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH v4 2/5] microblaze tune: Allow no version to be set
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
X-List-Received-Date: Tue, 04 Feb 2020 21:06:40 -0000

From: Mark Hatle <mark.hatle@xilinx.com>

We want to allow no version to be configured.  This should use the GCC default
which is the latest defined version, currently 11.0.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../include/microblaze/feature-microblaze-versions.inc        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 3221e2aab7..5c37f49abb 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -64,6 +64,6 @@ TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3
 TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
 
 # Version flags
-TUNE_CCARGS += "-mcpu=${@microblaze_current_version(d, True)}"
-MBPKGARCH_VERSION = "-${@microblaze_current_version(d)}"
+TUNE_CCARGS += "${@'-mcpu=%s' % (microblaze_current_version(d, True)) if microblaze_current_version(d, True) != '' else ''}"
+MBPKGARCH_VERSION = "${@'-%s' % (microblaze_current_version(d, True)) if microblaze_current_version(d, True) != '' else ''}"
 
-- 
2.17.1


