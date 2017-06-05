Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9E721780B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 22:06:39 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 15:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,303,1493708400"; d="scan'208";a="109502567"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by orsmga005.jf.intel.com with ESMTP; 05 Jun 2017 15:06:38 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 17:06:41 -0500
Message-Id: <1496700402-18627-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, libertad.gonzalez.de.la.cruz@intel.com
Subject: [PATCH 1/2] scripts/yocto-compat-layer.py: Return non-zero when layer test fail
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
X-List-Received-Date: Mon, 05 Jun 2017 22:06:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If whatever layer tested fails returns 2 to indicate the
failure.

[YOCTO #11482]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/yocto-compat-layer.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 0d5700b..30c55a9 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -178,16 +178,19 @@ def main():
         results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
         layers_tested = layers_tested + 1
 
+    ret = 0
     if layers_tested:
         logger.info('')
         logger.info('Summary of results:')
         logger.info('')
         for layer_name in results_status:
             logger.info('%s ... %s' % (layer_name, results_status[layer_name]))
+            if not results[layer_name].wasSuccessful():
+                ret = 2 # ret = 1 used for initialization errors
 
     cleanup_bblayers(None, None)
 
-    return 0
+    return ret
 
 if __name__ == '__main__':
     try:
-- 
2.1.4


