Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E37D5C0DE
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14507.1731077653682140720
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GIN5LqO7;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so1525619f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077652; x=1731682452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEEG1lHmFUjSiNqypF5I9B4Ny4w8S2iV6wC6SZPybEM=;
        b=GIN5LqO7Vsit1d4ZgHkd28IRXkuyOYkiuaEpxCfAOkCxHfCxBcGdUA0lRb0bmpJw7V
         Mm6sEWhN0leDgnPaNkc61rp7PpoELCSiJ5lN+snKYrLVYCTe380s74cDzDVrtEfUIfR3
         m5B/TKb67zUvjZqj9rkCW8NDWeFcgZ/57qQ66hpHbx7JLKL8yYRbNq27BAp+JL8OmCA4
         kDLhJX+fJo3lY27F0SdGr6GgAvIufUxNStVBWAjGhFQwdL07BGInX01azd/0DRsGDad6
         FPtJVYiE1nxU/slyyi+9MsVYDyJeA6EC7StLZ+HNuF7LsfekXlz6OD2skh2ojXx4/iX7
         W1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077652; x=1731682452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEEG1lHmFUjSiNqypF5I9B4Ny4w8S2iV6wC6SZPybEM=;
        b=YeUndYGWPTJmc5BRrANAZ/G08jJ1Bu9mvs8PCpBFddkWAlAyNaEY3gTp9xcYcUKI+R
         J8VbPapzwYSFkMBTedkS6VcM71Iz5aVyZxHbnTiAOjrkHGH3nkCTbjcOOONfkILxTioy
         yCZ7aFjqbT3RvoOI1EVh6HwVC5A/ElgjyatZZgY11ZqCi/Zy1yO3JW5jiiInmNMin1Hx
         F+GSw1zxO6gF8if6k3jxviNQW/S8MKkHgmgqWK+po055kyadUh0tbkUBfWCdk/bL/7R3
         BveZlL7Be9LzhhID4r0Lu8IGBBLIcmSRY5H0MLS4FDyY9X687yV43qxv2w8scOKTgcsJ
         VY+w==
X-Gm-Message-State: AOJu0YwTaEOR+YEPGHQrmK+LP/rO+io2z1PYJAg+facogFcboFfAgyc+
	dWtfRAjD29cTYnFaMAPFAx5BvAnRenTW9NN6KHp0ftShANxDsu0/J/+/Rg==
X-Google-Smtp-Source: AGHT+IH6RoJU0Sl/OYlhWmlFpIYfgSgZngq7S34uUbNDnOUGTJI/k2xf/fjwHe3xAnBok9+whf7BVQ==
X-Received: by 2002:a05:6000:18af:b0:37c:d11e:949 with SMTP id ffacd0b85a97d-381f1834506mr2758238f8f.28.1731077651974;
        Fri, 08 Nov 2024 06:54:11 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0530599sm74510605e9.1.2024.11.08.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 08/12] pseudo: Update to pull in fchmodat fix
Date: Fri,  8 Nov 2024 15:53:32 +0100
Message-ID: <20241108145336.224466-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206882

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is needed to work with coreutils 9.5.

Also contains some README tweaks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ad7067a08f..5a7ccb5761 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "516a0a3c4b46f046895d27bfa019d685fe462dfa"
+SRCREV = "0d292df61aeb886ae8ca33d9edc3b6d0ff5c0f0f"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


