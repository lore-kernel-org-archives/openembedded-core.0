Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532EBC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:46 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.1842.1645557465611650402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aJqoAdIM;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id u16so13056784pfg.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vajCHgrqlvmCBBIm7Itl5+AuD9LC1gQdlJj+Js/r9w8=;
        b=aJqoAdIMfbD2bwktyEpzLmcGIxmh61h35qhP7ndRzykrIMARTmj0ksRGQoIa2n9yzC
         zuyCcrN0X7P1ySy6TbUcf+GYaEDTMVJFzkJlQCGgilCbSoI37IgAM6qY4GJ+amgD7fNw
         BpbylG3bfb2sFes1+yWMvODrcOIHLZftavzeVYJdM85wVgwNZBCdjoQ33rKxmNEMR6lz
         /rLxM+mBtH/2s5sX0bECS0UP8/s1Vb+IaxbiVBCV9sUei0PVGet2A08+daAMFVYzCpzX
         EWHdRyK+9RMFbF+937Whe4KCsHmcbSiJR5Be7o1bf4KFbjY0ufUSOg8S+llCocxcX2pZ
         I5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vajCHgrqlvmCBBIm7Itl5+AuD9LC1gQdlJj+Js/r9w8=;
        b=gq8raCO07osgrVgDiuf0U00CjSIHv8ELybg9CmvyDUly+7dcH0yF6pLBim/tK4LsSV
         tJP2hVfK9ztg8dS8+1S7hZHigFkgUgUQBH11Al8wLPuAhJzwgZPXDu1B3EaBWnTGCMKB
         YRSrhgQ4NNMgRTBNNbsfbDaXq90s+LpAmiCmwR3iP1/zNMK37ZSh7CCGVbqTu2fpFpC5
         y3YKKsWQeLgtsuWxprV4OfMwJVkv9e0kn7cL1lBfPOlvAXDbFM6TagmYxS/N44DJzHYP
         NA7DZk9ztZA5o2cbkc1l892V85Kg54SobLE4fYZKbgzYpfKD+13vTWgUIwRAeJfJRx0O
         synA==
X-Gm-Message-State: AOAM530M0JCMKeNvMGAfKPOTlrQ3T41daRlApexqo8euT+p6UdMkk3/j
	BBJeFYLfReZJB5yaNCz6+PLMvMrykzFGVw==
X-Google-Smtp-Source: 
 ABdhPJw9EK/RU1D0W/KIqNw8dqz09oVmL3rOUwvH9gJcu5bxrRZP1DhUSECj7oZtXJ2wyr2VJ2QtJQ==
X-Received: by 2002:aa7:9902:0:b0:4e1:375c:99f6 with SMTP id
 z2-20020aa79902000000b004e1375c99f6mr25864257pff.44.1645557464619;
        Tue, 22 Feb 2022 11:17:44 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:44 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 25/32] bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER
Date: Tue, 22 Feb 2022 11:16:51 -0800
Message-Id: 
 <570d4c1471fa9cf2fdcea0bec7c2e54df3697b31.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162216

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


