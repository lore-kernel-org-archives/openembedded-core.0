Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE07571B86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:30 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885938"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:44 +1300
Message-Id: <b2b5d14d38ffd6de1dbe86f17545c5938e918dda.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/14] devtool: prevent BBHandledException from showing traceback
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:31 -0000

If we don't catch this then attempting to run devtool in non-memres mode
when bitbake is already running will produce a traceback instead of just
an error message.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 0c32c50..656898a 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -288,11 +288,14 @@ def main():
     scriptutils.logger_setup_color(logger, global_args.color)
 
     if global_args.bbpath is None:
-        tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
         try:
-            global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
-        finally:
-            tinfoil.shutdown()
+            tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
+            try:
+                global_args.bbpath = tinfoil.config_data.getVar('BBPATH', True)
+            finally:
+                tinfoil.shutdown()
+        except bb.BBHandledException:
+            return 2
 
     for path in [scripts_path] + global_args.bbpath.split(':'):
         pluginpath = os.path.join(path, 'lib', 'devtool')
-- 
2.5.5


