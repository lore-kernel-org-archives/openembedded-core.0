Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A145671A6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 13:25:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 31 Oct 2016 06:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,575,1473145200"; d="scan'208";a="895990096"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 31 Oct 2016 06:25:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 15:23:36 +0200
Message-Id: <20161031132336.16626-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] boost: fix the SRC_URI to point to an actual release, and not a master snapshot
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
X-List-Received-Date: Mon, 31 Oct 2016 13:25:59 -0000

Sourceforge does a not-so-clever redirecting that fails miserably here:

     Proxy request sent, awaiting response... 301 Moved Permanently
     Location: http://downloads.sourceforge.net/project/boost/boost/snapshots/master/boost_1_62_0.tar.bz2 [following]

Also, boost developers are naming their snapshot tarballs the same as
release tarballs. The two things conspired together.

The new tarball does have the same checksum as the one in release
announcement, so we should be good now:

http://lists.boost.org/Archives/boost/2016/09/230886.php

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/boost/boost-1.62.0.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost-1.62.0.inc b/meta/recipes-support/boost/boost-1.62.0.inc
index a097ea1..cd99b0e 100644
--- a/meta/recipes-support/boost/boost-1.62.0.inc
+++ b/meta/recipes-support/boost/boost-1.62.0.inc
@@ -11,9 +11,11 @@ BOOST_VER = "${@"_".join(d.getVar("PV", True).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV", True).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "7ef085456c48c49a7fe8237f07e5f674"
-SRC_URI[sha256sum] = "bce80293052e2d6230f1bec9b7524b33412e4fb26e9723460a0f362ac15b7acb"
+SRC_URI[md5sum] = "5fb94629535c19e48703bdb2b2e9490f"
+SRC_URI[sha256sum] = "36c96b0f6155c98404091d8ceb48319a28279ca0333fba1ad8611eb90afb2ca0"
+
+PR = "r1"
 
 S = "${WORKDIR}/${BOOST_P}"
-- 
2.9.3


