Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF20C3DA4A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:47 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.2128.1743577846989045452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AcjqvimX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ac9aea656so5191226f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577845; x=1744182645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVr5xfh1DxTQEzIT/X5eQejieCRBXGKR0oJ5Exte7+w=;
        b=AcjqvimXoJ10vJkCwugjo/TjzJSjCg98MEfaHbBODZ1eWJSA1r2DpJvT8UdydiisNu
         PUNwhOZkzdYO/DSv4GsL4zgdrMaeFTr1fOd5aj7zQjMK/Rn+j/A462VARxWc9S/Bc1GC
         PTOwdSqrDZ93lIg/ofvv3xKm0Dd/OFP+FVmn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577845; x=1744182645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVr5xfh1DxTQEzIT/X5eQejieCRBXGKR0oJ5Exte7+w=;
        b=vKje6vPx8cB46p6MHxV3D+s8A8ADhRyxrnWCZqZGj2oWphpu/doRC8CzV43dAy6ZDw
         tj5/V2sntnUBZ3uL+XWDDEy2g5FvrcoIFYq0F20IeA7c+4bwcSLNYdYi18XU6MHuXah1
         bZbIYgFq2K1/IkI9dUftp3YaTGVrm2qVFFPE9tmITxEslkVuZg8EWnZwm6Ux7xsCDr+z
         2doBHIvINOPl2EAi6AbwiIJtsYV4sTgAwBLSfuCoL1stcAF9NzmLvcBHOE47QZIoKPYp
         PKOm+b5IOrK2Ni/0JZxvW+ir9reVWcEeYAYyTmiTIKxH8rmbE9vGzJO6PTcnBWWtFsSN
         MJuQ==
X-Gm-Message-State: AOJu0YxDdp6hZS5FQi8MpGbQQQok0l3dWggGaqVR51v6vMSa9/lnylKi
	jCjpwQsSKaZ5+Gk1kZSqhdoIGINi8cP0dLlNuWeTeyV0DWsmiWQf7f3JGQTKKYc39EUFSWkAfLR
	D
X-Gm-Gg: ASbGncsx2EVctOdS1bIigIA0WSUgAqu6UUE5muw3iewNiLUb1taF1XWhvjiTTAi5U4z
	zcgHGETFVjiJ1YPwgnP6k2Q1P9yr+BPIa7xnDiFuMRqz7dqqtRl3rmUolca4WWTYVqHdWiytl1R
	9JIV/VbJqIwv4F1anhhTaRVPEEjyt9odfk+4g78aG6YXxyh15FC9Pp6ZKd1b0ufLAupdEU+ai8K
	kV6IzAXQRECo69vHBVRklIfjgk3uGGNyxyvmeL6PS879Lx13CV8cULEotAGMkPbuLHQH9ujarQx
	8GfydO+N+slUEuJifLGwh5vWS0YAtEqREqQF8AuUXrrkwGwan+lwX1OOI/nQart+4OwYGzynzA=
	=
X-Google-Smtp-Source: AGHT+IHtKJ4BYVRyZQTuQRW7xYrKoTG5I/G+cKXDyzbGuTxVwvzwXiH8Zj1eQoYzMGRHkfowzwnQzQ==
X-Received: by 2002:a05:6000:1acf:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-39c1211cfa3mr12774881f8f.47.1743577845033;
        Wed, 02 Apr 2025 00:10:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/48] ell: upgrade 0.74 -> 0.75
Date: Wed,  2 Apr 2025 08:09:40 +0100
Message-ID: <20250402071017.2157620-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214184

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/ell/{ell_0.74.bb => ell_0.75.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.74.bb => ell_0.75.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.74.bb b/meta/recipes-core/ell/ell_0.75.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.74.bb
rename to meta/recipes-core/ell/ell_0.75.bb
index afacedac2ed..80a108a4b59 100644
--- a/meta/recipes-core/ell/ell_0.74.bb
+++ b/meta/recipes-core/ell/ell_0.75.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f1690913024f80fafff19ecf010accb58a56784d78937bae536c016b8276bb75"
+SRC_URI[sha256sum] = "10cee84ee075d9e0fc1c65fa1acdf7f6ffc2b3ed7e09622be9fc8f8979b02bd5"

