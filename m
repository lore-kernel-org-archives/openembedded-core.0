Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6BEC0219C
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.92636.1738600895282827065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WWSVS2YR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso32033475e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600893; x=1739205693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DXIWB3yR/nOksML2SljDj0BJ2fG8Da98vpkZ40mjiU=;
        b=WWSVS2YRIzFKHoTrnHRksf1qaAES2NiFGg5ucv9L0xCKE0Pi6LzalZEv9Dw8raGpnr
         yfBqXgVhBe3FbFZvUd48absdvdUp0dO6e1EM16qVHzPhG58hM8ve1VA31UNzQIY2fP5y
         w/Z2tAt1Sjy68kksm/kyRnEdXFBMMqVVpyi7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600893; x=1739205693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DXIWB3yR/nOksML2SljDj0BJ2fG8Da98vpkZ40mjiU=;
        b=qOEUCxFoCYEUNCHXUoIq7gsdFecoxwFr9+8Uqtw6Sg8JKiuzjFP6OQzkITxM7nJDQ2
         vpPbC6cVoR0U4qeQmklsiv/nZ8pJl05EAFgur7Qk5qLsVApdJur0nP3HQ+0PCQFjXzt+
         Zzj0Aw3HGprn2EAYfOAs0qAesYqx6H/n6MVYKpSPKlAqvVH/nWzCjjAamJhZgBoEHNkZ
         wmyrD82bsH9A+dHDhd3GEAQ1rqd2hfBIESs9iIIKXTBm8fTtEl6+P28WpNINm/Uogo1O
         QRLbiDoEWw/t/JKko4sjj/0ds7poxXN4jDvQJkv8Jw/mOqpNOKV7Km6YTwRyFXsNsbY4
         MYKg==
X-Gm-Message-State: AOJu0YyGusQcU9W8NTIgeTbgTGrUmhsqrYH7sWWf7V4zDb5RSnTUwUJY
	EMeJhllg0oKZqdlw0Pzrui6WUfqM5YyR4NkJQhpreUjEu8SdQF2vJYLrisHwM0tzNfpF0Ojl6lN
	+
X-Gm-Gg: ASbGnctrbqOMPrqd5n4rdInLohQx5oftxpBcVm6WAshBpGslqzj4quEWEgJUjWx4UFJ
	r/wcfLHKx4fWpCiHFGHbSHg7K3uOQBqlR+v24SZulSjBK/IjhOHuvq8XVToNhqv+oevg+a8Qg/5
	DWYmOUyeFBgVwib5//4/KHQJYTF5jOGqRPDlaOHaLAzcR/uu0UJExZuXDejFbWvaDX3lIIqMvnI
	p4M7y64W7lmkJxhSAmM0PLyzbCF1Qum7kEiLGknEQ1Jl7OVkgjmajhjGS6gVesj/d0advMNLfR4
	Hy6dLeU1pvjQ4jLP0vZavR8O6YBZA6NxDeU00ydA3U3b
X-Google-Smtp-Source: AGHT+IGwfn9YKC6zwEg/i6v4UUg60wYIkEyNZmEPVhGa22pLANQTzzeXzvb1I4PfYROdhzggHBfbeA==
X-Received: by 2002:a5d:6da7:0:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38c520a3857mr18355678f8f.36.1738600893361;
        Mon, 03 Feb 2025 08:41:33 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/46] diffoscope: upgrade 284 -> 287
Date: Mon,  3 Feb 2025 16:40:47 +0000
Message-ID: <20250203164130.3403325-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210676

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_284.bb => diffoscope_287.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_284.bb => diffoscope_287.bb} (95%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_284.bb b/meta/recipes-support/diffoscope/diffoscope_287.bb
similarity index 95%
rename from meta/recipes-support/diffoscope/diffoscope_284.bb
rename to meta/recipes-support/diffoscope/diffoscope_287.bb
index 77717d42385..8f8f114054f 100644
--- a/meta/recipes-support/diffoscope/diffoscope_284.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_287.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c672e97ce3e69c229858419e8d368563bb583101a9cfc5eb70e28d441502b1b7"
+SRC_URI[sha256sum] = "51702676957edb4c16ad93bcfc25bfdbcdb0c39fa7d1d16f657db71cfaa58ceb"
 
 RDEPENDS:${PN} += "\
         binutils \

