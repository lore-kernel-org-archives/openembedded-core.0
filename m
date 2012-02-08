Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Ruz2X-0005hn-Va
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:21:54 +0100
Received: by ggeq1 with SMTP id q1so52314gge.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 20:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=n3NGkRPxxRNS62oAEThG9NjgwyO2oIDCQlsa2Xa1Ibk=;
	b=DxWmYYgMi0X747uNYecSkeqNNHisDtvPh2swXUufjwezDBiB+8knVg8+2VaQxoo6/w
	RC5nEtOVbXd9WCcMfe6v2su4rL8970oifmE7ro4zqbrfNry5BLscf+QhGF+Ssi636CjB
	j+IxIsK4bMCJxP8splUF6gLGxBx7mzve2taXw=
Received: by 10.236.197.74 with SMTP id s50mr34762474yhn.127.1328674430749;
	Tue, 07 Feb 2012 20:13:50 -0800 (PST)
Received: from localhost.localdomain (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id v7sm229460yhi.1.2012.02.07.20.13.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 20:13:50 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 22:13:45 -0600
Message-Id: <6e3eb904850df3ba2283bb0a66e9320a89e15936.1328674343.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1328674343.git.chris_larson@mentor.com>
References: <cover.1328674343.git.chris_larson@mentor.com>
In-Reply-To: <cover.1328674343.git.chris_larson@mentor.com>
References: <cover.1328674343.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] knotty: shut down more cleanly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 04:21:54 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures that when we are shutting down, we drain the queue of events from
the server. This ensures that the server never gets hung up on the join of the
feeder thread associated with the event queue, thereby avoiding a bitbake hang
issue.

Also, since the third keyboard interrupt now behaves the same as the second,
removed that message.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 lib/bb/ui/knotty.py |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/lib/bb/ui/knotty.py b/lib/bb/ui/knotty.py
index e1d42f7..22370ef 100644
--- a/lib/bb/ui/knotty.py
+++ b/lib/bb/ui/knotty.py
@@ -118,6 +118,8 @@ def main(server, eventHandler):
         try:
             event = eventHandler.waitEvent(0.25)
             if event is None:
+                if shutdown > 1:
+                    break
                 continue
             helper.eventHandler(event)
             if isinstance(event, bb.runqueue.runQueueExitWait):
@@ -199,18 +201,18 @@ def main(server, eventHandler):
                 print("Loaded %d entries from dependency cache." % event.num_entries)
                 continue
 
-            if isinstance(event, bb.command.CommandCompleted):
-                break
             if isinstance(event, bb.command.CommandFailed):
                 return_value = event.exitcode
                 logger.error("Command execution failed: %s", event.error)
-                break
+                shutdown = 2
+                continue
             if isinstance(event, bb.command.CommandExit):
                 if not return_value:
                     return_value = event.exitcode
                 continue
-            if isinstance(event, bb.cooker.CookerExit):
-                break
+            if isinstance(event, (bb.command.CommandCompleted, bb.cooker.CookerExit)):
+                shutdown = 2
+                continue
             if isinstance(event, bb.event.MultipleProviders):
                 logger.info("multiple providers are available for %s%s (%s)", event._is_runtime and "runtime " or "",
                             event._item,
@@ -269,9 +271,6 @@ def main(server, eventHandler):
             if ioerror.args[0] == 4:
                 pass
         except KeyboardInterrupt:
-            if shutdown == 2:
-                print("\nThird Keyboard Interrupt, exit.\n")
-                break
             if shutdown == 1:
                 print("\nSecond Keyboard Interrupt, stopping...\n")
                 server.runCommand(["stateStop"])
-- 
1.7.7



