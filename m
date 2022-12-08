Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E9CC63709
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 11:54:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.11510.1670500475819790882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 03:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T0FmoTDn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o15so525673wmr.4
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 03:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Adu0+P9APn5O4rp7mWquULu2UDyxG2kVcOuqfGkmjkg=;
        b=T0FmoTDn3yXhE0iqyss/efMR5KLyELf/H6x7JH2a6YysHZ9GbJDuraSIKSxoatbpib
         aGrei9aWB+RiWSj73+8iW0rX1y8smF2wWuyFUHCbukumZsWOujHQfpRqyr1JStd6MQAu
         cZU/j+GwmowXvrqTPy3xqzn4RV5XTD8LBq1bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Adu0+P9APn5O4rp7mWquULu2UDyxG2kVcOuqfGkmjkg=;
        b=ASbuOUunA7F4GDuHpKXUci77Wh1V53omPIC57fNtCwaTZ7/CF26U34PMNBbeZ8UxV/
         gNfht2VFKGRllRlRuCba1S1L1E3FWd6e2AbEzY3VD3DJ5Sq1TqG7LdRGfG1gDCQ3pO0q
         qm3yWXdKv/QYObcCJ0i6B7RQPKOwvZgF5YuDMD6U62cUSyz5cH062SrVZHZ3GGiy/Bw/
         xAVI10D+Cz9xg4E/txazWItefZG6qq6B5qKxRpjx+GK4p2mtSBPoHrQATmITZqa1hJjY
         ot9G++1fGl8ZOYqQ81LXWIaNl8JLQGlyZC0vP59ovxkCtP0uzRxe/+XvghqW/k8UuFHk
         +J4Q==
X-Gm-Message-State: ANoB5pldwb2ETIxA6cP5MZZobvVDzJet6cB8FJ/J4oMxH9Tm4fRGdT8d
	l9YArP2ddfB60NvOtMCf9cWeHDi1JxDQk0I1
X-Google-Smtp-Source: AA0mqf4LMIywnRTRnZR6ekRKQqfMHpkBKvJ59NwleZVQeV0uc91V1XhY8n6aW0iLrhPHGiMDErTaIg==
X-Received: by 2002:a05:600c:34d0:b0:3d0:89f7:f82e with SMTP id d16-20020a05600c34d000b003d089f7f82emr1788248wmq.21.1670500473565;
        Thu, 08 Dec 2022 03:54:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b003cfaae07f68sm5447180wmo.17.2022.12.08.03.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:54:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: Allow OE-Core to be tested
Date: Thu,  8 Dec 2022 11:54:32 +0000
Message-Id: <20221208115432.2332379-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 11:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174400

For unknown reasons we've never seemingly run the check layer script
against OE-Core itself. This isn't entirely straightforward as the core
layer is a bit of a special case, we can't for example compare signatures
against ourselve and we can't remove core from bblayers.conf.

Core does have distro, machine and software components too, in the case
of distro, our fallback default settings. Whilst the qemu machines could
be split into a seperate layer directory, core wouldn't then parse at all
standalone due to the lack of any machine so it seems a bit pointless to
do that.

These changes tweak the script to handle core's special cases, specifically
to allow distro and machine directories and to account for the README placed
a directory level higher than other layers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/checklayer/__init__.py     | 11 ++++++++---
 scripts/lib/checklayer/cases/bsp.py    |  2 +-
 scripts/lib/checklayer/cases/common.py |  3 +++
 scripts/lib/checklayer/cases/distro.py |  2 +-
 scripts/yocto-check-layer              |  5 ++---
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 78c74ca6ec3..0a0db2f02ac 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -16,6 +16,7 @@ class LayerType(Enum):
     BSP = 0
     DISTRO = 1
     SOFTWARE = 2
+    CORE = 3
     ERROR_NO_LAYER_CONF = 98
     ERROR_BSP_DISTRO = 99
 
@@ -106,7 +107,13 @@ def _detect_layer(layer_path):
         if distros:
             is_distro = True
 
-    if is_bsp and is_distro:
+    layer['collections'] = _get_layer_collections(layer['path'])
+
+    if layer_name == "meta" and "core" in layer['collections']:
+        layer['type'] = LayerType.CORE
+        layer['conf']['machines'] = machines
+        layer['conf']['distros'] = distros
+    elif is_bsp and is_distro:
         layer['type'] = LayerType.ERROR_BSP_DISTRO
     elif is_bsp:
         layer['type'] = LayerType.BSP
@@ -117,8 +124,6 @@ def _detect_layer(layer_path):
     else:
         layer['type'] = LayerType.SOFTWARE
 
-    layer['collections'] = _get_layer_collections(layer['path'])
-
     return layer
 
 def detect_layers(layer_directories, no_auto):
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index a80a5844da6..b76163fb56d 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -11,7 +11,7 @@ from checklayer.case import OECheckLayerTestCase
 class BSPCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
-        if self.tc.layer['type'] != LayerType.BSP:
+        if self.tc.layer['type'] not in (LayerType.BSP, LayerType.CORE):
             raise unittest.SkipTest("BSPCheckLayer: Layer %s isn't BSP one." %\
                 self.tc.layer['name'])
 
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 491a13953c8..722d3cf6383 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -12,6 +12,9 @@ from checklayer.case import OECheckLayerTestCase
 
 class CommonCheckLayer(OECheckLayerTestCase):
     def test_readme(self):
+        if self.tc.layer['type'] == LayerType.CORE:
+            raise unittest.SkipTest("Core layer's README is top level")
+
         # The top-level README file may have a suffix (like README.rst or README.txt).
         readme_files = glob.glob(os.path.join(self.tc.layer['path'], '[Rr][Ee][Aa][Dd][Mm][Ee]*'))
         self.assertTrue(len(readme_files) > 0,
diff --git a/scripts/lib/checklayer/cases/distro.py b/scripts/lib/checklayer/cases/distro.py
index f0bee5493c2..a35332451c7 100644
--- a/scripts/lib/checklayer/cases/distro.py
+++ b/scripts/lib/checklayer/cases/distro.py
@@ -11,7 +11,7 @@ from checklayer.case import OECheckLayerTestCase
 class DistroCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
-        if self.tc.layer['type'] != LayerType.DISTRO:
+        if self.tc.layer['type'] not in (LayerType.DISTRO, LayerType.CORE):
             raise unittest.SkipTest("DistroCheckLayer: Layer %s isn't Distro one." %\
                 self.tc.layer['name'])
 
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 0e5b75b1f7d..67cc71950ff 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -168,14 +168,13 @@ def main():
 
     layers_tested = 0
     for layer in layers:
-        if layer['type'] == LayerType.ERROR_NO_LAYER_CONF or \
-                layer['type'] == LayerType.ERROR_BSP_DISTRO:
+        if layer['type'] in (LayerType.ERROR_NO_LAYER_CONF, LayerType.ERROR_BSP_DISTRO):
             continue
 
         # Reset to a clean backup copy for each run
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
-        if check_bblayers(bblayersconf, layer['path'], logger):
+        if layer['type'] not in (LayerType.CORE, ) and check_bblayers(bblayersconf, layer['path'], logger):
             logger.info("%s already in %s. To capture initial signatures, layer under test should not present "
                "in BBLAYERS. Please remove %s from BBLAYERS." % (layer['name'], bblayersconf, layer['name']))
             results[layer['name']] = None
-- 
2.34.1


