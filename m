Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FA1C2BA15
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.9674.1718288444799021978
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dtaxknjB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f480624d10so9417645ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288444; x=1718893244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kc2aRj56NOKWYLKnmAwzJ6XY3CYGAzhMC9pO1ImqvE=;
        b=dtaxknjBnwKMX+T3Zp53tEuZVFgnTiO2b7LOxZYFKxOix2cmw5o2pSyF/N0i0Sjydi
         KHoxYmzCbF3cYuliuPKp0TE7irGSMdMYqZCGTa7kOvy5LQAFJW3z8Dv5tbE//h5kpdQ6
         ICotS10N4ffRnJBhGvWLDXurHAEJcgGgFUnrbJbPpt9XGFKQBAQzkY+PuEAZ31idl8C9
         R3c9NG/jF54NjYnyDzQQixL91m1Qlij7LG2ETzGJclh25ikwOXikehwAd3NAxbzdnI7U
         +usTnHAYrigS9dxmaUS/2rWcexoZ00bvz/7OrlLDeztc0/zDcIB60YrfeJcM8ZBamk5M
         gQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288444; x=1718893244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kc2aRj56NOKWYLKnmAwzJ6XY3CYGAzhMC9pO1ImqvE=;
        b=G/Iz2fyzB4nKCjRFcInNTJHcjiIbyjQtWMnyirosNxwUvfbSiCvB29ZaQqQGXkAHGq
         nFMk0vNhUylcZGi5yK42vJ/Kk1QboleO+PsYzlAFTYDgxLwuUQDffW8/4pvmDp1N+oL8
         oDkWTvkSOS3wcwiOo2SSlatymN0xzjGleoQy8Qd9MKxK3ZGB88uRf+pwZ6aTJRb+JYxZ
         8wARFwyjtwE5crjPqW+OGFt12lFCxGGb042AfXP210mmVj8sMJpZ4bZd4lfaP6zJjX63
         M1WRT6thV7SsEmrQBB0vJaMLA9K1OUkZ9dgng9/gkF4mkHe2RXokr9WuN3fofN5nD6ii
         jsZw==
X-Gm-Message-State: AOJu0YweqeLDkXPJXmSB2F2aaJWWv8RjXq+oaCEInZbFxr8pyVuWbJ1E
	i5XEzrps2Z2tMv8wl0eZQ2aCOcbhlj46LZuzgbe92NdUesKOUQpl3BKanOvuyypRkmsoPu5fbi+
	Z
X-Google-Smtp-Source: AGHT+IHtqqedhH657rJJJWTcVbymGMAtFy3ygBVGHAljIeApZcgq03vBWLstjMUU059DMza08eHlig==
X-Received: by 2002:a17:902:64c9:b0:1f6:62cd:2c8e with SMTP id d9443c01a7336-1f83b74b8fbmr42757615ad.58.1718288444076;
        Thu, 13 Jun 2024 07:20:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/29] taglib: upgrade 2.0 -> 2.0.1
Date: Thu, 13 Jun 2024 07:20:08 -0700
Message-Id: <0f4f4bc352589c475afcc16a4e375cd6fc4726e6.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200606

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix aborting when _GLIBCXX_ASSERTIONS are enabled.
* Fall back to utf8cpp header detection in the case that its CMake
  configuration is removed.
* Improve compatibility with the SWIG interface compiler.
* Build system fixes for testing without bindings, Emscripten and Illumos.
* C bindings: Fix setting UTF-8 encoded property values.
* Windows: Fix opening long paths.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3438bd2698dff19722123d7b2b5674ba40107eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/taglib/{taglib_2.0.bb => taglib_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_2.0.bb => taglib_2.0.1.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_2.0.bb b/meta/recipes-support/taglib/taglib_2.0.1.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_2.0.bb
rename to meta/recipes-support/taglib/taglib_2.0.1.bb
index 4bf9be15ae..14f99aabbc 100644
--- a/meta/recipes-support/taglib/taglib_2.0.bb
+++ b/meta/recipes-support/taglib/taglib_2.0.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib utfcpp"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "e36ea877a6370810b97d84cf8f72b1e4ed205149ab3ac8232d44c850f38a2859"
+SRC_URI[sha256sum] = "08c0a27b96aa5c4e23060fe0b6f93102ee9091a9385257b9d0ddcf467de0d925"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.34.1


