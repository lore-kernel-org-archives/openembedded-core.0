Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4CB60616
	for <openembedded-core@openembedded.org>;
	Wed,  7 Sep 2016 14:10:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 07 Sep 2016 07:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,296,1470726000"; d="scan'208";a="1026322346"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.9.194])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2016 07:10:36 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@openembedded.org
Date: Wed,  7 Sep 2016 15:10:29 +0100
Message-Id: <ed86c1c66b672f6b959f93155ba456f173f6f0d6.1473257282.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473257282.git.joshua.g.lock@intel.com>
References: <cover.1473257282.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473257282.git.joshua.g.lock@intel.com>
References: <cover.1473257282.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/1] runqemu: remove use of subprocess.run()
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
X-List-Received-Date: Wed, 07 Sep 2016 14:10:36 -0000

We aim to support Python 3.4+ whereas subprocess.run() was added
in Python 3.5.
Replace subprocess.run() with subprocess.check_output().

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 0a56c60..3ffd87a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -858,10 +858,11 @@ class BaseConfig(object):
             cmd = 'bitbake -e'
 
         logger.info('Running %s...' % cmd)
-        proc = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE)
-        if proc.returncode != 0:
-            logger.warn("Couldn't run 'bitbake -e' to gather environment information")
-        self.bitbake_e = proc.stdout.decode('utf-8')
+        try:
+            out = subprocess.check_output(cmd, shell=True).decode('utf-8')
+            self.bitbake_e = out
+        except subprocess.CalledProcessError as err:
+            logger.warn("Couldn't run 'bitbake -e' to gather environment information/\n%s" % out)
 
 def main():
     if len(sys.argv) == 1 or "help" in sys.argv:
-- 
2.7.4


