Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF57C10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:45:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.83108.1701953146007276406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ZiNtAEO2;
 spf=pass (domain: baylibre.com, ip: 209.85.128.48, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c0a074e71so9408935e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 04:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701953144; x=1702557944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMuQC6UCR3wA1UKdLDhvrWWMKwwlOkydwAy7g+3Ly8c=;
        b=ZiNtAEO2m6FYNyD373AQpLJol5PXXqh5kPGDNd9iz+81Wre+FFqLc8ysSb1eFD1ju2
         wgGmMC2DaWY1Shou+FIThck8Ve8wYwiDLpiNddLa8hDCL1U4wRyZ/WGRTE17e05i5usq
         bQsq1JW1oU6MDesjuMqCwfCsL6rj7bBK+idIvitvnnbObJ1jjbj7D3MGIT5NLd37iD8m
         IdikvXk4S1dMBiyecWPevvHd5hQOvf7EIFkZeeb66w/7YHG2Ri7TPoq9ZibzhufB44H1
         tpW0b9oltuXxUulHX3ZpFHdorxks8+gHLV+vCKG98fenavJzfv4HW6HOiTMvrwjZ7ERL
         xSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953144; x=1702557944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMuQC6UCR3wA1UKdLDhvrWWMKwwlOkydwAy7g+3Ly8c=;
        b=fpdAivyLlep0pubHNEcM1Y0EByJfY0LuOMHs7gD7WjAdOABj4kG5h4IZeWFcMGWAsW
         YK3km3XEMspIwORfhQN0Ldme53NEBJynMul1BxAKbblxaVaN+TCst2GpHQjFM5NS2q1X
         7SEoyVKaaEvUOOxhFG591oFb09t6z5MU3ZhAr/LkeWd5AFNJW8QnBOrzBN5AkI6guIbD
         bppl+Y1K12mpmcM/VCKYDeid1kpKg7mC1I8l2o0OmSzncHApJtI4XxMhEuE40d4EhsXv
         /X9ORPV+E5NHJ35nYJQ8+j0bC3c3kuXhfuHdF3lZUGtlx4zDoSwXIEgBCnP+x/vHLWSm
         iMYw==
X-Gm-Message-State: AOJu0YwGRpnIadHCmkH0j68e8UOr946FfyhWf36PTt42YM+xSp4lNpu3
	kiIRItlJCZ4YX3tZqVfh6JSibr0NV4h73tClxg9lsg==
X-Google-Smtp-Source: AGHT+IEcUuuQIsHvsHCsIRI7ExJCSZ2+k52YWwBQo7Ngs5vAHofUp49q+FhVdsHVFV+ucgnC1VV+Zg==
X-Received: by 2002:a05:600c:1c26:b0:40c:3103:2eb1 with SMTP id j38-20020a05600c1c2600b0040c31032eb1mr4450wms.22.1701953144534;
        Thu, 07 Dec 2023 04:45:44 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b0040b54335d57sm1901449wmb.17.2023.12.07.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:45:44 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 2/3] usergrouptests.py: Add test for switching between static-ids
Date: Thu,  7 Dec 2023 12:45:33 +0000
Message-Id: <4ba02f215e02d1a18e69e0f573a7ef7aa0221d84.1701952927.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701952927.git.pidge@baylibre.com>
References: <cover.1701952927.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191950

This test is related to https://bugzilla.yoctoproject.org/show_bug.cgi?id=12107

At the moment it doesn't seem to be able to actually replicate this
issue in the bug, which tells me it's likely fixed.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../lib/oeqa/selftest/cases/usergrouptests.py | 45 +++++++++++++++----
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index a63fce54dc9..c74b5678d00 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -5,11 +5,15 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var
-import bb.utils
+from oeqa.utils.commands import bitbake, get_bb_var, get_test_layer
 import os
 
 class UserGroupTests(OESelftestTestCase):
+    def _test_add_task_between_p_sysroot_and_package(self):
+        self.logger.info("Building useraddbadtask")
+        # This is expected to fail due to bug #14961
+        self.assertTrue(bitbake(' useraddbadtask -C fetch'))
+
     def test_group_from_dep_package(self):
         self.logger.info("Building creategroup2")
         bitbake(' creategroup2 creategroup1')
@@ -17,10 +21,35 @@ class UserGroupTests(OESelftestTestCase):
         self.logger.info("Packaging creategroup2")
         self.assertTrue(bitbake(' creategroup2 -c package'))
 
-    def _test_add_task_between_p_sysroot_and_package(self):
-        self.logger.info("Cleaning sstate for useraddbadtask")
-        #bitbake(' useraddbadtask -f -c cleansstate')
-        self.logger.info("Building useraddbadtask")
-        # This is expected to fail due to bug #14961
-        self.assertTrue(bitbake(' useraddbadtask -C fetch'))
+    def test_static_useradd_from_dynamic(self):
+        metaselftestpath = get_test_layer()
+        self.logger.info("Building core-image-minimal to generate passwd/group file")
+        bitbake(' core-image-minimal')
+        self.logger.info("Setting up useradd-staticids")
+        repropassdir = os.path.join(metaselftestpath, "conf/include")
+        os.makedirs(repropassdir)
+        etcdir=os.path.join(os.path.join(os.path.join(get_bb_var("TMPDIR"), "work"), \
+                            os.path.join(get_bb_var("MACHINE").replace("-","_")+"-poky-linux", "core-image-minimal/1.0/rootfs/etc")))
+        import shutil
+        shutil.copy(os.path.join(etcdir, "passwd"), os.path.join(repropassdir, "reproducable-passwd"))
+        shutil.copy(os.path.join(etcdir, "group"), os.path.join(repropassdir, "reproducable-group"))
+        # Copy the original local.conf
+        shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf'), os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf.orig'))
+
+        self.write_config("USERADDEXTENSION = \"useradd-staticids\"")
+        self.write_config("USERADD_ERROR_DYNAMIC ??= \"error\"")
+        self.write_config("USERADD_UID_TABLES += \"conf/include/reproducible-passwd\"")
+        self.write_config("USERADD_GID_TABLES += \"conf/include/reproducible-group\"")
+        self.logger.info("Rebuild with staticids")
+        bitbake(' core-image-minimal')
+        shutil.copyfile(os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf.orig'), os.path.join(os.environ.get('BUILDDIR'), 'conf/local.conf'))
+        self.logger.info("Rebuild without staticids")
+        bitbake(' core-image-minimal')
+        self.write_config("USERADDEXTENSION = \"useradd-staticids\"")
+        self.write_config("USERADD_ERROR_DYNAMIC ??= \"error\"")
+        self.write_config("USERADD_UID_TABLES += \"files/static-passwd\"")
+        self.write_config("USERADD_GID_TABLES += \"files/static-group\"")
+        self.logger.info("Rebuild with other staticids")
+        self.assertTrue(bitbake(' core-image-minimal'))
+    
     
-- 
2.34.1


