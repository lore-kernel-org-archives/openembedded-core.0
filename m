Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc8-0005NF-Kt
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233778"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:27 -0800
Message-Id: <f806badf31a3ca4653ec580f207c29d7689e72ec.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/26] bitbake.conf multilib.conf: move the definition of baselib
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:57 -0000

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



