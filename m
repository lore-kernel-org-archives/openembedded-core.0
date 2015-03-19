Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4451D6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 05:33:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2J5X5VW025212
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 22:33:05 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Mar 2015 22:33:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 22:33:01 -0700
Message-ID: <2e86e64232181782d1eebe6101015a5fd30cd3e3.1426743145.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426743145.git.liezhi.yang@windriver.com>
References: <cover.1426743145.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] oelint.bbclass: remove duplicated code
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
X-List-Received-Date: Thu, 19 Mar 2015 05:33:04 -0000
Content-Type: text/plain

The old code 'if not srcpath.find("{PN}") == -1:' looks strange, use
'if srcpath.find("{PN}") != -1:' and remove duplicated code.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/oelint.bbclass |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/classes/oelint.bbclass b/meta/classes/oelint.bbclass
index 1cee4b0..3e01503 100644
--- a/meta/classes/oelint.bbclass
+++ b/meta/classes/oelint.bbclass
@@ -54,6 +54,12 @@ python do_lint() {
         f.close()
         return ret
 
+    def checkPN(pkgname, varname, str):
+        if str.find("{PN}") != -1:
+            bb.warn("%s: should use BPN instead of PN in %s" % (pkgname, varname))
+        if str.find("{P}") != -1:
+            bb.warn("%s: should use BP instead of P in %s" % (pkgname, varname))
+
     length = len("file://")
     for item in srcuri:
         if item.startswith("file://"):
@@ -72,14 +78,7 @@ python do_lint() {
     #
     for s in srcuri:
         if not s.startswith("file://"):
-            if not s.find("{PN}") == -1:
-                bb.warn("%s: should use BPN instead of PN in SRC_URI" % pkgname)
-            if not s.find("{P}") == -1:
-                bb.warn("%s: should use BP instead of P in SRC_URI" % pkgname)
+            checkPN(pkgname, 'SRC_URI', s)
 
-    srcpath = d.getVar("S")
-    if not srcpath.find("{PN}") == -1:
-        bb.warn("%s: should use BPN instead of PN in S" % pkgname)
-    if not srcpath.find("{P}") == -1:
-        bb.warn("%s: should use BP instead of P in S" % pkgname)
+    checkPN(pkgname, 'S', d.getVar('S'))
 }
-- 
1.7.9.5


