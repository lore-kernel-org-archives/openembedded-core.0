Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC70C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:14 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.197093.1673964553234064962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qi9p8psF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id bj3so29268433pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwPdcWd48vhnkojHsbr8xMXyw192hjsXFN+QmAwZV4s=;
        b=qi9p8psF/pmQbtxJ8D+IL57Xu41KXm12PkVhxUcQ4EiIiSVGx8yK6U8xuGDEKPsXHo
         BL/FiSDrsswJ/Sz5bBxM+x6SjFipBb9XgJ3rPKN8DKIBbcfY3mXjFAdgNJm8Gy7LfztF
         zdwEjwhpa98kusA8ylFc5nWAwzGAcvAox3fN0umNE6wo1r1hp4YWwyi6haRosbmFsxbT
         o0MTi9nFMjhivhDpS7tRoYunKjYrYNB5y57KJ+ZVYiZhqlcengQl1ogVUCRPpkgszF42
         i9G+7DAyAdBjHJBg/ThY+LDPH7h6tBX0lAjxOOlw1D+xOP6v9bkHf5twJzIcNlzfgB+D
         0iDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwPdcWd48vhnkojHsbr8xMXyw192hjsXFN+QmAwZV4s=;
        b=V/Lh41KN4K4WSa6Vwi9rI8/bF7HVhTB3IhcMiI1+3EOfp2XHukqzaFr0YXAFX+4rQe
         plgoyT7oINTOarAnLhS7JgwqSL/jky3Eh3VQn4HfLRRQYBR9r2PtBlVU5Nss6uZ+4Rle
         mENNCodop06LTVYKd7vZYH+ZjrnTHWVlw9RoxakjV1w2txHFUmBTK7W1ixQLkpBRrw4M
         LrzyT4Ur071lsyZ5yV1QQGE1jFn6H9kXfgo8Y69Q0qAXvg+U+kzZJ9ufXX9E8BXkoFBg
         DLGdrH5WWH7Dkpq6DKgJHt0+N8rXHw8ipIA+niHxqfg7zgysd8tgFNbZ44VEcZEkFUOf
         VnEg==
X-Gm-Message-State: AFqh2koxuLr2aSIwJvlfek/EuOhsUda27TJ8Uo9APKoMAXKCUHTXJkgA
	0406QAg+t/ZZX4AQPFk9bvR1Hcw76yEJSNhX094=
X-Google-Smtp-Source: AMrXdXv+uCoijZGUTuOFOsbtQBkpeXTExMJAYeDuckCJr7shnxhpIYI8LPo0FfTkc1vydYVsJVfstg==
X-Received: by 2002:a17:902:bb8f:b0:189:8ca1:e641 with SMTP id m15-20020a170902bb8f00b001898ca1e641mr3356507pls.60.1673964552268;
        Tue, 17 Jan 2023 06:09:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.09.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:09:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] gtk-icon-cache: Fix GTKIC_CMD if-else condition
Date: Tue, 17 Jan 2023 04:08:45 -1000
Message-Id: <34de16fd86775c0f2ede1670fec90217e4d11776.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176047

From: Daniel Gomez <daniel@qtec.com>

GTKIC_CMD variable gets the wrong assignation leading into a post
install script error. Fix if-else condition in GTKIC_CMD variable
to assign gtk4-update-icon-cache when GTKIC_VERSION is 4 but
gtk-update-icon-cache when is 3.

Also, rename gtk-update-icon-cache-3.0.0 to gtk-update-icon-cache-3.0
to match the gtk-update-icon-cache binary name deployed in
meta/recipes-gnome/gtk+/gtk+3.inc.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gtk-icon-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index 6808339b90..f999b891f3 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -3,7 +3,7 @@ FILES:${PN} += "${datadir}/icons/hicolor"
 GTKIC_VERSION ??= '3'
 
 GTKPN = "${@ 'gtk4' if d.getVar('GTKIC_VERSION') == '4' else 'gtk+3' }"
-GTKIC_CMD = "${@ 'gtk-update-icon-cache-3.0.0' if d.getVar('GTKIC_VERSION') == '4' else 'gtk4-update-icon-cache' }"
+GTKIC_CMD = "${@ 'gtk4-update-icon-cache' if d.getVar('GTKIC_VERSION') == '4' else 'gtk-update-icon-cache-3.0' }"
 
 #gtk+3/gtk4 require GTK3DISTROFEATURES, DEPENDS on it make all the
 #recipes inherit this class require GTK3DISTROFEATURES
-- 
2.25.1


