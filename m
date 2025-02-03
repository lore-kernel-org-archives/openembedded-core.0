Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D476C0219C
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.92310.1738600924532455350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UUgdskt1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2443937f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600922; x=1739205722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvS30UwizrXNdf6gvC0ZVC3lJmUD9kuuOpSMNsVeTIk=;
        b=UUgdskt1LgM2e5uRGPqQyCpnW6g4nee57Zh/+jM4FID4mIG0yFpCVpXBYbaUCvrf1r
         bL0Wk08jxNwVTKGRehpb3UQHYMklSoAdKaMHtVNNEPWshgdRe+zbbEuSORe/vXt4vJdn
         55xJhmBsOrzWIhibtQABxtPgDGL+8BlUeAhXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600922; x=1739205722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvS30UwizrXNdf6gvC0ZVC3lJmUD9kuuOpSMNsVeTIk=;
        b=LApjRaz8d9tJE+JxPynlus/cb3i1DBOu1curGYb0wOdbgL1fenjAP0zsiqpUnMTgHs
         KhzpWl/rItJPUq2KKG6mwRiVQ6HhQNbVpo4C3cjvfJL7ouBW9Ytgi92fI19sVjjXYt9B
         yyhvsUM5t+XH9s7Lqwt9ItMe7je8i9WbbHaUG5s/i7iC4fj7KwtliqdEPoDspDyG0HVW
         Wfi8+RFT4Clg4aDb+YTaNnui5CMUQ/yxUIreseL0be3f0AJPWoji37JdVk+3PyZ7lawY
         w/Nj+RmsbGCtGIttLA70P1EtqJkCxF1+a0wP7lvvU8K1KCZDhBO0yEdT/ACo8EUL2wNW
         mZYg==
X-Gm-Message-State: AOJu0YwnAwkDzbUAEegUhCtXm0eyXEg4SH7fEBS21ahO6GSbISXS4fcU
	0HWPbJ1twgyCLZ4eSHq2siY4gulo4RX9ImNT/ftA61lVjGtvqnolS8fos9DGbbQ0b0DapoxDCIb
	y
X-Gm-Gg: ASbGncuhIQImc4yEEUN9ujdWibeQJvO9AQgSwMqueOwjjjQVfUHJfmsnuMoUuG1+ptg
	uU9z9ET3zX39Vgzs2QfLB2ZEY+Vp+pVLMNFqzK+P2N9LYPTaUrzTYGvZwCEJTzFCsMSrZY08E/s
	q3SuMwZQWjJnGJzxlM5BjATOXxWGMXXzqgfn9VaU8eq1OGjB1fhL7kYC2K7TT8GbKXQ5iJfdI3q
	dqJ3CqbRt4GbOziHR9rEpdAgwdUne/i1ZZEfoI+9iRSM+/LfRlQKDdNSdnATSd+E/ReykXkZofT
	ap6RKydllnPKdxRXl9k3d1mRuEXvVE/TPuFaqQu3ObTo
X-Google-Smtp-Source: AGHT+IFsXveq9pKmfXrwG1MVSgzzGgXuL723//EzevCjCPD2TKRYO7l5Jtwe78IkMNyiXF8FBlHgDQ==
X-Received: by 2002:a5d:6d86:0:b0:38b:ef22:d8c3 with SMTP id ffacd0b85a97d-38c5209395cmr21964852f8f.35.1738600922597;
        Mon, 03 Feb 2025 08:42:02 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/46] python3-license-expression: upgrade 30.4.0 -> 30.4.1
Date: Mon,  3 Feb 2025 16:41:14 +0000
Message-ID: <20250203164130.3403325-30-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210703

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...xpression_30.4.0.bb => python3-license-expression_30.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.4.0.bb => python3-license-expression_30.4.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
index 3af739bed40..649b53ea492 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6464397f8ed4353cc778999caec43b099f8d8d5b335f282e26a9eb9435522f05"
+SRC_URI[sha256sum] = "9f02105f9e0fcecba6a85dfbbed7d94ea1c3a70cf23ddbfb5adf3438a6f6fce0"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"

