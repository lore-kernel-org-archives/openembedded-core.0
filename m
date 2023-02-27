Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB5BC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 11:40:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.87972.1677498015355751796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 03:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SR6/yEk3;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id r7so5863454wrz.6
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677498014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcHIc1+on4mod4CqaoJ3kqEWP0GmAk68fj1PviF/2Ys=;
        b=SR6/yEk3HApqXLvpebuMuJGUYTGojJvEtkzgqaf35XqlAaSoe8afc2JAS+UY+3UWnW
         wyd5UpgMdHOm7LBUnW9NOsHOmH04LLPWF2hHtj5wEgbFSeWBITqjtyubjHSX9MeSfltk
         ODi0K7MD6sHK45xwddPRPSL+AnU5ZGVyBsxrNGTTLwFcUSlBO8W5W4GMu0fP5aOYmbpR
         danKeMDfmKSf3ofv/rxl19JDH/ylNHutKWR9S1qJ5Z6L09POjjDWxxFomf+LIE7mYz06
         mnP24gyOVzrNoctbYnzMUeuq48o+PBid6UJ7bLIZdjA4VPPO3LP0OMRv3Orlp4+FHbNf
         2LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677498014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcHIc1+on4mod4CqaoJ3kqEWP0GmAk68fj1PviF/2Ys=;
        b=yK0TY17g+je2Cd9sPMDOHxR+j/kr2KPs4cE5biOqGOBPEISH1/vG3Ba+eCXtmADcGk
         nZ1LFkSM7Sx2lg0HPmX3QG0I8x0o2d/NWX1naLnLnrn9yl7uYaZi1b6cJ0vZWL40F0b8
         7MD/NIUbQXhdjllg1dNca18y+ffrvF/KqNrwCB5bSc6Y8yg7UcHx151v6FzDVw6yf6M/
         lWrS4S/QBtZLa9Eqiad2uzXdH97+cGxzeNTPPfdiGI7+GPCAfSZW03lFjtLEyIYicPWt
         P3NwMTygQbej+cSGudSTbOuMpyu9ZniLi5/6RZ2kOLGwkpQU62xGr851sGnjbIIBCump
         64tA==
X-Gm-Message-State: AO0yUKXCv+woYK4skVSo9UB32drcuhSO1VxPBf3HzghIIg+gW65KX1yE
	NM/nUGY4dtUMNJi/EBSwe+2J81tQDOU=
X-Google-Smtp-Source: AK7set8rO+mQUaU9SuTwX18tbRmUkkEkbEveW0Nlb6FkUbWaqDF/a0WWtQM52T5JPuhQMAAjvhxL2w==
X-Received: by 2002:a5d:5945:0:b0:2cb:9d29:7242 with SMTP id e5-20020a5d5945000000b002cb9d297242mr2219463wri.27.1677498013638;
        Mon, 27 Feb 2023 03:40:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b003eb3933ef10sm7227851wmo.46.2023.02.27.03.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:40:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] scripts/runqemu: move render nodes check to runqemu from selftest
Date: Mon, 27 Feb 2023 12:40:08 +0100
Message-Id: <20230227114008.1175030-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230227114008.1175030-1-alex@linutronix.de>
References: <20230227114008.1175030-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 11:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177791

This will produce a more useful hint for those setting
up or testing virgl headless:

runqemu - ERROR - No render nodes found in /dev/dri: ['by-path', 'card0']. If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer.

as qemu itself isn't helpful:

alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ qemu-system-x86_64 -display egl-headless
qemu-system-x86_64: egl: no drm render node available
qemu-system-x86_64: egl: render node init failed

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py |  7 -------
 scripts/runqemu                              | 10 ++++++++++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 13e8760a16..e32c4aff85 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -260,13 +260,6 @@ class TestImage(OESelftestTestCase):
         if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinux')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
-        render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
-        try:
-            content = os.listdir("/dev/dri")
-            if len([i for i in content if i.startswith('render')]) == 0:
-                self.fail("No render nodes found in /dev/dri: %s. %s" %(content, render_hint))
-        except FileNotFoundError:
-            self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'IMAGE_CLASSES += "testimage"\n'
         if 'opengl' not in qemu_distrofeatures:
diff --git a/scripts/runqemu b/scripts/runqemu
index cedf4f62ad..58b0c191e1 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1366,6 +1366,15 @@ class BaseConfig(object):
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
         self.qemu_system = qemu_system
 
+    def check_render_nodes(self):
+        render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
+        try:
+            content = os.listdir("/dev/dri")
+            if len([i for i in content if i.startswith('render')]) == 0:
+                raise RunQemuError("No render nodes found in /dev/dri: %s. %s" %(content, render_hint))
+        except FileNotFoundError:
+            raise RunQemuError("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
+
     def setup_vga(self):
         if self.nographic == True:
             if self.sdl == True:
@@ -1403,6 +1412,7 @@ class BaseConfig(object):
 
             self.qemu_opt += ' -display '
             if self.egl_headless == True:
+                self.check_render_nodes()
                 self.set_dri_path()
                 self.qemu_opt += 'egl-headless,'
             else:
-- 
2.30.2


