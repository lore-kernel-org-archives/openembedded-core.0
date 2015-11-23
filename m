Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 18F9E6AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:38:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2015 18:38:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,335,1444719600"; d="scan'208";a="857558606"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2015 18:38:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:37:39 +1300
Message-Id: <94a1b59ed25ce88224e77a30d25a97d77c4fcc64.1448246218.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] classes/populate_sdk_ext: tidy up preparation log file writing
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
X-List-Received-Date: Mon, 23 Nov 2015 02:38:13 -0000

Use a variable for the log file which includes the full path; this is
not only neater but avoids us writing the first part (the output of
oe-init-build-env) to a file in another directory since we are
changing directory as part of this subshell.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 249ec36..d368d4f 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -249,7 +249,8 @@ sdk_ext_postinst() {
 		# dash which is /bin/sh on Ubuntu will not preserve the
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
-		sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && $target_sdk_dir/ext-sdk-prepare.sh $target_sdk_dir '${SDK_TARGETS}' >> preparing_build_system.log 2>&1" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
+		LOGFILE="$target_sdk_dir/preparing_build_system.log"
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && $target_sdk_dir/ext-sdk-prepare.sh $target_sdk_dir '${SDK_TARGETS}' >> $LOGFILE 2>&1" || { echo "SDK preparation failed: see $LOGFILE" ; exit 1 ; }
 	fi
 	rm -f $target_sdk_dir/ext-sdk-prepare.sh
 	echo done
-- 
2.1.0


