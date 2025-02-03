Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A548C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.92317.1738600931239905787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X/rhe/JW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e06af753so2309004f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600929; x=1739205729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbGYusvgKBvuYBOUc9PV4DmIOpCZBVsMkpk1h0q45G8=;
        b=X/rhe/JW4TF28R+yshIq0REDq+7+//6z6b/br2WKKn5OOhQGw4mdqUsAKzUoEo7GYE
         //JHuNA2D78XlH8a68Dw9unMgTAw40YQ+kmrXoU5pY7u0k380/ES8/ycFAy22Mwgquop
         TPEknryXAL95vyE8MbIwB+7U/KZTXQua/NybY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600929; x=1739205729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbGYusvgKBvuYBOUc9PV4DmIOpCZBVsMkpk1h0q45G8=;
        b=vL9QJSRSf3PfNTn8ahBVxxpKx/HqasZjK4VXfG9T+HdWRrJgAPXSQiXhr0u028eprM
         noOKoQGtrkpqPTjbZB5jizAKHw4yJEDiIKTJx3yGqGU7E8I8g7qAPkUaPRBUDcJipavd
         JTE6trJIiWMfwiJvez9rebag0e65wFkD+EPSzwkb4ralZh6nslI5bROBWYucbh2b79mT
         B/Tg8bReXQkKPo2CyAif441CXZqkhkno9cqV+3kxzTccZuKoVaa4ON4/Lrhxe9ttYflP
         mnDwZDU/13czk8Jny/pP4pme4glj8jl80MBZPiQ4+cymnwPLk5QUocxPlaBrQ0KcjvL6
         hhIw==
X-Gm-Message-State: AOJu0YzrgazXlhXumCFI2yaeBNQ0bLswWiWq+J3bg8OGvr4HNZCnQvpp
	6CuJjnd/zjxg9YX/qyQ1Nbk7VnFJmeygcPlRnQTtvoh9zshxEictfM3z5/0PmoHGGSsIsYkDHh3
	y
X-Gm-Gg: ASbGncs2EU4jzvPeliHwdXNqKtZ8hBSRHLF8wcPhkECgyw8Zk7bOZmRCjvk47q51+sN
	oTmvG3XwONeNvELs6WgIYTS/9VWzKJQ3cHPdBSnvuIW1drYmx6JhWM9l6wDN3y0+rEYPdJao/9x
	jufALJiVnBsiPJ5TkHa8inAEvp7ZoeIfuh51MSjyWN56w6T0nQdn4uOzlI3t1lCRbYU4/OmoCMq
	g0c+ppnKNgSc44HvyV/EZQ+c6LEbr04IKQfQwaI65UxZZTztUK0Heny51ZYj6DZzOHn7dJetkAO
	ZMdZsU1VkignnKW24tb4KBA0HOoUvkZi4h8dEUEyoRSb
X-Google-Smtp-Source: AGHT+IFQkkY5P+MDawVSx01zXd8JtcQIz3/PzUjWmWPuDJQZryWs5V3Wo6zjirbAHUR1am77+3YeUg==
X-Received: by 2002:a05:6000:2ac:b0:38c:5cd0:ecd4 with SMTP id ffacd0b85a97d-38c5cd0f0f5mr13843189f8f.6.1738600929213;
        Mon, 03 Feb 2025 08:42:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 36/46] python3-pytz: upgrade 2024.2 -> 2025.1
Date: Mon,  3 Feb 2025 16:41:20 +0000
Message-ID: <20250203164130.3403325-36-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210709

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pytz_2024.2.bb => python3-pytz_2025.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2024.2.bb => python3-pytz_2025.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2024.2.bb b/meta/recipes-devtools/python/python3-pytz_2025.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2024.2.bb
rename to meta/recipes-devtools/python/python3-pytz_2025.1.bb
index a379e192348..6d1861fbd56 100644
--- a/meta/recipes-devtools/python/python3-pytz_2024.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2025.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "2aa355083c50a0f93fa581709deac0c9ad65cca8a9e9beac660adcbd493c798a"
+SRC_URI[sha256sum] = "c2db42be2a2518b28e65f9207c4d05e6ff547d1efa4086469ef855e4ab70178e"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \

