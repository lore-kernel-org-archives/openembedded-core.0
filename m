Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F855C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 12:31:00 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.127030.1683030656647511060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 05:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=j/qobRUT;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3f1f1a7ecb7so33116181cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683030655; x=1685622655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NOKkS4016Cd8cQBOP+q5g/a7fU75onSoL2lH/Hzzlc=;
        b=j/qobRUT9QB9j8Ch8dQkHV5F1QeM2fYLQP1logMZZ+GeCJKD1oW1VJ+frrn6JLAu6m
         4g2SdxOBsd2L97b1/gckatxiuGJd4KkzRiDeegYq2nlv7Dqrmu8CN9hvPdmZ1dLbpV0C
         XPHcLk2vC9CkrCdp+NhloI43FubB1S6kxTOxPqTiyn8YBOr5wgSmN0+/dyrXjMiM/CsE
         x9R7dS1xr7Dnfikl0M605rp+dDedf6LWzBjiJrFoYC1vHD7/fL6FedQNiznas16CkP7B
         ExYZCweNWrxXo98WCpyjhgoDHGOFXHF63W7MBWDzxdtncVFLjQveLg7cREFc6+A92a5h
         TOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683030655; x=1685622655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NOKkS4016Cd8cQBOP+q5g/a7fU75onSoL2lH/Hzzlc=;
        b=F9RwYRhmVbUnbNhgzmE6tnmVCkbJ6iISBv7Yx7u9hERwpZjAStNAnruPReb7hlMQAU
         tFxD/nfs52/K2S7eeEdZYlE8S3BgPElJ4YNjNIJD42Oc2ctloBa7TAoJL3VRyiDu8XK6
         zTd+L56DHRl6FlPjbUKsuaBVbjL0XIDYVxicpbMMBsTTXADUPGCAVBq+kx0AZYK/J84u
         WV7YHuHlOD0ZdZpTjqsn/FuqqEHh1zE5ucztxh4teNWqFYpzqfnRdickrgJm2bec+O0u
         ++6yIGnRnDZ6AOe9i4KkH6TS1S7cZhJWBAXl3tx7af8oMVWw0fNXrsuvqOtxbAQPtIF1
         rdfA==
X-Gm-Message-State: AC+VfDwr+VpMYpLZvMQMaOKwiF1JII4+izJSVC4pTJ6aSp3VWiT05CNN
	KlN08lReYEjquvas5DI74zFXd7WnLCX51EycEhs=
X-Google-Smtp-Source: ACHHUZ5V/qT0DNpZM0bmUzkn0uD4dq1ehOdtjzJ/s651g6NpUgcpeLx8dUkqj4yhQRDJVQYc9y9yWg==
X-Received: by 2002:ac8:5e4b:0:b0:3f0:abab:87ef with SMTP id i11-20020ac85e4b000000b003f0abab87efmr26727454qtx.10.1683030655577;
        Tue, 02 May 2023 05:30:55 -0700 (PDT)
Received: from megalith.ht.home (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id h12-20020ac8548c000000b003e38c9a2a22sm10173876qtq.92.2023.05.02.05.30.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 05:30:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] python3-trove-classifiers: Add recipe
Date: Tue,  2 May 2023 08:30:52 -0400
Message-Id: <20230502123053.604642-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502123053.604642-1-tgamblin@baylibre.com>
References: <20230502123053.604642-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 12:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180725

python3-trove-classifiers is "Canonical source for classifiers on
PyPI.". It is required to update python3-hatchling from the current
version (1.13.0) in oe-core, and depends on python3-calver (another new
recipe). Also add ptests.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python3-trove-classifiers/run-ptest       |  3 +++
 .../python3-trove-classifiers_2023.4.29.bb    | 26 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-trove-classifiers/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-trove-classifiers_2023.4.29.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 78750a0d98..cbbf84f2d4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -64,6 +64,7 @@ PTESTS_FAST = "\
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


