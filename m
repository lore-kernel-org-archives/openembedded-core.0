Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNRbY-0006So-9J
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 16:59:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Nov 2011 07:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71871792"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2011 07:53:09 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 09:53:34 -0600
Message-Id: <cc1d56082567e6c76b05c65e2b839de6f9fea68e.1320638388.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
References: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1320638388.git.tom.zanussi@intel.com>
References: <cover.1320638388.git.tom.zanussi@intel.com>
Subject: [PATCH 4/6] gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 15:59:24 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

CC_FOR_BUILD was compiling the test programs using the target's
compile options and executing those on the host, causing errors such
as:

/bin/sh: line 1: 15032 Illegal instruction     ./gen-bases table 64 0 > mpn/mp_bases.c
/bin/sh: line 1: 15033 Illegal instruction     ./gen-bases header 64 0 > mp_bases.h

Export CC_FOR_BUILD using BUILD_CC to fix the problem.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-support/gmp/gmp_5.0.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-support/gmp/gmp_5.0.2.bb
index 03fef45..16bdcbc 100644
--- a/meta/recipes-support/gmp/gmp_5.0.2.bb
+++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
@@ -2,11 +2,12 @@ require gmp.inc
 LICENSE="LGPLv3&GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://version.c;endline=18;md5=d8c56b52b9092346b9f93b4da65ef790"
-PR = "r0"
+PR = "r1"
 
 SRC_URI_append += "file://sh4-asmfix.patch \
                    file://use-includedir.patch "
 
+export CC_FOR_BUILD = "${BUILD_CC}"
 
 SRC_URI[md5sum] = "0bbaedc82fb30315b06b1588b9077cd3"
 SRC_URI[sha256sum] = "dbc2db76fdd4e99f85d5e35aa378ed62c283e0d586b91bd8703aff75a7804c28"
-- 
1.7.0.4



