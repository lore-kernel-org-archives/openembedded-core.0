Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 496E9600EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 05:59:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2018 23:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,308,1517904000"; d="scan'208";a="25414241"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.221.20.23])
	by orsmga008.jf.intel.com with ESMTP; 14 Mar 2018 22:59:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 13:59:51 +0800
Message-Id: <1521093591-26496-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] checklayer: remove reference to undefined class
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
X-List-Received-Date: Thu, 15 Mar 2018 05:59:59 -0000

LayerError doesn't exist and will lead to an error when this failure
code path is hit.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/checklayer/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 6395261..288c457 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -42,8 +42,8 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
     ldata.setVar('LAYERDIR', layer_path)
     try:
         ldata = bb.parse.handle(lconf, ldata, include=True)
-    except BaseException as exc:
-        raise LayerError(exc)
+    except:
+        raise RuntimeError("Parsing of layer.conf from layer: %s failed" % layer_path)
     ldata.expandVarref('LAYERDIR')
 
     collections = (ldata.getVar('BBFILE_COLLECTIONS') or '').split()
-- 
2.7.4


