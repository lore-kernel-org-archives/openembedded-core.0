Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67B2376537
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 09:31:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2015 02:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,583,1432623600"; d="scan'208";a="759091790"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.23.101])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2015 02:31:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 10:31:34 +0100
Message-Id: <23c41aae25a330d6deec78852fa53241466fa193.1438335038.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438335038.git.paul.eggleton@linux.intel.com>
References: <cover.1438335038.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438335038.git.paul.eggleton@linux.intel.com>
References: <cover.1438335038.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] devtool: use tinfoil shutdown method
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
X-List-Received-Date: Fri, 31 Jul 2015 09:31:38 -0000

Tinfoil now has its own shutdown method, use it instead of calling into
cooker - not only is it the right thing to do from an API perspective,
it also ensures proper lock handling.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 557a830..5d37d3b 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -244,8 +244,7 @@ def main():
                  tinfoil.config_data.getVar('BBPATH', True).split(':')):
         pluginpath = os.path.join(path, 'lib', 'devtool')
         scriptutils.load_plugins(logger, plugins, pluginpath)
-    tinfoil.cooker.shutdown(force=True)
-    tinfoil.cooker.unlockBitbake()
+    tinfoil.shutdown()
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
 
-- 
2.1.0


