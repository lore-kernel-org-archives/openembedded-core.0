Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E5EC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:18 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.6298.1636603756830613440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=G4DWgRwW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id r130so4521531pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1+MsDdXr3kar/fVGfxZJahOcQ/Xxg+bYW4cpl95G7Nc=;
        b=G4DWgRwW9WQkCu6LxFh574ZRCG16N/F+9IqG03kQS6U9OBnlNory1NJsa6KkI+lnPi
         AiUH/Wh+AztoWvigqch+88OCQO5U5j6gzm4zmwo3RpV6u5zd3Y8y6KahvcbGzXYRoO0U
         R4+Vx2IU0z2AwZq3fmBAEK2KwMHh6RPWzYnsemJ+/ph3FJOs8uawLQ3vy1WZCXXCv34V
         RZittnMB5zaXRkYYU9ff34xj2CTjF5eDTiZgAMb8DwUZQDKfZJ8j7CoVjRoQmr0wxTaM
         xtC8AaVpBZSUvvwVf9bKeKqbQZDySiCCeaTK/6DF2oNz8ByjT41+vnCoce3qjGh8+gR0
         gRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1+MsDdXr3kar/fVGfxZJahOcQ/Xxg+bYW4cpl95G7Nc=;
        b=4jQFbRpmMUIUnN7GM9QmgsULkZnmQ9Q5xas9g9U24FpG27Uh8ol7CrGLrHdZSEY+gS
         QNzteoRfEuhlfLxQdZ3DfgWauKYRygmNcMQvVnxjnWy4bBQTW04YpIIZruBqDOaYFarG
         5V1GWpxgHEqrAwsGqMAufx5N21PIoQfKsFlq1/GHdevC/SFBHpwFifcixgopY/soHo3+
         XHv2OKkgX3q/ZDt5/RxJXjARxW401DqLZwPjIzSl66MWjCVGFoaDjpfsZt+nISe7Iat4
         VpI3cdKHr9RrwrRMoOHZ0AAkGVH6xtjh0DzlYx16dz8/BcC1iXXNRUKwy6xn6XQXhtSS
         xR6Q==
X-Gm-Message-State: AOAM532iDpKgI7X0sOPnKxaC+Zib2xt8SacCdReWiNID7orfh1VYDE71
	DAx1oJgbqELECtI8DTOd94Wt1u748lL2qcSg4Gk=
X-Google-Smtp-Source: 
 ABdhPJxsHRRc2Fs0DzTimQFBYQJATUvCk1ZUX4BohRt3aCAKZ1E2XQsOS2/Lh+I3xyfd4M+ciJSDig==
X-Received: by 2002:a63:1b5e:: with SMTP id b30mr2717146pgm.72.1636603755977;
        Wed, 10 Nov 2021 20:09:15 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] pseudo: Add fcntl64 wrapper
Date: Wed, 10 Nov 2021 18:08:32 -1000
Message-Id: 
 <c87d2dd8ec10d8164b0bff4307ea66f41b3360d4.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158139

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add fcntl64 wrapper which hopefully fixes issues seen in findutils and the find
command in the libtool removal code when built with LFS compile flags on Gentoo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f26867fe4daec7299f59a82ae4a0d70cceb3e082)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 6779db16d2..1a5d230c69 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "0cda3ba5f94aed8d50652a99ee9c502975aa2926"
+SRCREV = "d34f2f6cedccf8488730001bcbde6bb7499f8814"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1


