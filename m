Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 73CD56076F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 16:11:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 09:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,285,1493708400"; d="scan'208";a="1155876440"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2017 09:10:59 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 11:11:03 -0500
Message-Id: <1496419863-13332-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] oeqa/runtime/context.py: Add support to specify port in target_ip
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
X-List-Received-Date: Fri, 02 Jun 2017 16:11:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/context.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index c4cd76c..0294003 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -92,6 +92,12 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     def getTarget(target_type, logger, target_ip, server_ip, **kwargs):
         target = None
 
+        if target_ip:
+            target_ip_port = target_ip.split(':')
+            if len(target_ip_port) == 2:
+                target_ip = target_ip_port[0]
+                kwargs['port'] = target_ip_port[1]
+
         if target_type == 'simpleremote':
             target = OESSHTarget(logger, target_ip, server_ip, **kwargs)
         elif target_type == 'qemu':
-- 
2.1.4


