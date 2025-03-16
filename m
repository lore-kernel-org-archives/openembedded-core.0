Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E68C28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.31790.1742141554437652014
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aTJwPYUW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso7711655e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141552; x=1742746352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G25HDpj0ssyMVagidfThFaYK82QavnpC2f7VNECKZc0=;
        b=aTJwPYUWTgOrMFJ5POLtM7Ym/yHroktqrEHt+A/Fz1WI/MKSk8CEIWRSlK4NJmbjGf
         UJrFrJwsNCpTE33mny18QCm2y4znLvtTsnqquvILYwKa1hVdHqwxvl4j7V5Sw0IaYDeY
         RbOoOBxIweqO3qIFvrOcQiVtgM2hhmH6UWtM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141552; x=1742746352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G25HDpj0ssyMVagidfThFaYK82QavnpC2f7VNECKZc0=;
        b=T/l6Fkwbmf/kUmISFnptbr0lm0RaHtNPoc7SVhuDV0vu69gcuY6F2w0J83iVH3t1dA
         WnSizBvMMhWW3Ro2dBh32JVMAnUyK0fqM8xIme3x0dd6D1f1NEZvIf6tQLCN+/nsuTUl
         Zq3JFMQYn1TRc5xPFccCbvUSOacse5dM6WEawgvMKat+hN2CIw1bLbJJ7essRoYnzI6j
         zWbhhFcb0NEuvdk3r5aCF0JK9Lc2lDdbguthaUHjAPHUmK73Bwn1iA4uy/GGdu5+w7CQ
         mz/VWqEy0B7iJw8nh2ijckkSd0nqVmuJEq2lbGp6TI2+EMkxatiDRE0fMZJSdB9woPOn
         Cgtg==
X-Gm-Message-State: AOJu0Ywo/BWJsxWmc+rebVnJNwwuSyL3RB417ppYe8QdkVhdVhwceqUs
	L0WMiG1k2zK4ji3WeGxSVNnJLqls6wPfYLHIWZq/SqYYgjyRcGSXSx9QkHW9Ymmwf24fWckuHgS
	t
X-Gm-Gg: ASbGnctCZTA45khYSpo0R6KW7hqzwratyj2/AGIAkktXIgWDT9pJFLAqkkp+ZW/a1nI
	0zdEuv+g1gqEG9dLLUkK03AIUsT6qcHCTkXO+Cm7fMBa1r5cGyUSvZuZmX4yS/wGsB+6C+EGl6+
	n4GK/40hzj97UK2xFtXu0wyRsX3+vj3CY49RpPjkW7kAUyDv87tE6rnXd8dU9fYNf4BOha+xJSX
	feNY8ff3QPfwyzS2Y4WgIUpIhgDNI+I5p/Z+CojpEHqMaEbKRBYqmuk1xUpR/p/+nem/aOuZS51
	m3A9IRrE8CAyAp5iivn+LSgVfSmsxI10ZK16W6nIcNoQBhrdw19xTfTtbQATOwGEo3cjfmb5NA=
	=
X-Google-Smtp-Source: AGHT+IFT8QDPuAtMHoEHib/8CYs81I+n/fZqjAvheef5WzD58Pt1qR7dbca76X5MbY99njsJo2e9iA==
X-Received: by 2002:a05:600c:1f09:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43d2a534be9mr32801965e9.10.1742141552213;
        Sun, 16 Mar 2025 09:12:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/43] pango: upgrade 1.56.1 -> 1.56.2
Date: Sun, 16 Mar 2025 16:11:42 +0000
Message-ID: <20250316161209.3629986-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213019

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-graphics/pango/{pango_1.56.1.bb => pango_1.56.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.56.1.bb => pango_1.56.2.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.56.1.bb b/meta/recipes-graphics/pango/pango_1.56.2.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.56.1.bb
rename to meta/recipes-graphics/pango/pango_1.56.2.bb
index 06cf48021e1..36f3deb48ff 100644
--- a/meta/recipes-graphics/pango/pango_1.56.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.2.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI[archive.sha256sum] = "426be66460c98b8378573e7f6b0b2ab450f6bb6d2ec7cecc33ae81178f246480"
+SRC_URI[archive.sha256sum] = "03b7afd7ed730bef651155cbfb5320556b8ef92b0dc04abbb9784dcd4057afe7"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 DEPENDS += "${@' python3-docutils-native' if d.getVar('GIDOCGEN_ENABLED') == 'True' else ''}"

