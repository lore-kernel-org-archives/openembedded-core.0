Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 13B196AFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 12:53:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2013 05:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="340465025"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2013 05:53:59 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 15:53:55 +0300
Message-Id: <62b7cc36eab494ea6c7ece141b580132cb86e89a.1372942368.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372942368.git.laurentiu.palcu@intel.com>
References: <cover.1372942368.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1372942368.git.laurentiu.palcu@intel.com>
References: <cover.1372942368.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] populate_sdk_base: fix bashism
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
X-List-Received-Date: Thu, 04 Jul 2013 12:53:59 -0000

Only the printf bash builtin knows about %q format option for escaping
spaces. The coreutils version doesn't. Unfortunately, neither dash nor
sh have a printf builtin. So, escape the spaces using sed.

[YOCTO #4811]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 31e848d..6378af9 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -181,7 +181,7 @@ else
 	echo "$target_sdk_dir"
 fi
 
-eval target_sdk_dir=$(printf "%q" "$target_sdk_dir")
+eval target_sdk_dir=$(echo "$target_sdk_dir"|sed 's/ /\\ /g')
 if [ -d "$target_sdk_dir" ]; then
 	target_sdk_dir=$(cd "$target_sdk_dir"; pwd)
 else
-- 
1.7.9.5


