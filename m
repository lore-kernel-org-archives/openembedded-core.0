Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5B1E65C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 09:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1811D180BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:11:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id PmqWB0Sdbmx9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:11:33 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id CEC041806E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:11:33 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B8668103A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:11:33 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id AD763E30
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:11:33 +0200 (CEST)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by seth.se.axis.com (Postfix) with ESMTP id AB50B3E048;
	Tue,  2 Sep 2014 11:11:33 +0200 (CEST)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id C7DDA8000EF; Tue,  2 Sep 2014 11:11:17 +0200 (CEST)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Sep 2014 11:11:16 +0200
Message-Id: <1409649076-8611-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] useradd-staticids.bbclass: Fix for Bug 6633
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
X-List-Received-Date: Tue, 02 Sep 2014 09:11:39 -0000

From: Fabrice Coulon <fabrice@axis.com>

When using the useradd-staticids.bbclass under meta/classes,
this error occurs:
"<username> - <username>: Username  does not have a static uid defined."
There was a problem with the regular expression for parsing parameters,
it was sometimes returning an empty string.

I have fixed this by skipping empty strings.

Signed-off-by: Fabrice Coulon <fabrice@axis.com>
---
 meta/classes/useradd-staticids.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index a89cb10..421a70a 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -58,7 +58,9 @@ def update_useradd_static_config(d):
 
         newparams = []
         for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
-            param=param.strip()
+            param = param.strip()
+            if not param:
+                continue
             try:
                 uaargs = parser.parse_args(re.split('''[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
             except:
@@ -194,7 +196,9 @@ def update_useradd_static_config(d):
 
         newparams = []
         for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
-            param=param.strip()
+            param = param.strip()
+            if not param:
+                continue
             try:
                 # If we're processing multiple lines, we could have left over values here...
                 gaargs = parser.parse_args(re.split('''[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
-- 
1.9.1


