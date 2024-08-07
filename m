Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C2CC52D73
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 17:27:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39399.1723051659133480214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 10:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C210FEC
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Aug 2024 10:28:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 31B9F3F71E
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Aug 2024 10:27:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bblayers/machines: add bitbake-layers command to list machines
Date: Wed,  7 Aug 2024 18:27:31 +0100
Message-Id: <20240807172731.4079483-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 17:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203094

Add a command to bitbake-layers to list the machines available in the
current configuration.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/bblayers/machines.py | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/lib/bblayers/machines.py

diff --git a/meta/lib/bblayers/machines.py b/meta/lib/bblayers/machines.p=
y
new file mode 100644
index 00000000000..5fd970af0ec
--- /dev/null
+++ b/meta/lib/bblayers/machines.py
@@ -0,0 +1,37 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import logging
+import pathlib
+
+from bblayers.common import LayerPlugin
+
+logger =3D logging.getLogger('bitbake-layers')
+
+def plugin_init(plugins):
+    return ShowMachinesPlugin()
+
+class ShowMachinesPlugin(LayerPlugin):
+    def do_show_machines(self, args):
+        """List the machines available in the currently configured layer=
s."""
+
+        for layer_dir in self.bblayers:
+            layer_name =3D self.get_layer_name(layer_dir)
+
+            if args.layer and args.layer !=3D layer_name:
+                continue
+
+            for p in sorted(pathlib.Path(layer_dir).glob("conf/machine/*=
.conf")):
+                if args.bare:
+                    logger.plain("%s" % (p.stem))
+                else:
+                    logger.plain("%s (%s)" % (p.stem, layer_name))
+
+
+    def register_commands(self, sp):
+        parser_show_machines =3D self.add_command(sp, "show-machines", s=
elf.do_show_machines)
+        parser_show_machines.add_argument('-b', '--bare', help=3D'output=
 just the machine names, not the source layer', action=3D'store_true')
+        parser_show_machines.add_argument('-l', '--layer', help=3D'Limit=
 to machines in the specified layer')
--=20
2.34.1


