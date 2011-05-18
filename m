Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnw5-0001o0-Mx
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:05:41 +0200
Received: by pvc30 with SMTP id 30so924796pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=rUcBtwkpIYX99giSKmZc8MD/kVYH09C8KcOunkvx1U0=;
	b=w1p+47enJRj42CA+ocKT7/2c9WXbBTrCw6Si8HiDhsB3RZ3ugaH1qWpw1KgCx2Efv4
	WsriBRyEcmDl2HVAuv1XvwkScKPpxwA7HYOquivrDEv2s02E0N5V91rZ24HFyBqOVLq5
	+6MFay+f02FllZzNpTg6k8OZsVYMihbYyfN5Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RJ99QzhOmLClD5cMw4eRBOTLR5DPyfua7HvgPPoliQ9ivNde0Tv0JIeR05mexiGqnA
	hdagHDPLl0yUfOxTuMk2uakaHdDL30V5Zi1GMomMnAU2nsCFPlG0V6qihXKWMHmGor6D
	UwP00bawLEsAvfT//LfMLhDPja3iVF1qdQ1Gg=
Received: by 10.142.56.16 with SMTP id e16mr1305045wfa.74.1305752566073;
	Wed, 18 May 2011 14:02:46 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id k6sm1690201wfa.5.2011.05.18.14.02.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:02:45 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:02:32 -0700
Message-Id: <de72fa6b7cdb0b808b0f12a62822efc5782a1748.1305752502.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/5] Shift oe import logic out of the event handler
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
X-List-Received-Date: Wed, 18 May 2011 21:05:42 -0000

From: Chris Larson <chris_larson@mentor.com>

This can be useful if we need the imports from another config parsed event
handler, and can't rely upon the base one running before that one.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |   33 ++++++++++++++++++---------------
 1 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 51f5a14..391545c 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -12,26 +12,29 @@ inherit logging
 
 OE_IMPORTS += "os sys time oe.path oe.utils oe.data"
 
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
 	bbfatal "$*"
-- 
1.7.1



