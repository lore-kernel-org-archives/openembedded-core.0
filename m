Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZZ-0001h2-W6
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344574"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:24 -0700
Message-Id: <533c670305e56c1805b671f4fa9935fc88488fff.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/20] bitbake.conf: disable ccache explicitly if it is not enabled
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:30 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The autogen-native built error on FC17:

ccache: failed to create /dev/null/.ccache

This is because the default gcc command of FC17 is a symlink to ccache,
so the ccache will always be used regardless to the setting of CCACHE,
ccache uses $HOME/.ccache as the CACHE_DIR by default, but autogen set
HOME=/dev/null, so the error happens.

Disable ccache explicitly if it is not enabled would fix the problem,
otherwise it would always use ccache regardless to the setting of CCACHE
on Fedora 17.

The ccache 3.1.7 has a bug, it would always create $CCCHE_DIR/.ccache
even CCACHE_DISABLE=1.

Unset CCACHE_DISABLE in ccache.bbclass, since ccache only checks whether
there is a CCACHE_DISABLE in the environment or not, it doesn't care about
its value, so we need unset it explicitly when enable ccache.

[YOCTO #2554]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass |    1 +
 meta/conf/bitbake.conf      |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 10f9b9f..5aa2da2 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,5 +1,6 @@
 CCACHE = "${@bb.which(d.getVar('PATH', True), 'ccache') and 'ccache '}"
 export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
+CCACHE_DISABLE[unexport] = "1"
 
 do_configure[dirs] =+ "${CCACHE_DIR}"
 do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fbc0ca2..9b26580 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -414,6 +414,14 @@ export PATH
 ##################################################################
 
 CCACHE ??= ""
+# Disable ccache explicitly if CCACHE is null since gcc may be a symlink
+# of ccache some distributions (e.g., Fedora 17).
+export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
+# Assign CCACHE_DIR a default vaule to fix a bug of ccache 3.1.7,
+# since it would always create CCACHE_DIR/.ccache even if
+# CCACHE_DISABLE = 1.
+export CCACHE_DIR ??= "${@os.getenv('HOME')}"
+
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.7.7.6



