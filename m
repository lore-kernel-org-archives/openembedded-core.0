Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA38CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:52:29 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12678.1790772743901543888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DVrDbZvo;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so3136042f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790772742; x=1791377542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wF4JWZKV8JEObjy0GFnfSKreB6wYm7kMc+VuKNi1EI8=;
        b=DVrDbZvo5uqSQ0LLoqcMGlj3s+40Q4k5vSEOk3ZddbO1VEGltpsQyVp6buSuzCiC6w
         FxQqydfUfKlUrh+Sk7DwIRpdJaXxdRjFVhFrJeyQkT3wK4L0uSZ2B629WOz911GiGZcy
         hn6qvlxahtIxGcNNAazjT9ua/xMHKLnbQCDOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772742; x=1791377542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wF4JWZKV8JEObjy0GFnfSKreB6wYm7kMc+VuKNi1EI8=;
        b=JNU0PCvv8DdyINw76Vmp2NPNW0sS2ESwFgNneoe7orFMHQO/1o6EvzuU83bkAu3MiP
         yzA8aZxQfSjEKm88VXHXalvmEOUA524VQjG8NkzaUsaoAHOpJfa68CWdaK38s1gAqjlu
         9CxjAqUKnww27KF57Pqg4Js0gr7BTjv+QIw2E0lmjna52LWVtuKAduTMTKxi1e8bOjni
         O9AdQE+H51yRknXGFvg47z4042jYc+Qo1nSsdKkUNe8hMHUzOZ79YDEIcDzS3RZZwyJR
         Wxz7o2rurGgtzM6EV8pD254jfMrDp8bhn6B0rY23uIjNKEqcYwLaXBqPMs+cggVFuy0l
         Nx/w==
X-Gm-Message-State: AFq9FYJORRDbihiolUxWPKzPjuSJb6JbHwqwDeFxbGGYzE4oo7RNVuYD
	KBT3efXtn+c/c2IYSsn/LQH65fxdihKtFjSX98p+mmTDXYEtOMAGALjHZLpUzbEhOwDCJ27re1w
	0tgxAcd0=
X-Gm-Gg: AYBFou19VWC5l0dzJogfW59hYfmeCtmrYio5AcuTG6B1KS8Zi/efO+UDrESRUYTcq3+
	0FErJH+uP1q+Dexa13ZDhxsZzemPn3rvsa9JSXDorZlBr4Xc2BbXqagfS8RXQL6x+FjiRTmafOZ
	aPhKrTaO9p3KK2d1Z9B5pEA/nRYiiLmmPBEaFZolIlLA+wGNsQ/oD/21+YrgA7QbnR2mKWsJFgW
	sAHx8vPl6suG3BE9z4dC9VbFYT2M0IAeheubg2AGudlzICIvpOfSDDwxVBRNfeiIGNbzUzBzwXX
	ZLExMwUhFR5hxWGADhCPE5YV9fMHfCto0teY+KekMjo/3ssRKB2R0yFu6Eygbk+8iHxhy/HRmYX
	HIQwaP0R2QN1IX+cDubylQo6O9jT2tEg7pXmBMV4Cp99n0Dn76+lrAHoMAhJE+Ny1abhBZm3rTy
	DNYWKrnysQn8JkxyvOh4glJ7UQP1w85OqHK7gpXGbjl5KzO/Q2ma0gIOQBldhI7nE3TvCeYbICQ
	nGghNKSXjapefeCeiaC/lmdl7M9XCT0HSUl
X-Received: by 2002:a05:6000:24c2:b0:487:221f:65b8 with SMTP id ffacd0b85a97d-48b025448b4mr3269414f8f.50.1790772741800;
        Wed, 30 Sep 2026 05:52:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:349:f135:e106:4c82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a018c0sm3204611f8f.30.2026.09.30.05.52.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:52:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] fribidi: upgrade 1.0.16 -> 1.0.17
Date: Wed, 30 Sep 2026 13:52:20 +0100
Message-ID: <20260930125220.798644-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246969

Changes:
 - Bumped version to 1.0.17
 - lib: resolve FSI base direction in one linear pass, not per-FSI rescan
 - ci: capture the real test-suite.log from distcheck's nested rebuild
 - lib: replace N0 bracket-pairing linked list with a flat sorted array
 - lib: pool-allocate FriBidiRun nodes in embedding-level resolution
 - fribidi_reorder_line: implement L2 reordering in linear time
 - test: include stdbool.h in test-reorder-nsm.c
 - meson: fix parallel build race for test-reorder-nsm
 - gen-unicode-version: fix MSVC link failure by avoiding strncasecmp
 - Fix fribidi_set_reorder_nsm()/fribidi_set_mirroring() not affecting
 - gen-arabic-shaping-tab: fix remaining -Wformat= mismatch on
 - gen-unicode-version: replace non-portable strcasestr with a portable
 - Define _FRIBIDI_TYPE_SENTINEL/_FRIBIDI_PAR_SENTINEL in both enum
 - gen-arabic-shaping-tab: fix -Wformat-overflow warning on GCC 14
 - Update Unicode character databases to v18.0.0
 - Fix quadratic behavior in N0 bracket pairing preceding-strong search
 - Fix out-of-bounds read on trailing '_'
 - fribidi-main: fix truncation of lines/output containing embedded
 - Pair brackets by canonical equivalence only, per UAX #9 BD16
 - Remove unused appveyor yaml file
 - github actions: Use current python version
 - Update old FSF address
 - Remove unnecessary custom prototypes for getenv and getopt
 - Remove unused travis file
 - github actions: Install help2man to fix ubuntu build
 - Update TODO - remove readme item
 - Don't require help2man unless building docs
 - Generate fribidi.1 man page
 - Fix typos in docs: "an string" -> "a string"
 - github actions: Update python version to 3.12
 - Update github actions versions
 - Add GNU Mailutils to USERS
 - Fix typo
 - Fix error handling for file operations
 - Fix stack buffer overflow when parsing equivalence
 - remove compiler flag "-ansi"
 - debug: don't pass a comma "," in a #define

License-Update: Whitespace/address changes only

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fribidi/{fribidi_1.0.16.bb => fribidi_1.0.17.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.16.bb => fribidi_1.0.17.bb} (80%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.16.bb b/meta/recipes-support/fribidi/fribidi_1.0.17.bb
similarity index 80%
rename from meta/recipes-support/fribidi/fribidi_1.0.16.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.17.bb
index 9f75446da28..427f6dd760c 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.16.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.17.bb
@@ -7,11 +7,11 @@ SECTION = "libs"
 HOMEPAGE = "http://fribidi.org/"
 BUGTRACKER = "https://github.com/fribidi/fribidi/issues"
 LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c"
+SRC_URI[sha256sum] = "6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2"
 
 inherit meson lib_package pkgconfig github-releases
 

