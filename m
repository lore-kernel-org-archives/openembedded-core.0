Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0253AC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 14:28:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.7034.1660228098918025459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FWxf5xsM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l22so21551452wrz.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=q6/wle1TK5bjvtPBBJ+rqNW6rWHWMofXvp6VhjD5UsQ=;
        b=FWxf5xsM/H7ih9GFgzgKTt6Quz8R1Bg2Qexc/TtYbzBPGvx3V2de1FwInb3fx03pdq
         pwqCsw6qbgz/8OLgN+w/ZIBe0Zv4Bde9FrrwDabij1A2O7+Jef4MfmZp3F2RWulXrSsQ
         6UUrQXwBHD/U9UY3vOBAvgl29EKacsDQC9YPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=q6/wle1TK5bjvtPBBJ+rqNW6rWHWMofXvp6VhjD5UsQ=;
        b=2Dfm73Byqa/Xybx55zgb2Io+PrnOnKqNG/rotby+YVZTfCI043M4KRvRr/f0szmCx8
         88Ck655FzLzaPHa/sypYZoxVJ5a5njfIkZwup3BSdW0BkMklWIuKz76SMbp36eYmOy5y
         qbk67kpY8+6+d5902EgigAFdJbC8iqMHYvmsvs/S/h7omhyH8RqC7HLkyVg27KMnaiv9
         fzgESSLd6NwQ/QoSdLmm5l4zM7QfEZ2/pcpvK0Vah3vQPyzajyoZsP/tzAyMrs8CQgYx
         Woo6qWFieMBXJfs/GIgA9+/GqOE6WpoIuMrR1kREEK0shU7SWI7E/By3acWKDlm6J1zt
         JzaQ==
X-Gm-Message-State: ACgBeo1A/JcJEQz4kKYrE0BLlldRfNeaOvJatxIIFPaEgoTRl+5gjsK2
	6Fx99HVHcGYRkj+XyIxqrNgWZUIEJb45XQ==
X-Google-Smtp-Source: 
 AA6agR4d5Ujfu5DDL9j3OsAdiEtkeEwVaymCvNEbotwvz3MGUvL8DDVekSBy0vMXrXhszhyw67fpCg==
X-Received: by 2002:a5d:5a10:0:b0:221:7c17:abee with SMTP id
 bq16-20020a5d5a10000000b002217c17abeemr16857467wrb.698.1660228096652;
        Thu, 11 Aug 2022 07:28:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 17-20020a05600c26d100b003a2f2bb72d5sm7367178wmv.45.2022.08.11.07.28.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 07:28:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] selftest/runtime_test: Use IMAGE_CLASSES for testimage
Date: Thu, 11 Aug 2022 15:28:12 +0100
Message-Id: <20220811142812.651737-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811142812.651737-1-richard.purdie@linuxfoundation.org>
References: <20220811142812.651737-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 14:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169246

testimage should be included via IMAGE_CLASSES, not globally with INHERIT.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7c3faefeaea..89c363dee44 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -121,7 +121,7 @@ class TestImage(OESelftestTestCase):
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         features += 'IMAGE_INSTALL:append = " libssl"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
         self.write_config(features)
@@ -139,7 +139,7 @@ class TestImage(OESelftestTestCase):
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh dnf_runtime dnf.DnfBasicTest.test_dnf_help"\n'
         # We don't yet know what the server ip and port will be - they will be patched
         # in at the start of the on-image test
@@ -174,7 +174,7 @@ class TestImage(OESelftestTestCase):
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh apt.AptRepoTest.test_apt_install_from_repo"\n'
         # We don't yet know what the server ip and port will be - they will be patched
         # in at the start of the on-image test
@@ -224,7 +224,7 @@ class TestImage(OESelftestTestCase):
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-        features = 'INHERIT += "testimage"\n'
+        features = 'IMAGE_CLASSES += "testimage"\n'
         if 'gtk+' not in qemu_packageconfig:
             features += 'PACKAGECONFIG:append:pn-qemu-system-native = " gtk+"\n'
         if 'sdl' not in qemu_packageconfig:
@@ -269,7 +269,7 @@ class TestImage(OESelftestTestCase):
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


