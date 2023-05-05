Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC41C7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.30243.1683300038409530588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5H5NRqO+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6439b410679so922814b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300037; x=1685892037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6oBSvu7Y6dr8ZZiAmepkdKB1jGJkgDtClc7uyLRjsc=;
        b=5H5NRqO+X0PIWePcdi+gCXaLLzSkDL1A/VxHO24yQLDe82d8u1oGZoPjSesmLX8djq
         /unVm/ZdrylE5+QACicx9pvEeqtm4HfuyM4bcrRhrwTiWyylYBy4FTGj7DvGxfsCtxhp
         wGGU7l0hENUDkI3+7rywJhIGzy+Cne9DVWOxW/DNow9gZiadpRh23zD5qXg3pIleVNT5
         akcAlwwX85xmiPTvVbgcGQ9i0KF6yEq0dPO8Q6FSuYYougy+Bc2Rh6c5SOhFg6CBwEuD
         +k0TUyBlWYqI0ACODduv9BiHo9n485YiWkYEcVeeWTtgLwNYMVI9KowX2zm2UKRgwBeG
         AUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300037; x=1685892037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6oBSvu7Y6dr8ZZiAmepkdKB1jGJkgDtClc7uyLRjsc=;
        b=YCNQ+WegUmEov0ed4MiQHjJQ/LZCotERKOrojcTQ7mziGlC4RBOGgtk+U1XwqqfqGr
         bFyIH/ksea2arj9gnTiNfoz1SzjJTsqMws3tNbNf4iezCoXnla1fo0Nak98fB5p+SZ+s
         zE0WlPCrkQ+e7LJDQwzoOOu2QuId1QGYLb719MRtcDMxs5gqLlZ+uifaEPnfKxZYq9Go
         Fn3B0405QX4g4J9D1gxJmMO7w/UGyJOb4PICn7lVl/X1Dyv0xQMbt0iCIUOCp5Zkzpua
         ZBfcWFUHzBx9SAxrRlzKEUSaNqnzkKsAZjRUINJ7rXgpy3ZpZi7jOR/OzKw8OXqBudeC
         tAUg==
X-Gm-Message-State: AC+VfDy0YwqokHaB6ZR4Ju5gvG+J4goT5Qs44hAirrGcLMVD7oVhUKlt
	wR5UQDYbeTVHjNK5uMc2Iomms2aQKFAAh7JJbFg=
X-Google-Smtp-Source: ACHHUZ7RGA2doBQzKHZXZixL66TLhkBXygQBwPdOx8lzxXBP7YQnxlG3M9T5umsm6pTZkHt+pzR1yQ==
X-Received: by 2002:a05:6a00:a8d:b0:641:24bb:bbb1 with SMTP id b13-20020a056a000a8d00b0064124bbbbb1mr3043416pfl.27.1683300037434;
        Fri, 05 May 2023 08:20:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/35] xserver-xorg: upgrade 21.1.7 -> 21.1.8
Date: Fri,  5 May 2023 05:19:31 -1000
Message-Id: <9d5a512da3b81680d20cf8c557757a31cd48efba.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180940

From: Wang Mingyu <wangmy@fujitsu.com>

This release contains the fix for CVE-2023-1393 in today's security
advisory: https://lists.x.org/archives/xorg-announce/2023-March/003374.html

Benno Schulenberg (1):
       xkbUtils: use existing symbol names instead of deleted deprecated ones

Olivier Fourdan (2):
       composite: Fix use-after-free of the COW
       xserver 21.1.8

git tag: xorg-server-21.1.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7b08dff8f46bcaa05f7fbffbe27d524579af4faf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.7.bb => xserver-xorg_21.1.8.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 212c7d39c2..19db7ea434 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742d6532e92795877bb"
+SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.34.1


