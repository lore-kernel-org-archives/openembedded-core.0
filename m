Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39177C54E49
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:30:58 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.14009.1708612249911061872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R/uJcTi6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dc1e7c0e29so19057285ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708612249; x=1709217049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkvHaE4iYEHZIIn392PRN2rU2p4Tkkno85mb8LUCpoM=;
        b=R/uJcTi6QD60EbXIw6S15tCADHnXH13GEI/en4KDGxnp2PVAiudK0pOfWNeunfsFC4
         2I4k1VzWUqZcBy8OMo/QsIoeg5DRUnOaTmu/DMm3T6BW8ORnt3rUWDnLjxrWLHec+iJ7
         ZFAJbsZgt13xQef5hnAQzO19Jk9mtGbbsrDbeC1vG+hE0jjkexr0tES6DdhGdJhv8KGg
         nluoHa4l+GL2LOd0B4WXFl0FrYQrtSFSJknBczTK3Kj38otnESPflCpMK+bN7cChUUkn
         caUgriKpPXLQNtUovsH0QbMr/TyX8UwfC3sO7DrzcpMHwkk4xIOyvCB5IAf+WV1ouJwx
         BK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612249; x=1709217049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkvHaE4iYEHZIIn392PRN2rU2p4Tkkno85mb8LUCpoM=;
        b=QlwFsxabppLyB+hKZ8d1IcF87Q+JJRw7qsY983TkErlz47EWQpYWJOPfXoTrqJJAAC
         8SZWq8OjIwVZ7B6AfUbvt+HSwV//rb9PldwtxFBh+1/Rg00D+h5yFnJRXdr4u392Y7YO
         OQlWXVW2BlpHx+n8EEpowln7X3LQYuBt89lrzVqpS2q+mkgm8bzSJx1JqlSGYVWKvLpe
         KrOpSFVQwM/KK6HPZhFF43F0kIRww7vtMC9RrxkYPNYHl7VhrKI0PrBvenq4scRPmE+J
         y8+nC6u7kvaXsrOJbNID3V6o2+S5MqKG8PTvwA7KWsEvrCnF60oTaIVVpS16UmVHCVon
         271A==
X-Gm-Message-State: AOJu0YxvTUp35EY9+HSpIYEwxN+puvFmeTUvmqPOgWiKS9JE4CN0Ctqr
	yEVRRVAPGsdBBGHjMwhYRXHlfd2x8auAZFzYnjWSdFExCxgIxpeQUD0gnxBO1PnV3N0w8c4Gqtz
	yPfE=
X-Google-Smtp-Source: AGHT+IHassy/YFNAFDAOkiPnxe/VrauSmorVGA8Swnn/vsr/ZQ72uIH7e+OWb73b+hbPfozgeAvzsw==
X-Received: by 2002:a17:902:8a90:b0:1db:6338:63cf with SMTP id p16-20020a1709028a9000b001db633863cfmr19150619plo.49.1708612249212;
        Thu, 22 Feb 2024 06:30:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902f28d00b001dbcf653024sm9364558plc.293.2024.02.22.06.30.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:30:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] gcc-shared-source: whitelist CVE-2023-4039
Date: Thu, 22 Feb 2024 04:30:32 -1000
Message-Id: <037f640b9272ba055ee41eeb1e6e9b002faefe36.1708612053.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708612053.git.steve@sakoman.com>
References: <cover.1708612053.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196020

From: Peter Marko <peter.marko@siemens.com>

Concept of gcc-source prevents cve-check to detect existing
CVE patch file.
So whitelist this CVE in all recipes using gcc-source via this
include file.

(From OE-Core rev: 04511734c6dc8c7dda3a943b385cd273d012d8c7)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d803ca653139aa2d6acb4f99469c76a9d232b307)
Signed-off-by: Dnyandev Padalkar <padalkards17082001@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313..4baf7874d2 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -9,3 +9,6 @@ SRC_URI = ""
 
 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+
+# patch is available via gcc-source recipe
+CVE_CHECK_WHITELIST += "CVE-2023-4039"
-- 
2.34.1


