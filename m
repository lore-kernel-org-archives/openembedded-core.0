Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id BF87677F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:33:54 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id z62so19665274ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jb8WxN5zp4yzOQGgQqV74Em2ntc+rnj0wghsZCvE1cE=;
	b=XafcgHoT8djUcnMDlkaHaOkhaoPTjrCQixxyrnQFc+oTT+hrzgmYDMg+Lty2iupW2H
	Cg1aUemUoWMtXqiuestUqnCX+ZcAR7nOoe5GfEvTO8wZeevyGmNQbc3vBG613qn33Mot
	er2Yyu+ss/qh0dyn3aEmTyCAQwjAthTxwRQelte1oVSq0UUtBzRI7kOwI8gFSrqtB5o8
	ktGC4zG41ZZnhJEw/JXcR1O+Nza2UUSMgINVWmWtrXaguKGRR3gwf3csT2Pogucc1LdG
	CWnuiYJ7y/bYpCct0crbZWIXL4ymXbTKViOeVbZWov/RCZ1Xy2Fy3GGbh5g+9FFNb1Hj
	KRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Jb8WxN5zp4yzOQGgQqV74Em2ntc+rnj0wghsZCvE1cE=;
	b=XWtCa5s/720DXW8IWwmIG/h3e6OLzZE4yvNpsgsb9w56El86NFjyhf6GOwT7Y8nYa7
	D4At2jtHR1rIuqE8j+Wi58hb0+72KwxW8PLNbEGYA9CZhCIiIPEOgEjagwTPowJ4uZmj
	WPsDIlBfJB+JMINMd0BriMveo2ZDWRPvqv2KYpQ2MYLtbRMuEjDpbZxhgTia2J+IqoYy
	zapTWNWqVFxwgdNjoDKoajXqIyMfO0whxUiFXXQPoXijRsXwGGIP05bRtEO5Scltdllu
	paO1r9rOHhCPkGLiu2yYDAyvKApvtL6CKxsVpZkV9No0M0rYrgAemt3jdzfLoenoA4JY
	Jt9w==
X-Gm-Message-State: AKS2vOwXMexyfif9ErVTvYyQ+F0H2mM5KYMzyTdhpg2XoiqLho6eSRMQ
	11PRSP29oG5hkuKy+ys=
X-Received: by 10.107.3.225 with SMTP id e94mr7889106ioi.64.1498577635342;
	Tue, 27 Jun 2017 08:33:55 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	f40sm1702550ioj.19.2017.06.27.08.33.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 08:33:54 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 17:33:38 +0200
Message-Id: <89eb4c1de58d2de44df217a62c9cd791da16a9eb.1498577501.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 1/6] yocto-compat-layer.py: avoid adding layers more than once
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
X-List-Received-Date: Tue, 27 Jun 2017 15:33:55 -0000

add_layer_dependencies() might get called more than once, or one of
the layer dependencies might already be present. The function should
not add layers again because doing so can cause warnings like:

  WARNING: Duplicate inclusion for .../meta-openembedded/meta-oe/conf/distro/include/meta_oe_security_flags.inc in .../meta-openembedded/meta-oe/conf/layer.conf

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index e35f8c0..eaae4e5 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -4,6 +4,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import os
+import re
 import subprocess
 from enum import Enum
 
@@ -189,10 +190,22 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
     if layer_depends is None:
         return False
     else:
+        # Don't add a layer that is already present.
+        added = set()
+        output = check_command('Getting existing layers failed.', 'bitbake-layers show-layers').decode('utf-8')
+        for layer, path, pri in re.findall(r'^(\S+) +([^\n]*?) +(\d+)$', output, re.MULTILINE):
+            added.add(path)
+
         for layer_depend in layer_depends:
-            logger.info('Adding layer dependency %s' % layer_depend['name'])
+            name = layer_depend['name']
+            path = layer_depend['path']
+            if path in added:
+                continue
+            else:
+                added.add(path)
+            logger.info('Adding layer dependency %s' % name)
             with open(bblayersconf, 'a+') as f:
-                f.write("\nBBLAYERS += \"%s\"\n" % layer_depend['path'])
+                f.write("\nBBLAYERS += \"%s\"\n" % path)
     return True
 
 def add_layer(bblayersconf, layer, layers, logger):
-- 
git-series 0.9.1

