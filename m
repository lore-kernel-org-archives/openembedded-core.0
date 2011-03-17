Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fwj-00027I-Sm
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:21:10 +0100
Received: by gyf1 with SMTP id 1so1171097gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=tuJ/FWdyKMXs7ShXeLBua4bCRxryeHwidNbnh6XyjhQ=;
	b=fhzDZ8Hcy8K53VnGxhQg00v2HPxTU9C1+xajdWvzAT/AgQDHylMUvzh2+OA4j61i8S
	J7Vg0JpuVJVHkh6wLlX2ZoJn0HE8L9GbGa0j8mXZ0Cyyw0uerBpVsFKszSK/0gJeWUzc
	o+qiK4pYsIuRKqLwHglNXaEzOrCSrALEX1xHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dscEQTm/wuTX8FcurbW+HZ0mBBTGSrIP2+DabZ/JrE+Bq/o+5yVD9Wn7+cMxtkPeHg
	Z9YBHNUTq/YWhPiyXgqLpQjAo8WprHqB1YIHGG8wHLwLbDdZgjgNuDpZUtv7CtKw6lTz
	yewHqUtckY3rwVE8VtSTq9HZesf6w9s1a3cUc=
Received: by 10.150.93.18 with SMTP id q18mr31854ybb.207.1300378761935;
	Thu, 17 Mar 2011 09:19:21 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:21 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:03 -0700
Message-Id: <c47222c1e7c4bb7842d2d693f8a0d6e8f39ada4a.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 05/12] base.bbclass: switch to current OE's imports handling
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
X-List-Received-Date: Thu, 17 Mar 2011 16:21:10 -0000

From: Chris Larson <chris_larson@mentor.com>

The current mechanism makes it easier for classes to add new oe modules to be
automatically imported, and thereby made available to python snippets (${@}).

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |   21 +++++++++------------
 1 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e53ebe4..7a87f57 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -9,31 +9,28 @@ inherit utility-tasks
 inherit metadata_scm
 inherit buildstats
 
-python sys_path_eh () {
+OE_IMPORTS += "oe.path oe.utils sys os time"
+
+python oe_import () {
     if isinstance(e, bb.event.ConfigParsed):
-        import sys
-        import os
-        import time
+        import os, sys
 
         bbpath = e.data.getVar("BBPATH", True).split(":")
         sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
 
         def inject(name, value):
-            """Make a python object accessible from everywhere for the metadata"""
+            """Make a python object accessible from the metadata"""
             if hasattr(bb.utils, "_context"):
                 bb.utils._context[name] = value
             else:
                 __builtins__[name] = value
 
-        import oe.path
-        import oe.utils
-        inject("bb", bb)
-        inject("sys", sys)
-        inject("time", time)
-        inject("oe", oe)
+        for toimport in e.data.getVar("OE_IMPORTS", True).split():
+            imported = __import__(toimport)
+            inject(toimport.split(".", 1)[0], imported)
 }
 
-addhandler sys_path_eh
+addhandler oe_import
 
 die() {
 	oefatal "$*"
-- 
1.7.2.3



