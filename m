Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1FBC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:21 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.5668.1645406900539890564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c5UXGnTG;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 12so9379247pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MbFM/lfHIRRkVJn+qCVJ397jXTQm8/CrUAmSQXaYRLw=;
        b=c5UXGnTGzzmROoIaxrmVQL0h9br86Wyr+dFTndl0BZi4oI4X8rqxVoXuE798w2rcL1
         fDzSMiAuN81BU/13ME1cUfkar+gtMGTzqp61WxicOrEMblzbu09h3CV41kQv1K7sMXgj
         gq1IoyO4EYGafXkhQkMeF8lg6VbAbxpEAAfFvH0YehnIdspxTRtMrHRBDfPX5Mx+iH80
         eK1IiwH9AjNeOcl17MDvoWzWTXN3/TZdSWlQizElLu3dG9zVifjr7IH/OiQw45FGTANJ
         j++IRfCc8iTbSW51iWoN7D+FMXtoVHDPVCxmTvDQwg8mK1Hcn1xnInjQrim4IMmovrd6
         zRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbFM/lfHIRRkVJn+qCVJ397jXTQm8/CrUAmSQXaYRLw=;
        b=ggNG63NV3gY+YFPUhlrjyfP0JZ9COWySITWGsNHnNIDmAW5MZ1RfWEz61Nx//LjO5B
         AcDTsMlJ+GEEGGqM3FbDh9EB1PmFUpK0VTXAr3/jsncE5k8+m5w9H7SnLYv6iHhDbDUU
         E8NLtOOpmhiV9EgJtzR7qUvXBKfLPD0Svc8MFqfrXGc2/MCs6JTGULwWAgpEFQgrVOO6
         M+n2T8SCXs0ytvSpqcf4381PCxK8uzStNdkDwQLK2t61rH3h64uyYbCzPLEWkqBSNkc6
         yX5ggXvXORRnJk7cXJZLR9YmwVQj+oRIUkdoolDdIkrMzuUaWKuOe4ossgJRm/+QTjZK
         D2qA==
X-Gm-Message-State: AOAM531n+QDktbxHmCUTStNJnwFyCVUApe6s91CfOmdpY8leSGCByqaB
	s8tMQ9AWZMqlVbcgAqXn3M9+5KQkLw4Hog==
X-Google-Smtp-Source: 
 ABdhPJy9HAyWU/VVHpFtRy6SHhjOMMTbRV3NsgSTO3gozw4IiYqA1jzgBX3OnP6IO+yT5ChTQ/rCkw==
X-Received: by 2002:aa7:94a3:0:b0:4e0:1c98:1e3b with SMTP id
 a3-20020aa794a3000000b004e01c981e3bmr17690193pfl.72.1645406899626;
        Sun, 20 Feb 2022 17:28:19 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:18 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/19] python3-setuptools-scm: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:41 -0800
Message-Id: 
 <c994f320a3edfbc040697f1c2f9e791ec0045b99.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162004

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index 10dad5a37be..182ccecbbfc 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 SRC_URI[sha256sum] = "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30"
 
 PYPI_PACKAGE = "setuptools_scm"
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
 
-- 
2.30.2


