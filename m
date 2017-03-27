Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC37B60685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 17:01:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 27 Mar 2017 10:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,232,1486454400"; d="scan'208";a="65594189"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.126])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2017 10:01:35 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 11:05:30 -0600
Message-Id: <1490634330-5652-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] scripts/yocto-compat-layer.py: Add dependency validation in add_layer
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
X-List-Received-Date: Mon, 27 Mar 2017 17:01:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some layers don't have dependencies so add a validation to avoid
exception when trying to None.split().

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/compatlayer/__init__.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 435679e..58f94b7 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -143,7 +143,11 @@ def add_layer(bblayersconf, layer, layers, logger):
     logger.info('Adding layer %s' % layer['name'])
 
     for collection in layer['collections']:
-        for depend in layer['collections'][collection]['depends'].split():
+        depends = layer['collections'][collection]['depends']
+        if not depends:
+            continue
+
+        for depend in depends.split():
             # core (oe-core) is suppose to be provided
             if depend == 'core':
                 continue
-- 
2.1.4


