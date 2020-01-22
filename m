Return-Path: <mark.hatle@kernel.crashing.org>
X-Greylist: delayed 969 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jan 2020 00:43:12 UTC
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 39FF97FFCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:43:12 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00M0R3c2025108
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 18:27:04 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 18:27:02 -0600
Message-Id: <20200122002702.166957-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122002702.166957-1-mark.hatle@kernel.crashing.org>
References: <20200122002702.166957-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 2/2] libgcc.inc: Fix an issue w/ a recursive symlink
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
X-List-Received-Date: Wed, 22 Jan 2020 00:43:13 -0000

From: Mark Hatle <mark.hatle@xilinx.com>

If the OS is not Linux, the code could end up generating a recursive symlink.
This can happen because the same symlink can be created twice in a row.  If this
happenes, the second symlink becomes a link to itself within the directory
pointed to by the original link.

In order to prevent this, verify that the destination does not already exist.

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/libgcc.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index e008d14f36..6d48ec9809 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -9,14 +9,18 @@ do_install_append_class-target () {
 			"linux-musleabi") extra_target_os="linux-gnueabi";;
 			*) extra_target_os="linux";;
 		esac
-		ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
+		if [ ! -e ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os ]; then
+			ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
+		fi
 	fi
 	if [ -n "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}" ]; then
 		case "${TARGET_OS}" in
 			"linux-musleabi") extra_target_os="linux-musleabihf";;
 			"linux-gnueabi") extra_target_os="linux-gnueabihf";;
 		esac
-		ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
+		if [ ! -e ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os ]; then
+			ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
+		fi
 	fi
 }
 
-- 
2.17.1


