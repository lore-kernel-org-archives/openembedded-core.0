Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D389CFC980C
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38618.1774823885071846036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=we8WYtOY;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfa33a983so387150f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823883; x=1775428683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Z5P92f/WBPWltkhEdKSyzPt4B8v/iLjxe5CiaZdZIQ=;
        b=we8WYtOYxepLLgLXg3O4/PkolY/mu5R37hmfia3Z6pjgW5l4l238F5qEKDixTCpHZu
         IwqL2+RG52rkAKgnEJLT+ySrzJCX7WEAhFFDmo5PPSpSvQSKsOczcUgrFZQ1yL+MhoA8
         wcku6ofRKtgPsupCsOI+yk79VCLLgwiI46rxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823883; x=1775428683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Z5P92f/WBPWltkhEdKSyzPt4B8v/iLjxe5CiaZdZIQ=;
        b=TncKcJH8VzlLLRzDYNNfchBduPfcWfCkbVLyjU2noe4ODTvjX33c10Ux0SpxV8jKGn
         Y5N/27janUYigCtAI+0rPdaTevndKfxUFWPDtSTvWf07zbO4Om2OYOTg4TgYfoOfKvaB
         RBjxf4SxDbuWHq6Zr+fpm+/fcCK/RsDl23hT6fO9jiX4HNrNq4urOGvvpA2UcHzPXDrl
         PPluFhmmRqSclTUs8xAKNhe1sQ5IIvJLtjt6VVjIct5SHYpT8Z8Os8bzbUZlbbuaEXuF
         iOyjwbLml/B5i8WfmebUJc5tdGR4ZWCGuyMevHrAlBas0Uu3XWttq0HA3vLsB5NgjP8R
         VUXw==
X-Gm-Message-State: AOJu0YxATmoDDUfOHvXsx0QHfvvKD2tf+TLTkIr9WK848RbZjC1tv+RB
	3pku80uwQkEHZPZR5TLcBp56q4aZKMcm/S9ujyXpDYMD9nml+KiAH9F8XixBooqOj3SfxL9+pvB
	d7EQ0wI8=
X-Gm-Gg: ATEYQzwT8hVsq59htqZxJCiWMYyxaP7niXLYMrtS1oFzGb32OQo9NLUrNWgRIuuXZRu
	rJViMgXXTq7yqKkdlfwMIOF9ME9uvwvxSE+Z0/sf9zMysq5qE0axHxMa502x8vVkbYKbB9AFXsk
	4Uo2n0Yp7fRnIcvEqYQ9Nfryz2g+xDPburrya7oIVyE4iLyQNsP0ngUfVUnWxYQ3SWAtwutIyzE
	lU/weXQ0gAQlhQ5xY54qxMlwOqjDAvSPHxcVL7cTIpta03+NB1TDIbmsUFPdMmSiiosb62GyZCT
	qRhh8ZiQ8s/XUsbYKvaRHjQ0sF3CZm0lKd8UTCOCV4qV4Ib+13Ljt6Va/hCg7DD45lFWArdecFS
	L3PG/OR6Mdgo4x/yuog07RVK3wXx95YCIO2wA506Z5kf/TEBe9tMcXvS/ynGZimVG3+pY8eEfkg
	/Gkpueo5eWkM+wth7Igf4F3IXg1mY+BJaU2Rue3lJVvRhi60iVkGAclLQEDv7XPwuaMA2cPoqY7
	8uOv0hcrml5tkDf4DiuuPU3HIA=
X-Received: by 2002:a05:6000:240f:b0:43c:f687:a39b with SMTP id ffacd0b85a97d-43cf687a433mr8665804f8f.48.1774823883280;
        Sun, 29 Mar 2026 15:38:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/16] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Mon, 30 Mar 2026 00:37:33 +0200
Message-ID: <7255b0ff315367abb5f0c6f00974bf30f7861d1b.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234159

From: Paul Barker <paul@pbarker.dev>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f21bedf4fc5..35f22d5a15a 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

