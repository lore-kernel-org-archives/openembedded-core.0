Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1778771CE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:34:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAC7Ygw6018626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 23:34:42 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 Nov 2015 23:34:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Nov 2015 23:34:39 -0800
Message-ID: <70acbfcac541d52baad29e7fd76796e3d3f6a964.1447313581.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1447313581.git.liezhi.yang@windriver.com>
References: <cover.1447313581.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] prexport.bbclass: avoid export for native and crosssdk
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
X-List-Received-Date: Thu, 12 Nov 2015 07:34:43 -0000
Content-Type: text/plain

* The prservice is only used by do_package, the native or crosssdk
  doesn't have do_package.
* Change WARN to NOTE when no AUTOPR found, the prexport_handler()
  checks all the parsed recipes, but a lot of them may not be built, for
  example, the lower version or broken recipes. So change WARN to NOTE to
  not confuse user.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/prexport.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/prexport.bbclass b/meta/classes/prexport.bbclass
index 5a1cb33..809ec10 100644
--- a/meta/classes/prexport.bbclass
+++ b/meta/classes/prexport.bbclass
@@ -8,7 +8,8 @@ PRSERV_DUMPFILE ??= "${PRSERV_DUMPDIR}/prserv.inc"
 
 python prexport_handler () {
     import bb.event
-    if not e.data:
+    if not e.data or bb.data.inherits_class('native', e.data) or \
+        bb.data.inherits_class('crosssdk', e.data):
         return
 
     if isinstance(e, bb.event.RecipeParsed):
@@ -21,7 +22,7 @@ python prexport_handler () {
             bb.fatal("prexport_handler: export failed!")
         (metainfo, datainfo) = retval
         if not datainfo:
-            bb.warn("prexport_handler: No AUTOPR values found for %s" % ver)
+            bb.note("prexport_handler: No AUTOPR values found for %s" % ver)
             return
         oe.prservice.prserv_export_tofile(e.data, None, datainfo, False)
         if 'AUTOINC' in ver:
-- 
1.7.9.5


