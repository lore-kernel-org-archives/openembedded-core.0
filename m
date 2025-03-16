Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA19BC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.31815.1742141583062227020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hG6fN3h2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso15234645e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141581; x=1742746381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m466y37cuNXJE/eUJt1K7CPVsFaRyZBIGy4lVaPOQ70=;
        b=hG6fN3h2l+ovBGu1yh/f0Df1vYkQDhblxVswd2+zXbCHBSrQTnTKfoMABco9Q7LEXH
         rc5n28DUzoACVImKCDNrc8voTjqgUzKQadrD0eGykEsLA1GCZ9ipnAP98dOOfLtU2KxA
         N0RVb6l/DX7Fe/MZgL+BhUBA/DNGL6zB7nU8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141581; x=1742746381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m466y37cuNXJE/eUJt1K7CPVsFaRyZBIGy4lVaPOQ70=;
        b=E+oEN3LtrmG8XWOdJcftSiOrDH9YBzEAB/S23uJiWKu6j8tannRcmn4HYRGhRH1lGb
         7vIqH+TIlw4MaR5ptW22cC2H2LEmBi82YPDCBcUS34soV74KvftfMtbZXFrGGZItavZT
         c/OzKcDJVRe1Aw1mhroWgLGmsmY+tdnlkv+mRYjruJYl/UtCOLV+KH2zWSdydm4U29SA
         LL2oDneGi4EgEbW+sEH9sWWRvLJYjIQE1lkHLtB2680UmwEB/fWxGo2fBf3Jp8zQyhYE
         7RYhHM40ynllXb0/45cOdtHxZpcfUsLhU6b44ODrfClZCyjxkhIfxBJuIM4pIb0wSsxa
         ANCw==
X-Gm-Message-State: AOJu0Yxl7DBSYkOlorNgTqkKJ0mYaKF3OPWZSAnlwjog2T+uqP/f/e/J
	5CDo3exmDjxcS9hplfXVkr8TiPq1P0lehlaEQ1O+ESUCEPjfcNZ0xYzcDC7PXmrRcmUvbx9MVi7
	n
X-Gm-Gg: ASbGncumGbx0wAZ9j0W6vWwyQdOBNKP1UimblQjbMM8ic2zV1bxr+gMIcizTzR6bRzU
	u8awoSjqEBXUpcpdLsUIGKhuGQTyRk+Qf4+Cdb+dVJ3vO14ENj24zriPezo8S53DGov4BtksvWg
	pd5ckWXa1+zhzIWvBBYK12ehDEbjnJR+0NCxczPV7CiklIiNEYoHbYotLIol1ZLv4pV172Hf25x
	XB0gvXGdU8mq4gzwa1l4LtUanPJIZl2x19+hBwlursmQGoY+e20krPUSLTBrcBgBcVdT3eyGKoa
	BldyGDKpHrNitm1mKAOt4J3bxhuWeCSZoFO7cDnGhFzaEOw+GctZ+tYZWiy2RbvDNuHNMSbgow=
	=
X-Google-Smtp-Source: AGHT+IHGJA0dPK9TYvLE5dNXeb0GdSKH7+jcIYutvtELHFZc4cO4SWhFuEKWT/QwKmc/P6JAEod8YQ==
X-Received: by 2002:a05:600c:3b0a:b0:43c:f969:13c2 with SMTP id 5b1f17b1804b1-43d1ece13a4mr97332035e9.28.1742141580923;
        Sun, 16 Mar 2025 09:13:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 34/43] wpebackend-fdo: upgrade 1.14.3 -> 1.16.0
Date: Sun, 16 Mar 2025 16:12:00 +0000
Message-ID: <20250316161209.3629986-34-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213037

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{wpebackend-fdo_1.14.3.bb => wpebackend-fdo_1.16.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.3.bb => wpebackend-fdo_1.16.0.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb
index c8cce5447bc..aa6c58d1766 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.3.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "10121842595a850291db3e82f3db0b9984df079022d386ce42c2b8508159dc6c"
+SRC_URI[sha256sum] = "beddf321232d5bd08106c179dbc600f8ce88eb3620b4a59a6329063b78f64635"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11

