Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E36CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:12:24 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.15101.1727187135603791806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GNG83Lsl;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4582c62ee33so56436371cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727187134; x=1727791934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=48qy0wjRnNYIKUaC0adoM3gzWJwr500LfDODGNHV0cI=;
        b=GNG83LslLMaYIyLF51P3K18CxYBkQRlHOls0EhvyfjKFkXcdhpQ5saUhIuRyxv2ICP
         n7GC81ST0NlhpoiJVyqv31UY21qqM/LmSj9uasWel1J8w9qPRArFKRtw0IWy+iIbXIkR
         T//7K/FQo4LI7avG8b4ETcH7GLGmh851FJ5VzTrRZ6XYMo8m9LNMiCLjt0HQ+v/Fz5CJ
         dfsK4WivVABSjWNtdA6aQftU2z/jFdYiA9hHyMdzTKkOi6atcWfVcvx3SsGtwegsRNeR
         MzIeO2MNIFLXY61Ql8Lh4kXcJp3KRl05S9BAFPhyV1CHz9IWI7iDtxyqhfcE8ryPQWL5
         G0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187134; x=1727791934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48qy0wjRnNYIKUaC0adoM3gzWJwr500LfDODGNHV0cI=;
        b=MUzyW54NXckv4QkLgu5AJtRl/YVkHLvF4Lq9SSgDn712mXVNsjQ0yS3XgI7KwRJsuB
         Zd0pWkoMaHeGMV1HQ1TB87kFmanKjE6UWnvx1p3R9NlTDcsdQmydiKnuSn79YDqvX8xK
         po3xmUCChoiDcgeQzeYE588zLZpk20JrF0qAkGqdrDlrIQGpQrCXVRRGYvtBo9c/nbqR
         /nL4N0gPabhAj4Y/bJ4+9+3Nwom0pHy41IERuVyIngum8TQjKzOTKI6VCx34vop1VTIW
         BMLRZZLCPvo0CBYpYiKgIKXZuqvYHcZr2k3k40T656ujyMUnbtPgLjGylhi3hJdASQfk
         QQkw==
X-Gm-Message-State: AOJu0YxJXMxWnysbn5LXKVQ744hiIANQijftybJM3y+qOKkJ+yBd+lZh
	PpiaOSuy1wOX2mwbzd1iYqE8Byj7lPl1lPW0TVMjD/knA59hZwEk+JDwQbmqF1HfzzyqkKUu6eu
	l33Y=
X-Google-Smtp-Source: AGHT+IE/YUfiTkd7zcBJyWGp65IUe82dMMw6y7QCDrkIgxwWHHtACGtPdt089thurl+/knRpHdKiNw==
X-Received: by 2002:a05:622a:1aa8:b0:456:8ee8:f5ed with SMTP id d75a77b69052e-45b2053f159mr245114871cf.48.1727187134234;
        Tue, 24 Sep 2024 07:12:14 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b526924d7sm6620711cf.87.2024.09.24.07.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:12:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] python3-trove-classifiers: upgrade 2024.7.2 -> 2024.9.12
Date: Tue, 24 Sep 2024 10:12:09 -0400
Message-Id: <20240924141212.2579675-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204865

Changelog (https://github.com/pypa/trove-classifiers/releases):

- Add Odoo 18 trove classifier (#187)

ptest output:

|root@qemux86-64:~# ptest-runner python3-trove-classifiers
|START: ptest-runner
|2024-09-24T12:45
|BEGIN: /usr/lib/python3-trove-classifiers/ptest
|PASS: tests/test_classifiers.py:test_success[classifiers0-deprecated_classifiers0]
|PASS: tests/test_classifiers.py:test_success[classifiers1-deprecated_classifiers1]
|PASS: tests/test_classifiers.py:test_failure[classifiers0-deprecated_classifiers0-Top-level classifier 'Foo' is invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers1-deprecated_classifiers1-Classifier 'Foo :: Bar' is missing]
|PASS: tests/test_classifiers.py:test_failure[classifiers2-deprecated_classifiers2-Classifier 'Bing :: Bang' does not exist]
|PASS: tests/test_classifiers.py:test_failure[classifiers3-deprecated_classifiers3-Classifier 'Foo :: Bar' in both valid and deprecated classifiers]
|PASS: tests/test_classifiers.py:test_failure[classifiers4-deprecated_classifiers4-Classifiers starting with 'Private' are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers5-deprecated_classifiers5-Classifiers starting with 'Private' are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers6-deprecated_classifiers6-Classifiers starting with 'Private' are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers7-deprecated_classifiers7-Classifiers starting with 'Private' are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers8-deprecated_classifiers8-Classifiers starting or ending with whitespace are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers9-deprecated_classifiers9-Classifiers starting or ending with whitespace are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers10-deprecated_classifiers10-Classifiers containing ':' are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers11-deprecated_classifiers11-Classifiers containing ':' are invalid]
|PASS: tests/test_classifiers.py:test_failure[classifiers12-deprecated_classifiers12-Classifiers containing ':' are invalid]
|============================================================================
|Testsuite summary
|# TOTAL: 15
|# PASS: 15
|# SKIP: 0
|# XFAIL: 0
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 0
|END: /usr/lib/python3-trove-classifiers/ptest
|2024-09-24T12:45
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
---
 ...fiers_2024.7.2.bb => python3-trove-classifiers_2024.9.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.7.2.bb => python3-trove-classifiers_2024.9.12.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
index 934c6d4be0d..c3a4eea1c77 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.7.2.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8328f2ac2ce3fd773cbb37c765a0ed7a83f89dc564c7d452f039b69249d0ac35"
+SRC_URI[sha256sum] = "4b46b3e134a4d01999ac5bc6e528afcc10cc48f0f724f185f267e276005768f4"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.39.5


