Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E941C5AE4A
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:37:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.2312.1700120221237493575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWPyIkok;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9e5dd91b0acso66024066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 23:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700120219; x=1700725019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqpGULiyTMEbBSkOJ6UVqDx6BShxgan3gdr5opGymPk=;
        b=aWPyIkokYetZq2hGjie40KHhQocfOEmMOI7G2H+qS9D1xvAq/lUPnNS5qDQZJUOp/d
         nmNn7c4i1qV2IybFXFSKnKZfBvmX6iKklaNyeicQ9TEx6vBW5RBXQRwJ5AKp8h/obRyg
         8ueVX2lMLMGzZTJhszuCChixFFkMFnc0UbsKRyNuVrd0WN4vX1v4flaAPBUdJ/ASTVDg
         cDo9YHQfN9k3sKOm5C6NN8r1m3KWZvKhNLrDc93l/YkqRJI5Bo1qWxFWb8KW/u38hmW8
         NlPztteJAeqOr+6hNC/vqJgzcZWkJTtv7oIotlfRB/30MSMY7MTeqs7AIC/22J77ljmm
         S25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120219; x=1700725019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqpGULiyTMEbBSkOJ6UVqDx6BShxgan3gdr5opGymPk=;
        b=TfG3YJXUB86psGz6fleqrClHycH4CWjwtPsFfvqM8T0d09U0VkJp5eARHy7koDhf9z
         klL17S0eRHlCdrIr/fLhVx2jOGdAkvV/XEPNm38+HwXPkazA73IKPeFzNg8KXioB8hYE
         ov2EsmDWvPzkoQN7snT4Td72ipo9tPvfQK9I0TOI+/YgrtHwhatcmNYdrey/d3EN1ME8
         50ntRi/ub9knggobgvyMaV5Q4XnBf0XlhxrI4cYoFsDyW5LVnO12YQIYAJPuFVSMij3n
         0Nflf8htIA0F9BHczTFta8ygfRZ3PrynslHeeebj+izdeSRyP0SlgD5yIdvKND9qOV6Z
         lBNw==
X-Gm-Message-State: AOJu0Yw4R1fCr1yIXjYcMnb+Z/P3m3IgXSxnSS0+KFYTt1/dkOGKblCR
	AfxqkafBSELnhyAZNqT5KfUmeazyNLY=
X-Google-Smtp-Source: AGHT+IH8zl32qN0Ad3OfiOmWGcSuZ3PnMfT1vkkCTAme8OezhgSiFkT6jyUfgoAexfPbWwyn2K7Jdw==
X-Received: by 2002:a17:906:2e8a:b0:9d0:2e6b:f47f with SMTP id o10-20020a1709062e8a00b009d02e6bf47fmr12517219eji.36.1700120219491;
        Wed, 15 Nov 2023 23:36:59 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gy18-20020a170906f25200b009b95787eb6dsm7986267ejb.48.2023.11.15.23.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 23:36:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 05/11] libjpeg-turbo: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 08:36:44 +0100
Message-ID: <20231116073650.2710535-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116073650.2710535-1-martin.jansa@gmail.com>
References: <20231116073650.2710535-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 07:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190757

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 99ed82dac4..ca1910966e 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -24,7 +24,7 @@ RCONFLICTS:${PN} += "jpeg"
 
 inherit cmake pkgconfig
 
-export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}"
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE:append:class-native = " -DWITH_SIMD=False"
-- 
2.42.1


