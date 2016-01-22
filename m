Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2819B731B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272719"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:53 +1300
Message-Id: <78d4c2a97780cad28ba5adeab361a6ede4a20c97.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/14] classes/populate_sdk_ext: drop ext-sdk-prepare.py when installing
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:20 -0000

At the end of the extensible SDK installation, if we've successfully
prepared the build system then we don't need ext-sdk-prepare.py. I had
thought earlier that this would be used when updating, but a different
mechanism was needed there so this script isn't used for that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index bb8831b..2944576 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -304,6 +304,7 @@ sdk_ext_postinst() {
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
 		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py '${SDK_INSTALL_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		rm $target_sdk_dir/ext-sdk-prepare.py
 	fi
 	echo done
 }
-- 
2.5.0


