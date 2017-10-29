Return-Path: <prvs=14756db9d0=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.220])
	by mail.openembedded.org (Postfix) with ESMTP id 289AD60777
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1509302104;
	s=domk; d=rsi-elektrotechnik.de; h=Date:Subject:Cc:To:From;
	bh=DVLZD51t/Ouos8H+EK4Y6nsEhu2DcYD0Ntufpus7jlA=;
	b=Cafub57gx49kfVBiJmtWI5+8JKdqt7TQPJi+DS4aar168PxuvKEzBJeb1N6G1+XrOv
	jsZtvNbu0zIj0gvh1kmm4dgLPr8rwa8ufjXhrDdfhYrluVxgzfp9TKrSfk3MSlIBVjRS
	WCn4FO8LXTWIvdLPE0toNu8e+BfxMd8tgWt30=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/Kpz6b/avroGOv0c9mHNc01sePA6ZpTLlbQjW24Olytlo4I0NdRCwlcJguoKm15Xs=
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:185a:8b8:af6c:cbea])
	by smtp.strato.de (RZmta 42.8 AUTH) with ESMTPSA id 40b7eet9TIZ0zyG
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Sun, 29 Oct 2017 19:35:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1509302088; x=1509906888;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=From:To:Cc:
	Subject:Date:Message-Id; bh=DVLZD51t/Ouos8H+EK4Y6nsEhu2DcYD0Ntuf
	pus7jlA=; b=Scp2aXRlsQk5ev7uHN7NzmLHgM7JKpKMB2YdrD4aX5ilFmfwkwMA
	BKmbu7kREHci+CJ/SuohVxyTqLajX+O+7oY6g2ZDPC/jgrYRDGFw47sUfVxYDeLG
	+xKCHWH6Jqio8uRzUe4519r6ZMftH06MJj/euW9Hb0fwdz01QNl8sVI=
X-Spam-Processed: mail.rsi-elektrotechnik.de, Sun, 29 Oct 2017 19:34:47 +0100
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RELAYS shortcircuit=no
	autolearn=disabled version=3.4.1
X-Spam-Report: * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28)
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.5.0) with ESMTPSA id
	md50000015513.msg; Sun, 29 Oct 2017 19:34:47 +0100
X-MDRemoteIP: 178.27.11.181
X-MDHelo: jholzmayr.fritz.box
X-MDArrival-Date: Sun, 29 Oct 2017 19:34:47 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=14756db9d0=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Oct 2017 19:34:01 +0100
Message-Id: <20171029183401.27842-1-holzmayr@rsi-elektrotechnik.de>
X-Mailer: git-send-email 2.14.3
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2] devtool: add clean command
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
X-List-Received-Date: Sun, 29 Oct 2017 18:35:04 -0000

Add an idiomatic way to devtool to clean a recipe. When using devtool
in the context of an eSDK there is no direct access to bitbake.
This command exposes the bitbake clean facility through devtool,
keeping the idiomatic interface and configurability.

Signed-off-by: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
---
 scripts/lib/devtool/clean.py | 48 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 scripts/lib/devtool/clean.py

diff --git a/scripts/lib/devtool/clean.py b/scripts/lib/devtool/clean.py
new file mode 100644
index 0000000000..473c30f366
--- /dev/null
+++ b/scripts/lib/devtool/clean.py
@@ -0,0 +1,48 @@
+# Development tool - clean command plugin
+#
+# Copyright (C) 2014-2015 Intel Corporation
+#               2017 R-S-I Elektrotechnik GmbH & Co. KG
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+"""Devtool clean plugin"""
+
+import bb
+from devtool import exec_build_env_command, check_workspace_recipe
+
+def _get_clean_tasks(config):
+    tasks = config.get('Clean', 'clean_task', 'clean').split(',')
+    return ['do_%s' % task.strip() for task in tasks]
+
+def clean(args, config, basepath, workspace):
+    """Entry point for the devtool 'clean' subcommand"""
+
+    build_tasks = _get_clean_tasks(config)
+    try:
+        bbargs = []
+        for task in build_tasks:
+            bbargs.append('%s:%s' % (args.recipename, task))
+        exec_build_env_command(config.init_path, basepath, 'bitbake %s' % ' '.join(bbargs), watch=True)
+    except bb.process.ExecutionError as e:
+        # We've already seen the output since watch=True, so just ensure we return something to the user
+        return e.exitcode
+
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_build = subparsers.add_parser('clean', help='Clean a recipe',
+                                         description='Cleans the specified recipe using bitbake',
+                                         group='working', order=50)
+    parser_build.add_argument('recipename', help='Recipe to clean')
+    parser_build.set_defaults(func=clean)
-- 
2.14.3


-- 
_____________________________________________________________
R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
Fon: +49 8444 9204-0
Fax: +49 8444 9204-50
www.rsi-elektrotechnik.de

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


