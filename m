Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6866FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 10:03:47 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 03:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="137214645"
Received: from peggleto-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.43.222])
	by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2017 03:03:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 12:03:44 +0200
Message-Id: <c402f25ed2151e87e201ffcb1b8a9b0fc1550a1c.1502100124.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1502100124.git.paul.eggleton@linux.intel.com>
References: <cover.1502100124.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] devtool: fix handling of errors during task execution
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
X-List-Received-Date: Mon, 07 Aug 2017 10:03:47 -0000

* If an error is logged while executing a task, we need to ensure we
  exit instead of assuming everything went OK.
* If we receive CookerExit, the server is shutting down and we need to
  stop waiting for events and probably exit (knotty does this). This
  will occur if an exception or bb.fatal() happens during an event
  handler.

This fixes a couple of issues highlighted when using devtool upgrade or
modify on a non-supported recipe with intel-iot-refkit together with
bitbake master, but I'd be very surprised if it were hard to reproduce
in other scenarios.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 22a9ec8..ec19223 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -498,18 +498,24 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
                                 'logging.LogRecord',
                                 'bb.command.CommandCompleted',
                                 'bb.command.CommandFailed',
+                                'bb.cooker.CookerExit',
                                 'bb.build.TaskStarted',
                                 'bb.build.TaskSucceeded',
                                 'bb.build.TaskFailed',
                                 'bb.build.TaskFailedSilent'])
 
         def runtask(target, task):
+            error = False
             if tinfoil.build_file(target, task):
                 while True:
                     event = tinfoil.wait_event(0.25)
                     if event:
                         if isinstance(event, bb.command.CommandCompleted):
                             break
+                        elif isinstance(event, bb.cooker.CookerExit):
+                            # The server is going away, so drop the connection
+                            tinfoil.server_connection = None
+                            break
                         elif isinstance(event, bb.command.CommandFailed):
                             raise DevtoolError('Task do_%s failed: %s' % (task, event.error))
                         elif isinstance(event, bb.build.TaskFailed):
@@ -519,7 +525,11 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
                         elif isinstance(event, logging.LogRecord):
                             if event.levelno <= logging.INFO:
                                 continue
+                            if event.levelno >= logging.ERROR:
+                                error = True
                             logger.handle(event)
+                if error:
+                    raise DevtoolError('An error occurred during do_%s, exiting' % task)
 
         # we need virtual:native:/path/to/recipe if it's a BBCLASSEXTEND
         fn = tinfoil.get_recipe_file(pn)
-- 
2.9.4


