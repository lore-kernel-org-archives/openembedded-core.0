Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B668C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:18 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.4683.1645478657519808259
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Esx3CPnv;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id x18so9969460pfh.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dNLGngtey9WED5VQilqdbHjZhWopBluU8AH/DrKJCho=;
        b=Esx3CPnv56fVg/GhSoCf4g2GJJbWuFT7ch9Ibw6+0jz3J7ziRKKd6w0ukkjjs/+X9P
         k2nnAN+fpUMlyDdAlZuxYS3LXrYPIVEmMUPwf4Cbj24AxpIYU/dK8Cje6Rnx9grsTPxY
         D9Td9QwsyP5orlgDgXE7Lu5OU6efF6PUY/ffhaVxh3OJuTybmbRyS80RlUTLOap/vUk8
         OukMnDXjTFecXdVeJC7zNn0fO0LPLMYYnXAg0RONgYApdJRk6ObwqvbUeElm2qAnImT7
         7aJQi7b/G+sRJKD1u2RtC0qZCbkdJMK/D13J8yTm/zkY7VCItEnS6PAsP0+jbhwcIWPh
         AsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNLGngtey9WED5VQilqdbHjZhWopBluU8AH/DrKJCho=;
        b=2pAnLj22dUWuP6G7uTdU5/Nx3Dk3bRnKmibn0C6pIMjnwBLS4X+Jh9+s2PTAkTx77K
         inbogpge8ZrC2X0eSHs0pCNFmNHGXlQlEQkHmdYrJG/3CJQCcYSxLCTAWl/yiZ9vL4na
         PDL8sgblnisOpqpC1wflantmX6jgSP7cMBW1/uBfXOv6IjUL7CwO4JGDn9KrXMZYtBpl
         xDpPFtMVtIoeHCj0Qgws0b9HLmq3NtqEBpJ2su1aEQmkYhzZNYTm6paE3fCRrUUYjKgp
         bppBENNAvyDIGzOJn7SSHhs2x+1SXRbG+FQkMx5PzRlQGQYTEbhCDtQtiK1KG1D30icT
         KC0w==
X-Gm-Message-State: AOAM531lYb0XmzGuv9Fh7Km3SI7mSDo86yaYaQfIY272UJnBb2fj+/uX
	cyA2+oOU05YZvrsFy1xIy3LBRnA+pgqLAQ==
X-Google-Smtp-Source: 
 ABdhPJyQY2rBEFxaioubDdw05B5HL9uP5mWuYbPTrHpe8/d/PRp0J/hH9jYVuxXeUtIMvQpT/iPqdA==
X-Received: by 2002:a05:6a00:24c7:b0:4e1:cb76:32d1 with SMTP id
 d7-20020a056a0024c700b004e1cb7632d1mr20712478pfv.36.1645478656633;
        Mon, 21 Feb 2022 13:24:16 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 10/32] python3-pytest: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:25 -0800
Message-Id: 
 <15c365924ac146117ca38abdb1542cbea00d227e.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162086

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pytest_7.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
index 25014064890..ea6ba80300a 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
 SRC_URI[sha256sum] = "e30905a0c131d3d94b89624a1cc5afec3e0ba2fbdb151867d8e0ebd49850f171"
 
-DEPENDS = "python3-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 
-inherit update-alternatives pypi setuptools3
+inherit update-alternatives pypi setuptools_build_meta
 
 RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-atomicwrites \
-- 
2.30.2


