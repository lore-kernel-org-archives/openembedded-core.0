Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D256D77CFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467501"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:13 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:14 -0500
Message-Id: <96407528134e0e8d65e8a6c34931f3877dc1a0eb.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 06/30] oe/copy_buildsystem: check_sstate_task_list also pop BBPATH from env
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The BBPATH environment could be set and can make a failure when try
to build an extensible sdk because it will look the bitbake.lock
file in the original build folder.

Example:

$ export BBPATH=`pwd`
$ bitbake core-image-minimal -c populate_sdk_ext

ERROR: bitbake failed:
ERROR: Only one copy of bitbake should be run against a build directory
ERROR: core-image-minimal-1.0-r0 do_populate_sdk_ext: Function failed:
copy_buildsystem

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/copy_buildsystem.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index a3729041835..dd506a39e6c 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -239,6 +239,7 @@ def check_sstate_task_list(d, targets, filteroutfile, cmdprefix='', cwd=None, lo
     cmd = "%sBB_SETSCENE_ENFORCE=1 PSEUDO_DISABLED=1 oe-check-sstate %s -s -o %s %s" % (cmdprefix, targets, filteroutfile, logparam)
     env = dict(d.getVar('BB_ORIGENV', False))
     env.pop('BUILDDIR', '')
+    env.pop('BBPATH', '')
     pathitems = env['PATH'].split(':')
     env['PATH'] = ':'.join([item for item in pathitems if not item.endswith('/bitbake/bin')])
     bb.process.run(cmd, stderr=subprocess.STDOUT, env=env, cwd=cwd, executable='/bin/bash')
-- 
2.11.0


