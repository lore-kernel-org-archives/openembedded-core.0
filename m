Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2rbg-0004xy-3n
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 00:07:17 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 14:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,610,1355126400"; d="scan'208";a="281408765"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 14:51:14 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue,  5 Feb 2013 14:52:48 -0800
Message-Id: <9f9ad79974b3f855ca1375292ea3de964e5c9471.1360104547.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1360104547.git.dvhart@linux.intel.com>
References: <cover.1360104547.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1360104547.git.dvhart@linux.intel.com>
References: <cover.1360104547.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 6/9] base.bbclass: Remove generate_git_config()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 23:07:23 -0000

git no longer supports the use of GIT_CONFIG which defeats the purpose of
GIT_CORE_CONFIG and the generate_git_config() function. Remove it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/base.bbclass |   21 ---------------------
 1 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4662d3b..83de10f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -133,26 +133,6 @@ python base_do_unpack() {
         raise bb.build.FuncFailed(e)
 }
 
-GIT_CONFIG_PATH = "${STAGING_DIR_NATIVE}/etc"
-GIT_CONFIG = "${GIT_CONFIG_PATH}/gitconfig"
-
-def generate_git_config(e):
-    if e.data.getVar('GIT_CORE_CONFIG', True):
-        gitconfig_path = e.data.getVar('GIT_CONFIG', True)
-        proxy_command = "    gitProxy = %s\n" % e.data.getVar('OE_GIT_PROXY_COMMAND', True)
-
-        bb.mkdirhier(e.data.expand("${GIT_CONFIG_PATH}"))
-        if (os.path.exists(gitconfig_path)):
-            os.remove(gitconfig_path)
-
-        f = open(gitconfig_path, 'w')
-        f.write("[core]\n")
-        ignore_hosts = e.data.getVar('GIT_PROXY_IGNORE', True).split()
-        for ignore_host in ignore_hosts:
-            f.write("    gitProxy = none for %s\n" % ignore_host)
-        f.write(proxy_command)
-        f.close
-
 def pkgarch_mapping(d):
     # Compatibility mappings of TUNE_PKGARCH (opt in)
     if d.getVar("PKGARCHCOMPAT_ARMV7A", True):
@@ -311,7 +291,6 @@ addhandler base_eventhandler
 python base_eventhandler() {
     if isinstance(e, bb.event.ConfigParsed):
         e.data.setVar('BB_VERSION', bb.__version__)
-        generate_git_config(e)
         pkgarch_mapping(e.data)
         preferred_ml_updates(e.data)
         e.data.appendVar('DISTRO_FEATURES', oe.utils.features_backfill("DISTRO_FEATURES", e.data))
-- 
1.7.5.4



