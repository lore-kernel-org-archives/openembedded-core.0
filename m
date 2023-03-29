Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82136C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 08:58:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.19599.1680080287511249082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 01:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=AuuYq7Z8;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id v1so14865869wrv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 01:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680080286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFk+zfv58Qkp4ecYYWww0f4Jmgt9ibVCbS70f4zJwPU=;
        b=AuuYq7Z8OQ4n/407WaSeiV3A8/kp2jcYu/np1NQiFDFDZhlr2ipF4rtZb/XenqYD4J
         PG+UXzQiqlEVBWy9hA+7OAg64moH+xBulDQB/1NxHkvmpfOmX40tR5l7yjtnWNL94SVU
         D2RlNKGAM4rpd7N/BdZxvDKjM964+IYtP21fnomN0db22i/MrNC30mIy0ntqTUViZr76
         WQ+2u8pK9NeltTFyUZT4+TMWkKI1wtYXqFTp8Su9jFpEqXFU97WgilX8AuDVhlWFmEVV
         ttLWVAV7fP4XGCIzxj0r6igaSd4/DcmMFFXO5mvJS0SAofXRBLvtmzp4f0wlFTk3JKvm
         5JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFk+zfv58Qkp4ecYYWww0f4Jmgt9ibVCbS70f4zJwPU=;
        b=iUNCP5PFtVzoRcpnWEOWtJN5QLkgXw6xMbINTuKPpEr6ropzv2LBZRYe0ptkkiG6La
         f78/nsq/15k986bu+g1fHRhoxdCz9KcUrgL921p2q6Q8SgMqXJFFpbDFR+yuncw8j0xM
         w97mMAcrv2uWA/yrS6Y0VXTQPypZFWEL2rheLo13HB2B95m32Sl8KCMi36+dGyzUML0y
         pOc9ymiMUfzAGK+g4OX/7MkQY31n+Zoq0fPgmUpkRRDa/ZpCROKHfRznnqZTMIeBBcZD
         BRmCWnCYwxiIxW4RyD0cihrCeR78R5KgauwIqs5y5EuSLQ8NB9rDYCR+yycH7nIUZ3Bc
         0TuQ==
X-Gm-Message-State: AAQBX9ftRuhhMjsk3qxG3Wq/Q/dRj0W9x0i+u6RYGbiYuFiQiiDm4m13
	xrd0psXJKDNDc6cMwN3GMSIlqHg2OuUHKzQ80Dw=
X-Google-Smtp-Source: AKy350ZiFmHrQ05T8T7JhNCfQq+SrGFjqsAWoVFcU+W9CBgWKJ1/FjznDcA2xlRcqEjRYsD941e5Fg==
X-Received: by 2002:a5d:674e:0:b0:2d2:74d6:6f79 with SMTP id l14-20020a5d674e000000b002d274d66f79mr15887001wrw.59.1680080285833;
        Wed, 29 Mar 2023 01:58:05 -0700 (PDT)
Received: from P-ASN-SCRUM.home (2a01cb000236d800046b4bc25620f21a.ipv6.abo.wanadoo.fr. [2a01:cb00:236:d800:46b:4bc2:5620:f21a])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002cfe685bfd6sm29668014wrw.108.2023.03.29.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:58:05 -0700 (PDT)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fawzi KHABER <fawzi.khaber@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH v3 2/2] oeqa/selftest/cases/package.py: adding unittest for package rename conflicts
Date: Wed, 29 Mar 2023 10:57:57 +0200
Message-Id: <20230329085757.15412-2-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329085757.15412-1-fawzi.khaber@smile.fr>
References: <20230329085757.15412-1-fawzi.khaber@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179271

This Unittest tries to rename a package, using an already used name and
fails on do_package.

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 .../packagenameconflict/packagenameconflict.bb         | 10 ++++++++++
 meta/lib/oeqa/selftest/cases/package.py                |  7 +++++++
 2 files changed, 17 insertions(+)
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


