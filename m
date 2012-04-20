Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7J-0005tX-73
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167819"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:44:53 -0700
Message-Id: <d2330607b1757ad68add6ab2b37c6182b4f28d00.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/43] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Replace dependency on eglibc with virtual/libc
Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
index 6c4931e..e38ada9 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
@@ -18,8 +18,7 @@ SRC_URI = "git://github.com/clrkwllms/rt-tests.git \
 
 S = "${WORKDIR}/git"
 
-# need to append rt-tests' default CFLAGS to ours
-CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli"
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 # calling 'uname -m' is broken on crossbuilds
 EXTRA_OEMAKE = "NUMA=0"
-- 
1.7.7.6



