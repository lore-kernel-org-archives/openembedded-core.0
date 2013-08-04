Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 95F4C6AF54
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 22:25:35 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id i57so1181971yha.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2013 15:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xn0ZqwVz09L4FKIi9ZRFtGiKwke21RdPI4kyr/B/nYs=;
	b=kBRQs62n/eItp3IWJ67WLgbsvSWhLMnPPqqAho09CZ4V815quyls+Ha9NL0MB8by2+
	ayz6JBUoBRrww/ELxKVjobWRDeYPdM6VEvTIDUZmH+CrTTLhcm/K3quRwpzrxcTOxOiY
	5HhE9pvX4Smu/fVKBMwX2HrL7dOpsAjlGgXXYiE8LNxXXMJOC6Fqaotv9HBW3kDc5FB5
	yCnDg3EDMrT7vO8waEu2UtyWGXXMs3E28BuMpyJuXyJXyeZfqSYtpp5W18D7/HDxb7hC
	7g7gMgYUeH/W1f1QYQ/xZci+8o5AuMkE8d7pXRQbo6wPvPxedTTmmpYCu991em2y2+FR
	F4/A==
X-Received: by 10.236.127.3 with SMTP id c3mr1304677yhi.112.1375655135878;
	Sun, 04 Aug 2013 15:25:35 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id
	h26sm31739549yhb.21.2013.08.04.15.25.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 15:25:35 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun,  4 Aug 2013 19:25:16 -0300
Message-Id: <1375655116-10659-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: [RFC PATCH] uboot-config.bbclass: Allow choose of U-Boot config for machine
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
X-List-Received-Date: Sun, 04 Aug 2013 22:25:35 -0000

Some machines provide several possible configurations and until now
there was no easy way for user to override the default setting.

This class provides a system similar to PACKAGECONFIG but for
U-Boot. The format is:

UBOOT_CONFIG ??= <default>
UBOOT_CONFIG[foo] = "config,images"

There are two possible parameters:

 - config: it is used to set UBOOT_MACHINE
 - images: it is used to append onto IMAGE_FSTYPES

Below there's an usage example:

,----[ i.MX6Q SABRE AUTO based example ]
| UBOOT_CONFIG ??= "sd"
| UBOOT_CONFIG[sd] = "mx6qsabreauto_config,sdcard"
| UBOOT_CONFIG[eimnor] = "mx6qsabreauto_eimnor_config"
| UBOOT_CONFIG[nand] = "mx6qsabreauto_nand_config,ubifs"
| UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"
`----

User can, from local.conf or environment, use UBOOT_CONFIG=nand and
override the default setting, as:

,----[ Override example from command line ]
| MACHINE=imx6qsabreauto UBOOT_CONFIG=nand bitbake core-image-base
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/uboot-config.bbclass | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/classes/uboot-config.bbclass

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
new file mode 100644
index 0000000..fc37620
--- /dev/null
+++ b/meta/classes/uboot-config.bbclass
@@ -0,0 +1,39 @@
+# Allow easy override of U-Boot config for a machine
+#
+# The format to specify it, in the machine, is:
+#
+# UBOOT_CONFIG ??= <default>
+# UBOOT_CONFIG[foo] = "config,images"
+#
+# Copyright 2013 (C) O.S. Systems Software LTDA.
+
+addhandler uboot_config_eventhandler
+uboot_config_eventhandler[eventmask] = "bb.event.ConfigParsed"
+python uboot_config_eventhandler() {
+    ubootconfigflags = e.data.getVarFlags('UBOOT_CONFIG')
+    if not ubootconfigflags:
+        return
+
+    ubootconfig = (e.data.getVar('UBOOT_CONFIG', True) or "").split()
+    if len(ubootconfig) > 1:
+        raise bb.parse.SkipPackage('You can only have a single default for UBOOT_CONFIG.')
+    elif len(ubootconfig) == 0:
+        raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
+    ubootconfig = ubootconfig[0]
+
+    for f, v in ubootconfigflags.items():
+        if f == 'defaultval':
+            continue
+
+        items = v.split(',')
+        if items[0] and len(items) > 2:
+            raise bb.parse.SkipPackage('Only config,images can be specified!')
+
+        if ubootconfig == f:
+            bb.debug(1, "Setting UBOOT_MACHINE to %s." % items[0])
+            e.data.setVar('UBOOT_MACHINE', items[0])
+
+            if items[1]:
+                bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
+                e.data.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+}
-- 
1.8.3.2


