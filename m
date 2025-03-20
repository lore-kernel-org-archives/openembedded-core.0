Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F5DC36006
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.7665.1742477999976042346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mYyABw3L;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso7096165e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742477998; x=1743082798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/p2OScyQrHeCW1OogWc3uNl0IAGgYfliUw0Gy8EV934=;
        b=mYyABw3LMZ/G88Hmnu+KHVZBdZh1euaZgtW6lD25phxS3WLPfXt8XqH4YkFaJSrG9a
         fcnJrDbm45zTcYL3W2e/qu4KxUXgi3yXo0iLzoIQ2ba1+mVxEpS4tKtRPcJakt1uJ2vf
         NOQl3PmVTI90IRpabxhGUPR1eV5kG9qBEusw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742477998; x=1743082798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/p2OScyQrHeCW1OogWc3uNl0IAGgYfliUw0Gy8EV934=;
        b=IKoaRe90WbFQ85LP1Nk7SoQVoO8M9I2PQJ4QaomjlW1ZCoe7kIznWbSFiMgwhBbZ6T
         oJJHYNodHtl1gcrR7t1qk95OJI2FJt18K3tWKszOY2+SEYzNI6VfMQ8YXsXdSgTtdJww
         IldA6V0zKShDu1Eqzc6KCcSN7+omRv0lIYGbtDAP3hO607CNo6ooy/YvxeDz/ZeayUAK
         mlE5+d7x1s8mZamhed1HjXm93EsIRM9EzdaOY839pXANCDoSQ0nWky+PccoRphQqj6I0
         HBsZX5V3ivoPgTo7BnTmzpkLItkZKswcmlH7bzr7MgDcspmq/4zSW8kyyvpF7wPA32XY
         WRkg==
X-Gm-Message-State: AOJu0YzrL0mxvIIsWui8hs3JKC6kab+4Yh/QF+8YgtEto6/v+JQZrUzn
	H0gk6KRZykBpn34wZlip9DLOx+8rvH7fXjm3YeLNcMzc3ySJ4nCeAJX6wPbvxqfSajS7YH5wDW6
	c
X-Gm-Gg: ASbGnctmoSMcAWGkx52etFTdpbu4Q4PdhMTWrWGn8A1jBX5tLsDez2aZWe0XjvYU46Q
	OPsChMSS/auQl7FhFhX1uWTEsjtr/Acazoa15e0l7Yr6NZtSql6fUn62mPiexAvodP5B4PzzLkR
	RPCBKPDMJHw5VSxcp1AkYFwys3Tyq/XaFBCiYVTEEqMSuel6zt1aFkbLaGTN9bNXeWU+exrfk4E
	BotqQJIeERpalYZlPaoZI5Fq2+m2ad4puk1ykvgyyCTEd6oHIDAVma5iQxZ+WBYRIsNv2Gb0oC3
	DeaCkgWsD7sRdualdcGy1L4bKCz4FIwO124WD15Gp2U2Pf9M6Kc0JWSo6kBmvfJQDaz2rLWabY2
	XzLh8fQHXl8snsKthNOB4MWOSVrMfHJAPqK9w4k4cnO+wS50DOA+IQwgFyw==
X-Google-Smtp-Source: AGHT+IEoR5fjWfksYyuUIW8WcdQ1RzQv2SSWYSaL9zW6Pji4hqJHVjpHxWFxJpuF+qEdKbCVPKc7iQ==
X-Received: by 2002:a05:600c:5250:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43d43781e4emr64384295e9.2.1742477998120;
        Thu, 20 Mar 2025 06:39:58 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df320csm23651274f8f.7.2025.03.20.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:39:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] insane: Check if the C++ toolchain supports --std=gnu++20
Date: Thu, 20 Mar 2025 14:39:46 +0100
Message-Id: <20250320133946.2631311-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320133946.2631311-1-yoann.congal@smile.fr>
References: <20250320133946.2631311-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213387

From: Yoann Congal <yoann.congal@smile.fr>

This is needed to build nodejs from meta-oe. Check this early to avoid
an error later in the build.

Fixes [YOCTO #15804]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
WARNING: as discussed in previous threads [0][1], this will disqualify
builds on Ubuntu 20.04 (its g++ does not support the option)
[0]: https://lists.openembedded.org/g/openembedded-devel/topic/111740469
[1]: https://lists.yoctoproject.org/g/yocto-patches/topic/yocto_autobuilder2_patch/111757761

v1->v2:
* Changed error message
* Refactor C++ toolchain flag check
---
 meta/classes-global/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index dc317e846d..ce52bcdf90 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -804,6 +804,11 @@ def check_sanity_version_change(status, d):
     # Check if linking with lstdc++ is failing
     status.addresult(check_cpp_toolchain_flag(d, "-lstdc++"))
 
+    # Check if the C++ toochain support the "--std=gnu++20" flag
+    status.addresult(check_cpp_toolchain_flag(d, "--std=gnu++20",
+        "An error occurred during checking the C++ toolchain for '--std=gnu++20' support. "
+        "Please use a g++ compiler that supports C++20 (e.g. g++ version 10 onwards)."))
+
 def sanity_check_locale(d):
     """
     Currently bitbake switches locale to en_US.UTF-8 so check that this locale actually exists.

