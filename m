Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 86A2E60616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 19:35:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 21 Sep 2016 12:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,375,1470726000"; d="scan'208";a="1034348376"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.27.83])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2016 12:35:56 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 20:35:38 +0100
Message-Id: <3943a27225a79ad5f038a484377dd51ad4ffa249.1474484610.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474484610.git.joshua.g.lock@intel.com>
References: <cover.1474484610.git.joshua.g.lock@intel.com>
Subject: [PATCH 3/4] runqemu: don't try and invoke bitbake when running in a toolchain env
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
X-List-Received-Date: Wed, 21 Sep 2016 19:35:55 -0000

If a MACHINE value is passed we can't validate it by running bitbake
as the toolchain environment doesn't include the build system, we
must assume that the passed value for MACHINE is correct.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 591746f..e8360c2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -306,11 +306,16 @@ class BaseConfig(object):
         # FIXME: testimage.bbclass exports these two variables into env,
         # are there other scenarios in which we need to support being
         # invoked by bitbake?
-        deploy = os.environ.get('DEPLOY_DIR_IMAGE', None)
-        bbchild = deploy and os.environ.get('OE_TMPDIR', None)
+        deploy = os.environ.get('DEPLOY_DIR_IMAGE')
+        bbchild = deploy and os.environ.get('OE_TMPDIR')
         if bbchild:
             self.set_machine_deploy_dir(arg, deploy)
             return
+        # also check whether we're running under a sourced toolchain
+        # environment file
+        if os.environ.get('OECORE_NATIVE_SYSROOT'):
+            self.set("MACHINE", arg)
+            return
 
         cmd = 'MACHINE=%s bitbake -e' % arg
         logger.info('Running %s...' % cmd)
-- 
2.7.4


