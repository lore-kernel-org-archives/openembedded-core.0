Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgIwO-00041O-68 for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 18:02:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFwfXH012658
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12581-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFwSnB012639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2011 16:57:42 +0100
Message-ID: <1310399862.20015.981.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [RFC PATCH 1/3] bitbake/utils: Add contains helper function
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
X-List-Received-Date: Mon, 11 Jul 2011 16:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/utils.py |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 82e5dc4..e19e1c8 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -856,3 +856,19 @@ def to_boolean(string, default=None):
         return False
     else:
         raise ValueError("Invalid value for to_boolean: %s" % string)
+
+
+def contains(variable, checkvalues, truevalue, falsevalue, d):
+    val = d.getVar(variable, True)
+    if not val:
+        return falsevalue
+    matches = 0
+    if type(checkvalues).__name__ == "str":
+        checkvalues = [checkvalues]
+    for value in checkvalues:
+        if val.find(value) != -1:
+            matches = matches + 1
+    if matches == len(checkvalues):
+        return truevalue
+    return falsevalue
+
-- 
1.7.4.1




