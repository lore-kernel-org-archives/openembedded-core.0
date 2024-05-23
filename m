Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD792C25B7A
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:58:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.10247.1716451104848964010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 00:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gIo6Z9YN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4202cea9941so50025535e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 00:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716451103; x=1717055903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBpk3jvpVJwgOlMUz2uTwpJM+GUSDZqVFCss6VFG5hk=;
        b=gIo6Z9YNzCYYwpAJLy+eCzwQ9NRIRMkSAHbiuEgf+YdMD5JvxiuXJncV6ShLUI1q4D
         K+esFYL9ZrsB10PKJ4Mevubo4XJqHK1KME5fUKEQmPcKe0uVRaiY5V1+KK3+evxb/WSx
         T28lpeJoR6Z9dYywKPhAbwEkUvkqeCOTXjk8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451103; x=1717055903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBpk3jvpVJwgOlMUz2uTwpJM+GUSDZqVFCss6VFG5hk=;
        b=h8GPxfh+z7zHAEJmkiQjMfNsJUZVfv51tuHAiiZqjKOPkXy4Cx6261q/psnOSUls//
         HqyaV4EaX6c/+qIZjQoc6ixoApdqs1MsyQV49RwsCKJ7b7cgZvNo62hai3v4HNgoFPvC
         7qFsQjKxC0Ge5DI4ipyQpB3p9E9MqPes7LClqeONjUSr535lhJnoh36wwrVd+og5lqMf
         9YUmcY/Gs0Gncul1c+XH2Lpx/wiI4PpWkcrScoIyL9HTHAX4K6QyQbmaA9q03V7GuO0l
         0q+ou5Jldkfqqph6PeRl4i0C9JQ00sPaZ4DRM/NYFq/kx8GfTXrejSSljqP63jjdciYc
         csVw==
X-Gm-Message-State: AOJu0YzrAvLnScTMZYFatAkEjsfWv4dJlgvuMMkIooUOKJv2Xr0Vwho3
	9jR5bcQ5mscX/PlOgj8vklScAgEJc4KSbZgFXspAfsJt7cRWmbvlxRASbPCFfXWO9VqG+J3TktG
	V
X-Google-Smtp-Source: AGHT+IHeUH6+yp3TGbMTctsdAjzVufnaqZiUbSwcdbv7DpoUMYYycIkx2Gw3Z/cAcISiMDAchEOq0Q==
X-Received: by 2002:a7b:c38a:0:b0:41e:454b:2f7 with SMTP id 5b1f17b1804b1-420fd31fe36mr35943645e9.23.1716451103019;
        Thu, 23 May 2024 00:58:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bf06:e9d5:d26:9301])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f75acesm17120265e9.27.2024.05.23.00.58.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:58:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] useradd-example: Fix S = WORKDIR reference
Date: Thu, 23 May 2024 08:58:18 +0100
Message-Id: <20240523075818.2307756-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
References: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 07:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199783

Update not to use S = WORKDIR after that was no longer allowed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index 8437a5a7745..b0d96e7f711 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -9,7 +9,8 @@ SRC_URI = "file://file1 \
            file://file3 \
            file://file4"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 PACKAGES =+ "${PN}-user3"
 
-- 
2.40.1


