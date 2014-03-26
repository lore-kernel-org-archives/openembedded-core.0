Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7556F9D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:09:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2QF9FO6023760 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:09:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iePcMebRcGYb
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:09:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2QF9CBJ023752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:09:14 GMT
Message-ID: <1395846546.24890.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 15:09:06 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity.bbclass: Update against bitbake sanity event changes
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
X-List-Received-Date: Wed, 26 Mar 2014 15:09:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Bitbake will now trigger sanity events when it needs the checks to run in all cases
so we can drop the ConfigParsed hook. We now control whether events are generated
or errors are raised from the event itself.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d79db8f..cf514d0 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -779,20 +779,19 @@ def copy_data(e):
     return sanity_data
 
 addhandler check_sanity_eventhandler
-check_sanity_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.SanityCheck bb.event.NetworkTest"
+check_sanity_eventhandler[eventmask] = "bb.event.SanityCheck bb.event.NetworkTest"
 python check_sanity_eventhandler() {
-    if bb.event.getName(e) == "ConfigParsed" and e.data.getVar("BB_WORKERCONTEXT", True) != "1" and e.data.getVar("DISABLE_SANITY_CHECKS", True) != "1":
+    if bb.event.getName(e) == "SanityCheck":
         sanity_data = copy_data(e)
-        reparse = check_sanity(sanity_data)
-        e.data.setVar("BB_INVALIDCONF", reparse)
-    elif bb.event.getName(e) == "SanityCheck":
-        sanity_data = copy_data(e)
-        sanity_data.setVar("SANITY_USE_EVENTS", "1")
+        if e.generateevents:
+            sanity_data.setVar("SANITY_USE_EVENTS", "1")
         reparse = check_sanity(sanity_data)
         e.data.setVar("BB_INVALIDCONF", reparse)
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
     elif bb.event.getName(e) == "NetworkTest":
         sanity_data = copy_data(e)
+        if e.generateevents:
+            sanity_data.setVar("SANITY_USE_EVENTS", "1")
         bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity(sanity_data) else bb.event.NetworkTestPassed(), e.data)
 
     return



