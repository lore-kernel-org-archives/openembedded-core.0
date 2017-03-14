Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4B4D4778DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:37:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 14 Mar 2017 10:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,165,1486454400"; d="scan'208";a="1122478395"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2017 10:37:37 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 09:37:25 +0000
Message-Id: <20170314093726.24891-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170314093726.24891-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170314093726.24891-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/3] uninative.bbclass: split long command
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
X-List-Received-Date: Tue, 14 Mar 2017 17:37:36 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Single long commands are difficult to read and maintain. Split it to make
it more human-friendly.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/uninative.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index ee4ab20..b578031 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -59,7 +59,16 @@ python uninative_event_fetchloader() {
             if localpath != tarballpath and os.path.exists(localpath) and not os.path.exists(tarballpath):
                     os.symlink(localpath, tarballpath)
 
-        cmd = d.expand("mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; cd ${UNINATIVE_STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
+        cmd = d.expand("\
+mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
+cd ${UNINATIVE_STAGING_DIR}-uninative; \
+tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
+${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
+  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux \
+  ${UNINATIVE_LOADER} \
+  ${UNINATIVE_LOADER} \
+  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative \
+  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
         subprocess.check_output(cmd, shell=True)
 
         with open(loaderchksum, "w") as f:
-- 
2.10.2


