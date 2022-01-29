Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E755C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 17:12:05 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.8405.1643476324540792226
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 09:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=fisgQMT2;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.173, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f173.google.com with SMTP id bx31so1817673ljb.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZH4fl6FHjdXkDqHRotlESJHQDG20AtWpIUxNUDGF8I=;
        b=fisgQMT2Yez525WyA4QdpYIJBX0+gMesLKZzm7KE6k7H6OaHkorNAVGkULxTOBA4QW
         +BTL1ueKLEen7VM+hZkmc1YeYv3A43Oku9U2BUU2h2m7GXrF6vjke9QtDFxleWBS9BCv
         p/e3/p9fq6359/k1WfzFw6D0AF+p4x+cjzsibLGT9shLpZ+wi+MuPdcfq11BunEWl3pL
         coxaUDGF5jDIYLLkTAbpmpWWlM7gfEh8DMad//n2cVyW++KCl1q+U7ZffChqlb2uwGLd
         mPX1/aYwuLxh+bHRoNwfdelriWqDLhonVigY2pGxy1Z95+imdwoIXCqqXN9FhbOYbEYW
         ex0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZH4fl6FHjdXkDqHRotlESJHQDG20AtWpIUxNUDGF8I=;
        b=csXwl4FBo+TANvveubEdbIToQva0TrPd4zx7uPaH4L9LlPbwtiYbPRv18tHeXVM7df
         KCas0MAHoDSqW3u0dNf++A2ULF7kDFscayVH6fXubcn7n6+uDg+r7c9tWVdcjvHrVnsR
         P85eUTdeq5gTB1RDgHKrPOSAdDRkl0Z4UjJWy1m6MKi5dFMyactl1Ap/hidZG6Egwy7T
         0i1pHkbDeBnMajbu275PpanaDJ2uYEoETN/a68HpOwYPz6LtPirscWvyQO/V+5JPy4Wx
         YjPf148bwUuicJYmJgalvJXcLxy5S7YLAo2F7TjyPK4lD1iGqoLHR63EODHaV1itqy2d
         arKQ==
X-Gm-Message-State: AOAM530pfQtBphB6nFv4LAwfZ2nwDQCDdbiWAuhSjPXuXrCdtsKN5ZwO
	FC2VqfY8n6vmxTfUUBcUfQhZhEbuThux/kFF
X-Google-Smtp-Source: 
 ABdhPJy+csHvP+STMdvX3C76Cbl5/udyLb3tFmcG1XRS/hssnZYbPS1wh652LTpFYs62Lt8fj5y2Kw==
X-Received: by 2002:a2e:5810:: with SMTP id m16mr8697816ljb.261.1643476321994;
        Sat, 29 Jan 2022 09:12:01 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id t8sm2309051ljj.0.2022.01.29.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 09:12:01 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.48
Date: Sat, 29 Jan 2022 18:11:56 +0100
Message-Id: <20220129171156.410519-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 17:12:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161101

Changelog:
- Fix issue with memory leaking from ICMPv6 RA.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.47.bb => ell_0.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.47.bb => ell_0.48.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.47.bb b/meta/recipes-core/ell/ell_0.48.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.47.bb
rename to meta/recipes-core/ell/ell_0.48.bb
index 1db0065a37..737302a444 100644
--- a/meta/recipes-core/ell/ell_0.47.bb
+++ b/meta/recipes-core/ell/ell_0.48.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9"
+SRC_URI[sha256sum] = "9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


