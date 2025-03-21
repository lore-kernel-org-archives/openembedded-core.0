Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F285C36002
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:04:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.2136.1742569473479430654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Sz8qa1F4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22398e09e39so44212595ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742569473; x=1743174273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmTCDFqm2A+PlZvZomhFxw2ckZN78rwxo6iK/Sqe/Vc=;
        b=Sz8qa1F4nUiJo7kJ1b6BF4LdCYAYbWtuJ+Wo1kIoMTTjp5PQB5g9qjPquLOaIjKoJv
         1Kg9sZfnr5bSe0IcJ9c0Q7t2Dm7ciCpDVaE1/R8pDG8I3hf83aRMKwRoP+/AHq98pErw
         /9bmbw/JrmDT1Si92dzOeqydhwHXnSGohMtpskgS6mzyoAX1XUcolV0IvggBI4tSjbFY
         o8ohLEOG/AoK9iBafEx+qYI74Lr+xbiQ98lyFOLcF5nDSbma8UvKp9FKlgbCNqYUU6TE
         bdBSknbhlgLr5exv2Cip1EuBWix77kM71H2HCVR0Bf8yL3Xbxp+lUt5OR66qlrne3tuF
         mRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569473; x=1743174273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmTCDFqm2A+PlZvZomhFxw2ckZN78rwxo6iK/Sqe/Vc=;
        b=Zg7fitD2x76HBOIqTwIdB7e8AEAwlZVQ+QkrDXnT8BRqFqcengNCtq0T6vEMwFbfFA
         LjgHSb0GMPOyqj82dRJnLTZdnFuSHcVxDsYrVLpIw/6+qvjPxFG7uOeSaKIgjwgaWcTc
         3Pr9PVMF04csgB+rhbJkJ2H/Vo2jUrQ9w6+92sgLSoBGPT1PYM4oxgLw2ewKCnx/IFyO
         5KP+wBYKPCSEEVFM9N09o1pCN3W/OJVqgh2i5/9wo8UIg0yNZ9LbxmP8Ho0A2SsHH7/p
         fkT7WI8+865Ahw8IUjrdInhsmdjT8JnJfMsMmQlo93gKQj5VigPN4D81i+Td7Mfz3KTd
         hRhQ==
X-Gm-Message-State: AOJu0Yy82Ie5551/NumzCiyHUHSoM8Z6+xQVEj6Yx0S5fqVKJIfSUKAe
	a7p3939yp8KTSs6UTlxJmDfsnC6w14pKwOqPcTmBE7P9yHD8UIVjmil3nWKHBaEcQm2u1AUVKey
	M
X-Gm-Gg: ASbGncvI1zeAe/4Qp64AJjxj1J0i8yJe/taRwF/j1FZtuCrvEjr785u0rl2FcNC2+mL
	RERFU05bTzPZZ0dRnTzKIjjMkBCQL2e/Htl6nmFMdFDJAQz+EcJs9TxM5/oCFZ2QjgwUqpej0EU
	vzTY3gByR8Kt+lHQ+zkGy0wiwkJynKCPYDOUwP+OPuR5nYB8HYELwOjrrW1HcbL3Vv3b04+XJpp
	ZoqDp8I+xcFcG/Mk8104KHlbc/pSwDcGSnvJNWmJ9Egd/ucbCYFMm2NSO6rKWkub+7y5GEFJ+Yw
	CkJD/tGPKCryvM6E7pvHIqj2XhdeMAigbGOb
X-Google-Smtp-Source: AGHT+IH9LlKszDXzF57qzqNDzvMveCdfss5eYKRaCQjnE7SGxpw/ztJBCWuDsqAtMbUF2tTFqj8uXA==
X-Received: by 2002:a05:6a00:1812:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7390598df4emr5209244b3a.4.1742569472444;
        Fri, 21 Mar 2025 08:04:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2534:4cdb:e422:e636])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5788sm2076620b3a.50.2025.03.21.08.04.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:04:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/5] libxslt: upgrade 1.1.39 -> 1.1.43
Date: Fri, 21 Mar 2025 08:04:21 -0700
Message-ID: <7196f0a9a9f31c8692cd54877e6a34d10947b5c7.1742569342.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742569342.git.steve@sakoman.com>
References: <cover.1742569342.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213475

From: Vijay Anusuri <vanusuri@mvista.com>

Include fixes for CVE-2024-24855 and CVE-2024-55549

Release Notes:
https://gitlab.gnome.org/GNOME/libxslt/-/releases/v1.1.43

Remove mem-debug option [1]

[1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/c65a7c05f98ea4e9fae1247510b45db9dd3ec907

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxslt/{libxslt_1.1.39.bb => libxslt_1.1.43.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.39.bb => libxslt_1.1.43.bb} (91%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.39.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
similarity index 91%
rename from meta/recipes-support/libxslt/libxslt_1.1.39.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.43.bb
index 2cc0c84bec..d251fa8122 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.39.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
+SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -37,7 +37,7 @@ do_configure:prepend () {
 	touch ${S}/doc/xsltproc.1
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+EXTRA_OECONF = "--without-python --without-debug --without-crypto"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin += "${PN}-utils"
 RCONFLICTS:${PN}-bin += "${PN}-utils"
-- 
2.43.0


