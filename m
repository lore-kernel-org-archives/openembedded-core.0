Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E76BC7EE37
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.27600.1677860259281506072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=s2YdaG5y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so6633297pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zr2RDf6eBegaQnve+uHA/0F54eR6z7WAVuSvjIKSA8w=;
        b=s2YdaG5ybz3we4C0DySNQCWmTYEHrqdlBG8ryPkdG0qSCfEBKbZUbjfJwD9KN5QuiI
         WoPKfllfta1t+JtIsPsnL8Vs884L0a/9E9aJztimpdWV9cGwM1WxsiUnne3KygatnfnN
         gQ7+K6Ng7y5/ei0evgBbz+WX24aCfa3NVgUSjHNN8H9gQHE+CV/kNXMXCi27V6x7cRk1
         T4kwB4I5dwNKfyq7bCKKO7En+S8OH+Pfv6SWkJqmjRdClyUfgtQHa806PRLWQokudVAx
         giA0yXiRlgtnV8wVGEz0MRzvAG/kgaHqMAKzY2kw+vELyrn0XChNk5Ewl5hWBi/L17ao
         q6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr2RDf6eBegaQnve+uHA/0F54eR6z7WAVuSvjIKSA8w=;
        b=SjrHkZPGQOeUbC5rYKHZI1cow+syA0/rEuxaKvRIL8pF36FO4DVEdJm2T7vl8Eo6az
         j7mZp4Qtew41eJOgTrlKNKJxquu87vaiJfiry8fb4ysW1R5wOTx4AYzfur0ORhpgg4jT
         PpTVDr+wQRNDF6S8WSB+OMZtZP1CAraL5flNCDhC5f8h1eTiUkRQoszNqF5Tg6jAT1Df
         on1sDLU2J/C4EkcYhTIBlEZxj68ZkeD4h5zJLzbYiePitHpZN4Iv7mMgla8ddh1wCGp6
         ccfwKgWmA60KrUCxFsXZXgjTycFKwUAkCOn0Q37dSG2/LgE8sI7QS9nduCg7wJ3BbJwU
         Rzaw==
X-Gm-Message-State: AO0yUKVLD8RPrM8nSwUmCYYnMoEc+XO1AM7B9/gIGYCNIHkohc8awIb/
	eFJTlclHovN4+SC4ZpnZDDcVzWFvUHhn6a6xefg=
X-Google-Smtp-Source: AK7set+DSkDsP7wyzWiEpakr2mX+0y9/yn9EnND8QdWYjIau55FsHscw2GtjiWonjBX/sS21GIofzA==
X-Received: by 2002:a17:902:ea94:b0:19e:7879:f084 with SMTP id x20-20020a170902ea9400b0019e7879f084mr2330682plb.40.1677860283576;
        Fri, 03 Mar 2023 08:18:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/29] busybox: Fix depmod patch
Date: Fri,  3 Mar 2023 06:17:16 -1000
Message-Id: <03e437782b1b295334a95cea8678fc425cafe9d3.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178007

From: Saul Wold <Saul.Wold@windriver.com>

The original patch was actually allowing .debug modules
though which was in-correct. This change blocks the
parsing of .debug modules (which is correct). As noted in
[YOCTO #15022] this should address the empty modules.dep
when using the BusyBox depmod.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 339c3c3abe8d405cfe7b3f34db9b3547bcaaf878)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/0001-depmod-Ignore-.debug-directories.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
index 354f83a4a5..d76118f85b 100644
--- a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
+++ b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
@@ -21,7 +21,7 @@ index bb42bbe..aa5a2de 100644
  	/* Arbitrary. Was sb->st_size, but that breaks .gz etc */
  	size_t len = (64*1024*1024 - 4096);
  
-+	if (strstr(fname, ".debug") == NULL)
++	if (strstr(fname, ".debug") != NULL)
 +		return TRUE;
 +
  	if (strrstr(fname, ".ko") == NULL)
-- 
2.34.1


