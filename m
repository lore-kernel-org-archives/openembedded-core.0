Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE55BE9906F
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:05:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153072.1775815523091127868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F+WoS8J0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so17575815e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815521; x=1776420321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgbXVlkW+k2nQWLosNO3RU4U5oMGprrZublJaA5dCME=;
        b=F+WoS8J0xJLXXB3+Bndp8e2K9UdipbVH4GOMB/grS3mCG+MO7svIlnDypw7DTvm+KN
         AoOcF+SA+DfWf2Gm/pdBYgABTalh2EfFO+BlXrZSlBH0Z3g+ZpBjORDC3AWJreEvP0xB
         wCLsynzU2YktAOQoJEXhuukN/34DTxvpH4LB/ItFwOdiifd1KObYm1DmoJvW5lVPk83m
         u6KxgTsvsnKlac/LBsnCTw+FdHGGO1TveDMai85kwKfLpqTSZoByQoxFc94sJ6lvJVuv
         XCwu+8mNZv5SxkZMPVvvmQLMFCPPztpZypxkN3M5X14BFSfX8lYLF6uHfCo90NOo8vAN
         2zXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815521; x=1776420321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgbXVlkW+k2nQWLosNO3RU4U5oMGprrZublJaA5dCME=;
        b=n1NsOpEjm6u0r83azatOfqUZePhc51mRL1GVpMW3pNm0Nxo0IUpgdFbF+lXHfwrXiN
         6gv81CTZn9g9L2Wt6qcwANeuBGv0rRp1AJIhLQBGrXomJc6V4eeRBUHyukemF+MxZgnp
         vaMOf56MJ08mOGipYBvzhxDMlzGNGXWDGkCGF5akzHsQPnG0a8XbibodGSo3tQVTnkvt
         Jbh1j9Xtv5Uqr7Gc1pyh2poTKDfdNw8J/D7kVnAMz0qKi/VhmfildskhxtW0DXFebBbl
         qzroCV5+GQE38xNfoIW8vor+jVaEiTTYGdalBfCkSJWnHmMjqrsVPY5O9JGDgBEgxzic
         XHzQ==
X-Gm-Message-State: AOJu0Yx6kN/oHXopGl2SzqRxgtnMgjUhgT+0QQ99QTxEnnB6jpobuAKO
	a2fPUtSUg3Z4te1AwfUrMozka20/upZO0EZVF197RnYrxCGFWVk5ultCbwNa4Q==
X-Gm-Gg: AeBDietPQNMGc5mqUZ58v89ettdP+NCEDryo70jvMEbKMzitsOQF+GzV5AbwUEnKWat
	4WHX9imhMBzQwYLOJGrkjz3QybugvE/aPjLMzamHvO0E9he0zwkJBS7tLAjJSh/vlUnjCMqvp8z
	OJODXg8gbdOmCs6IOTskq2F6shCeVTq76rjBW0L8psPk/winIIuRlV0cr7xgOVg5c6QOQeRftHt
	odKiaW4JvFHsZB3fFxfsaHBswyMvawGlHTpYqK8dFLCtxo0J+rTwNsbv800yC+vSySivYSJjSVv
	Frsr+rIfVLTRDH0ynaugj+AryQXddDbqgIj+BD8J9CY8zRJBpZZ6L/hvpiiiyX0FAHUYDPBJpN/
	kqfzEX88Zb2rIkKCxTJXGgEDezw2gzi/OkDtpTcGfyI+kVQoks4GLWG8kXUvXnXBp3+MyL6PpeB
	OXrjZ5Bup7JyHFc7YMv30rZ37LlWgMHqe7fx/jIBES9LiNFMyyje+LcvK4XyzUgh/PtScLJpM64
	Kl8yJIKOA==
X-Received: by 2002:a05:600c:314b:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488d687c076mr24756495e9.26.1775815521392;
        Fri, 10 Apr 2026 03:05:21 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd10b1dbsm93862315e9.2.2026.04.10.03.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:05:20 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 1/3] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Fri, 10 Apr 2026 12:05:14 +0200
Message-ID: <20260410100516.3923530-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235004

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building nativesdk-libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index da515d1927..1292f4288b 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -19,6 +19,7 @@ PROVIDES = "virtual/crypt"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

