Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FF2C77B6F
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.162526.1680796959265406526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4SWYy+fG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id le6so37888417plb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796958; x=1683388958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ0dnNduopsBqurJjoW4QSi6yGAtzTyLePI5cbYeD88=;
        b=4SWYy+fG9CB+XD8Aw1X9XTxQVNNYlWJ7YpHDCUBPJJbvHKJyq4Uu4lAbBtpZ4CK2Y6
         jW8tounrb4knY/RfZzjiC4Hx85JcGGKT1IG0dquCUefSTKzmwDWKu4qsUKUtVVLQy3dA
         hK47mlYGdVDBYUbMD3B3Id9zUQ1SM/U93f3us2Vw8HdRPi/XqWqnu7bSsKUWr46NQNee
         eK2mNWnRkRaHma/YtY52iM1p2ol7SBN8zT1874WOsik9OGIo39WrNM4Q6+cMw/4JU/g6
         /LfW81jR7S7nXbQwyG+1Q8GzfKg4GDdiKacCNvVICojeRPwgmh4uBrFoqw3ElrWCQkxP
         BXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796958; x=1683388958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ0dnNduopsBqurJjoW4QSi6yGAtzTyLePI5cbYeD88=;
        b=OnZxbSdCLjiWwe+IQdJXyiJaKuiDJUUh9iMiiSj8W9/wEBGaN783/7P2PnrVsPwbQl
         If0V1wF9EXklhhhGSCfsI66CW63csDWR5R1jHklqx/xoY0B+dtleRmeGi02VN4ZRqzfv
         yCOCAlg64NsA/3CeiHBiwsxctzNhxArLQNWxBy2QImN+P4y8xI3GfllFHjoGA1qs/inm
         mWxQv316Q+S5cSDfi/aOx+4Y2GduIFkrgyviXrOCaXsI20vEJYTJdBKoPnAJ2ig+HtVR
         fAGDaho4myeXxXwxMeT2KXbrvCgQJf2FdUAaOH1gKiMGRL6nyo5igwQitt/Uv2O0Lrdl
         6y1w==
X-Gm-Message-State: AAQBX9d0AvcLkVdbCyCk+r/UPiFMdpOcVLUVjy8bV+rd3/HZjdiQ/Wvl
	r7LT+FbtE9kc8NypvIFjXGER/IOn2Spi76QVNRI=
X-Google-Smtp-Source: AKy350YGQ9D8snfxL9uic+YtN442tBmXTrEB8B90+vbu4Guq87bcNm4OwzSSAKUjAJ6FQIN+ge5mCQ==
X-Received: by 2002:a05:6a20:4c15:b0:da:53ca:8f26 with SMTP id fm21-20020a056a204c1500b000da53ca8f26mr37428pzb.30.1680796958299;
        Thu, 06 Apr 2023 09:02:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/26] oeqa/selftest/cases/package.py: adding unittest for package rename conflicts
Date: Thu,  6 Apr 2023 06:01:38 -1000
Message-Id: <efcb5c2b6009632c1ca1c7b401944ccf9fe2eb44.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179789

From: Fawzi KHABER <fawzi.khaber@smile.fr>

This Unittest tries to rename a package, using an already used name and
fails on do_package.

Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3fe173d5196506d89aa464ba56aabcf581a60db)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 2d1b48a15d..cc09a1442d 100644
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
2.34.1


