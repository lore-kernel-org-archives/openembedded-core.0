Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CCCD177E25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:28:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 05:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="845454157"
Received: from tranm-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.175.125])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2017 05:28:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 00:28:05 +1200
Message-Id: <0a1164ab1a1cb70e38d6211f71f446353de630dd.1492086458.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1492086458.git.paul.eggleton@linux.intel.com>
References: <cover.1492086458.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] devtool: extract: fix handling of failed tasks
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
X-List-Received-Date: Thu, 13 Apr 2017 12:28:14 -0000

If a task such as do_fetch fails when we're extracting source for a
recipe (within devtool modify / upgrade / extract / sync) then we should
naturally stop processing instead of blundering on; in order to do that
we need to be listening for the TaskFailed event. Thanks to Richard
Purdie for noticing and fixing this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 34525b4..c3b65fb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -536,6 +536,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
                                 'bb.command.CommandFailed',
                                 'bb.build.TaskStarted',
                                 'bb.build.TaskSucceeded',
+                                'bb.build.TaskFailed',
                                 'bb.build.TaskFailedSilent'])
 
         def runtask(target, task):
@@ -547,6 +548,8 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
                             break
                         elif isinstance(event, bb.command.CommandFailed):
                             raise DevtoolError('Task do_%s failed: %s' % (task, event.error))
+                        elif isinstance(event, bb.build.TaskFailed):
+                            raise DevtoolError('Task do_%s failed' % task)
                         elif isinstance(event, bb.build.TaskStarted):
                             logger.info('Executing %s...' % event._task)
                         elif isinstance(event, logging.LogRecord):
-- 
2.9.3


