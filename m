Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE71FCA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:05:40 +0000 (UTC)
Received: from mail-ed2-f42.google.com (mail-ed2-f42.google.com [74.125.228.106])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11818.1790863170100103909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 06:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=o1KCXI5R;
 spf=pass (domain: amarulasolutions.com, ip: 74.125.228.106, mailfrom: jennifer.chukwu@amarulasolutions.com)
Received: by mail-ed2-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae7aa02cb6so1233024a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790863168; x=1791467968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVP230thZe1y5UXnTUm/zuXBJlwV3T1FWW45cAD4yrs=;
        b=o1KCXI5RSxtysiBjzPEdJ83LJqoZAwq9cO4Ep9Takuy1GUUMrwzdhrEBEN4ZSRlIPu
         rJ22d18VL7rkkSPhL5pEX5cLZLlKeCq3O4RORXTblSJcDLeHe4kuYgJb1OPudN1W4xLT
         xepCTxhJ1EseqsO1te1l7IxAW94Is7GUxzsTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863168; x=1791467968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVP230thZe1y5UXnTUm/zuXBJlwV3T1FWW45cAD4yrs=;
        b=s2JOIcfWJdjjihTKeT4l+xMD6by5gZCJX8lUgqzWPZIvkW5Xelxdu/IX2aPBedHS+j
         EzRCLmiZk9ZUbcBbLZdsJSJBoi2/VVtBOagypomlAfJtwNnr5RAs/M6A4YAscZidGjqH
         Su4tcFFg44E7zPIBKes3yldcfQnkxaBvv4nVoJJAgZYkahUddVlKCzJIwT9QmdnK3247
         pbxmUFJHz89bqcpfcbWnl5ICI0aeWn02/lRrD4frH3yHiHfKXl6uBTT/h65yGX49YqIx
         +t3tuD8r4JS/VmUNR0LGGgCBlQelK/1dsHUwuhYzQq+Xy6YAXPQcoaEfNYbwab4+JaEh
         dX3Q==
X-Gm-Message-State: AFq9FYJ0yAsXBQlKgNNFzk2P5yGU/eMVVGrTV9LucN+6K3V86FBqbkQm
	+1hJ9w7iKq+ffAsRn0sfFORkXQ6TEJVJO0E9K6IQeyZ0cQdEE8c32xLOjeI/nAvrC2JrqPXJLUP
	646xk6Y0=
X-Gm-Gg: AYBFou1L7ZFXjl4F1d45f2aY4vAc3xvmab04H77PgdRf3TB/W5z2yGHAmKi6DdW3OBX
	JlTqCN2nPEtBveK2LK0Eqkab9PhW3Ato9LfCPWPY8Niq6wmmtQNiIsM0Om5fxod7Qfxre2yMOOF
	GXsSdzgVZAde5uK6hK4a84j0aX2MeLMJvL7gHN8fr6aTxtVDzzEhclqolNZjx7OyfeoZXtP163W
	NkvueT/cKfk4NDyJRiR/Oo9lmsyZ/clFWwCOQYrRdg+gY8jxeRnCee/krTB7k2LXPRE+v1pFHUg
	KQSYfCPqgCDm1r4ieKxjLxKZPLy7UFSatgyZs8uMyNqqX26vYIfdRmNYKCHR+BM6jCbJtjLQYca
	Q9kUTsAqgcFvlXvxs1X8NIh8Ujc2HHduE79QHIPlaNUricrk/mZ22q6klEws5xKuyR/uebhdkCj
	gOavBGtvomAiz6JYeUT9Igc7eOLYW2X60dbge5I4mIv1JgXzQjN1PTSpVPEG14pU68lvGYTYYLg
	gnFrJqE1VwyBLvZuMXzCeZH0RGSeVapUE47lDvG7/swR8vIIaOd
X-Received: by 2002:a05:600c:3e1b:b0:4a0:159b:d2a9 with SMTP id 5b1f17b1804b1-4a01b126300mr79316205e9.24.1790862693479;
        Thu, 01 Oct 2026 06:51:33 -0700 (PDT)
Received: from jennifer-chukwu.amarulasolutions.com ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98224csm59026125e9.3.2026.10.01.06.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:51:32 -0700 (PDT)
From: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
Subject: [PATCH] harfbuzz: upgrade 14.5.0 -> 14.5.1
Date: Thu,  1 Oct 2026 15:50:51 +0200
Message-ID: <20261001135051.3423293-1-jennifer.chukwu@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 14:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247036

Overview of changes leading to 14.5.1
- Map the `fonupa` (Uralic Phonetic Alphabet) BCP 47 variant to the `UPPH`
  OpenType language system tag.
- Produce smaller `cmap` subtables and drop no-op variation device tables when
  subsetting.
- Fix possible deadlock in `hb_font_destroy()` after `hb_ft_font_set_funcs()`,
  a regression from 14.5.0.
- Fix signed integer overflows when scaling glyph extents and applying
  synthetic slant and emboldening.
- Fix float-to-int overflow in `VARC` component axis coordinates with
  malformed fonts.
- Fix a memory leak in the experimental WebAssembly shaper when shaping with
  features.
- Fix accumulator overflows in the experimental raster library when rendering
  glyphs with very many overlapping edges.
- Fix heap buffer overflow in the experimental GPU library with malicious
  `COLR` fonts.
- Various build and CI fixes.

Signed-off-by: Jennifer Chukwu <jennifer.chukwu@amarulasolutions.com>
---
 .../harfbuzz/{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
index 438aa23133..d10f1bfa01 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9"
+SRC_URI[sha256sum] = "7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.43.0


