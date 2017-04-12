Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AE29D77C31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:41:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 03:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,190,1488873600"; d="scan'208";a="247654590"
Received: from lheah-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.133.64])
	by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2017 03:41:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 22:41:28 +1200
Message-Id: <69c8ef135d4443e2d1ad8873d205d8d27d699546.1491993601.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491993601.git.paul.eggleton@linux.intel.com>
References: <cover.1491993601.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] devtool: add: prevent repeatedly running recipetool
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
X-List-Received-Date: Wed, 12 Apr 2017 10:41:40 -0000

If recipetool returns with exit code 14 this means devtool needs to
build nodejs-native and then call it again. If recipetool returns exit
code 14 again then clearly something has gone wrong and we should just
quit with an error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 73e629c..1e84ae4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -155,11 +155,14 @@ def add(args, config, basepath, workspace):
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
+        builtnpm = False
         while True:
             try:
                 stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create --devtool -o %s \'%s\' %s' % (color, tempdir, source, extracmdopts), watch=True)
             except bb.process.ExecutionError as e:
                 if e.exitcode == 14:
+                    if builtnpm:
+                        raise DevtoolError('Re-running recipetool still failed to find npm')
                     # FIXME this is a horrible hack that is unfortunately
                     # necessary due to the fact that we can't run bitbake from
                     # inside recipetool since recipetool keeps tinfoil active
@@ -167,6 +170,7 @@ def add(args, config, basepath, workspace):
                     # to exit out and come back here to do it.
                     ensure_npm(config, basepath, args.fixed_setup, check_exists=False)
                     logger.info('Re-running recipe creation process after building nodejs')
+                    builtnpm = True
                     continue
                 elif e.exitcode == 15:
                     raise DevtoolError('Could not auto-determine recipe name, please specify it on the command line')
-- 
2.9.3


