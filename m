Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3A78C77264
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:51:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Feb 2016 03:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="913458266"
Received: from gtan23-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.53])
	by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2016 03:50:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 00:50:53 +1300
Message-Id: <2668dc7b10a30d2e5bcdb6e16ed2bdaed72e08ab.1456746626.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456746626.git.paul.eggleton@linux.intel.com>
References: <cover.1456746626.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456746626.git.paul.eggleton@linux.intel.com>
References: <cover.1456746626.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/populate_sdk_ext: prepend to PATH rather than appending
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
X-List-Received-Date: Mon, 29 Feb 2016 11:51:05 -0000

The rest of the environment setup script prepends to PATH, so when we
add the path to run devtool we should be prepending as well. This
also ensures that when you run the environment setup script from
extensible SDK installation A and then in the same shell session run the
environment setup script from installation B, and then run devtool, that
you're running B's devtool and not A's.

Fixes [YOCTO #9046].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9e2fc61..27d4afc 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -323,7 +323,7 @@ sdk_ext_postinst() {
 
 	# A bit of another hack, but we need this in the path only for devtool
 	# so put it at the end of $PATH.
-	echo "export PATH=\$PATH:$target_sdk_dir/sysroots/${SDK_SYS}/${bindir_nativesdk}" >> $env_setup_script
+	echo "export PATH=$target_sdk_dir/sysroots/${SDK_SYS}${bindir_nativesdk}:\$PATH" >> $env_setup_script
 
 	echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
 
-- 
2.5.0


