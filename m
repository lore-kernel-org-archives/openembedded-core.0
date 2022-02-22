Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51326C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:36 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.1835.1645557455486581926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ogqzq/Lg;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id d16so17821348pgd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bIWn95NH7ZZ5EAPah4d73bWVjBR5j0CeQlwbjz5AVy8=;
        b=Ogqzq/LgB4VLwVCj9xOf8Az4631rk5ee409WO2EZZP3b/Ds+Bz0B5zxeBX1FsJhUse
         6AgrOgqy6Q6VYr9pmY0EHc4SkEO9FBTIlyT47+bweNVi2EM5j4NDxSdNAe9gCBDpbXqA
         Hdwu+5vMztAoJz3vbbhvLsJAczFQj+6RXud5Vlzo7VSJglvIUQ0oVYzmY5ChGxBEq/5t
         QD5JwEc5+TZJKxor/TC6gYn2LhJcKLg4KifyhIyH3vMJfjyIwc/HxbLmbdr4XIDQolT6
         OIJXrmjyD7FQ60qU9tnFm0DHwQiLvRbunsebsV+fpFUoBkUSnBVGUeLtckju0dz3exhm
         16lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bIWn95NH7ZZ5EAPah4d73bWVjBR5j0CeQlwbjz5AVy8=;
        b=k3K1EOpVZ3SK1GZX0atFkN1IZFLjkYbWJRcltZX8PwG3VeRiHif+lDQjfEtDol0dRE
         wxaD/pEslMhj8uRXRErLTl8BEhevrim1SFj+DlHkyjVc7a9iNWPL06u8UoGTROJpWY+d
         ZImi72ZNPj3FJjJ4roTCu3ZNAfyYHlmFN0z3eXEVfwHcTeyqQoIcdOP5V/2HGcEae6WJ
         2qgpJsoiqpPLtrQzyg/uB+W2arkK2ngWcndlLpLLBOVeIbHrBOVvQH0MJh1MaJE4mnD+
         CgHtfkxlNu4YNIqmi7W4kbPfEQA4aQP73Q2A11vod0Jq9e69UN0T6ujHA5G9/zlRIJ12
         q1Sw==
X-Gm-Message-State: AOAM530U6J960icXFfbixFV1VF4Ka86z+CgeyKmWVojH57kktLD5YPRg
	ozd5uaqpIrGGxd9c79m4uXju72BPyj806w==
X-Google-Smtp-Source: 
 ABdhPJzoMrn1HP+5qhsKrsxgspaUqEuFwRYVDmq2dtkp4qb2q/39ox7yvmYo/Szt1jzouEu2aPX/+Q==
X-Received: by 2002:a63:f551:0:b0:36c:54bd:da32 with SMTP id
 e17-20020a63f551000000b0036c54bdda32mr20494698pgk.285.1645557454545;
        Tue, 22 Feb 2022 11:17:34 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 19/32] meson: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:45 -0800
Message-Id: 
 <f74bad7407bb16278c7c2711051ef17f151b6f2b.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162210

Upstream provides a pyproject.toml which declares setuptools.build_meta
to be backend for PEP-517 packaging.

Set PIP_INSTALL_PACKAGE as this recipe does not inherit pypi and
therefor no PYPI_PACKAGE is defined

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/meson/meson_0.61.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-devtools/meson/meson_0.61.2.bb
index 45938af6ffe..a51db1e3d44 100644
--- a/meta/recipes-devtools/meson/meson_0.61.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.2.bb
@@ -21,7 +21,9 @@ SRC_URI[sha256sum] = "0233a7f8d959079318f6052b0939c27f68a5de86ba601f25c9ee6869fb
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit setuptools3
+inherit setuptools_build_meta
+
+PIP_INSTALL_PACKAGE = "meson"
 
 RDEPENDS:${PN} = "ninja python3-modules python3-pkg-resources"
 
-- 
2.30.2


