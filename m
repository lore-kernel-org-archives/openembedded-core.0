Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8070CD4F46
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:30 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.62257.1725485610198562417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Y4CdAQ85;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d885019558so21046a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485609; x=1726090409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3o9d2xg1j6dMKTl0Y6Ehna25C4Op3K0piSPQbx9cOI=;
        b=Y4CdAQ85MIgkdC+LVcLweAbiq9xZAjIvMqgXdAXWt+ace6mEMpwcMpMHsXOq6+oEWQ
         dJeqppPaUjDKxth48bK3V6bnWunKUWo4Ps+I282CNli2Y0eu22UPbhCKRy/4T6iocCT2
         F6GejcPfAQQp2clSsyUinpJneheUVAUL5J1zkgPmb2q+SX9JrivDyJ8RiK7h7udNJKBo
         d41OWVan1an9ZOC6Rm0af5C8jsxwMJbU1HOcwyj7N0Nh4IPt7o+ghW7y21LuucdX7VXw
         +yH/0yl+ulmhXLGO/Im2fyipYaAjj8MN2z2V/Dmt0MlMPAeLc8AGxIhv0lGCu6KemZWj
         K4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485609; x=1726090409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3o9d2xg1j6dMKTl0Y6Ehna25C4Op3K0piSPQbx9cOI=;
        b=plV9vRpVT3BuylthJRsKeuBn5w/BwDJ/45TfB3MqeQ9fVUbnasTaUF4gTxO+Yy67X6
         0XALqZbMf2CeJ+VwrQpqx+ykiuCY01gEXjel1UXPSOf1Z3vhnakegIGpwlSTuOfbPBZI
         I4ky8YTUJejYpmDuxXtfU70xFGVeXTT7Mk0jFTxulukC7Pq6Ud0lNjkF9VZCNlQAbNrQ
         JPZSPdEmqyPzSVxbUxXfb50tj1pruyjjtmJLAGaS3iAtQCYlg06n5G5cDP/U9z/VQGEw
         LdAibj1jmEqhN+B1/DlS7fhPFAjJjbn5+RH/zsS9bbt0mvtGDU7bu8YHW9UYhH3Tl/wd
         YsCg==
X-Gm-Message-State: AOJu0YyWpk0pSam0MGUXhDzp6dzGNY7dLvWdKdILw6J4rS1iNYQb6pkH
	pjtRZDPI6BSjzHnmwcXeyzj8GQBCkyHWmnnhfyCuH4Qk8cO63lPPl1k5dVJsbYLMGPUWNh94CeO
	wMgY=
X-Google-Smtp-Source: AGHT+IEULdzAnBhR1E+I9PKriPHGQiQW8wN5/j0iaMWlR0QS5IUkwb9eMtT4Lsb5YvvmB43MBdCj8g==
X-Received: by 2002:a17:90b:611:b0:2d8:8d62:a0b with SMTP id 98e67ed59e1d1-2d893a9c666mr15829996a91.23.1725485609001;
        Wed, 04 Sep 2024 14:33:29 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/14] mc: fix source URL
Date: Wed,  4 Sep 2024 14:32:55 -0700
Message-Id: <7e11701698a9f38a5e3e0499c0c2edd98d32a85d.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204226

From: Benjamin Szőke <egyszeregy@freemail.hu>

new URL for sources: http://ftp.midnight-commander.org/

Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03c4052718a9b8392b25e1770630317b8cf29fbe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mc/mc_4.8.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.31.bb b/meta/recipes-extended/mc/mc_4.8.31.bb
index 69c32887a2..5f8257f71f 100644
--- a/meta/recipes-extended/mc/mc_4.8.31.bb
+++ b/meta/recipes-extended/mc/mc_4.8.31.bb
@@ -8,7 +8,7 @@ DEPENDS = "ncurses glib-2.0 util-linux file-replacement-native"
 RDEPENDS:${PN} = "ncurses-terminfo-base"
 RRECOMMENDS:${PN} = "ncurses-terminfo"
 
-SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
 SRC_URI[sha256sum] = "f42f4114ed42f6cf9995f1d896fa6c797ccb36dac57760dda8dd9f78ac462841"
-- 
2.34.1


