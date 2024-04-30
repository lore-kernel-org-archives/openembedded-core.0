Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAACC10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.215.1714512281201233569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j04GwhK0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e50a04c317so34189935ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512280; x=1715117080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cr7jPCGboH+WNxvnWy1YZvWx+zXFbxnchiXqQUcVlw=;
        b=j04GwhK07ZX5bvnUJJNPjo/1EQNwo+5NbW0txwkdUTPlt4GgqTWaCKEoqVOoqa3lch
         18G0w4OkUpiurC+Nd0MDQCJCjMZE1GNbefH4PDgg07fZ3cPQLVjUPQioHepYFowmXMQu
         R6aQD7oe3hz9PyVg46StWfIhzyUri6eIM0hP7ajMxW1X696OoUBsjfE9peUEotHRASnf
         bKr5jEZ2ik1OganvNpQF2b3KHYF9Aw939gnKJiQb6CQWkyrgLrwOTnIVjrmYoz4H0v4I
         60RFBA2sLnIIeb6fnpym4/RlG6fH0phukGR3ROZT+XKA/ffCzLNa4ePEuW/rtmdBSnGK
         S4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512280; x=1715117080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cr7jPCGboH+WNxvnWy1YZvWx+zXFbxnchiXqQUcVlw=;
        b=cs5rq7/Uo91rTbUI2e9vkU345pzK7UkartnOZij/jrQ2/acnXkbRFZ1/ec8Br0jCoR
         AbnU4X0K+I6V9STjoGow9fg5f/F0CzjzuPyGi0wZHaU302ctWSE74THnv9MalVIC6+EW
         lTIwLeg2nfGNvgsv8pOd+mN3O3WCqJdbs/OrWxq0Obo6av6suRW8f0kObjo2RjWSTH4L
         aAgbt0Kcbcu7cl6kjudl1vwMX33J/nZVYmWuTv3YCQ/fqRTQoZk6RPmLIT1t8TPiEmjX
         6lYQn+IuY9lI0zlprTelUDzuEwjOmAXn+StbBpDPq3y9qPsdu7QmEz52bBEpPVnPyxnj
         YXXA==
X-Gm-Message-State: AOJu0Yy1dEdD15Qb9LhjkvKSKpA9x0KY31Ul9s95WhEPkIk0qu/gkdWh
	hULIGsmjhhHaRRz4Ys83gbU6zm8G5BngiP6EUhk7FkTlKuVfp4qvVhqTSmYUxX0vGpApbapVFNE
	8TmA=
X-Google-Smtp-Source: AGHT+IEXylhxOgSzmLALuGwcFu3/J5jyO3M7buzG5w6+AwjBG5KaF+GccyPttXPkOjOXhL8rwZDJ9A==
X-Received: by 2002:a17:902:eb88:b0:1eb:7603:9ce8 with SMTP id q8-20020a170902eb8800b001eb76039ce8mr665821plg.22.1714512280485;
        Tue, 30 Apr 2024 14:24:40 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/17] libx11: upgrade 1.8.7 -> 1.8.9
Date: Tue, 30 Apr 2024 14:23:59 -0700
Message-Id: <14ec9ffa949e5bc42fc04aa5a86ad3acf59d8e72.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198778

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-xlibi18n: restore parse_line1 for WIN32 builds
-Fix _XkbReadGetDeviceInfoReply for nButtons == dev->buttons
-_XimProtoIMFree:no need to check arg for Xfree()
-_XimEncodeString:no need to check arg for Xfree()
-Fix XCreateIC() memory leak (Part 2)
-_XimLocalDestroyIC:fix possible mem leak
-_XimLocalCreateIC: get rid of bzero
-_XimLocalCreateIC: minor cleanup
-_XimLocalCreateIC:no need to check arg for Xfree()
-_XimLocalDestroyIC: no need to check arg for Xfree()
-fix table width

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd8fab6937cddf3b6818e8e333b78813f0524116)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libx11_1.8.7.bb => libx11_1.8.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.7.bb => libx11_1.8.9.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
index 5f14e62446..5dcb063473 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "05f267468e3c851ae2b5c830bcf74251a90f63f04dd7c709ca94dc155b7e99ee"
+SRC_URI[sha256sum] = "779d8f111d144ef93e2daa5f23a762ce9555affc99592844e71c4243d3bd3262"
 
 inherit gettext
 
-- 
2.34.1


