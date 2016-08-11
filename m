Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43009731F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:35 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475667"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:03 +1200
Message-Id: <1bebb41b4b45f46bfccf875de4560042123e874c.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/10] classes/populate_sdk_ext: properly handle buildtools install failure
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:35 -0000

If the buildtools installation failed, we were using a subshell instead
of a compound command and thus the subshell exited but the script
continued on, which is really not what we want to happen. Additionally
log the buildtools installer output to a file and cat it if it fails so
that you can actually see what went wrong, as well as amending the
environment setup script to print a warning as we do when the
preparation fails.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a075a09..18013564 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -490,14 +490,16 @@ SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
 sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
-	printf "buildtools\ny" | ./*buildtools-nativesdk-standalone* > /dev/null || ( printf 'ERROR: buildtools installation failed\n' ; exit 1 )
+	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
+	printf "buildtools\ny" | ./*buildtools-nativesdk-standalone* > buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 
 	# Delete the buildtools tar file since it won't be used again
 	rm ./*buildtools-nativesdk-standalone*.sh -f
+	# We don't need the log either since it succeeded
+	rm -f buildtools.log
 
 	# Make sure when the user sets up the environment, they also get
 	# the buildtools-tarball tools in their path.
-	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
 	echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
 
 	# Allow bitbake environment setup to be ran as part of this sdk.
-- 
2.5.5


