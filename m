Return-Path: <andreas.reichel@tngtech.com>
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id 82AAA779F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id C3DF41E1A2D;
	Fri, 21 Apr 2017 14:10:23 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001,
	URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 1_17lnUSABnY; Fri, 21 Apr 2017 14:10:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 4619E1E1A3F;
	Fri, 21 Apr 2017 14:10:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Fl3q5jC-CgUj; Fri, 21 Apr 2017 14:10:22 +0200 (CEST)
Received: from localhost.localdomain (p578a821c.dip0.t-ipconnect.de
	[87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id 289C61E1A35;
	Fri, 21 Apr 2017 14:10:21 +0200 (CEST)
From: "Andreas J. Reichel" <andreas.reichel@tngtech.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:11:45 +0200
Message-Id: <20170421121145.9797-6-andreas.reichel@tngtech.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170421121145.9797-1-andreas.reichel@tngtech.com>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>
Subject: [wic patch 5/5] wic: Use enum like dicts for string constants
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
X-List-Received-Date: Fri, 21 Apr 2017 12:16:16 -0000

To increase code maintainability, use dictionaries
as enum-like container for parameter string comparisons.

Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>

---
 scripts/lib/wic/engine.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 647358287f..1428a73ba8 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -35,6 +35,16 @@ from wic import WicError
 from wic.pluginbase import PluginMgr
 from wic.utils.misc import get_bitbake_var
 
+class StrEnum(dict):
+    __getattr__ = dict.get
+
+ListType = StrEnum({
+    'LIST_IMAGES': "images",
+    'LIST_SRC_PLUGINS': "source-plugins" })
+
+HelpArg = StrEnum({
+    'HELP': "help" })
+
 logger = logging.getLogger('wic')
 
 def verify_build_env():
@@ -204,14 +214,14 @@ def wic_list(args, scripts_path):
     if args.list_type is None:
         return False
 
-    if args.list_type == "images":
+    if args.list_type == ListType.LIST_IMAGES:
 
         list_canned_images(scripts_path)
         return True
-    elif args.list_type == "source-plugins":
+    elif args.list_type == ListType.LIST_SRC_PLUGINS:
         list_source_plugins()
         return True
-    elif len(args.help_for) == 1 and args.help_for[0] == 'help':
+    elif len(args.help_for) == 1 and args.help_for[0] == HelpArg.HELP:
         wks_file = args.list_type
         fullpath = find_canned_image(scripts_path, wks_file)
         if not fullpath:
-- 
2.11.0


