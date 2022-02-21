Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F72C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:44 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.4755.1645478683935722102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jTPOR077;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id u5so13904548ple.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vajCHgrqlvmCBBIm7Itl5+AuD9LC1gQdlJj+Js/r9w8=;
        b=jTPOR077lTzfF6B/WJlfq7ofhwOordtyU4KRXVSxr10TwQ0NdEp3fnr5U4/TluCqbf
         9xRHRpaJyWh9Yp0Dnzk4ba3Mn38NtfRaX47Cc5qzwTQhbvUffS3oLEsbDcVe/gK0nTu5
         4GWzBEMlTggRpoFLqV0su0XkYz22Zanw9GD//o3yxI90wUpEol/P9/7CfYCAclt1QyrL
         g5Lsy5iduzgonCFA37tP4gxYQBVoBqqmdIXHcUzW+TVXiKAq4yLhxaMvJ1mbS9F7uBI4
         WzPU/uegVsyzlVHhNjhKNA/G4BPRkFwOByc20JNb1PFN4Q/ucrOTajlLlYLWUok7O5gC
         uV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vajCHgrqlvmCBBIm7Itl5+AuD9LC1gQdlJj+Js/r9w8=;
        b=HH9NOCYcRYcSbgAqAixNQcp9Q50OuFn47pwDUzEclDRv7xY46TSfxWHaPEEgC8iLQ6
         6mU5+nnyGiLpv46tN9UGNdpKDWgR78jQrHCF9MX24NOefQZPSBnCHxt3tkL4i6ZIyucC
         uq09Rx4CMODondrKA7qWOu1RFnc7aiPZDV4D3mn9UQ14gUc1DWKJlp9GK/8UkfhvhlOV
         uZ3WD1em9GGBtdaADcF4upW/ezGTe7vVmvB+nYIgw7W9+u7M1rjykgIP4i5MXwsxsIUd
         FaPkH9ld9bkNApQd668iDaxqyddtXG5sJmU6hdspe4pP/zuKaE33jKZd+s2pQcuma8Hh
         z8nQ==
X-Gm-Message-State: AOAM5305R4lPPM/tvy/XQAXd29cF7rKA5NWSVcORRh8yvNZMnf6Q2YB6
	u4LoL1G2l63sg1xzcif/2XP98sl3vn1T0A==
X-Google-Smtp-Source: 
 ABdhPJzEsqcwaYuSZQEnKLBoCQAWLfpdBGUfZ/VuVhlwuvPvDLx2ZwC8LsBKez5nDFu5NbhzcE+SJA==
X-Received: by 2002:a17:90a:7845:b0:1b9:159c:148e with SMTP id
 y5-20020a17090a784500b001b9159c148emr820332pjl.136.1645478682902;
        Mon, 21 Feb 2022 13:24:42 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 25/32] bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER
Date: Mon, 21 Feb 2022 13:23:40 -0800
Message-Id: 
 <9069e1e6b398646031ed0d184a6d2812e93e04a8.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162101

Change filename to _git.bb and use BASEVER to set PV.

The wheel built by bdist_wheel is named "bmap_tool-*.whl" set the
PIP_INSTALL_PACKAGE name accordingly.

Use BASEVER to set PYPA_WHEEL to match the version in the wheel produced
by bdist_wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../bmap-tools/{bmap-tools_3.6.bb => bmap-tools_git.bb}     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta/recipes-support/bmap-tools/{bmap-tools_3.6.bb => bmap-tools_git.bb} (86%)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
similarity index 86%
rename from meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
rename to meta/recipes-support/bmap-tools/bmap-tools_git.bb
index 1e87d45c90d..e3315321ed1 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -13,7 +13,8 @@ SRC_URI = "git://github.com/intel/${BPN};branch=master;protocol=https"
 
 SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
-PV .= "+git${SRCPV}"
+BASEVER = "3.6"
+PV = "${BASEVER}+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
@@ -23,4 +24,7 @@ RDEPENDS:${PN} = "python3-core python3-compression python3-mmap python3-setuptoo
 inherit python3native
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "bmap_tools"
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${BASEVER}-*.whl"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


