Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81B2C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:21 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.77629.1690740080512994117
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=l+Fe06Qc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-686f0d66652so3649006b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740079; x=1691344879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWskmQEzmyL1EnFWZtAfMxu3JVssCnAY3xpWfbOmTi0=;
        b=l+Fe06QcITTIMRMG+Vo4fuN6hDLMye9lXe9UUa6p22gEa6GRZcyjYPYDfYm+tJJgSU
         D4VBJcvUsjpkGYWa+h0ZYdeaM5Pp7dUJBFPPwTyP0eyVGUt0mLn7/igbVCtKLyB7doUX
         qkfX4fns/jK88J4moiDdw6/IXK+EsygyoPS0zSwCAjhdfzwNWTWRQD3HxLsSNgkcd4qJ
         dI16x6kVWX2ESWm4E+9CEHoroFHiNx4GCb9kDsQ5lL21tEhvLx5NeVUWEUiIB0wlB1so
         LYE96rzTCd5fRL4sXY+QVadAhmm+f4Ry7C4ap0sp7vGX7rHB6I/1eVwrpJftIfSQdxM1
         74Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740079; x=1691344879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWskmQEzmyL1EnFWZtAfMxu3JVssCnAY3xpWfbOmTi0=;
        b=IpoRaMNQapn0cKjg7/Ez1Js+ak9DKOgq2bxT7LpaPI6SZ/InhAiycRvRno41Es1Zbi
         Fk3G6E83azNgKsH7jdD7fd3GECB4HWaLGOa7KAGtGtaEIN42IqBRpXSbAyKIglhBpV8g
         MaUlx+KGkK7IkOql+hLfBN9GnJhyA0OguUZeo8aqyxs6TpW/OQOvRw5jYyaq9yHSmRyK
         GNyjvGDM3bxp91hdjnGQsB8nNbCG+DgcmB5GoxrJLy20UN4/ZC660H00nfgymppsEkjn
         s8EvMzJ78robYC+Ej+MKMHlPSreE3mnvt1DuRXKd+s+hLyubZGbQNE2+kR3MJwXoKkDo
         RTyQ==
X-Gm-Message-State: ABy/qLZZDnBtu7WdnpZJpwXDkYXe7xsEuULWWMGOKPLYbkDbOQ6n3NLv
	WePFbdBu25XEPfWJyr5cNpCEAkJjRkZ7/Q6NVLqr0w==
X-Google-Smtp-Source: APBJJlHkTqZkgVjkMwV8tVL7MYyWSi5tbsCklWihs27qxCl4He7tqcYtGN3xz49UYmw6UrUR5CZEnw==
X-Received: by 2002:a05:6a20:938c:b0:13a:6413:9004 with SMTP id x12-20020a056a20938c00b0013a64139004mr10647315pzh.43.1690740079664;
        Sun, 30 Jul 2023 11:01:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/30] libassuan: upgrade 2.5.5 -> 2.5.6
Date: Sun, 30 Jul 2023 08:00:34 -1000
Message-Id: <a905094c4e7ff3475de657adcf7a0afcc132191a.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185089

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fix logging of confidential data.  [rA0fc31770fa]
 * Fix memory wiping.  [T5977]
 * Fix macOS build problem.  [T5440,T5610]
 * Upgrade autoconf stuff.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90126be6dc32170c08eb90223b6a6cc06c2133ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libassuan/{libassuan_2.5.5.bb => libassuan_2.5.6.bb} (93%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.5.5.bb b/meta/recipes-support/libassuan/libassuan_2.5.6.bb
similarity index 93%
rename from meta/recipes-support/libassuan/libassuan_2.5.5.bb
rename to meta/recipes-support/libassuan/libassuan_2.5.6.bb
index 2bab3ac955..7e899e7399 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.5.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
            file://libassuan-add-pkgconfig-support.patch \
           "
 
-SRC_URI[sha256sum] = "8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4"
+SRC_URI[sha256sum] = "e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.34.1


