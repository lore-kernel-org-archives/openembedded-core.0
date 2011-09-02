Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QzPgV-0003UF-7h
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:05:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Sep 2011 02:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,317,1312182000"; d="scan'208";a="13468045"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Sep 2011 02:00:15 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:03:37 +0800
Message-Id: <0a7bbc84eda7c0483b1dd1ae55679e1ed463ed39.1314953755.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/5] multilib: Using different sysroot for multilib recipes
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
X-List-Received-Date: Fri, 02 Sep 2011 09:05:11 -0000

Thinking of the senario that, if we already built out a 64bit image
along with the full toolchain bootstrapped, then we need to build some
32bit libraries, which needs lib32 versions of gcc and eglibc. These
toolchain recipes will bootstrap again in the same sysroot, resulting
that lib32-gcc-cross-initial will find some macros owned by eglibc have
already been defined and thus it includes non-existed headers that
provided by later lib32-eglibc.

The solution for the above issue is to use different sysroot for
multilib recipes, here we add ${MLPREFIX} in front of the machine
specific sysroot directory name.

[YOCTO #1372]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/multilib.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 9fca715..5329eda 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -6,6 +6,9 @@ MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
 
 MULTILIBS ??= "multilib:lib32"
 
+STAGING_DIR_HOST = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
+STAGING_DIR_TARGET = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
+
 BBCLASSEXTEND_append_pn-acl = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-alsa-lib = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-alsa-utils = " ${MULTILIBS}"
-- 
1.7.1



