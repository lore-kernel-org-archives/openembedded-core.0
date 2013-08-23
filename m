Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 419EB6B885
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:49:31 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id a41so196947yho.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uH0obz84ydDuierbqL1LYEcfqCTMFV7anCOahDqozL4=;
	b=eC3dUjppFSN5jPzh0tVsY0TBQcJPpSzxsQcDrhNzs5eFwPIx6u0Jvchk32mTCMwF9R
	bFzzBolCA3xsi3vEoDMPksKkIvhQpku/8eFiVK1o9xjfwfD3PWuWfBZV7NPzjq2s54PD
	FruE02cFjymLA20+os6SFJxHfdQaqE0bA0tKO+suY2fU9gc17jCf9LXJxab4fumYwzLF
	aQaXnxZrS8Z5k6cL1pOXidCApMLCCNEPE2qa4h7PeKs6Sb3qXKTQRQnzBKlNkOeF362n
	s23RrxiNzAbJhFoHNNPvJMpCJ488uRCdmAbXAW3udfbkdIeTInehUKwpb6BeVlv7nhzj
	xRbg==
X-Received: by 10.236.6.199 with SMTP id 47mr33037yhn.127.1377269372047;
	Fri, 23 Aug 2013 07:49:32 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id v23sm248195yhv.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 07:49:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2013 11:48:58 -0300
Message-Id: <1377269339-6139-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
In-Reply-To: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
References: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: [RFC PATCH v5 2/2] uboot-config.bbclass: Allow choose of U-Boot config for machine
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
X-List-Received-Date: Fri, 23 Aug 2013 14:49:31 -0000

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
Changes in v5:
- Resend

Changes in v4: None
Changes in v3: None
Changes in v2: None

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
1.8.4.rc1


