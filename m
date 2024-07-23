Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB60C49EA1
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:31 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.43668.1721740407855146049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OhnP4p6e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70b703eda27so2513154b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740407; x=1722345207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWbQhdJjs2SB4Jplw52DHxWzJrdEnbcXYFEM91MLKhs=;
        b=OhnP4p6e9jnkssiSYPIT8JVhW+4+EA5TgqGrcO9RLSFL6yOimZp/FeUUniUs1b8HXV
         OYE/XO2W3XoPfz2vSlQlWA9b69QBnSU4rOecD0bCl+mpK3Pw0NqQCsnwfNM8Xr2tgKhZ
         dElFg/BS6OAWrCARAHIfo0nGRaEcMxSdL30C7H2d58L4rD0nCVx/bPtG9eG8TU/LWFrp
         3ldsH7TcL9MpiVCJLhSe0eTOCCdSPELyjjLyIh9Vr+wt/2rr07qqYP5BkDoIyTjUI5Yu
         upkpmfU3kkhl+joDd/BhRDhpYRJbHKsIEtJQCOGlIfDrGXZY4fKY8wxCNaJHZomHWZxB
         Acew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740407; x=1722345207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWbQhdJjs2SB4Jplw52DHxWzJrdEnbcXYFEM91MLKhs=;
        b=dQy4cvnjdvQ1LHfyDpY/p5zYTzx3izpIZu7T0l6ukEYFb642AjK+qrPkvYYNtI4iBf
         BTiq10E6VThZvxZQUGEBQ1zrhoRoL/UhT9o3CUGVQhGLNWFKPlP/af2YkNrMAlPbzBhF
         qPqSWepMUqg5pAz/dXDJZoi7p00OaD+ERTACjBqEXyHoGe8KeLGKZSdoF3XB7yjDAcMh
         TnBLXuHHAxovi1np22fF61HQQt/lSv9oG2pfXHvhCNApmhy+B1fkamKBmmJXFH6JggOl
         ek6ewc/dai1rgNohStn+QqeoeRfoZnuXR3sYdmibp2igN1kDfLNZTCW8gP6t0FPKvL+A
         FZBg==
X-Gm-Message-State: AOJu0Yys68Tnr9mwG9xn4r+KnVW10aaWr7JJbQlA6g6AqI/yMiODYD0E
	Fe+gTdAo69+ytkYANUtGMmUjSVa7UmO0TfPVtMgkQ/WtkiHTwBfOwQdGD7HOj9ong39xhg5xR/E
	Yois=
X-Google-Smtp-Source: AGHT+IFBdrbMIL3tp3ouvkVq4MqCqK5JSneddmik1PtwSeETmWpRMMzr1AqxGjd1Kch2Md/KBTwkEw==
X-Received: by 2002:a17:90b:1c10:b0:2c2:deda:8561 with SMTP id 98e67ed59e1d1-2cd274da1fcmr5937755a91.41.1721740407079;
        Tue, 23 Jul 2024 06:13:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/17] mesa: upgrade 24.0.5 -> 24.0.7
Date: Tue, 23 Jul 2024 06:13:01 -0700
Message-Id: <247f62169d1fff5df16606c64aed38b642f36857.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202347

From: Wang Mingyu <wangmy@fujitsu.com>

Mesa 24.0.7 is a bug fix release

Changelog:
 https://docs.mesa3d.org/relnotes/24.0.7.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55d962ff7e3475d2c46e1a76d9efa55e1de6e940)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mesa/{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7cc48e8a04..9157fe9c3f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
 "
 
-SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
+SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.5.bb b/meta/recipes-graphics/mesa/mesa_24.0.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.5.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.7.bb
-- 
2.34.1


