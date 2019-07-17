Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 00EBF7EC70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 13:26:02 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6HDQ3GN009248
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 15:26:03 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.46.11])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x6HDQ21K019478;
	Wed, 17 Jul 2019 15:26:02 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B6B7C98021E;
	Wed, 17 Jul 2019 15:26:02 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 15:25:44 +0200
Message-Id: <20190717132544.17657-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe/copy_buildsystem: move layer into layers directory
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
X-List-Received-Date: Wed, 17 Jul 2019 13:26:03 -0000

Layers could be located outside from poky but inside the build directory.
This case should be covered in eSDK.
meta-abc
meta-def/meta-ghi
meta-def/poky
meta-def/meta-oe/meta-oe
...

It should take all enabled layers and put them into 'layers' dir during
build-time with respecting new relative path to poky.
layers/meta-abc
layers/meta-ghi
layers/poky
layers/meta-oe/meta-oe
...

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/lib/oe/copy_buildsystem.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 5b96121ddb..246ff58250 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -45,6 +45,9 @@ class BuildSystem(object):
 
         corebase = os.path.abspath(self.d.getVar('COREBASE'))
         layers.append(corebase)
+        # Get relationship between TOPDIR and COREBASE
+        # Layers should respect it
+        corebase_relative = os.path.dirname(os.path.relpath(os.path.abspath(self.d.getVar('TOPDIR')), corebase))
         # The bitbake build system uses the meta-skeleton layer as a layout
         # for common recipies, e.g: the recipetool script to create kernel recipies
         # Add the meta-skeleton layer to be included as part of the eSDK installation
@@ -98,7 +101,10 @@ class BuildSystem(object):
             if corebase == os.path.dirname(layer):
                 layerdestpath += '/' + os.path.basename(corebase)
             else:
-                layer_relative = os.path.basename(corebase) + '/' + os.path.relpath(layer, corebase)
+                layer_relative = os.path.relpath(layer, corebase)
+                if os.path.dirname(layer_relative) == corebase_relative:
+                    layer_relative = os.path.dirname(corebase_relative) + '/' + layernewname
+                layer_relative = os.path.basename(corebase) + '/' + layer_relative
                 if os.path.dirname(layer_relative) != layernewname:
                     layerdestpath += '/' + os.path.dirname(layer_relative)
 
-- 
2.11.0


