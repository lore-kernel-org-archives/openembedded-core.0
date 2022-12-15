Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040F9C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:22:04 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.143564.1671132082168738641
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tjxnht+e;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so128408pjm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5BqG/pNlQVz44ZzBoY8Z0mkRKX9jf/N30SfyKHcVyo=;
        b=tjxnht+eqBeZ1KKwuyidGM7F8kFXojPAWgDTHWzsWRQd2EW2jtL8JBl/Tb7b3oFLkY
         9cqB4E/ZRgpbmkpNdpjn/Fzt2Lj4zrHO40wQEDfPAav6GAZSv4eGtqmvB46sCs0r5zh6
         SSSekEvuYOwqpYyXE/mUx5OVTrkBSzIkiXMh1bbFCqnnmKxc0UhyrQ5Vy/05VAl1dPLB
         GUFEbVFoAFsXNBc67N5+rb6te3b9jlW8Q0p5rOjcEs41sUtcxmaj5EHGEhHMzJvFivgg
         Z/2VeTUmBTcbUHg1B6TlracNc2BKKupuCV/73d8CMAXIylWf0RqJi9MBNfj1I2nly5ja
         gHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5BqG/pNlQVz44ZzBoY8Z0mkRKX9jf/N30SfyKHcVyo=;
        b=vYpqOnCpwu1ofWgRrsngMi5aoFGQ9gwcN2+cO6rd5DQeeEQJqZMLjrCtv2TiopY1jS
         mSKEcdwHs3d3tWolw5UzKVfkP5Hgh+wDZoYAgHXBxbfJCsH+2FfUWoFSRH1uaf1iCcol
         vgXKIVzKtAf1bU/zS1ijIpEKTPc6kGrGGABBrluawto/Ta9QM1CkJFPJhWw3clRUO8og
         h7lgab9hYqCANY+IPdK3Dt6LL5BFo0SCghHVAVDZ4B08smV+8TZNfSLQQaFTeEh52IYW
         ExFTmJ7Af1hZq39HLRy9cOpL+HlGHbD0S7B7/xXpD/vCDz2ftAGgzd+3Bd1zptR67D33
         NJEw==
X-Gm-Message-State: ANoB5pk9GyONr9izX2N3gVUTdSdTOhRj58kL/cSvbIWLWaQoGivuNIeu
	f9URktSoB0GIvA/HUsq1Fqd9xnQrgZjJaxtXyf0=
X-Google-Smtp-Source: AA0mqf77pWivsSMhrlXfrvNJR1Qfzjsd8w6mSUTo+uNnDTOPQHb7VVooCBaweuNdYdeCdt6GcgvRuw==
X-Received: by 2002:a05:6a20:c887:b0:ac:f68:33c9 with SMTP id hb7-20020a056a20c88700b000ac0f6833c9mr36378659pzb.33.1671132112990;
        Thu, 15 Dec 2022 11:21:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 30/30] yocto-check-layer: Allow OE-Core to be tested
Date: Thu, 15 Dec 2022 09:20:54 -1000
Message-Id: <2a987c36c98707fa33d24a3896bb447145c5bf41.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174622

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
(cherry picked from commit ba312ed228507d05f280aeb96819d671b01400b8)
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


