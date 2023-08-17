Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD595C41513
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:02:47 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.2217.1692298965733736679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=JLHyqeym;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-649edb3a3d6so930066d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692298964; x=1692903764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feyYW0fyAYJLUhY2q8sh8KR0XdKIxXsmPi7sQy0Mw6Q=;
        b=JLHyqeymoXOci9wZaJQwePkPizzj5Nh7qld9yFNKsnLsdW3Me5q/ng1WZVG4ZeLhnD
         VSPLx5wY7pSqRCv84qyVyNk2aMegk5NZTFACLWT59fg+9Fiub0aAD9efh4ytnhzCZAPb
         eznSlD54UMxytsdLH3CrmoCsptJa7rrfq4w0rEaP+GIhIxJO2MfiY1uA95+vpfzgbxdY
         TxZJgQStxnDauijSDT0ANOLEaFNj4iieTbZmALalTnGB7CL57FkV+eI7KZ03+Szc/GXx
         c3TCCgmQNNiwh8ND5BDDZPGiSfe7ENPNG97s3cnl8Gv1/6SGnM+UAUzEjcPPejbgNRrp
         EUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298964; x=1692903764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feyYW0fyAYJLUhY2q8sh8KR0XdKIxXsmPi7sQy0Mw6Q=;
        b=FBORcJ3tlvKDJrdY3JjMuURaY+rO0mZTlgXtjiqR0etwe26WbwfAeM/0UCX3M1yVQs
         fyltR9GlsLvld/5XZR5eyp8vPrh/xs/lYmLyzFRroPCkBiw+dFJPJPZFTqvfcUYKUilO
         ht1NuXrIbFBjEBCP2clDuULTEd4meuyO12UvcVqUdIwOomZZ5oplHUVjH9y2GlGQ0nv4
         8VUCTMh5rKpQqkGzu5ZRe24LtHkQWVIwNJ+b/ycFsd6srDhejJwqIjdggPtu+PTYQrKO
         loa/hrqSazLNBe1+u7WgrioTM1TwkEBgsmyVIA8l1+Z4maL5BTaTPItEfz68nIbCbA+L
         wHWQ==
X-Gm-Message-State: AOJu0Yz7/FD/sFGzzBMakCq9FxmZrzXUmxCIjrFkna7Le7cQLafn7qXY
	o3AkApO4eEpMOMxoxDJg0B0GI46BYcqyEbB3qxE=
X-Google-Smtp-Source: AGHT+IEfBvzKLiN/FynrvNcXV7QE5V/+88iCzFpD8O4gEYQpgrlqVXBxQl97tXKI67WWDnZsHRlgRQ==
X-Received: by 2002:a0c:f312:0:b0:62d:f04b:b51 with SMTP id j18-20020a0cf312000000b0062df04b0b51mr351099qvl.29.1692298964675;
        Thu, 17 Aug 2023 12:02:44 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k17-20020a0cf291000000b0063d47a29e6fsm80998qvl.55.2023.08.17.12.02.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:02:44 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/5] python3-numpy: upgrade 1.25.1 -> 1.25.2
Date: Thu, 17 Aug 2023 15:02:39 -0400
Message-ID: <20230817190241.2302457-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817190241.2302457-1-tgamblin@baylibre.com>
References: <20230817190241.2302457-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186336

Changelog: https://github.com/numpy/numpy/releases/tag/v1.25.2

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_1.25.1.bb => python3-numpy_1.25.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.25.1.bb => python3-numpy_1.25.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.25.1.bb b/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.25.1.bb
rename to meta/recipes-devtools/python/python3-numpy_1.25.2.bb
index 3632ab71ee..0c6c0a3287 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.25.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9a3a9f3a61480cc086117b426a8bd86869c213fc4072e606f01c4e4b66eb92bf"
+SRC_URI[sha256sum] = "fd608e19c8d7c55021dffd43bfe5492fab8cc105cc8986f813f8c3c048b38760"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.41.0


