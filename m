Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF7E7198E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:35:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 21 Sep 2016 12:35:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,375,1470726000"; d="scan'208";a="1034348387"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.83])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2016 12:35:58 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 20:35:39 +0100
Message-Id: <ac51009d76d1297d48163c39ebd1c4b3c081601f.1474484610.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
Subject: [PATCH 4/4] runqemu: don't fail during check_arg_machine()
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
X-List-Received-Date: Wed, 21 Sep 2016 19:35:57 -0000

If DEPLOY_DIR_IMAGE doesn't exist during check_arg_machine() we
will attempt to guess a suitable value later when check_and_set()
calls validate_paths(), therefore this shouldn't raise an exception

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e8360c2..658f7c8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -332,7 +332,7 @@ class BaseConfig(object):
             self.set_machine_deploy_dir(arg, deploy_dir_image)
         else:
             logger.error("%s not a directory valid DEPLOY_DIR_IMAGE" % deploy_dir_image)
-            raise Exception("Failed to set MACHINE to %s. Unknown arg: %s" % (arg, arg))
+            self.set("MACHINE", arg)
 
     def check_args(self):
         unknown_arg = ""
-- 
2.7.4


