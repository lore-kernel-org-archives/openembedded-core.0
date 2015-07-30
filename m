Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id EEE6275F23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7E26C18101;
	Thu, 30 Jul 2015 11:43:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CmT2wwDfVgk7; Thu, 30 Jul 2015 11:43:46 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 456B2180EA;
	Thu, 30 Jul 2015 11:43:46 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2E28610EA;
	Thu, 30 Jul 2015 11:43:46 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 22245F43;
	Thu, 30 Jul 2015 11:43:46 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 202BF3E049;
	Thu, 30 Jul 2015 11:43:46 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Thu, 30 Jul 2015
	11:43:45 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id DD7229C68B; 
	Thu, 30 Jul 2015 11:43:45 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 11:43:45 +0200
Message-ID: <1438249425-5423-1-git-send-email-olofjn@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] base.bbclass: Don't warn about "invalid" PACKAGECONFIGs by default
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
X-List-Received-Date: Thu, 30 Jul 2015 09:43:51 -0000
Content-Type: text/plain

The recently added warnings for recipes that try to use undefined
packageconfigs isn't compatible with the PACKAGECONFIG approach of
exporting a common set of configs and letting the recipe look only at
the configs they care about.

This change introduces a STRICT_PACKAGECONFIG variable that one can
enable to get the warnings.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/base.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e0f1053..6f652d8 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -340,9 +340,12 @@ python () {
         pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
         pn = d.getVar("PN", True)
 
-        for pconfig in pkgconfig:
-            if pconfig not in pkgconfigflags:
-                bb.warn("%s: invalid PACKAGECONFIG: %s" % (pn, pconfig))
+        # If STRICT_PACKAGECONFIG is set, warn about recipes that sets undefined
+        # PACKAGECONFIGs.
+        if bb.utils.to_boolean(d.getVar("STRICT_PACKAGECONFIG", True)):
+            for pconfig in pkgconfig:
+                if pconfig not in pkgconfigflags:
+                    bb.warn("%s: invalid PACKAGECONFIG: %s" % (pn, pconfig))
 
         mlprefix = d.getVar("MLPREFIX", True)
 
-- 
2.1.4


