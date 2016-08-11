Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ABCAE771D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475707"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:07 +1200
Message-Id: <8b812f1819f53d4f58454d094f7e8c9ea9879242.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/10] classes/populate_sdk_ext: drop duplicated error message
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:44 -0000

The preparation script itself prints out an error on failure, and we
aren't redirecting its output anymore, so we no longer need to print out
a message here when it fails. At the same time, make the message printed
out by the script a little clearer - we're just writing the log out to
the file, we shouldn't give the user an expectation that there will be
extra details in there (other than the output produced by
oe-init-build-env there won't be).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 meta/files/ext-sdk-prepare.py         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index f1ae7c1..b52ad41 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -578,7 +578,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "ERROR: SDK preparation failed: see $LOGFILE for a slightly more detailed log"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 		rm $target_sdk_dir/ext-sdk-prepare.py
 	fi
 	echo done
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index 8b15982..78c1d16 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -59,7 +59,7 @@ def main():
                 for line in f:
                     logf.write(line)
         if ret:
-            print('ERROR: SDK preparation failed: see %s' % logfile)
+            print('ERROR: SDK preparation failed: error log written to %s' % logfile)
             return ret
 
 if __name__ == "__main__":
-- 
2.5.5


