Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C463BC76195
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 16:42:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.48358.1679503360633091899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 09:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=yOmAyU6z;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id t15so17750509wrz.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 09:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679503359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzhiMkapEg9/i1jaI2v6+kEd8V0Hm1DbdqxDk8w4h74=;
        b=yOmAyU6zeIhUWkdz5OUDm22ao1HFYBDv5bKB9oshnGQPa16LltTAZBkJ/GlYZSp8Ga
         EA/xnblZGNMPK3Jliv7oQ2cjrJxnp0BjXzvNkALKUG7ujQmoPzLsuQIvEu0liMgN7/Ue
         wrOG9Qf/BR/hfANzdqC4jJ6YrqzntCI5Dy9EanUFcVte704hQkrmEQQZOyXE4tvMrNf1
         VksiumFGinTPTOuKGupdKB3j6aPc3OVT4JN6GNUALLjQyrGtvKL7E7+78d6CM1l/ZjA/
         1LK4tvVJuPWzfkYBTZ6LEQD2I/ckgJT8tOjVLsBHvTXxsJRETvWevNO1TQ5KEumlRqwY
         T8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzhiMkapEg9/i1jaI2v6+kEd8V0Hm1DbdqxDk8w4h74=;
        b=DftCCx/ANIdSmb+T2FPRcgCjZ7v+CWEltsHb3k4T+XLhhqsmQaxD1gF3A3ajvhPS5y
         50eQBX1q8YhCsf87dYcxu3F/YsndjsKvVbxgbHUk2T2SUowWgqOxvHQNuh/Y9lxCmywp
         sDMqEZUFr+23r6n4njloPJjW8ir8UtaY33RUGjOaK8RhNl4vnZNu7g1UaChZ3SvX+ReU
         q3muep85bUKDWUH7iFBey36gfx3SSgPuKupT4PHbT73nQPJ4cSn+2/PbrKzpkcXWMiFM
         ZRikT+gROS4LX2JhZa1/ykXzhxQBvJKjE+zfGUAcyPdJek3snnHy9sl7RvbGygusQQ7n
         dvfA==
X-Gm-Message-State: AAQBX9fQidKVsmBNdj2Eu0mstqY/6BqR5eBFcemsCbI4BB6tNzDVrzsk
	udS/Qg/5VlfcU+MBXrqkh51hgeWZ5+z2fTsHxO8=
X-Google-Smtp-Source: AKy350ar7TKxHkzBrKx/tb67s4oXulbc0LBYOMf6loaxz7rtFCDlInd6jA8vTaRfBnyyI8B434yGhg==
X-Received: by 2002:a5d:614d:0:b0:2c7:1e00:d514 with SMTP id y13-20020a5d614d000000b002c71e00d514mr324974wrt.38.1679503358673;
        Wed, 22 Mar 2023 09:42:38 -0700 (PDT)
Received: from P-ASN-SCRUM.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id p7-20020a1c7407000000b003ee6c54b0bcsm1579537wmc.48.2023.03.22.09.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 09:42:38 -0700 (PDT)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH 2/2] oeqa/selftest/cases/package.py: adding unittest for package rename conflicts
Date: Wed, 22 Mar 2023 17:42:24 +0100
Message-Id: <20230322164224.100884-2-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322164224.100884-1-fawzi.khaber@smile.fr>
References: <20230322164224.100884-1-fawzi.khaber@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 16:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178952

This Unittest tries to rename a package, using an already used name and
fails on do_package.

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 .../packagenameconflict/packagenameconflict.bb            | 8 ++++++++
 meta/classes-global/package.bbclass                       | 3 +--
 meta/lib/oeqa/selftest/cases/package.py                   | 7 +++++++
 3 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb

diff --git a/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb b/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
new file mode 100644
index 0000000000..291d37c5f6
--- /dev/null
+++ b/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Test case that tries to rename a package to an existing one and fails"
+DESCRIPTION = "This generates a packaging error when a package is renamed to a pre-existing name"
+LICENSE = "MIT"
+
+# Add a new package ${PN}-renametest
+PACKAGES += "${PN}-renametest"
+# ... and try to rename the ${PN}-dev to the new ${PN}-renametest (conflict)
+PKG:${PN}-dev = "${PN}-renametest"
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 30dfd63d4f..21461ff314 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -498,13 +498,12 @@ python do_package () {
 
     # Check for conflict between renamed packages and existing ones
     # for each package in PACKAGES, check if it will be renamed to an existing one
-
     for p in packages:
         localdata = bb.data.createCopy(d)
         localdata.setVar('OVERRIDES', p)
         rename = localdata.getVar('PKG')
         if (rename != None) and rename in packages:         
-            bb.fatal('package %s is renamed %s using PKG:%s, but package name already exists'%(p,rename,p))
+            bb.fatal('package "%s" is renamed to "%s" using PKG:%s, but package name already exists'%(p,rename,p))
 
     ###########################################################################
     # Optimisations
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 4f7cd10658..1aa6c03f8a 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -89,6 +89,13 @@ class VersionOrdering(OESelftestTestCase):
             self.assertEqual(status - 100, sort, "%s %s (%d) failed" % (ver1, ver2, sort))
 
 class PackageTests(OESelftestTestCase):
+    # Verify that a recipe cannot rename a package into an existing one
+    def test_package_name_conflict(self):
+        res = bitbake("packagenameconflict", ignore_status=True)
+        self.assertNotEqual(res.status, 0)
+        err = "package name already exists"
+        self.assertTrue(err in res.output)
+
     # Verify that a recipe which sets up hardlink files has those preserved into split packages
     # Also test file sparseness is preserved
     def test_preserve_sparse_hardlinks(self):
-- 
2.39.2


