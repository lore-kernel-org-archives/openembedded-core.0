Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E635BC8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 12:06:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.19062.1756382781637813603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 05:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J/KDVPQw;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c79f0a604aso521946f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 05:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756382779; x=1756987579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7r0NU2THxDOSXBCWwQ+TliGgfU2udJP5Al3hVcEGCY=;
        b=J/KDVPQwKGYbgitp4zZi+b7xcpWU4VwwpBZppAcVhpcbqLdBuAolWofFdqjvED6D1n
         Im6VJ40mQDQjGrRKTjOdaOFLBvA7uQe9t8zH6dTGQkPdq4iaRFttIg+pzNr5enbsCDof
         sEjCdDg8HtG4BCGoIKCsYLBHL5LK88XMh19GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756382779; x=1756987579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7r0NU2THxDOSXBCWwQ+TliGgfU2udJP5Al3hVcEGCY=;
        b=gIcTWyvjkh7Hyl6xhZcNkugBXbqhQNYC+ytodu7X37H1S99JwmTnI8rB093hbH6k8A
         b1xjXB5tR8rCDk6HKE0DFopYCwOjVcp0hNgp+xvkoLoJwwNwJggU4jARQFIizN6jInGi
         t4xSDwkWtwi6x+06b+LSzNroFUuEOXlixRUlkXUOZPaG8RtJ0+cypdhtb7ZUHO0kVB5l
         /l3jClC0MBCPy3sHoaw3Wv6ip+HlE21AnnPpwW/i2qeAbbP0W3JSNwHcgd8aUQ2Ojr08
         kgwcrzu4mSW0NUCeDxjiNJik5rlOqORRlFkcqAv52izprcXzU39vdOhb9TVZaMaBJraU
         y71Q==
X-Gm-Message-State: AOJu0YybB38eWCCIyE+fJgNX3b+TakXmVtd7pxXmcwiw5LpMPHIxUdPu
	SduT8h3nQdYHwgcgLaHMTrI6SyCjFziQMdlkLTzseKRAusEu8JF2+OFpjt3bYn/tRPYB8foPWm6
	NQlG6
X-Gm-Gg: ASbGncsXnJm2ohRQx8Yi4qkC9Yu0HGAYVhiBF2Wm9sJEJoBMSfrbDHrnYn88HCkGh6v
	xop3Tkz8DMjDAJtPHSSO4hHUHyUinea9p+Gj1KjzylZtg2M6gLHX7cDnFDWEkBLEjS/CEqwT1Wc
	hjQzuk0Dpw9DkKwYbmslJGr9O2w14Fb4ZZPJ/qRdNeQlDE+SZbM+UVbXhXmTiiOhE5/pMEf8v1W
	o1yREUvubwPOwZFLn+PhmNNbUrRvV77WlAbbndAeaoHd927/hIghGSG99B9jan7/yry8y6ryfb2
	dTK0Y3Yvkv1P5EDMt+X14q/QNVu5CGmi8zyEjYmD+uLehUNWAPVFlNuj54kPvaxdRJTJYROvUcJ
	516h4g1vz7E9wPFsS7Qb5HEkSGwE3lHmCcjhmqN3aVJCvLJzhdiZE3A88I9BqS/J/JSTlA9WeH5
	JFHQ6v51mq/DaRXrigo/y3m7hAzfndqs6TQlg=
X-Google-Smtp-Source: AGHT+IFpa8l8RyljJhInn9GwKqzLRltgqwL8hdkFKSe/C3cilwI26Izc+qYlIylVY1bsHROuZMWDJw==
X-Received: by 2002:a05:6000:178b:b0:3c8:e9d3:c38a with SMTP id ffacd0b85a97d-3c8e9d3d0bemr13484403f8f.5.1756382779527;
        Thu, 28 Aug 2025 05:06:19 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b797bb7b1sm31728575e9.8.2025.08.28.05.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:06:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] rpm-sequoia: remove rc initialisation from run-ptest
Date: Thu, 28 Aug 2025 14:05:44 +0200
Message-Id: <20250828120544.2982231-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828120544.2982231-1-yoann.congal@smile.fr>
References: <20250828120544.2982231-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 12:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222568

From: Yoann Congal <yoann.congal@smile.fr>

With the previous patch "ptest-cargo: move run-ptest rc variable
initialisation", rc is initialised by the ptest-cargo class.
Remove the (now) redundant initialisation and the related comment.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rpm-sequoia/files/run-ptest | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/files/run-ptest b/meta/recipes-devtools/rpm-sequoia/files/run-ptest
index 83e59b8031..36adfba7b4 100644
--- a/meta/recipes-devtools/rpm-sequoia/files/run-ptest
+++ b/meta/recipes-devtools/rpm-sequoia/files/run-ptest
@@ -7,9 +7,4 @@
 # The test that ptest-cargo class generates requires the
 # TEST_DONT_BUILD_LIB environment variable to be set before
 # it would be executed, and this is what this script does.
-# The "rc" variable is used by the script generated by
-# ptest-cargo, and is expected to exist, in case the
-# run-test script exists, and not created by that class.
-
-rc=0
 export TEST_DONT_BUILD_LIB=1

