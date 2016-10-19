Return-Path: <mikko.ylinen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDE2601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 06:33:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Oct 2016 23:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,513,1473145200"; d="scan'208";a="1072484577"
Received: from summit.tm.intel.com ([10.237.55.19])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2016 23:33:40 -0700
From: Mikko Ylinen <mikko.ylinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 09:34:00 +0300
Message-Id: <20161019063400.22786-1-mikko.ylinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] buildstats: check IMAGE_ROOTFS exists before checking its size
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
X-List-Received-Date: Wed, 19 Oct 2016 06:33:42 -0000

After 0d6b7276003f1afabc6de683f663540327d52bdc, the exceptions are
correctly checked if the rootfs size check fails. In case of a
failure a build error is triggered.

However, there are cases where this is known to fail (e.g.,
with meta-swupd the rootfs for swupd images is other than IMAGE_ROOTFS).

Because of that, check IMAGE_ROOTFS exists before trying to get the
size of it. Also, in case of any error catched as err, simply print
out a warning.

Signed-off-by: Mikko Ylinen <mikko.ylinen@intel.com>
---
 meta/classes/buildstats.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 8c2b7b3..599a219 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -163,12 +163,13 @@ python run_buildstats () {
             bs = os.path.join(bsdir, "build_stats")
             with open(bs, "a") as f:
                 rootfs = d.getVar('IMAGE_ROOTFS', True)
-                try:
-                    rootfs_size = subprocess.check_output(["du", "-sh", rootfs],
-                            stderr=subprocess.STDOUT).decode('utf-8')
-                except subprocess.CalledProcessError as e:
-                    bb.error("Failed to get rootfs size: %s" % e.output)
-                f.write("Uncompressed Rootfs size: %s" % rootfs_size)
+                if os.path.isdir(rootfs):
+                    try:
+                        rootfs_size = subprocess.check_output(["du", "-sh", rootfs],
+                                stderr=subprocess.STDOUT).decode('utf-8')
+                        f.write("Uncompressed Rootfs size: %s" % rootfs_size)
+                    except subprocess.CalledProcessError as err:
+                        bb.warn("Failed to get rootfs size: %s" % err.output.decode('utf-8'))
 
     elif isinstance(e, bb.build.TaskFailed):
         # Can have a failure before TaskStarted so need to mkdir here too
-- 
2.9.3

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


