Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8105BC41513
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:38 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.15497.1691071477987379560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=caOpSH9h;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-686f090310dso912104b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071477; x=1691676277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOa7PDJ3FLLFj5CqJb7EZ2kH1HjlXGrArLuMP1Ci5/g=;
        b=caOpSH9hoeH+DFa3kPBBOx3lCmpL0R8H70Xd1V7t74ZTKCi59gGIzCANPhr46T2TWz
         2ov/mVvpbPDWJOzQoSrieYDNO3y0uUC55sQNB30zKqgLQNGbIRhBerDmm9/2XdFurt7w
         zlbiLakKHDl3VSkYXbSVNGj0Mf2NuLW0KW4WNMBB/VxG4OP+7ZGa5LV8PzpkhjxT0pUZ
         K5kG1e+yS9x+cgcVBlS1J+iVY45eOfwUILi7Y0UQtmNx6KSQz4jwBNp7Poj+rooojNG3
         KhzXpXO5pqj0FzJgynQ7NybaE9x4NyowClvJShq4ABnkyPGnql61LXS/WCx4xJ3su47j
         YAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071477; x=1691676277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOa7PDJ3FLLFj5CqJb7EZ2kH1HjlXGrArLuMP1Ci5/g=;
        b=Nuw1tqiey1zD7P86PHs47G0n5W99GObzpAk1rQR/I+C+RZbKq47yh+9rCGUdVzmd7b
         G0Mg7Q6Rn/yhB/ZrtY/7VSrdkRJFPG15+iapZ98kE/kQVm3JujSH/qwm9yt25GNWii7K
         a5+Ux3Mew4RVY1PSLM0a9zKaryzxq+JGplOiggvadmTQ2wZkHZZoV3gvecvcqY4XCwJ4
         tib3Q3rRkF8FrKtONaGJ9iE47LNqA8BVttpsFY0YfA3ojL17y97lBnoKRLf4gA42nNO9
         IjwQuB43P0JjLJy+tpXBItWwg8/Pp+CzVPoepbFtdJH9Xcp0612IjaOW7Q++ZcYAuJaO
         gKFg==
X-Gm-Message-State: ABy/qLZfkVcseFTBrMEl4gtVwCcsjBPxIfBgXarRLFM3lGX3puPOByQg
	dNcz8CDKaC7hOc/qAOFLhuvsSKY7RZ28aR9Kozc=
X-Google-Smtp-Source: APBJJlGBLqvwT0vlzjK8ejspHyRI7ryW1WIKBp9jpd84BA9fo3vMOETJ8u5LfjiJ4wC7ucgTFMX0Ig==
X-Received: by 2002:a05:6a00:1484:b0:66c:a45:f00b with SMTP id v4-20020a056a00148400b0066c0a45f00bmr23089790pfu.23.1691071476980;
        Thu, 03 Aug 2023 07:04:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] cve-update-nvd2-native: always pass str for json.loads()
Date: Thu,  3 Aug 2023 04:04:12 -1000
Message-Id: <e67d659847afe648de1b1eca2d19c4f6375dd12c.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185487

From: Yuta Hayama <hayama@lineo.co.jp>

Currently json.loads() accepts one of the types str, bytes, or bytearray
as an argument, but bytes and bytearrays have only been allowed since
python 3.6. The version of Python3 provided by default on Ubuntu 16.04
and Debian 9.x is 3.5, so make raw_data type str to work correctly on
these build hosts.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 2f7dad7e82..67d76f75dd 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -136,7 +136,7 @@ def nvd_request_next(url, api_key, args):
 
             if (r.headers['content-encoding'] == 'gzip'):
                 buf = r.read()
-                raw_data = gzip.decompress(buf)
+                raw_data = gzip.decompress(buf).decode("utf-8")
             else:
                 raw_data = r.read().decode("utf-8")
 
-- 
2.34.1


