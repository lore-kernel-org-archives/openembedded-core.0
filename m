Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062AACF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 15:00:05 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.16438.1727190004076561875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 08:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=cQni29Wo;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6c34fb4f65eso51110326d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727190003; x=1727794803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sw1Xt1D1vBnxjod6FJuSwogA71BGIsRB3UvrCdQ1+k=;
        b=cQni29WoRQFoqnJPJVT4NrA7YZLIHNscFOsFXTyJsiGIim/wbYf0zwWCAcftbBLpj2
         iPfn7lStj+o9ffO7G56tomlyLoO+z8NP/SoyE4BwPQS/J88mV5X/62HijzvGJmeGI76B
         VDr5rFXtrrafPe3d3Rsbqv1DHgCxgxLWYCPri/eOJz2UajKifX8nzM2+bUsyxU3VZg6s
         4hQmu8tbZeGxCvggcp0k+5Yxa/rE+M2cUP3GpHO5GlBj5hmxf7coHQgcOAF7iGT5Y+Sn
         CNZbGwAD5oACGScNrtudaTWWgkaVL94cI7v7RWs3ktaFe/FP3fg6xruAFVO3XfaIV/fS
         3eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190003; x=1727794803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2sw1Xt1D1vBnxjod6FJuSwogA71BGIsRB3UvrCdQ1+k=;
        b=jN5pLdETnEGOlM7ghZ+lO6Zj0w+VpKOV8vvXjz/X7RQAiKerb20I7V1mpcinoawTiJ
         q60yH7t7W8YdxzcpFx+5CEUQDHLV2RnADdXC7nIvi7Ih6Vvv6TIkRNs8Baj8RwOzI3Pa
         RVav9pokK7MhNuUY5Hu09O65OlvLf/VrtnN4uU1IQTcOKC4o5zPgjcU5sZryhAzOTXOl
         EpWPoaV2V2zoFRzCMEcyV5gVzvRfPOOO1M+dxjzUcLleelX+j9sTzPe19SJ/uB01UKx2
         E5RgKSCB255XB9RIxVt5WQtOwn0HCy+bW9+3pzOSBS0R2byCppc0hTaZpH4TbZ5vg6bX
         h4KA==
X-Gm-Message-State: AOJu0YwYUMFK0qPsZre4RDRfL9FYT3i0C8Te7YIh+f7zHs3+MX4/cRfB
	Fq0exdw2uzo7Ul83v6Ou2Xg84A4IyIkq5E8o98YD8dJhcrO8xF5g+XW9WMQiLbxGy6LKqqOtZ3O
	goJY=
X-Google-Smtp-Source: AGHT+IFQFdXUfV67It9vlfASDX0R9rsK4QZq22xmRPnQGJXxAnq0TJzdOKa8dymG9iM6I+BSqtUQjA==
X-Received: by 2002:a05:6214:540f:b0:6c7:c7e3:a799 with SMTP id 6a1803df08f44-6c7c7e3a7eemr228562226d6.13.1727190002724;
        Tue, 24 Sep 2024 08:00:02 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f772f27sm7205716d6.121.2024.09.24.08.00.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 08:00:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4 v2] python3-trove-classifiers: upgrade 2024.7.2 -> 2024.9.12
Date: Tue, 24 Sep 2024 10:59:58 -0400
Message-Id: <20240924150001.2586819-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 15:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204873

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

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds the missing signoff.

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


