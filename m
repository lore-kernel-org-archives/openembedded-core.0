Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDH-0001aO-Oc
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753292"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:10 -0700
Message-Id: <0c3f88376a18f789749965ce5fc60a718ac73020.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 23/50] gcc_4.5.1: fix arm_bswapsi2.patch
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:06 -0000

From: Ilya Yanok <yanok@emcraft.com>

Acoording to http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44392
correct fix should be
TARGET_EITHER && (arm_arch6 || !optimize_size)
not
TARGET_EITHER && (arm_arch6 && !optimize_size)

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
index 9b9f874..a7a6684 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/arm-bswapsi2.patch
@@ -9,7 +9,7 @@ Index: gcc-4.5/gcc/config/arm/arm.md
    [(set (match_operand:SI 0 "s_register_operand" "=r")
    	(bswap:SI (match_operand:SI 1 "s_register_operand" "r")))]
 -"TARGET_EITHER"
-+"TARGET_EITHER && (arm_arch6 && !optimize_size)"
++"TARGET_EITHER && (arm_arch6 || !optimize_size)"
  "
    if (!arm_arch6)
      {
-- 
1.7.3.4



