Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D23BC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 10:45:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.9218.1660301117834717925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VgKbYV6+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso4136872wma.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 03:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=PUCUU+XvVeyMArOEr/8myWK/k6ICuowMb/yJ6vUYnhA=;
        b=VgKbYV6+P3u0j04/I3Wyg0ofrREKmRf1eXkf9v6TreCBzAk5gDR5wGYcvildXNl7Di
         rU3Q1ErtnBdVnL7yWL7QXYJ0LxPy9qdJ3dQPczLjkfN+c83gR1yZYR04+DSyztMSRkpz
         WplGNQiLBndTpCLc2HKbJPciNIdUXSeVQLUJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=PUCUU+XvVeyMArOEr/8myWK/k6ICuowMb/yJ6vUYnhA=;
        b=P0VNmjtuNZkoaWzR5D7QJ4USEBsSilGuy/2tVybP+4AFZFHI2wLT42l6Psb4UMNsxW
         jcmCZiSZ2LhvPIhGqjpNvDfvg3ZhqRPZUZXMR6zN09k5CBy0bnEGfn30O+5+qeVPkEyB
         R81i0vzne93XPtM8i9CSzx0aXweSh15CnPMp9tpCnNZMcDv/mGZtAqbtl6Bmyc+4I6Vz
         +lB/KaKFahdtCSFgAuOd8iG+dveZIFUEru1DQ+RWgt/Mq4R0F4Qo1Ubzkji1yILvuhiC
         ao6Q5xJXLZ/RDy2juWT4BxL1qN+ih74omHdszysmGxKduEClH87rwYq1vF0IYLRwPJKX
         i6Jw==
X-Gm-Message-State: ACgBeo14UJqhUKQqCHwP54f9NsXWKS86ZAPGXdPrXQvqbhAQCZKwCUpq
	DboqOneRbpSEyGt9cjDQtNmEzCZ80URTBw==
X-Google-Smtp-Source: 
 AA6agR7cLg/ki+A356mIeP8g7d3Msi0esHvf6WJ141sUJ36Rt5W5+gFN7vz6mv/A5T8MaE8e+hcnOw==
X-Received: by 2002:a05:600c:1914:b0:3a3:4476:36f1 with SMTP id
 j20-20020a05600c191400b003a3447636f1mr8547569wmq.205.1660301115823;
        Fri, 12 Aug 2022 03:45:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c425:95a5:4141:7147])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b00220628ef654sm1587732wrw.24.2022.08.12.03.45.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:45:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] selftest/runtime_test/incompatible_lic: Use IMAGE_CLASSES
 for testimage
Date: Fri, 12 Aug 2022 11:45:11 +0100
Message-Id: <20220812104514.825820-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 10:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169277

testimage should be included via IMAGE_CLASSES, not globally with INHERIT.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py |  2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py     | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 6279d742459..35218491586 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -134,7 +134,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 
     def test_core_image_full_cmdline_weston(self):
         self.write_config("""
-INHERIT += "testimage"
+IMAGE_CLASSES += "testimage"
 INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = "GPL-3.0* LGPL-3.0*"
 INCOMPATIBLE_LICENSE:pn-core-image-weston = "GPL-3.0* LGPL-3.0*"
 # Settings for full-cmdline
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 857737f730c..70fff6c6541 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -119,7 +119,7 @@ class TestImage(OESelftestTestCase):
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         features += 'IMAGE_INSTALL:append = " libssl"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
         self.write_config(features)
@@ -137,7 +137,7 @@ class TestImage(OESelftestTestCase):
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh dnf_runtime dnf.DnfBasicTest.test_dnf_help"\n'
         # We don't yet know what the server ip and port will be - they will be patched
         # in at the start of the on-image test
@@ -172,7 +172,7 @@ class TestImage(OESelftestTestCase):
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh apt.AptRepoTest.test_apt_install_from_repo"\n'
         # We don't yet know what the server ip and port will be - they will be patched
         # in at the start of the on-image test
@@ -222,7 +222,7 @@ class TestImage(OESelftestTestCase):
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         if 'gtk+' not in qemu_packageconfig:
             features += 'PACKAGECONFIG:append:pn-qemu-system-native = " gtk+"\n'
         if 'sdl' not in qemu_packageconfig:
@@ -267,7 +267,7 @@ class TestImage(OESelftestTestCase):
         except subprocess.CalledProcessError as e:
             self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         if 'opengl' not in qemu_distrofeatures:
             features += 'DISTRO_FEATURES:append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
-- 
2.34.1


