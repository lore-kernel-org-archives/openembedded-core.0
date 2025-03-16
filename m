Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B827C35FF6
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.31716.1742141556706145457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B1FYPFZ9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-391211ea598so1942250f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141554; x=1742746354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8eYPC1YdjvHAu2dyurOoGZVCAPl/AXh1vVqR+HQdtM=;
        b=B1FYPFZ9h48YuhVixbXSTLjTPOuejnIKEP8zf/rCHQFDNJcwqzSsZbqIsd9mfqQzC7
         blozM9H3zzHhH0Utmv0jwKPc8EtvZIvn6reAi0WlWxggjUFWSUrlMHCyPhGx+r29Eae8
         c1OIcsZHUpiL1XpKJZOoHGfzLI7ixl+Nfhb4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141554; x=1742746354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8eYPC1YdjvHAu2dyurOoGZVCAPl/AXh1vVqR+HQdtM=;
        b=P5oLDn1YMXmsAV6m7pv3xze4nHBHEb9Au4pwp6WGrJJmWF7+lUsiYslD1epQtms/sL
         diZ/d+LftJ3xxkCUqd61Gs0x50RBw3GIjYU5SrX8vLHTmdFY5TolYmbgnZewQO6ACb4j
         dyrEAQx/m6zId8jW+1P1UXJHDZVjcfUGHPBIQxKHwOnkrYUeMAWHTm1cImFHVfvchRYC
         a6EGnSThCl7KQX6nNiefoguTUYu7Q8mQm0SAO13p9Ry15W7D88f1OCvPm4lvue9RzBVb
         5fNbJdhZl7Wd8y8ouuEtGIlEGgTUFu+ekCmCVlIVkMDP5WiVXPjU2txVtM+nocUEPkom
         rHZg==
X-Gm-Message-State: AOJu0YwxztuZQ8DGitSH5pHBIajozE/eHFzCOrsN5DY/l726wlEix+0t
	bIOWD1v6UcIPeM6XplOrLFgemQam53cqIiyHfcrydxbR4IJ291txwLkyT2uIUAB3NHJGsogDuq8
	f
X-Gm-Gg: ASbGncvIACix5i6D7d1W6mDpRZ5ARkqzHYWOYnrJvwFroxQCl7GUoVEHX9Uu9gLXrF2
	Qhrwho9gSVHdMxqgpN1u4nX7lm8i/zuxnUsg0iqYxN800+7mAZudzpxNWoD516aBA5vD/eB7hAo
	lx4jHgp7lq0WZlAaXxNDGBA/WsO73qDbwH0Xyntr28Oo2CF8Ds/0UkjT19GHCsa8rxnB6YX/lJJ
	fqS0n39UpkBI4juPbl490zOjT9iyVPfFCrtBbKmGr6BFo7kWMHNnGimEDPn3OxUnWEdxJw0AfQ7
	YCTWXqq+jDgrV934+vxDZ1RNadjKK9unAmbhXDK8z+sEn8nJkSs3sor2E5DFKZiTn+xPx5pAeQ=
	=
X-Google-Smtp-Source: AGHT+IG6JSFarPB4RnscaYjD1uoYhF7Ovee5DmAt9G1KKGrdL370q+xxAh9ejGWSwzDnbgsUssUqgQ==
X-Received: by 2002:adf:b319:0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-3971fadd9c2mr8648374f8f.32.1742141554228;
        Sun, 16 Mar 2025 09:12:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/43] pkgconf: upgrade 2.3.0 -> 2.4.3
Date: Sun, 16 Mar 2025 16:11:43 +0000
Message-ID: <20250316161209.3629986-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213020

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pkgconf/{pkgconf_2.3.0.bb => pkgconf_2.4.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.3.0.bb => pkgconf_2.4.3.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
index c95ab748382..9695e37bbd0 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.4.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b"
+SRC_URI[sha256sum] = "51203d99ed573fa7344bf07ca626f10c7cc094e0846ac4aa0023bd0c83c25a41"
 
 inherit autotools
 

