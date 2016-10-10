Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7606071A1C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 08:30:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Oct 2016 01:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,471,1473145200"; d="scan'208";a="1068367628"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 10 Oct 2016 01:30:10 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 11:30:04 +0300
Message-Id: <040c9e4fdcec710294ab7003ac7482448bab56e3.1476087291.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b37e5eddccd2448a5ba13b752b198540617dd5c1.1476087291.git.jussi.kukkonen@intel.com>
References: <b37e5eddccd2448a5ba13b752b198540617dd5c1.1476087291.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1476087291.git.jussi.kukkonen@intel.com>
References: <cover.1476087291.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] depexp: Close UI with error message on NoProvider event
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
X-List-Received-Date: Mon, 10 Oct 2016 08:30:32 -0000

Without this the UI just sits there doing nothing. Showing an
infobar in-UI would be nicer but not much more useful since currently
user couldn't do anything in-UI to fix the situation. Implementation
is based on the one in knotty.

Fixes [YOCTO #9288]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 bitbake/lib/bb/ui/depexp.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/bitbake/lib/bb/ui/depexp.py b/bitbake/lib/bb/ui/depexp.py
index 995703d..d879e04 100644
--- a/bitbake/lib/bb/ui/depexp.py
+++ b/bitbake/lib/bb/ui/depexp.py
@@ -301,6 +301,30 @@ def main(server, eventHandler, params):
             if isinstance(event, bb.command.CommandCompleted):
                 continue
 
+            if isinstance(event, bb.event.NoProvider):
+                if event._runtime:
+                    r = "R"
+                else:
+                    r = ""
+
+                extra = ''
+                if not event._reasons:
+                    if event._close_matches:
+                        extra = ". Close matches:\n  %s" % '\n  '.join(event._close_matches)
+
+                if event._dependees:
+                    print("Nothing %sPROVIDES '%s' (but %s %sDEPENDS on or otherwise requires it)%s" % r, event._item, ", ".join(event._dependees), r, extra)
+                else:
+                    print("Nothing %sPROVIDES '%s'%s" % (r, event._item, extra))
+                if event._reasons:
+                    for reason in event._reasons:
+                        print(reason)
+
+                _, error = server.runCommand(["stateShutdown"])
+                if error:
+                    print('Unable to cleanly shutdown: %s' % error)
+                break
+
             if isinstance(event, bb.command.CommandFailed):
                 print("Command execution failed: %s" % event.error)
                 return event.exitcode
-- 
2.1.4


