Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9323F757C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:23:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 10:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,634,1427785200"; d="scan'208";a="729357415"
Received: from apulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.212])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 10:23:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 18:23:24 +0100
Message-Id: <fc3443f502efe26bc00f740f0a14ce10829c9f83.1434559829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] recipetool: appendfile: fix file command error handling
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
X-List-Received-Date: Wed, 17 Jun 2015 17:23:41 -0000

* It turns out that not all versions of the file command support the -E
  option - the version in Ubuntu 14.04 doesn't support it for example.
  This option is supposed to force file to return an error if the file
  can't be opened - since we can't rely upon it then fall back to
  looking at the output instead. (The results of this issue were simply
  that we didn't notice if the file was executable and give a warning,
  which tripped an oe-selftest failure - so it was minor.)
* If we receive an error there's not much point looking at the output to
  see what type was returned because there wasn't one.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/append.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 28015c6..ed4ce4a 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -262,10 +262,12 @@ def appendfile(args):
 
     stdout = ''
     try:
-        (stdout, _) = bb.process.run('LANG=C file -E -b %s' % args.newfile, shell=True)
+        (stdout, _) = bb.process.run('LANG=C file -b %s' % args.newfile, shell=True)
+        if 'cannot open' in stdout:
+            raise bb.process.ExecutionError(stdout)
     except bb.process.ExecutionError as err:
         logger.debug('file command returned error: %s' % err)
-        pass
+        stdout = ''
     if stdout:
         logger.debug('file command output: %s' % stdout.rstrip())
         if ('executable' in stdout and not 'shell script' in stdout) or 'shared object' in stdout:
-- 
2.1.0


