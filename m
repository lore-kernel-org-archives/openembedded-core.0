Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RdRvl-0008W3-Gu
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 20:34:25 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 11:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98926596"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2011 11:27:16 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 11:27:13 -0800
Message-Id: <019e85ac0db36b83b2497e3ff33c43f613fb6266.1324495514.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <c363f3248af48a2d0e8be897e93237343cd69e02.1324495514.git.nitin.a.kamble@intel.com>
References: <c363f3248af48a2d0e8be897e93237343cd69e02.1324495514.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1324495514.git.nitin.a.kamble@intel.com>
References: <cover.1324495514.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] bitbake.conf multilib.conf: move the definition of baselib
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
X-List-Received-Date: Wed, 21 Dec 2011 19:34:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The baselib value varies with tune, even when multilib is not
configured. This commit makes the logic to find value of baselib
based on the tune available outside of multilib setup.

This Fixes bug: [YOCTO #1854]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/bitbake.conf  |    2 +-
 meta/conf/multilib.conf |    2 --
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c21616..700a40a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -9,7 +9,7 @@
 # Used by multilib code to change the library paths
 baselib = "${BASELIB}"
 baselib[vardepvalue] = "${baselib}"
-BASELIB = "lib"
+BASELIB = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
 BASELIB_powerpc64 = "lib64"
 
 # Path prefixes
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 87a3d86..a9448df 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -1,6 +1,4 @@
 
-baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
-
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
 MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
 
-- 
1.7.6.4



