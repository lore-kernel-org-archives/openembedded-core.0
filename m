Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4754CF58D9
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:56:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16222.1763582175561750933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 11:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K0f6stOw;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219db05so1011495e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763582174; x=1764186974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wf2Xa/AVNsz0beYpW5OyGShz8OKCeZpSOiyECianV68=;
        b=K0f6stOwbFLdZnJTv90yMHvXuGPCEzS2lz2N2fNf8SFY+CeCWKm9iU171a6o1knohz
         4gFYbBp1Qb/mxvs5ZKdNCX4sFycmZg89iXp7KekjZTA1DWJ2EA/Yzd/tv8C8WyDC53WN
         Gts93LYwhCJpYfwsA3Dmvd0jNTEHkI9guvH18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582174; x=1764186974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wf2Xa/AVNsz0beYpW5OyGShz8OKCeZpSOiyECianV68=;
        b=XnEo89gu7EN1mM/LsrkJlQX+ALGDmbkHcyhElYi6gUGbRg5wmt5zRqdyz9flew/ffu
         frtTGSHxcGdVTb3+ku1YTJsgFEpqjSCDkpcqHJiNEjAe53WkCNFseOI5uZDs63sWWYIl
         455d/JtIWpF294zfasU/JAGJNqXmMtQlKa68nuUhj77Y6x23njKzt+XuDLpf3Bzzn68E
         PsT3/4NhTnQtamWSDuMpIxHR2EmYzMSWTzF47NKW4ysPcB92TZy2QexlyQi9gCnRpQfS
         3z/fVQvDWS4dSJcLO5X8lPGkBXKyBD2RQqou2UvTIafgggEHebZtQBAS1JX1xjKapHeZ
         JXTQ==
X-Gm-Message-State: AOJu0YxaTQieOwjmLgzVnBuRVcCDmxC+GVclQH2U/q1odEtIJPG8I1Y2
	f2wPgGMIn40ThF6Wp3gN3m4arWrKi5GcMRbdfZD87Sb2l9wC5GkI986Vv7ng2QaKlC6kqDFU7cd
	vzES0Rf8=
X-Gm-Gg: ASbGncuRVgkGFmqFR0zk2qEom1oNU0lgOwuM6yTInK74nuI3S6oTVKD0LhrPF3SOEAS
	B+WKm1Sra18ZysL7lJlx0qvFqRKNxgx2r7fZsA4nVRAg/xa3fgIrPb+Su0jXMyE69Aq20lPh2qz
	pzx57YQC5Fnyic+klsTAoByhV7aNe/PcI+r2oLfd8OKwIcfYhcAQzYV5Srm3YNcdYC4RMznCAE2
	0QfxZSvd1lbItde4RKu3W4o44Bm8708ZfE6IUVb7RiIO1iFrbHfJDofBLVikDz3PTjzHdLkXI32
	PCuThEgP7vqEohLQ3A9fuoY8f4fgchTHn6yOgWIJW8Q+jnAw3OZJAvo3xJc+bl+xxM4qqAj8yiB
	t2nZTKR5ohdzBP0H22Bp8eXWFmenl01F37tggAt7B2IKVwqJhKjHe0Oi9zkGYVnCqW0rS9Hvsza
	sYESkmC/1Pb9Rw7GjfW1Hxs8x/t6PjInHGXxSI4Pd/RQfpo5d9DenX/Yq7ItGyx+LdAbtT8agOB
	0+G+eJfAsM1pg4gJboaKlFIh7omJ2Fq
X-Google-Smtp-Source: AGHT+IHCjgmNdbBo/dwHAh8yrvgWuTTRV3fcZT+s2lGS7SKkGa2ksJT2kFhbIuA8dq8u0SSB5ie3Vg==
X-Received: by 2002:a05:600c:444f:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-477b8a8ea8bmr4294385e9.18.1763582173602;
        Wed, 19 Nov 2025 11:56:13 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm50519895e9.0.2025.11.19.11.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:56:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH 4/5] rust-out-of-tree-module: Add myself as maintainer
Date: Wed, 19 Nov 2025 20:55:39 +0100
Message-Id: <20251119195540.2671856-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119195540.2671856-1-yoann.congal@smile.fr>
References: <20251119195540.2671856-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226584

From: Yoann Congal <yoann.congal@smile.fr>

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c3174cbb72..7204a5e5992 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -774,6 +774,7 @@ RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-out-of-tree-module = "Yoann Congal <yoann.congal@smile.fr>"
 RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sassc = "Simone Weiß <simone.p.weiss@posteo.com>"
 RECIPE_MAINTAINER:pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"

