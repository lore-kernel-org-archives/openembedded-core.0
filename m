Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA42CCFA0A
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 16:42:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.11981.1693396455876732035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 04:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=P2TmCbP1;
 spf=pass (domain: baylibre.com, ip: 209.85.221.42, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31aeedbb264so4962466f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1693396454; x=1694001254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NoGfij0wr6QQ+TCDhq/2pkDEbAVbO1D6ONtC/BatuQ=;
        b=P2TmCbP15HYswPrDESWApGUAaPYFEI+ogV9TYqR64tI5ccXXpXHCPn7UW1RJeAT7Fl
         vKrlsb36uucljKLYSjBQjIYE+PSNyKd9UciukJJP/Nc3Iu6LX09I4PS7HZWnmYwNF5yK
         CftzAQCnGI0bt4hsMuHpV0LdpSzOw0yS9PIUXNqVSbCDrbua5HbYvzyw4LulwaVv0JrA
         S3EYVKW9anT9nCi4k8JlJl1Ivh3zGJBTFtZpfnqo+TSs3/Z6cH/Qle7TIjYqBTSjx7yD
         eruw8cp1XnIr+yF05VGZRlbBK9aZyhF+WQ4WlGLwZM2N/VzENqcjdqSZZpGztfRA/t39
         dshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693396454; x=1694001254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NoGfij0wr6QQ+TCDhq/2pkDEbAVbO1D6ONtC/BatuQ=;
        b=f1cDqZfPaQxVdBcDANmuf9bT9GFdHtjYvQUwYRHGzcjxTZ/ZFaYTZSJLSTQAPmkeMh
         f6bbQqPeSXyFB+9FEc8ZP25prf0/GXLkTZyRMY1nJnaYhFd8G26KGWPZamlMpq0Qj+ha
         4ahteju0ij7J+5nMzajPjAT4syPFJ3CHdkwFqnwJlPT3J7puTVpqBHJfpwc04N4jFvDj
         DeWqEpeXl0sb6x0BS5HQ9e7vIHkr4Ud6eJV6OSOdtddMuuQujm+t3Tp+Imrg46vD+fjk
         n8Ji1yoxnsDEkAFGKasnVyF8Wt4nRVoMc7dYQy9Sppo433fwIkxo13Igz6bZmVsVlnJb
         v1VA==
X-Gm-Message-State: AOJu0Yzwx+j6zSaLh/kM0H5CJbpnzZZQpT2u996iRbZ8kzyuU/g8+Ed0
	StafkjYvRU4vNz3Box8TYPGVhGvY3z+AjPDaBtMNPA==
X-Google-Smtp-Source: AGHT+IEcJdlEDMOIewHwZgPplDy3qDOPzhTPd32YeFmgm22U7DlTSy7sQTjt9SOI/SuYiRgGM2UKqA==
X-Received: by 2002:adf:ef05:0:b0:317:6992:855c with SMTP id e5-20020adfef05000000b003176992855cmr1426450wro.19.1693396454039;
        Wed, 30 Aug 2023 04:54:14 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d508e000000b0031ad2f9269dsm16414492wrt.40.2023.08.30.04.54.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 04:54:13 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] update_mandb: Point to correct /etc/passwd with man
Date: Wed, 30 Aug 2023 11:54:04 +0000
Message-Id: <20230830115404.2016313-1-pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 16:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187441

[YOCTO #15023]

In this instance (do_populate_sdk with api-documentation turned on),
pseudo is going to end up finding the passwd/groups files in
recipe-sysroot-native which is incorrect and does not have man. The 
solution here should be to ensure that pseudo points to the passwd/groups 
files in recipe-sysroot (which does have man:man).

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 scripts/postinst-intercepts/update_mandb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-intercepts/update_mandb
index a061bb426a6..6bc073bfff5 100644
--- a/scripts/postinst-intercepts/update_mandb
+++ b/scripts/postinst-intercepts/update_mandb
@@ -13,4 +13,4 @@ PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --config-file $C
 
 rm -f $CONFIG
 
-chown -R man:man $D${localstatedir}/cache/man/
+PSEUDO_PASSWD=$D chown -R man:man $D${localstatedir}/cache/man/
-- 
2.34.1


