Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5D6780AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:32:48 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id p24so42947658ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jb8WxN5zp4yzOQGgQqV74Em2ntc+rnj0wghsZCvE1cE=;
	b=T9kBQEUY0u4C6Hp+ouNK4GF8c76/3C7IbpJwQlDiCXRroGpB0uZ85N5TTT7MXSaqQA
	oT7wz0NQxEFiH4Aqa0jYDsaNLhQ9rHbhNiZsOcpQZV0vVdK+6LF7PbjSVETjTN5OqzPJ
	XqkrYZDa6kFSUoa46m3coFZ5vd4cik2CD/7SdMBsCKMaoVLfULtltD0SS6WT4xINnUcf
	4oDSiN7Ox6MT2TPn3pQnJgYht/fzcdhNq2DIs24j6cC4Np/h71hPMjxr+4xJGP2jXX73
	LxA42uyukoTtQBPuCkjAdITaPTXZEloiPBi4J6M71vwwoPZpZQRoer1fujgBBYSYek8D
	oexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Jb8WxN5zp4yzOQGgQqV74Em2ntc+rnj0wghsZCvE1cE=;
	b=a+MpKXjZHR+9tMrbxWf88n2TWpBjFgCY8RweZY2uodLZ/TTKHnCaoPT+eRwpXF9RS6
	0OCmgD7Cx7vxfJvu1xiloWEBkt/5MQeynFfMLcSoAraNqm+5CvaVUxUOsxcIL3eiCu8K
	Hs/iHn1QHHE8MawhczCQCcQIJ+H2oOAeJd0M9EAVs75ktCWEh6Onl+8xsGU6fJ0A/bzy
	0dvA9anZvy7msHcezuCeLaOPeYepGcZJV2WD3tTWGIxQi3pH1ydYP/k7S8nMuQZbdd+q
	WmcOa7ztT0gQgd0+eP3SXMNg7ruMiOID+wRqKuPVIZu7sEC7USRYt3c+Y3Z4nxZ4+o6a
	ydtQ==
X-Gm-Message-State: AODbwcCm0fVfvMBHdQvsFgv5jaO4LE8JcFwb3s8RXYqSAuVF3gdZBlfz
	fKGTP+dPVTaZ+fMsOyg=
X-Received: by 10.107.150.70 with SMTP id y67mr13163854iod.27.1496071969851;
	Mon, 29 May 2017 08:32:49 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	r82sm4232600iod.45.2017.05.29.08.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 08:32:48 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:32:35 +0200
Message-Id: <fe3a63060146adbb0fb76543cc5db9f124956df6.1496071841.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/6] yocto-compat-layer.py: avoid adding layers more than once
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
X-List-Received-Date: Mon, 29 May 2017 15:32:49 -0000

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

