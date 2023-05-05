Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19DAC7EE24
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 18:51:30 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.3019.1683312684523434299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 11:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=E75lj6LK;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-61a4e03ccbcso19427066d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683312683; x=1685904683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RZkE8aAhurcBjSLPvrfZNM6ze0Pq6k9aGzbEPPdhrE=;
        b=E75lj6LKq00ma2uLYuZFDUClnN8bo5GMq/QTspYBoXJD3uhowT+ItVNIBCMltyZYIN
         VBjhq+en88pSVzfupjtM79qu7EWvDNhcKqh1XCOgP7MX/F2VKY1kxdRCZEF1g0PbMztA
         l5NfAIfqFYEYQJjpPOi8Vim3Qim294H9g2j8/6jgZxQfyimWPxPOgo4A2kWRJ9wBAmtt
         EemI261Yb0/oBdXPCRJTu0G8rm94npgv9lFyQb3kcrCLd9hCqpTPnWwxaeyjmzOWTWHY
         tuJS3zo4xxE5SaYwKJfs2MUTRx1xiGc6iYM6cwWLB+uzcHMc59oD1i/8Z1nU4iQlND3I
         /tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683312683; x=1685904683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RZkE8aAhurcBjSLPvrfZNM6ze0Pq6k9aGzbEPPdhrE=;
        b=WLR9TD1OrfCS/zC4NWj45T+G46YB6y0NJDc2w6id50J7KvDhsjquQSMx0eOLXmX/RY
         UApnmo0FMIxNWecUZT6yghqN9XC0IZnKLGAeRSfBBtmwPXJ1F/BMFnL6Ckuh/MsS5FXO
         UXuG9zifr8CUoQpg4NnhF/kZVqEFnYC7xelvRcOfDRYVLTywK5j0XEQ/JPjq2lPmRvX/
         2on4F/6VsE6oPCUudN+a19XyozCCZA2u1oaPrjXecxD0c9j/ibwfwnAprH5o+0FrqYlV
         3ftqiuzTCbyhcp8MsmmNlQlkVi5nw+DNNjmqCHhlx7XnOXHxyQpDvB5YDe6YTFvT8h8/
         9kRQ==
X-Gm-Message-State: AC+VfDzP7GdTXEz4Anq9Ls//MQiV4SgKg7F3rfgc53ydaILXQqrNVxA0
	dErS9HUFPDvrdyoiCmLCHarqiUWP5v3XNu+dEaibgw==
X-Google-Smtp-Source: ACHHUZ5mmHRmnrxNSr4gQ01JoiVymgQJNZ2A6Wv6128mQhx+sqSEXsNY303gUf8STJESIQd4q+Gnpg==
X-Received: by 2002:ad4:5f8e:0:b0:5df:4d41:954d with SMTP id jp14-20020ad45f8e000000b005df4d41954dmr4357605qvb.3.1683312683350;
        Fri, 05 May 2023 11:51:23 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id b8-20020a05620a118800b007465ee178a3sm765863qkk.96.2023.05.05.11.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 11:51:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] python3-trove-classifiers: Add recipe
Date: Fri,  5 May 2023 14:51:21 -0400
Message-Id: <20230505185121.2063085-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505185121.2063085-1-tgamblin@baylibre.com>
References: <20230505185121.2063085-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180969

python3-trove-classifiers is "Canonical source for classifiers on
PyPI.". It is required to update python3-hatchling from the current
version (1.13.0) in oe-core, and depends on python3-calver (another new
recipe). Also add ptests.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v3 adds these revision notices in the right place.
v2 adds maintainer info to maintainers.inc.

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


