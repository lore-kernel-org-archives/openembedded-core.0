Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C630EC0219E
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.92681.1738600933714794237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P7Uxmm0Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361815b96cso31971415e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600932; x=1739205732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7vwFOTe00TV0f4fQO4JIaGjOulBtkKBfgoDqYtJfPc=;
        b=P7Uxmm0YWhBdY6Sls0f0G3QGfWh3gqQ6mZv2+WTKkgM2rrHNvn3sVxEbU/dfTnQJLL
         wJnOgGZ+YjbTuQ8jVHRLudX+NW2aW5T+hB6bQBWFqko0ptOa94RNpTb/uBcc10sfsOAH
         qkcibNK/DR8noAxiLfx3MragqKg9u311XA1wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600932; x=1739205732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7vwFOTe00TV0f4fQO4JIaGjOulBtkKBfgoDqYtJfPc=;
        b=D0Y6UY/gt9tswXMXAF1LUmWOtmhmlzRcwKQWnvUo9CfI/hVSm281fWG46ACYKK657l
         x9PbiitoT83Pi+B1Oc6YlEkAMrpvVPsCEc84/iCC1qMYD4/TcLUYbc7/JXkdILMLLCBx
         lqIBLAQsjzeXkMtbPnbqe4JxBmLbxWnQt0gpqf/JqXOX8dnatXzP+79dfSoQ1Qirn/2e
         th1Qr0E4nUYsnBXxUXUNtcZeIkQhIMnpWq5vwexooxC9Kt+EV6m6bmYBv+qv0ZCJPw4U
         HdZJiH9ZCeK/nfn84NNsb8CxE63qbEfntw0LnVWxnoQWs2ehBEMD2XJMWnJa5dJWaPeD
         VcQg==
X-Gm-Message-State: AOJu0YxHssu597syiiUUFanPTMVAYEHuHjpRt8h2LBGJbLs2EjqjC5le
	Hi3bp2rwtH9OD5Dws9mEl2KYwy7UsHACNVhwMNxS2BAkI6a3L1vM3HryAaruRHlIfJrYIMukc48
	j
X-Gm-Gg: ASbGnculz0GAJTc/dszz4ArEaqlBV+AgLGhck5AXll3O2u+eb3si9abB8DrqyZRL4EQ
	+Lu1F7fc/ORvNBFikzj3CCdiSTq0JPvEJJbE16cT7+t0e8wDgB8y29tYjkQI8OImW704NITfKdR
	P33gHNclZzgSWGEwNk58D6Odk2p8erZaUrf9EJiLFMT7vA3K0RhtA8ti9ECvoiafD+khSHgttQ6
	WRS4j+uKuaTP7q9brfoV+VLbYykr7UuC5+h1t9kw9xylcvn8sPH6wveu/99m7igud4G1RCHYGea
	XkRkh4gKWcq62Fg77bL0L1t87zv4ZWhA0ruNncvqiqsB
X-Google-Smtp-Source: AGHT+IG9BBoc83w9LIs78c9xsPfK/TVM3mJJxg/nj57hStiREkvJJjpZ7WeyAVAne7t5Np+IGTaQDQ==
X-Received: by 2002:a05:600c:468e:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-438dc3a81ecmr203449925e9.2.1738600931692;
        Mon, 03 Feb 2025 08:42:11 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 38/46] python3-ruamel-yaml: upgrade 0.18.9 -> 0.18.10
Date: Mon,  3 Feb 2025 16:41:22 +0000
Message-ID: <20250203164130.3403325-38-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210711

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...on3-ruamel-yaml_0.18.9.bb => python3-ruamel-yaml_0.18.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.9.bb => python3-ruamel-yaml_0.18.10.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
index efc07169f77..02b04e3c0c2 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.9.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.10.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "59d0f8b10c658bd55ecd107e334d4117d766a2b9cc8f5176afcdadcff6f84a5e"
+SRC_URI[sha256sum] = "20c86ab29ac2153f80a428e1254a8adf686d3383df04490514ca3b79a362db58"
 
 RDEPENDS:${PN} += "\
     python3-shell \

