Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1Swy6T-0004xG-3b
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 18:18:25 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q72G6hqc025625
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 09:06:44 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 12:06:36 -0400
Message-Id: <1343923596-28854-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] base.bbclass: fix PACKAGECONFIG handling code
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
X-List-Received-Date: Thu, 02 Aug 2012 16:18:25 -0000

PACKAGECONFIG flag code only handles that when it has 3 or 4 items in flag,
it may have a stale data if some flags doesn't need DEPENDS and RDEPENDS.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 meta/classes/base.bbclass |   25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e15fa26..3e6a7de 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -364,20 +364,19 @@ python () {
             if flag == "defaultval":
                 continue
             items = flagval.split(",")
-            if len(items) == 3:
-                enable, disable, depend = items
-                rdepend = ""
-            elif len(items) == 4:
-                enable, disable, depend, rdepend = items
+            num = len(items)
+            if num > 4:
+                bb.error("Only enable,disable,depend,rdepend can be specified!")
+
             if flag in pkgconfig:
-                if depend:
-                    extradeps.append(depend)
-                if rdepend:
-                    extrardeps.append(rdepend)
-                if enable:
-                    extraconf.append(enable)
-            elif disable:
-                    extraconf.append(disable)
+                if num >= 3 and items[2]:
+                    extradeps.append(items[2])
+                if num >= 4 and items[3]:
+                    extrardeps.append(items[3])
+                if num >= 1 and items[0]:
+                    extraconf.append(items[0])
+            elif num >= 2 and items[1]:
+                    extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('EXTRA_OECONF', extraconf)
-- 
1.7.9.5



