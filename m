Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 115DA71A52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 02:51:43 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 17 Oct 2016 19:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,359,1473145200"; d="scan'208";a="20627613"
Received: from ssethurx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.157.103])
	by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2016 19:51:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2016 15:51:16 +1300
Message-Id: <d34af1901e034160aa61c4cf74dbce4cefdd1013.1476759034.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1476759034.git.paul.eggleton@linux.intel.com>
References: <cover.1476759034.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1476759034.git.paul.eggleton@linux.intel.com>
References: <cover.1476759034.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] devtool: runqemu: work around runqemu script path assumption
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
X-List-Received-Date: Tue, 18 Oct 2016 02:51:43 -0000

The new runqemu script assumes that if OECORE_NATIVE_SYSROOT is set then
it shouldn't try to run bitbake to find out the values of various
variables such as DEPLOY_DIR_IMAGE; this assumption is incorrect for the
extensible SDK. To work around this, clear OECORE_NATIVE_SYSROOT in the
environment when running runqemu.

Fixes [YOCTO #10447].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/runqemu.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index 303abca..ae25cee 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -48,7 +48,12 @@ def runqemu(args, config, basepath, workspace):
         raise DevtoolError('Unable to determine image name to run, please specify one')
 
     try:
-        exec_build_env_command(config.init_path, basepath, 'runqemu %s %s %s' % (machine, imagename, " ".join(args.args)), watch=True)
+        # FIXME runqemu assumes that if OECORE_NATIVE_SYSROOT is set then it shouldn't
+        # run bitbake to find out the values of various environment variables, which
+        # isn't the case for the extensible SDK. Work around it for now.
+        newenv = dict(os.environ)
+        newenv.pop('OECORE_NATIVE_SYSROOT', '')
+        exec_build_env_command(config.init_path, basepath, 'runqemu %s %s %s' % (machine, imagename, " ".join(args.args)), watch=True, env=newenv)
     except bb.process.ExecutionError as e:
         # We've already seen the output since watch=True, so just ensure we return something to the user
         return e.exitcode
-- 
2.5.5


