Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U3wdr-00012R-9y
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 23:42:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2013 14:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,632,1355126400"; d="scan'208";a="259980216"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2013 14:26:01 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri,  8 Feb 2013 14:27:21 -0800
Message-Id: <3e63afff901540a82ad1f9a42167d36ee0fee6a8.1360362264.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1360362264.git.dvhart@linux.intel.com>
References: <cover.1360362264.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1360362264.git.dvhart@linux.intel.com>
References: <cover.1360362264.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/7] base.bbclass: Remove generate_git_config()
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
X-List-Received-Date: Fri, 08 Feb 2013 22:42:21 -0000

git no longer supports the use of GIT_CONFIG which defeats the purpose of
GIT_CORE_CONFIG and the generate_git_config() function. Remove it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/base.bbclass |   21 ---------------------
 1 files changed, 0 insertions(+), 21 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1c284b7..4d69caf 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -132,26 +132,6 @@ python base_do_unpack() {
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
@@ -310,7 +290,6 @@ addhandler base_eventhandler
 python base_eventhandler() {
     if isinstance(e, bb.event.ConfigParsed):
         e.data.setVar('BB_VERSION', bb.__version__)
-        generate_git_config(e)
         pkgarch_mapping(e.data)
         preferred_ml_updates(e.data)
         e.data.appendVar('DISTRO_FEATURES', oe.utils.features_backfill("DISTRO_FEATURES", e.data))
-- 
1.7.5.4



