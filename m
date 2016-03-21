Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 909F76FFFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122150"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:01 +1300
Message-Id: <bb475a3b38c0a1c02ab805934d010b72bbda44b6.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/9] classes/populate_sdk_ext: parse metadata on minimal SDK install
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:25 -0000

Instead of skipping the build system preparation step within the
extensible SDK install process when SDK_EXT_TYPE is "minimal", run
bitbake -p so that the cache is populated ready for the first time
devtool is run.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  2 +-
 meta/files/ext-sdk-prepare.py         | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index be4bcc0..cabf815 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -374,7 +374,7 @@ sdk_ext_postinst() {
 	# Warn if trying to use external bitbake and the ext SDK together
 	echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || true" >> $env_setup_script
 
-	if [ "$prepare_buildsystem" != "no" -a -n "${@SDK_INSTALL_TARGETS.strip()}" ]; then
+	if [ "$prepare_buildsystem" != "no" ]; then
 		printf "Preparing build system...\n"
 		# dash which is /bin/sh on Ubuntu will not preserve the
 		# current working directory when first ran, nor will it set $1 when
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index c99e34f..7887696 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -30,10 +30,14 @@ def exec_watch(cmd, **options):
 
 def main():
     if len(sys.argv) < 2:
-        print('Please specify target to prepare with')
-        return 1
+        sdk_targets = []
+    else:
+        sdk_targets = ' '.join(sys.argv[1:]).split()
+    if not sdk_targets:
+        # Just do a parse so the cache is primed
+        ret, _ = exec_watch('bitbake -p')
+        return ret
 
-    sdk_targets = ' '.join(sys.argv[1:]).split()
     print('Preparing SDK for %s...' % ', '.join(sdk_targets))
 
     ret, out = exec_watch('bitbake %s --setscene-only' % ' '.join(sdk_targets))
-- 
2.5.5


