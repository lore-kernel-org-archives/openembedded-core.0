Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E104C10F1E
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:59 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.32120.1671380030474010780
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2vKwI/0n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id o12so6876077pjo.4
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1iIXzY9CdRSKSgVDQ9K+19DSuFnmnJrx/HFMd/6f2w=;
        b=2vKwI/0nOBPm3KgdZRFkfGZ/ii0OpvS05d5hh4nkWrzjT7IHLU0Gqt+GjrMO0Kx6gS
         GNZfAu2PGetZcRZP/dnkA3jXcogO7hO/KsP632sdr6suTqvo7M5diTZhA5KNnMalj+rD
         oJZUTRlTlPR4VkKzEzWnKzMo+bBlmfd8YZKn3cQnRiU9OJLc7021FyapYN8J/+MIimPG
         weHpDjpHbgVn5jANhPV5/hB5Ks0eo6JP9BTHRw1aTUS7WkjZy8nuonBZuq42lQhbjx3c
         N7hULp+q1UVVZRAoT6QSJMpnd+rnOW+cJVrNkA8OEvSPN1RTZE02ai6MslJCHNB6Eni5
         MU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1iIXzY9CdRSKSgVDQ9K+19DSuFnmnJrx/HFMd/6f2w=;
        b=dhjU+kVM+DIgrzyGITZtFMnrrwi2Zy3iwx/KXRXAwUH7xWPFnBW2XoVqx63jz6fn0X
         kzbPP0gGmjT+OocMHgd/ZB4iUe9wGXXeJJ2gLXirzH1P3mcbNfUeHmMVMxyaGeJnw/bI
         ehap0vlDHhcWCYwqkitoFiIyTRuhdnokCF9fSML4iGI2ed9ty81s4uEdHdC6nf4xXKYj
         s67CaHX5hKvLQA3JU0zlISmxhBhJXsx/wXDk/j/Sjyyju9IFJB5DTNU5Jeb2IcSZCyH6
         qV5LNBLYbqZcN6HCkoQ8/JWczt8gNEUJ1srIzFAfD1R9Cnw0749RJQ/8DHAzGNeSlNfR
         b+3A==
X-Gm-Message-State: AFqh2kq/cuEh8A+xB86aTh3JhxDi+Mcd1HH0GeqyIs+Y4S7LBmbWDqXr
	R/Qyj9ObiwLgS8Y01CRBIzbcPeaz4dddx4zfMdU=
X-Google-Smtp-Source: AMrXdXueOVtIr7Vx9eWjz2kNdfUjM/8UTSzExO7vE49/9uPBVZtu+jno4FSRrebvp8gH/E5LXrdt/Q==
X-Received: by 2002:a17:902:b591:b0:18f:aa25:46d with SMTP id a17-20020a170902b59100b0018faa25046dmr5887596pls.38.1671380029144;
        Sun, 18 Dec 2022 08:13:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/19] yocto-check-layer: Allow OE-Core to be tested
Date: Sun, 18 Dec 2022 06:13:02 -1000
Message-Id: <2d0641df27196ad029d95c52fb790122b2db3f9f.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174805

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/checklayer/__init__.py     | 11 ++++++++---
 scripts/lib/checklayer/cases/bsp.py    |  2 +-
 scripts/lib/checklayer/cases/common.py |  3 +++
 scripts/lib/checklayer/cases/distro.py |  2 +-
 scripts/yocto-check-layer              |  5 ++---
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index aa946f3036..938805289e 100644
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
index a80a5844da..b76163fb56 100644
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
index 491a13953c..722d3cf638 100644
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
index f0bee5493c..a35332451c 100644
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
index 0e5b75b1f7..67cc71950f 100755
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
2.25.1


