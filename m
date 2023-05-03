Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2357C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:35:49 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.17830.1683117340802660501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=hMNQhzUg;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3ef69281e68so22729241cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683117339; x=1685709339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmQa3+XAOEBtsac51b++/pGH952ZeZJeM9cMvn8MMzM=;
        b=hMNQhzUg+zBTXlvgXEpKTJKjcfZYwBKRvGO6yMca6WAmORP+Kr6BeKeWRlm3nEm2/6
         7jrD98RcSosiu7pvV3zc/R+2MozVygwmTZu65e2LGq33qzjcgvKFdiJkrR0SniIoVeHA
         ozsAFF0ubdfxd45oXabx1gjHOkibgAWXmoGa5DWAo+CLcmKkiqRhdMI40YEHYWhNORE/
         rVAXLT61RAj2kNJpgSyt82Md+zIZGC4c4XDWB5Lc9zsIgPT2pLcuIatM7IEtaIdsg8bp
         gjPjar07uetzR11+8JOVT31TKtBLBUCqyVnzswZzhBRxLQu3mEbTUc509j8F5Rk6FqxZ
         ov1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683117339; x=1685709339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmQa3+XAOEBtsac51b++/pGH952ZeZJeM9cMvn8MMzM=;
        b=TmrMV86glQvX3Uq3dXvDPKT2ldJPh6XmfOuKawgpO4kjV+hqgyVcwLl28cDis+9nfY
         uKUQJgjNahw/aM4N7pnw/c9/A++utsVBNqDBUQ/lpsrXZLPIDhsq1MxYaIFXf5OItBLR
         NZuBbUile2Bxktk0t2Rl8npZbrGesAN20gkZLCSYaIi01rXHIISL6KAyAoPLK7PG7Ml0
         EdMlyDhMX7OiQh7hRWTpap67iMw9zCv2y9CIfCLuIgnrlUTNb1x69suYaGZY+bioI1bC
         Nt3zMFpomP+Uswblt18JshwzGHWbatQZCAsAIkkcxEcUI8Abj45wNGxJ2lJ/N4FNReiw
         xDhg==
X-Gm-Message-State: AC+VfDzrjzNgilk5eyg6S/fraq/nTyDVOJEm8NYu3c4UyzLYlER7ncYN
	ywpiob7et27iEO01xa9kGOVC9/apBRsoz3rUaCI=
X-Google-Smtp-Source: ACHHUZ6vGAJjMGQc6XOuT0/xFllyXEt1ZHeB0NwYEZVB1mFdlt3GdKHDf+0Q75nJ3U7XR08ly4ORpQ==
X-Received: by 2002:ac8:5886:0:b0:3ef:7d5b:486f with SMTP id t6-20020ac85886000000b003ef7d5b486fmr30771997qta.52.1683117339498;
        Wed, 03 May 2023 05:35:39 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id h3-20020a05620a284300b0074df5d787f2sm10460458qkp.89.2023.05.03.05.35.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 05:35:39 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-trove-classifiers: Add recipe
Date: Wed,  3 May 2023 08:35:38 -0400
Message-Id: <20230503123538.2804334-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180815

python3-trove-classifiers is "Canonical source for classifiers on
PyPI.". It is required to update python3-hatchling from the current
version (1.13.0) in oe-core, and depends on python3-calver (another new
recipe). Also add ptests.

v2 adds maintainer info to maintainers.inc.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python3-trove-classifiers/run-ptest       |  3 +++
 .../python3-trove-classifiers_2023.4.29.bb    | 26 +++++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4853a905ef..650c7fc076 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -699,6 +699,7 @@ RECIPE_MAINTAINER:pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksand
 RECIPE_MAINTAINER:pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-trove-classifiers = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-unittest-automake-output = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index bd95a13ff6..faa9bd6983 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -65,6 +65,7 @@ PTESTS_FAST = "\
     python3-pluggy \
     python3-pyasn1 \
     python3-pytz \
+    python3-trove-classifiers \
     python3-wcwidth \
     python3-webcolors \
     qemu \
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest b/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb
new file mode 100644
index 0000000000..4bbcea5489
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Canonical source for classifiers on PyPI (pypi.org)."
+HOMEPAGE = "https://github.com/pypa/trove-classifiers"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "8adcc06f1eb7c495f0bdceb698bd9c044b3e57b0d5767d99ec4b6b17c9bbe957"
+
+inherit pypi python_setuptools_build_meta ptest
+
+DEPENDS += " python3-calver-native"
+
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+       ${PYTHON_PN}-pytest \
+       ${PYTHON_PN}-unittest-automake-output \
+"
+
+do_install_ptest() {
+      install -d ${D}${PTEST_PATH}/tests
+      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


