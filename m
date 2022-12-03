Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7D2C47088
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 03:29:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.96657.1670038176747563801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 19:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DIMhrmT0;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so2384576pjb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 19:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBAoHOA9tizWvC7JLFYDIo68YI1OfKeIVIyoCM6yh3A=;
        b=DIMhrmT0CU56dtG4smP6wZBmAwTkOtWFTdHqT1ocVJvIPbqW+jwRk8q2fQgAHTkm5/
         k0sj9f5jjH6FTseMlXrg0c87SvEQ7DwVxGrlsU7vNIRw7EVYwUeNKUmNfCzJ1MtB7r48
         SdP+AnFBv9ivZKujmFXUl7tprcJlCZJtqrD/fVVMGPlMn8mcZdwhN7xApTQoev228kIq
         +IuGJ2r3YhRGNAAU60M6aqYz1tav5uujCnuGj6JM3L+T22NfBllU5XX/6BtFeXl2nStF
         TiEPkPBJjYJeaTZ30zUZ4yA0woBeMTbN+aFu4Y6B8UYz5WBYgJq2tf3bPHS/wK2Irdij
         zCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBAoHOA9tizWvC7JLFYDIo68YI1OfKeIVIyoCM6yh3A=;
        b=sOrYBKezNqisDkyUyDxoBUFp8HJ2p05aYhNOpINdlBK37Kpsvz+A5n4rwNyf+zQNie
         frODTjODDarLCzR9LrN2zYCmZnv+AeOSPzMK3LN/Bp+laAm8egJ9J0X5DhBEzt0RWM6J
         2ZQFNETSGvTo1CrjTx5Lr8Q6tqGNT/33kW8mTuka/wa64tB35ucBQ0J0qkp4KA2Z0qj8
         kiVke/xS0pcqQHUOUF3rgmH3QNhWzloFzJ0AIEsiVtYp18loZ/P7YiFgKjPYrwLxstA8
         /PFG7AjVz0091m7Q1Pg5Zp2wWrvjI+ZZG/XtNFOQlfSQGGt2Chy43VaVS4VEM9IDpcYe
         vwHg==
X-Gm-Message-State: ANoB5pkcGmCNv19deaFKqVlLfkfuAeSdNWW6HsPAnq3QdyAX/Uhsjxgl
	sbZ3eZB/CKPdana6foiIZtvPXeUbqGU=
X-Google-Smtp-Source: AA0mqf58G9C9U3Xj7YmQGz3xzZtLhNXa5+oiSTLFFBbIAoZmu4MzscW6JXq3fx7By0yMkFHYvxrpqw==
X-Received: by 2002:a17:90a:bc86:b0:218:fdd7:6df4 with SMTP id x6-20020a17090abc8600b00218fdd76df4mr45481993pjr.233.1670038175928;
        Fri, 02 Dec 2022 19:29:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902db0b00b00172951ddb12sm6366234plx.42.2022.12.02.19.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 19:29:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] libxkbcommon: Extend to build native package
Date: Fri,  2 Dec 2022 19:29:31 -0800
Message-Id: <20221203032933.878802-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Dec 2022 03:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174247

This is needed by gtk+4 recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
index 89093e6786..df13ceb389 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
@@ -34,3 +34,5 @@ python populate_packages:prepend () {
 # Fix a following runtime error:
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
 RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', 'libx11-compose-data', d)}"
+
+BBCLASSEXTEND += "native"
-- 
2.38.1


