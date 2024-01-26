Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F961C4828D
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:22 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.15960.1706276121231323441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gw16RgBy;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a30359b97a8so57234966b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276119; x=1706880919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GELPSqXMS+Sl1fCXCgckNistYpbRP98gjyDk2/9/7o=;
        b=gw16RgByKLXWrTinNYjPZxi7E37WWarE11C8ZqeTUqvqhtKyAw64Sj/32tRm0rnoNW
         8NcJ7l+L1KW8UcYGeaCxeP9syCGFagb94ntBBJj8mcGAFgtGzy6V8TMKN2bgbDUX6NVn
         3uMUIkyD5tiJZaATPAODoySK437kAkVTAtdGU3YsRLY+8pXM9zDAemO09/5aSNM3yHj5
         DG+IEnW3xRCbudydCJV189WVct/K3+UAFL9+3cjyNgBH1kykGZ4YgDV/ZUBTGHJWlbij
         FIu76t+okNvPNzH3HLq16GUXjmLMuM0yFu3BVb6iqM8ilI4gRe1k8icNCsf3zvbhVyUb
         YhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276119; x=1706880919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GELPSqXMS+Sl1fCXCgckNistYpbRP98gjyDk2/9/7o=;
        b=dElInkuo9hQNqgu09+P1aDq3LwylNBR+nLvK10+jYmgjgurQc+6irKYMOGgNzFevXX
         bq2NQsKQnW9SqWSwpCOJ3K93XY4NtMv1PGzKg5w8BvT35K8zvuJNQ4D6gjEzwZToFuFl
         mR+ghxLdZHCpBbj/7pHICxb397j4vSAfTcl8oP/9DrJ6Der6tTCEWmrEWMqXFvuGQzAR
         BI+BIlheumVa9GgDZ3ThwSWZY2xU7emBN2qlkCiwDwIkjvHKONNv0G7uzy/zL5K5U731
         VB5or9yBvND8ELLy/7XIsc55VQw7aDqyouWdp00F4UlrA/AXuh1ontnUi2mo2KDhw7Kv
         5CNA==
X-Gm-Message-State: AOJu0YwGbrpVrz0zWERmCEdS0w6Iq52PumLhgI6ISFcnCbNr+La56dZj
	bF/SIQRCRNLxC+1XcgDpbzWxWfgPb2t35jNZgTIPrtOpYiH7Vx4SIPuq8HFE
X-Google-Smtp-Source: AGHT+IGXczLyU6qaI2SCiNAavFdCCYb6Mu2ULoh2mODK9KehmEGx58T9OswLTRAqQEHiH7D6xTBhXQ==
X-Received: by 2002:a17:906:7b86:b0:a34:a1ec:52c0 with SMTP id s6-20020a1709067b8600b00a34a1ec52c0mr698840ejo.41.1706276119558;
        Fri, 26 Jan 2024 05:35:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm631554ejc.127.2024.01.26.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:35:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/8] oeqa/runtime/rpm: fail tests if test rpm file cannot be found
Date: Fri, 26 Jan 2024 14:34:54 +0100
Message-Id: <20240126133455.2609378-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126133455.2609378-1-alex@linutronix.de>
References: <20240126133455.2609378-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194367

Discovery of the test file was happening in a class initializer.
That block of code cannot fail (it's not a test), and so it
falls through to completion even if the needed file could not be found.

Then the tests themselves fail later due to class variables not
being set, but all information as to why is already lost at that point.

This converts the discovery to a helper function called from
the tests, so that the function can fail the tests precisely when the
problems occur.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index a4ba4e67698..ea5619ffea4 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -80,21 +80,24 @@ class RpmBasicTest(OERuntimeTestCase):
 
 class RpmInstallRemoveTest(OERuntimeTestCase):
 
-    @classmethod
-    def setUpClass(cls):
-        pkgarch = cls.td['TUNE_PKGARCH'].replace('-', '_')
-        rpmdir = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm', pkgarch)
+    def _find_test_file(self):
+        pkgarch = self.td['TUNE_PKGARCH'].replace('-', '_')
+        rpmdir = os.path.join(self.tc.td['DEPLOY_DIR'], 'rpm', pkgarch)
         # Pick base-passwd-doc as a test file to get installed, because it's small
         # and it will always be built for standard targets
         rpm_doc = 'base-passwd-doc-*.%s.rpm' % pkgarch
         if not os.path.exists(rpmdir):
-            return
+            self.fail("Rpm directory {} does not exist".format(rpmdir))
         for f in fnmatch.filter(os.listdir(rpmdir), rpm_doc):
-            cls.test_file = os.path.join(rpmdir, f)
-        cls.dst = '/tmp/base-passwd-doc.rpm'
+            self.test_file = os.path.join(rpmdir, f)
+            break
+        else:
+            self.fail("Couldn't find the test rpm file {} in {}".format(rpm_doc, rpmdir))
+        self.dst = '/tmp/base-passwd-doc.rpm'
 
     @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
     def test_rpm_install(self):
+        self._find_test_file()
         self.tc.target.copyTo(self.test_file, self.dst)
         status, output = self.target.run('rpm -ivh /tmp/base-passwd-doc.rpm')
         msg = 'Failed to install base-passwd-doc package: %s' % output
@@ -117,6 +120,7 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
+        self._find_test_file()
         db_files_cmd = 'ls /var/lib/rpm/rpmdb.sqlite*'
         check_log_cmd = "grep RPM /var/log/messages | wc -l"
 
-- 
2.39.2


