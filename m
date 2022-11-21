Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EB1C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 19:20:28 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.3296.1669058426749096230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 11:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([76.164.132.203])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2ALJKP1s018414
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 13:20:25 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master,langdale][PATCH] qemurunner.py: Support fallback to older QEMU qmp library
Date: Mon, 21 Nov 2022 13:20:25 -0600
Message-Id: <20221121192025.926659-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 19:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173661

From: Mark Hatle <mark.hatle@amd.com>

Some vendor versions of QEMU may be on older versions that do not have
qmp.legacy, but instead of qmp.  Default to the integrated library
versions, fall back to the older one and then if neither is available
catch the exception and provide a more human readable error.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index f175f8a1de..436caef273 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -328,8 +328,14 @@ class QemuRunner:
         try:
             os.chdir(os.path.dirname(qmp_port))
             try:
-               from qmp.legacy import QEMUMonitorProtocol
+               try:
+                   from qmp.legacy import QEMUMonitorProtocol
+               except ModuleNotFoundError:
+                   from qmp import QEMUMonitorProtocol
                self.qmp = QEMUMonitorProtocol(os.path.basename(qmp_port))
+            except ModuleNotFoundError as msg:
+                self.logger.warning("Failed to load QEMUMonitorProtocol from qmp.legacy or qmp: %s" % (msg))
+                return False
             except OSError as msg:
                 self.logger.warning("Failed to initialize qemu monitor socket: %s File: %s" % (msg, msg.filename))
                 return False
-- 
2.25.1


