Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 34CE96FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 20:49:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 08 Sep 2016 13:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,302,1470726000"; d="scan'208";a="1027087351"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.10.74])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2016 13:49:32 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 21:49:13 +0100
Message-Id: <84dae3ed6d5c52c8edb9774d73e6042357386296.1473367495.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473367495.git.joshua.g.lock@intel.com>
References: <cover.1473367495.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473367495.git.joshua.g.lock@intel.com>
References: <cover.1473367495.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/1] runqemu: fix run from testimage with non-standard DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Thu, 08 Sep 2016 20:49:45 -0000

testimage.bbclass uses runqemu to execute runtime tests on a qemu
target, this means that bitbake is already running and `bitbake -e`
can't be called to obtain bitbake variables.

runqemu tries to work around being unable to read values for
bitbake variables by inferring the MACHINE from the
DEPLOY_DIR_IMAGE setting, however if a user sets that variable in
a manner which doesn't follow the systems expectations (i.e. if
running `bitbake -c testimage` against a directory of pre-generated
images in a user-specified path) the inferring of the MACHINE name
from the DEPLOY_DIR_IMAGE location will fail.

It's possible that check_arg_machine() shouldn't cause runqemu to
fail and that runqemu should proceed with the user-supplied value
even if it can't be verified. This patch simply ensures that a
workflow where the user sets DEPLOY_DIR_IMAGE continues to work
without changing too much of the runqemu code.

[YOCTO #10238]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7919564..9af13f3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -278,6 +278,19 @@ class BaseConfig(object):
         elif self.get('MACHINE') == arg:
             return
         logger.info('Assuming MACHINE = %s' % arg)
+
+        # if we're running under testimage, or similarly as a child
+        # of an existing bitbake invocation, we can't invoke bitbake
+        # to validate the MACHINE setting and must assume it's correct...
+        # FIXME: testimage.bbclass exports these two variables into env,
+        # are there other scenarios in which we need to support being
+        # invoked by bitbake?
+        deploy = os.environ.get('DEPLOY_DIR_IMAGE', None)
+        bbchild = deploy and os.environ.get('OE_TMPDIR', None)
+        if bbchild:
+            self.set_machine_deploy_dir(arg, deploy)
+            return
+
         cmd = 'MACHINE=%s bitbake -e' % arg
         logger.info('Running %s...' % cmd)
         self.bitbake_e = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
-- 
2.7.4


