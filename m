Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4F3C3DA5D
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 18:03:49 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.1599.1721585022740939163
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 11:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b6j674AT;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-389ccd2f0abso13971805ab.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721585022; x=1722189822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnN7/eGg665l8jF6d5Ce3N4RncLf7ZlzRJhMnmX9r8U=;
        b=b6j674ATdME3UWiDEZSz5ehII7jHw+FU760cfeWknBQiISV5IXTTaMCyOzdOKKJk38
         woZ+TIgOhDmq3wjKSRIu3cySP4DkMcMxOmjFruldYGDM9fKX7iJCt6uY23/9qLIOL4Ci
         GdmtgCWnBvnxbzlafR3mmy7ENsWtQylBPm0Bhkb3sGhEC5mLGRCDzO0kpddBytMhkSnp
         86wHehAvko3SybaiIyW7+kR9dfAY0v9vieLd1LmY3X23MBTDnz/9POQFJD4kO550Oq6W
         Z2ZdmYTSsE6OaRz/wIAp5FAq73qzLyARxoZeWfHCEcSSMbvDS1QUuEClvEIyUmUBleEI
         xUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721585022; x=1722189822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnN7/eGg665l8jF6d5Ce3N4RncLf7ZlzRJhMnmX9r8U=;
        b=ggEiYC6o4fqE3raZL+YURls9tZ2ZQyI560fIZL1Hx4pD2MlIxe0wof+rtY+KlHKPj7
         P/G3lCXwfCVkHQ6lcC2NJioGydJV4ONV4lNSEiIF4XMWr2oixTAg3iUhh8xyx5YqdJwp
         GkFBuS2E8nqCcqdDURLYSDGRg7xVLrQZWkRNbLgTPy51ydwSE1x9+i5y8wGw3a44TXmI
         RYN23P05SBid3Ro5CY9mwEPO07QdviFmPni0rM/7u7OUrjS4E5Ldzxk6tuKd6ZeyxK5M
         pYiZU4D2M6+s5L6/GElNTxUU3fdn6GGUR1iamhC4MGoEJOSuWkaPnv++uhW4FiBQfLC2
         vf+Q==
X-Gm-Message-State: AOJu0Yw1Adlt+OJCbTMfcppjNGdgINndSZu1tKo5274R2a7NjI9rR/UH
	bohd5KlYvyD/vZS2nmPGImPYbzwsfz6Yrcu/YkyZcTpWIUH7IdfsHBlvUvRv
X-Google-Smtp-Source: AGHT+IG6fvJalKMlewaQVxwrj49CAGYF0C0XnkI9uYsOdfp+Yc4ZTKsQGB79X9UfNDXXoI4Aw8Yp5w==
X-Received: by 2002:a05:6e02:1c23:b0:376:1c71:1e1d with SMTP id e9e14a558f8ab-398e537cfd5mr78528525ab.12.1721585021707;
        Sun, 21 Jul 2024 11:03:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d142246b0sm2155803b3a.14.2024.07.21.11.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 11:03:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFT][PATCH 2/2] glibc: Remove redundant configure option --disable-werror
Date: Sun, 21 Jul 2024 11:03:36 -0700
Message-ID: <20240721180336.2642270-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240721180336.2642270-1-raj.khem@gmail.com>
References: <20240721180336.2642270-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 18:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202299

This is applied unconditionally few lines above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.40.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.40.bb b/meta/recipes-core/glibc/glibc_2.40.bb
index 86f9fb927e7..71b89ac9ffb 100644
--- a/meta/recipes-core/glibc/glibc_2.40.bb
+++ b/meta/recipes-core/glibc/glibc_2.40.bb
@@ -79,7 +79,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --with-default-link \
                 --disable-werror \
                 --enable-fortify-source \
-                ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 

