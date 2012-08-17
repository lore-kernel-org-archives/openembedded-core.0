Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1T2K88-0001Jj-6R
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:50:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 03:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; d="scan'208";a="181902757"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 03:38:16 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 13:38:09 +0300
Message-Id: <0a4a0de423aba0978d632281144ab130be70a7e6.1345199518.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345199518.git.laurentiu.palcu@intel.com>
References: <cover.1345199518.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1345199518.git.laurentiu.palcu@intel.com>
References: <cover.1345199518.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/3] populate_sdk_base.bbclass: fix SDK relocation issues
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
X-List-Received-Date: Fri, 17 Aug 2012 10:50:16 -0000

The problem appears if multiple setup environment scripts are found. In
order to find only the script we're interested in, I removed globbing in
matching pattern with ${REAL_MULTIMACH_TARGET_SYS} that will be expanded
to the correct string.

Also, fix a problem when changing the scripts/configs. The grep pattern
matched also files that contained "text" in their name.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 0d19741..a1cb12a 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -154,7 +154,7 @@ echo "done"
 
 echo -n "Setting it up..."
 # fix environment paths
-env_setup_script=$(find $target_sdk_dir -name "environment-setup*")
+env_setup_script=$(find $target_sdk_dir -name "environment-setup-${REAL_MULTIMACH_TARGET_SYS}")
 sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
 
 # fix dynamic loader paths in all ELF SDK binaries
@@ -168,7 +168,7 @@ if [ $? -ne 0 ]; then
 fi
 
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
-find $native_sysroot -type f -exec file '{}' \;|grep text|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
 echo done
 
-- 
1.7.9.5



