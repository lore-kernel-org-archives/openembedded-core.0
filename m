Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9946600B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 14:31:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5CEVmqt009852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 07:31:48 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 07:31:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 07:31:45 -0700
Message-ID: <8893c8a12a33a3ea417c1bb82c55ee2877aff3f8.1465741803.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465741803.git.liezhi.yang@windriver.com>
References: <cover.1465741803.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] wic: fix path parsing, use last occurrence
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
X-List-Received-Date: Sun, 12 Jun 2016 14:31:47 -0000
Content-Type: text/plain

From: George McCollister <george.mccollister@gmail.com>

If the path contains 'scripts' more than once the first occurrence will be
incorrectly used. Use rfind instead of find to find the last occurrence.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 scripts/lib/wic/plugin.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index ccfdfcb..151ff31 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -42,7 +42,7 @@ class PluginMgr(object):
 
     def __init__(self):
         wic_path = os.path.dirname(__file__)
-        eos = wic_path.find('scripts') + len('scripts')
+        eos = wic_path.rfind('scripts') + len('scripts')
         scripts_path = wic_path[:eos]
         self.scripts_path = scripts_path
         self.plugin_dir = scripts_path + PLUGIN_DIR
-- 
2.8.0


