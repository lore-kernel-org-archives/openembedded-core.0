Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76502CD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9492.1777739427104836732
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VTVoBFWt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe62837baso1456695f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739425; x=1778344225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ejw1F9Ex3Ir3Rh9PSuqKvrC+JvjzldLFCklLOm71Ht0=;
        b=VTVoBFWt0PT4AA6xVHXiT/DdWmD+XT2TkROX8z6Vm2YPYmJ08e0ydF9uC30+vp0vWD
         8dyQouB+d0PGShZMQqNGuu3lRYYGh4w/rde0FkNvlbtkQvbzANLFoWQ80i3d9+BAMzWH
         M386iPLRb+GIqWqw41qUz10VGINmnS5ke4FbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739425; x=1778344225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ejw1F9Ex3Ir3Rh9PSuqKvrC+JvjzldLFCklLOm71Ht0=;
        b=YgejRwPnx2LUOIsi3kdtZ3GDJm/jySgCvvZEa5a50/tIvUBEYHxHUz29N9LmW2CCHE
         +Wmd0mDjIxTESmLkZnmWNxFhMv2RaKYyvLFXWfOyixeKPvbv2OnAnqyxxiFaXsT2i8t0
         XcYATDulIwWlwy6qT0tPcmzq9mchkntYTAZfXtsE48ewuVSf8+vNf5oZalJSFNdTprbt
         inStPjqa1Uyw/lz9s8FodJNGAqR3C8gIa8ihDQ4YdZ4LysF96xYlUDEuFwS4zbZHOZwO
         K8xOMbVV2AlqZg9BIVdQr/a2M4NmAhTViAqSgTUaK3NR8ra9AC1uARXVwCxtdNgba5Xy
         oe7g==
X-Gm-Message-State: AOJu0YzJrC8dMvlXhkUy7l56lKhKFoAZNZJEnOOeVg1Ev3voJ8oQvwhS
	mJQfaqeuSbgkPKcaClFhjtAxlpn7Bk6ujJ1VZD1yVRSBt8qov6SB0jxqckhYD0vFJGtso85ZwCS
	0+g4ym/0AfNLU9ekvE70y5HmlBiZMGAipOmLmg5ZaY1yd83ivbnJ6MSkZxONmdBS3bdPTgHrCqT
	czgUxGdpcUvbzin38=
X-Gm-Gg: AeBDiet/9M/uZ4KgHHeXXNTZZupqLg1czw7iiQF5rRWV+djh37HgrQa9qcGVXEcqePb
	vuSd+xGr15UTzNBRO9LmLQq3uLjLnpZ5e+xJbwkJ1jIIPmmjHbJFmFJxWmskTB9zoUmuvK0MWr3
	K4gDlVhEKz6R63LVqncQ7FKnShiayWIR7Ti0LmN8myZwAkLIB1odXHyvgI1TqXxJJalI+J9hpqH
	0I28q0Ny5zztYbs5mjK+6eVQu15JZmc7stBbfh2aMUzx9WAzqkDEtogDEQgu/qmNAgWrK+Xt66T
	reHXXZIVP1gFqYCZYYeRxOk5WGhDZkBPXwR1mdq9gen2Hqs5PE8Yq+xt6ifIl40O2FPKBNAHCld
	YY59l22H2R2D/+Mkvn1qUbJ6kjbZyB/aM6Hjtj4AUBkHopbYvMVuGTsieKnQMTkKcV75ORAfypV
	ijL3LcXyIFsrfiS+Bfg26i/+bsneCwWyGZqwdsTWij5vp1KjSJ21eY0WkWyUvZyGY=
X-Received: by 2002:a05:6000:1a8b:b0:441:36b7:7262 with SMTP id ffacd0b85a97d-44bb4af936cmr5709804f8f.13.1777739424878;
        Sat, 02 May 2026 09:30:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/62] mpg123: upgrade 1.33.4 -> 1.33.5
Date: Sat,  2 May 2026 17:28:48 +0100
Message-ID: <20260502162929.1377831-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236337

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mpg123/{mpg123_1.33.4.bb => mpg123_1.33.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.4.bb => mpg123_1.33.5.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
index dd5f8a53f5a..f8c08ad1f89 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3ae8c9ff80a97bfc0e22e89fbcd74687eca4fc1db315b12607f27f01cb5a47d9"
+SRC_URI[sha256sum] = "0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 

