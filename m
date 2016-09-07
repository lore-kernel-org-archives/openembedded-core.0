Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3817F77085
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 22:04:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 07 Sep 2016 15:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; d="scan'208";a="1026549993"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.9.194])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2016 15:04:32 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 23:04:25 +0100
Message-Id: <d92f093e3d264283f6adf85b606b6005dfbf60b5.1473285523.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473285523.git.joshua.g.lock@intel.com>
References: <cover.1473285523.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473285523.git.joshua.g.lock@intel.com>
References: <cover.1473285523.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/2] runqemu: fixes for when invoked during a bitbake run
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
X-List-Received-Date: Wed, 07 Sep 2016 22:04:50 -0000

When runqemu is invoked from a running bitbake instance it will be
unable to call `bitbake -e` due to the lock held by the calling
bitbake instance.

Our test code sets an OE_TMPDIR environment variable from which we
can infer/guess paths. Add code to do so when self.bitbake_e can't
be set, much as the sh version of runqemu did.

[YOCTO #10240]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index cbc5cc6..7919564 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -570,12 +570,28 @@ class BaseConfig(object):
         if not havenative:
             if not self.bitbake_e:
                 self.load_bitbake_env()
-            native_vars = ['STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE']
-            for nv in native_vars:
-                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
-                if s and s.group(1) != self.get(nv):
-                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
-                    self.set(nv, s.group(1))
+
+            if self.bitbake_e:
+                native_vars = ['STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE']
+                for nv in native_vars:
+                    s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
+                    if s and s.group(1) != self.get(nv):
+                        logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
+                        self.set(nv, s.group(1))
+            else:
+                # when we're invoked from a running bitbake instance we won't
+                # be able to call `bitbake -e` but should have OE_TMPDIR set in
+                # the environment and can guess paths based on it
+                tmpdir = os.environ.get('OE_TMPDIR', None)
+                if tmpdir:
+                    logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
+                    hostos, _, _, _, machine = os.uname()
+                    buildsys = '%s-%s' % (machine, hostos.lower())
+                    staging_dir_native = '%s/sysroots/%s' % (tmpdir, buildsys)
+                    self.set('STAGING_DIR_NATIVE', staging_dir_native)
+                    # we have to assume that STAGING_BINDIR_NATIVE is at usr/bin
+                    staging_bindir_native = '%s/usr/bin' % staging_dir_native
+                    self.set('STAGING_BINDIR_NATIVE', staging_bindir_native)
 
     def print_config(self):
         logger.info('Continuing with the following parameters:\n')
-- 
2.7.4


