Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9605C19F53
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.263.1714512264829138598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yTJ3z5sY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ed32341906so5725268b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512264; x=1715117064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VLAQUpH9L8Ke2adEQZ9FUvsb8OfXGb9hpegiM0CtA8=;
        b=yTJ3z5sYhauo9OSxGLhcAEqaeHrqa5objwEhN5m6ci/pq9EsPY4DuUOHwTRSEchIIt
         lqB56S2r0CZPMOfACMPmObf0apJt6Mi9KNq4n6R60xeQRpJegniYT/MgXDIZ1L94u2c4
         x9C1sQHGMaOuFBLdvgJkjtpa2LLXo0bb0talXFzX8+d95guJ683d8UpqfeRVKxIgxVXh
         Uk5Ey4V64doONbjnSQ3+8Y5XGU+o8LT/yIzMhYTt/gCtOBOZRjvIuuqLc+xTrNiCbQC7
         Zs9Zg3rNR7feuv7IMW3OSBHB/92WYKL0cWvwYgsl77G6M04noxyUfGwDYTNznWUmvcrV
         sXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512264; x=1715117064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VLAQUpH9L8Ke2adEQZ9FUvsb8OfXGb9hpegiM0CtA8=;
        b=o4+FB0bhIpLifqmx1xm3pmIxJrOL1i4cdU9Pa9Hl3bq44R296dA+uWeA9se3T1ldwL
         ZpL6eEjx2ZjKLeiBOCa2qFEdeUxQEpG+e//de1jjESiErXBfnS1g1Ko7H5po/VAfgFZN
         DW9Bdb2ZsaOnG1Ly74NyxrKbXiiMoQlUMeYkfsQPiBXSwll+hPQ3DDo7vuNNawrVsWp4
         Wa3Ju5WYNcN1N3ROZhzlDjkvQrbghwy7Zv310FM8yM59H54tj4SBrIeymiYHAa+iVrEs
         R1Yk7iM8EHyaivACCQj58orgUy2PEkbEJ/pxjXT7b197Dgvp3seNWu/2X5C3f0LgL53q
         +qFQ==
X-Gm-Message-State: AOJu0Yzdt/orP03i54pDr0znl+2C2cb4cbPq7CoRSBpy3fUzBop7ywRq
	NK+kWYKHgOoX1kwUNPVBrTFgAYvn/P0XMjtUtI2txghiK/c4IX+jmiSnTiQDAUAViB+CF42XkTk
	kcdo=
X-Google-Smtp-Source: AGHT+IFgsh5WNO62zuBu2Aj3PTvSn3T3ooWLAvmXxac/JTUTx3+/P67fpHDw2hlFATQWX0xTNfy7OQ==
X-Received: by 2002:a05:6a21:1518:b0:1a7:78d2:a142 with SMTP id nq24-20020a056a21151800b001a778d2a142mr1358490pzb.38.1714512264109;
        Tue, 30 Apr 2024 14:24:24 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/17] pango: upgrade 1.52.0 -> 1.52.1
Date: Tue, 30 Apr 2024 14:23:52 -0700
Message-Id: <5bc3dfa37fe2a94e1ceba364ab5af3ca8e89efd2.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198771

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix hexbox drawing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5a296e6c3afb412ee9740fc28963f35dd16e52d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-graphics/pango/{pango_1.52.0.bb => pango_1.52.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.52.0.bb => pango_1.52.1.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.52.0.bb b/meta/recipes-graphics/pango/pango_1.52.1.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.52.0.bb
rename to meta/recipes-graphics/pango/pango_1.52.1.bb
index 7505ff9279..a67c3791a2 100644
--- a/meta/recipes-graphics/pango/pango_1.52.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.52.1.bb
@@ -23,7 +23,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "1ec8518879c3f43224499f08e8ecbbdf4a5d302ed6cd3853b4fa949f82b89a9b"
+SRC_URI[archive.sha256sum] = "58728a0a2d86f60761208df9493033d18ecb2497abac80ee1a274ad0c6e55f0f"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.34.1


