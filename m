Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCA9C7619A
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 09:57:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.68345.1679565422080283453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 02:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=jWE2Rd21;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso683893wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 02:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679565420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXEVA3vvLAaSWgqCzeSe7g/Iy0o79J2UzTIBWBWjD+I=;
        b=jWE2Rd21Okz8iYFvfhUE2Z+PuKvcVwaAZ9WC5lX45Ax4QqvyEnZIrPxWDj4+NXc/gR
         JNUx6+9CTqci0zS1r4CyycE1QuRy3/4t7cI2fTjeH5j9OsUorT1fXpxndEaSwAJgFjIu
         JIeDxCr/BXQ8RNONAMmP0KFBl1QDtos9oHfhjWdarwclUPUjCp2SsYCJRIlF1zrXA1vl
         xHMWJ1YQyTRfsyLpkfE4VAqMS23SNPsrcK0/y6A4d42MKLsISRE61S2nrCEvUXj+zMe6
         pBOdS6wbjBXQwiX4mqDJltmJK/M/Bp+GMuLrU8Jeim85fDYucnDU/97yFO2tj81LhM80
         o8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679565420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXEVA3vvLAaSWgqCzeSe7g/Iy0o79J2UzTIBWBWjD+I=;
        b=O/kqbXyFawRMVPRmAyyN+Sym4uwiBg2AuwxVDNiUefhddej2ncSZTP5ndvLoDsWcjf
         5ShAKyjPSm5PnboMmJMiC3wNKj/fRJhceW5lnXFxlBZYMTXnkuOPwfklics4xEAKwyru
         uG/YFpfgOVkj9Ot9885cJdRmN1y3pBl7h16JLApcnx7dZ3VVdoOCcEzZrE7mDe6ca1mX
         HK9wWu5XqFtRBeLTEgFm1Y04JFGhVZmOswxu6OSnfAcMyWbKm6ytXEyXVfp32MNpjE4T
         y+GhVupjH/ydBc41dJD3jF66VfW9VOeYAIDzA3Pach7so6OT/4whj46kp75qTO77jBDN
         ZvSQ==
X-Gm-Message-State: AO0yUKUGADlVmdcXXvGOyxGo7GEp+pi9UazOiVMrN2GPri/ugjBTMUdh
	fZ0N3xawWr/K6AtMAKFF7mBTwtKoVHlvFfkZ7n0=
X-Google-Smtp-Source: AK7set8DaSG3hnN/vycdSVFFrIcyMe+22bdUXbMVIUxnRgTDLwxq8brEvR3yGGrtWpSjUoHTigVQYA==
X-Received: by 2002:a1c:c914:0:b0:3dc:4fd7:31e9 with SMTP id f20-20020a1cc914000000b003dc4fd731e9mr2203959wmb.7.1679565420281;
        Thu, 23 Mar 2023 02:57:00 -0700 (PDT)
Received: from P-ASN-SCRUM.home (2a01cb000236d8006dc035242cd5cfe3.ipv6.abo.wanadoo.fr. [2a01:cb00:236:d800:6dc0:3524:2cd5:cfe3])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003edd2ec9f85sm1483131wms.6.2023.03.23.02.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:57:00 -0700 (PDT)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH v2 2/2] oeqa/selftest/cases/package.py: adding unittest for package rename conflicts
Date: Thu, 23 Mar 2023 10:56:55 +0100
Message-Id: <20230323095655.6319-2-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323095655.6319-1-fawzi.khaber@smile.fr>
References: <20230323095655.6319-1-fawzi.khaber@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 09:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178974

This Unittest tries to rename a package, using an already used name and
fails on do_package.

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 .../packagenameconflict/packagenameconflict.bb         | 10 ++++++++++
 meta/classes-global/package.bbclass                    |  3 +--
 meta/lib/oeqa/selftest/cases/package.py                |  7 +++++++
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb

diff --git a/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb b/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
new file mode 100644
index 0000000000..5d19a4dd25
--- /dev/null
+++ b/meta-selftest/recipes-test/packagenameconflict/packagenameconflict.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Test case that tries to rename a package to an existing one and fails"
+DESCRIPTION = "This generates a packaging error when a package is renamed to a pre-existing name"
+LICENSE = "MIT"
+
+# Add a new package ${PN}-renametest
+PACKAGES += "${PN}-renametest"
+# ... and try to rename the ${PN}-dev to the new ${PN}-renametest (conflict)
+PKG:${PN}-dev = "${PN}-renametest"
+
+EXCLUDE_FROM_WORLD = "1"
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


