Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FE0EE4996
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 19:13:30 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.2910.1692386008249872900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 12:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=UYVupaTt;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-410450b3f55so8504611cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692386007; x=1692990807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HaQw6jtBgIE7oeQV429hIfq+teafcOUcLmKlucAm+M=;
        b=UYVupaTt6+l7WtFAztZbTp/3MKQKo9ZBMfXUT25mChmbUCeVY2FJEWL+uApX1VEQBs
         h3ztuom/otS3bwhbdRDPnp1wT+qsRzwPvGx5nEEP/GvNO+/liFyA5xgTNTE2b67od4Ie
         ELWg/Rc+s5qSPQ+Kh8EdGvd5LeHo3qowdxk75KtbkYgSlCg/zwWK4CssGlMCzmP38Eum
         tmkyGec7QT3ClgWTquZu/wklhG9j1PAV0MAsxce0qrxax7ftuyGP9zy7wKZAna8qU0Fq
         rRgcuSeXpD9CxMHVYYjXwXh2Pwjztu3RZQLC9GIfvbzpdfaBOjd7Mu43M0hbWMPKHdUH
         QkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692386007; x=1692990807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HaQw6jtBgIE7oeQV429hIfq+teafcOUcLmKlucAm+M=;
        b=dnqJLXK6l9lygl3m0SCjVKkKgBFxFmjzzI9kRsxBAzd8pq6AYfmPzc8pBks7nUeNh1
         mvnLThVnxtSHL1gfnl5uQwBpwHWI9s37bu5ccp3jl7i1hNsfNCD3dLGcjBG1T+cqWDte
         OMNAD0OC1r/zasVw9M749aD/ctejKSp80A1/040UHMBXqShZcjBOifm8baSK4CNUh2VV
         Ci6Q2SXDcNpDhd8DHtsAgpUk1dUPZp7lJfDgl45+jNzh2iFo5XKU9SiKo1IY1mrMZ71i
         VcKXnYFXfFeP4JWG311l6RH8lkJuAQ5149EnwB+fziELTIo2xJF8VJpUlC9CuVDhIesd
         a8sQ==
X-Gm-Message-State: AOJu0Yw0mDFSK9LsGXvnT5MMtNddRXZ4+CW178VyLpaabmXNXuJr55yL
	4XV3vMykT6qd71wmdln8Qxz8TBkiANmez6XIg+s=
X-Google-Smtp-Source: AGHT+IFxPDTU3FgvyX/Sj51tD3oUacCyCgEVqSiW1Ujz7VLPoBQ+762tszr+HWQ8Hb0zW4/Nm9XvVw==
X-Received: by 2002:ac8:5c16:0:b0:410:684:c3cf with SMTP id i22-20020ac85c16000000b004100684c3cfmr161822qti.11.1692386007293;
        Fri, 18 Aug 2023 12:13:27 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id cx18-20020a05620a51d200b0076cb0ed2d7asm720732qkb.24.2023.08.18.12.13.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:13:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/5] python3-pygments: upgrade 2.15.1 -> 2.16.1
Date: Fri, 18 Aug 2023 15:13:22 -0400
Message-ID: <20230818191324.1959527-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818191324.1959527-1-tgamblin@baylibre.com>
References: <20230818191324.1959527-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 19:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186395

Changelog: https://github.com/pygments/pygments/blob/master/CHANGES

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pygments_2.15.1.bb => python3-pygments_2.16.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.15.1.bb => python3-pygments_2.16.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.15.1.bb b/meta/recipes-devtools/python/python3-pygments_2.16.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.15.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.16.1.bb
index e0e477100e..240d01d0df 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.16.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_setuptools_build_meta
-SRC_URI[sha256sum] = "8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c"
+SRC_URI[sha256sum] = "1daff0494820c69bc8941e407aa20f577374ee88364ee10a98fdbe0aece96e29"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.41.0


