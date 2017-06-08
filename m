Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1D1078281
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:32:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271875670"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:32:05 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 11:32:02 -0500
Message-Id: <ce0801ecc9a40a2997f072e27dad859bb8d892f9.1496939387.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] scripts/yocto-compat-layer.py: Return non-zero when layer test fail
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
X-List-Received-Date: Thu, 08 Jun 2017 16:32:08 -0000
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


