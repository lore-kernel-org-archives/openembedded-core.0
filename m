Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0G4k-0002N7-3R
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:29:26 +0100
Received: by gxk3 with SMTP id 3so462701gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=fTuS+qd8A4WH/9awZD/fqZNp6E+pzgOJXK7x9l3licE=;
	b=R8d+AUQleG3NVRh6FOAlvvLi4YTFwNw71Bt824Y2agm+R7YgXYTvyuEg5+bzCSPCw0
	/CPQxLszH+5PfBigY9IOD228zqRszHJEAMMThuCUsMi4X4nn94VTgGq7sDgZCp6PRpdd
	VHyFYw0T0Nl3tC5nt9IMmv6depxhnHtY+AaOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RWudBWZ7H11kYzYydNsUkynTaCCjUK6EhcR+lxgLAQ0X7Eij8ObnfOiQbNh8i7w8M1
	oHdLsOuRv2lBI9uzzv6EtmXtdVUmHGqdbPGWHbtj8tMUsk5BVL8BoQIhvK4hPAngEGVp
	x+778+gKboA27u9bRo5LGAf1nlfCW7lMWHxcM=
Received: by 10.236.185.134 with SMTP id u6mr1582798yhm.217.1300378763354;
	Thu, 17 Mar 2011 09:19:23 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id u79sm1277609yhn.5.2011.03.17.09.19.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:19:22 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:19:04 -0700
Message-Id: <364a78379e4afb498435367b9651886cfea81798.1300378596.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378596.git.chris_larson@mentor.com>
References: <cover.1300378596.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 06/12] Shift oe import logic out of the event handler
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
X-List-Received-Date: Thu, 17 Mar 2011 16:29:26 -0000

From: Chris Larson <chris_larson@mentor.com>

This can be useful if we need the imports from another config parsed event
handler, and can't rely upon the base one running before that one.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |   33 ++++++++++++++++++---------------
 1 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7a87f57..a3d4086 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -11,26 +11,29 @@ inherit buildstats
 
 OE_IMPORTS += "oe.path oe.utils sys os time"
 
-python oe_import () {
-    if isinstance(e, bb.event.ConfigParsed):
-        import os, sys
+def oe_import(d):
+    import os, sys
+
+    bbpath = d.getVar("BBPATH", True).split(":")
+    sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
 
-        bbpath = e.data.getVar("BBPATH", True).split(":")
-        sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
+    def inject(name, value):
+        """Make a python object accessible from the metadata"""
+        if hasattr(bb.utils, "_context"):
+            bb.utils._context[name] = value
+        else:
+            __builtins__[name] = value
 
-        def inject(name, value):
-            """Make a python object accessible from the metadata"""
-            if hasattr(bb.utils, "_context"):
-                bb.utils._context[name] = value
-            else:
-                __builtins__[name] = value
+    for toimport in d.getVar("OE_IMPORTS", True).split():
+        imported = __import__(toimport)
+        inject(toimport.split(".", 1)[0], imported)
 
-        for toimport in e.data.getVar("OE_IMPORTS", True).split():
-            imported = __import__(toimport)
-            inject(toimport.split(".", 1)[0], imported)
+python oe_import_eh () {
+    if isinstance(e, bb.event.ConfigParsed):
+	oe_import(e.data)
 }
 
-addhandler oe_import
+addhandler oe_import_eh
 
 die() {
 	oefatal "$*"
-- 
1.7.2.3



