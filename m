Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01347C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 13:22:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.10400.1639660940794819096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 05:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WlpsoM0q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so1717958wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 05:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B1MubYHM+7wNniaJcpHmrY17wy4afNjjib/SDOWKe2I=;
        b=WlpsoM0qW8eFFrf9yWoCz8LR6gxhP4UP19mXkly5/XdCYBdfU3G/uCoZV4608NHJDy
         2jeIE5X1NmwiUzQOQkALjY6uDGoT+B/n8OVlkDo4JRcZGfVtAfORournbzLK/3zPFt/e
         ppFZEf0pahfo+YF87kvZyg/uBpfDtPYCdR+5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B1MubYHM+7wNniaJcpHmrY17wy4afNjjib/SDOWKe2I=;
        b=tvQd2sWVWL1OdD6oGDHp1tgolEsXp7ehrfP6mzuuJ6iFM5pTXP8+Gq7FLLWNowKRnH
         rFeevF348NmAV2hIJnFjai7cMV1RXG7AZ6fgt+L8y2fRwjzuTthx1s+xmTLtx4klf5nQ
         PpiTuo2yLjH48DCwBnAoXRiYujWGZ9GyzcQiewjio+pV395zkYUwzgOD+hc78r94rF6o
         8YfC7vpI8PlUMKGOCEdxsMiWIE4Hr9+BpEoXYhJCpeHfEUa+7DDU40wjAGInj9e/SpwW
         TKqva4toxhl5sNdlztndqICpsY7aVdE7e80XryRmtDDMbNBapYEsfpts7QFQFCk7u8wM
         v0xg==
X-Gm-Message-State: AOAM533g47SV44k56weWdCtJbeBeqaGr0Y3F5li/r/EDVXhvXIeSzOK3
	g9o3qb0UF3p4dD9GrX8m2Q4gtjbA1O9o9g==
X-Google-Smtp-Source: 
 ABdhPJw3lXo9TOfvd1uVlwv5LeWkoTdauRuNMPhrZFHZwAOcd4k8pWLuYGHoCcs76q8BM6Cs0rwSmw==
X-Received: by 2002:a1c:a301:: with SMTP id m1mr4986730wme.118.1639660939031;
        Thu, 16 Dec 2021 05:22:19 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828])
        by smtp.gmail.com with ESMTPSA id
 10sm5996540wrb.75.2021.12.16.05.22.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 05:22:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-idna: Drop from OE-Core
Date: Thu, 16 Dec 2021 13:22:18 +0000
Message-Id: <20211216132218.857571-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 13:22:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159785

The only recipe mentioning python3-idna in OE-Core is python3-jsonschema.
python3-jsonschema only depends on it if the nongpl package config option
is set. We don't set this option.

The idna recipe has license issues with questions around the Unicode license
(still in meta-oe) and which version variant it should mean. We see QA warnings
in automated testing from this:

do_populate_lic: QA Issue: python3-idna: No generic license file exists for: Unicode in any provider [license-exists]

Lets drop the recipe and if needed, it can be in meta-oe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../python/python3-idna_3.3.bb                | 19 -------------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-idna_3.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8e86ea45d2f..85d8a5396aa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -605,7 +605,6 @@ RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr
 RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <timothy.t.orling@intel.com>"
-RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
deleted file mode 100644
index a0e6b79a565..00000000000
--- a/meta/recipes-devtools/python/python3-idna_3.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Internationalised Domain Names in Applications"
-HOMEPAGE = "https://github.com/kjd/idna"
-LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
-
-SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
-
-inherit pypi setuptools3
-
-# Remove bundled egg-info
-do_compile:prepend() {
-    rm -rf ${S}/idna.egg-info
-}
-
-RDEPENDS:${PN}:class-target = "\
-    ${PYTHON_PN}-codecs \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


