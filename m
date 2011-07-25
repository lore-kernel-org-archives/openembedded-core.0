Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QlPob-0005Ym-3m for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 20:23:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6PIJSWM031431
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 19:19:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29591-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 19:19:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6PIJHNb031417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 19:19:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 19:19:11 +0100
Message-ID: <1311617951.2344.193.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] lib/oe/utils: 'Fix' oe.utils.contains() behaviour
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
X-List-Received-Date: Mon, 25 Jul 2011 18:23:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently oe.utils.contains(X, "A", true, false) will return true for substring matches,
e.g. if X = "ABC". This is not what most users expect from the function.

In the common OE use of this function there is the case of "touchscreen" and "screen" being
used as independent variables. Whilst it could be argued there isn't a problem in that
specific case (touchscreens are usually on screens), there is no substring usage of this
function is OE-Core so this patch changes the behaviour to match only full strings.

It also fixes a bug where duplicate entries would confuse multiple matches, e.g.
contains(X, ["A", "B"], ...) would match X = "A A" which is clearly wrong.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 4287eee..b3473d3 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -35,16 +35,15 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def contains(variable, checkvalues, truevalue, falsevalue, d):
-    val = bb.data.getVar(variable,d,1)
+    val = d.getVar(variable, True)
     if not val:
         return falsevalue
-    matches = 0
-    if type(checkvalues).__name__ == "str":
-        checkvalues = [checkvalues]
-    for value in checkvalues:
-        if val.find(value) != -1:
-            matches = matches + 1
-    if matches == len(checkvalues):
+    val = set(val.split())
+    if isinstance(checkvalues, basestring):
+        checkvalues = set(checkvalues.split())
+    else:
+        checkvalues = set(checkvalues)
+    if checkvalues.issubset(val):
         return truevalue
     return falsevalue
 




