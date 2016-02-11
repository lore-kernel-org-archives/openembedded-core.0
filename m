Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8134C73180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 22:05:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 11 Feb 2016 14:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,433,1449561600"; d="scan'208";a="910324563"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.155])
	by orsmga002.jf.intel.com with ESMTP; 11 Feb 2016 14:05:59 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 16:08:05 -0600
Message-Id: <1455228486-15517-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [[PATCHv2] 1/2] classes/testsdk: do_testsdkext avoid STAGING_DIR/BASE_WORKDIR in PATH
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
X-List-Received-Date: Thu, 11 Feb 2016 22:06:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The inclusion of STAGING_DIR/BASE_WORKDIR in PATH is contaminating
the environment, i.e. when try to sanity check perl (check_perl_modules)
it takes perl from STAGING_DIR causing eSDK install to fail.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 487f40c..a56ad5e 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -97,9 +97,18 @@ def testsdkext_main(d):
     # extensible sdk shows a warning if found bitbake in the path
     # because can cause problems so clean it
     new_path = ''
+    paths_to_avoid = ['bitbake/bin', 'poky/scripts',
+                       d.getVar('STAGING_DIR', True),
+                       d.getVar('BASE_WORKDIR', True)]
     for p in os.environ['PATH'].split(':'):
-       if 'bitbake/bin' in p or 'poky/scripts' in p:
+       avoid = False
+       for pa in paths_to_avoid:
+           if pa in p:
+              avoid = True
+              break
+       if avoid:
            continue
+
        new_path = new_path + p + ':'
     new_path = new_path[:-1]
     os.environ['PATH'] = new_path
-- 
2.1.4


