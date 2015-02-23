Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9759E72D36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537425"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:41 +0000
Message-Id: <a7cf39dee0b896159a9dbc5625a52e1947e70909.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/9] uninative-tarball: Actually use bzip2 for compression.
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:53 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

uninative.bbclass uses -xjf for decompression so actually run the data
through bzip2.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index e17685a..53435f2 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -44,5 +44,5 @@ fakeroot tar_sdk() {
 	rm sysroots -rf
 	patchelf --set-interpreter ${@''.join('a' for n in xrange(1024))} ./${BUILD_SYS}/usr/bin/patchelf
 	mv ./${BUILD_SYS}/usr/bin/patchelf ./${BUILD_SYS}/usr/bin/patchelf-uninative
-	tar ${SDKTAROPTS} -c --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	tar ${SDKTAROPTS} -c -j --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
 }
-- 
1.9.3


