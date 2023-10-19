Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A96CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 20:49:32 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.39042.1697748570927575584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 13:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=e8T7OHbB;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-66cfd0b2d58so988446d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697748570; x=1698353370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZu0EUBrkZfLAyjH1GvlXWbZuVWdZn/vKIKBlQtJCyQ=;
        b=e8T7OHbB92uYZtThPtrRQSiFore+3Xadab+dUQqINujZ7wF1utULInMU38/1NU6DIX
         XIT1UyaJTHuTlLQBoRIfdqjK3/B4Rg8y4aLMk/U6eu7b/yWT95nmBV0pxEpA2arLCB3p
         j9Mh7fUOwzthATQ9mle05Sx3AEPiCT/f+bjEnod2y3+dlscvxXbvxlsPYGFoNKAYLCvE
         IF23sbzjSNdAScq5PFq6b5/N51STG8wblT8z0sOIn/k/b+gR1Vijxu5El+pRUQRcFaPr
         mIU0E1jM2hjNZE+KbuRxOOz59WMuuhhJ1bT9ES6qdhBeU3abcfs+0qNKvIcNZmRq9Xu6
         aRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697748570; x=1698353370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZu0EUBrkZfLAyjH1GvlXWbZuVWdZn/vKIKBlQtJCyQ=;
        b=VXDKcWu+f98PpNYviYtX9N0XSiLOxGoIj7OpnwKomMC9WE+DL/umF2esBZNHfcjMVJ
         n4CHx2igIPoEgkJKa2TXBBWlPhm9wornzcjfsl6jwsR1s+Uy4pI1SnovbQiTGvr6dIUX
         f/w/I+janawGYA/4z7ACvrjCcV3bESHDfjJ5O1YrBKCmvPYh/Gy092inT8sCF++8OD/G
         HiiLx8hKKy/Db9JZU+WeleaD5kNS4Sxn5D4cpiEaborgDueEFIPqjft9XOqYRFsENnzu
         NAyUk8Goeuw3iKd+kfJ5ZVYyMEtVqgPASuWntED1MMu7yBeSZSscgWsL241klVo6WGTm
         K4Fg==
X-Gm-Message-State: AOJu0Yxy7P20nlkVJUBriCee2SLjv9h9qLBREQ3THvsqvsuTsk56TnZ9
	ypkR3dktNkOgeGjeBtCAuLshJWjNupOBdtq6y/n7xg==
X-Google-Smtp-Source: AGHT+IGAcEsAmT3zud9OU2WUtJHYJuKGNPROYrp5xluuQkbpTcp484UEOhwMt9jjrlAT/ztiRrodLw==
X-Received: by 2002:a05:6214:21ee:b0:66d:43be:7e45 with SMTP id p14-20020a05621421ee00b0066d43be7e45mr3666444qvj.43.1697748569744;
        Thu, 19 Oct 2023 13:49:29 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id c25-20020ac853d9000000b004109928c607sm88013qtq.43.2023.10.19.13.49.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 13:49:29 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] patchtest: test regardless of mergeability
Date: Thu, 19 Oct 2023 16:49:27 -0400
Message-ID: <20231019204927.2290521-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019204927.2290521-1-tgamblin@baylibre.com>
References: <20231019204927.2290521-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 20:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189483

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py | 5 -----
 meta/lib/patchtest/tests/test_metadata_license.py          | 5 -----
 meta/lib/patchtest/tests/test_metadata_summary.py          | 5 -----
 meta/lib/patchtest/tests/test_python_pylint.py             | 2 --
 4 files changed, 17 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
index b2c32507ffe..cb3e7c9d341 100644
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
@@ -15,11 +15,6 @@ class LicFilesChkSum(base.Metadata):
     lictag   = 'License-Update'
     lictag_re  = pyparsing.Regex("^%s:" % lictag)
 
-    def setUp(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
-
     def test_lic_files_chksum_presence(self):
         if not self.added:
             self.skip('No added recipes, skipping test')
diff --git a/meta/lib/patchtest/tests/test_metadata_license.py b/meta/lib/patchtest/tests/test_metadata_license.py
index a5bc03b83fe..1a7f09b7470 100644
--- a/meta/lib/patchtest/tests/test_metadata_license.py
+++ b/meta/lib/patchtest/tests/test_metadata_license.py
@@ -12,11 +12,6 @@ class License(base.Metadata):
     metadata = 'LICENSE'
     invalid_license = 'PATCHTESTINVALID'
 
-    def setUp(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
-
     def test_license_presence(self):
         if not self.added:
             self.skip('No added recipes, skipping test')
diff --git a/meta/lib/patchtest/tests/test_metadata_summary.py b/meta/lib/patchtest/tests/test_metadata_summary.py
index 1502863df02..170e79eb4b7 100644
--- a/meta/lib/patchtest/tests/test_metadata_summary.py
+++ b/meta/lib/patchtest/tests/test_metadata_summary.py
@@ -10,11 +10,6 @@ from data import PatchTestInput
 class Summary(base.Metadata):
     metadata = 'SUMMARY'
 
-    def setUp(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
-
     def test_summary_presence(self):
         if not self.added:
             self.skip('No added recipes, skipping test')
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index 9cfc491a134..304b2d5ee9a 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -26,8 +26,6 @@ class PyLint(base.Base):
     def setUp(self):
         if self.unidiff_parse_error:
             self.skip('Python-unidiff parse error')
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged, no reason to execute the test method')
         if not PyLint.pythonpatches:
             self.skip('No python related patches, skipping test')
 
-- 
2.41.0


