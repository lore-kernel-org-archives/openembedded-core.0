Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33520C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:22 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.16719.1690487056519428662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=JXZPksGC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.41, mailfrom: steve@sakoman.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7878e573827so52779539f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487055; x=1691091855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ljh7jx4q/oacC27uvIMl3IjW2lP2eINbfIVgqPYl9sg=;
        b=JXZPksGCXMoNlmp+tpkI+4SfdXYG+Y5AretbMNxjFg3Q78EK9btMbaVGL12PF/JSGl
         o6KuZ+V8WH5YdOIWjZ/l6ccugGmE12/QjONPcufs6t11IMQ+hTeISjdVnB4qmvqzW9ny
         EalD9SMUTezmQxMb6gfWdIBWfdojnZbLdK4oyaXfcOFYKgVGbUlXWGIgpm4G5Ikok8Vy
         1Y8g0KSoXikrK4udVLmGNs2WzK95nSolhmIPHgFFJMxDefvJmZlJJFsHsjYY3kXXFJzr
         7gs6vRludfuo9oBPQr/0/NwAw0Z109g2Yh+aCXOe2dZFsYq9EAex2JU2Fp/CkGJ9ZRLo
         bNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487055; x=1691091855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ljh7jx4q/oacC27uvIMl3IjW2lP2eINbfIVgqPYl9sg=;
        b=mC/PMWv1yCb2gWLkoeLTIW7ZWItmN97nuDEYhINOyv7N6ckvgylhT15UL1yfhpHD68
         M1v1xA+JFmIJdNNJ5bC9ELBiHnwjfuiLvzNFet6OrZIE14ckNhvdvi7DQ6FmmBZlP9hZ
         fAKd1UFryf78fElMArjNO/+r7kScZp0CrjH4wq9LAoHMAulicU1A4iEvF2BLXgcvoBk/
         Msu5QyjmDG9tPJ5jVj/F56VzADiRVSGdmwVfj4OTS1s3vtIjrhDVdFn2YFDPaXK8ePX7
         xrv6Gq4WOphLVCwSG/iJTi1F+UmC/QpXH368BP8ZuClPXKCCaZkXM0v6Hkn+h3MSHFUy
         SF2w==
X-Gm-Message-State: ABy/qLZ6+LWyiRcw8TPoYDFRZXvpLiDMqDy7OT9xk9VZok1DIAbF8TLt
	L+HcXbrTyK+7b8xY6cxK7yIY0oPCOIw9NRd48UY=
X-Google-Smtp-Source: APBJJlHrQpBAa4/rw1YViy4U9RLpOwxROdgAMtrNThBson8BAG0RdEJGl94/ROUI/QY7lqJY903MdQ==
X-Received: by 2002:a05:6e02:b45:b0:345:d3bc:8882 with SMTP id f5-20020a056e020b4500b00345d3bc8882mr479185ilu.24.1690487055309;
        Thu, 27 Jul 2023 12:44:15 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/27] pkgconf: update SRC_URI
Date: Thu, 27 Jul 2023 09:43:29 -1000
Message-Id: <7b50737b787311216670aa4b83b0a363d9a12aa3.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184986

From: Ross Burton <ross.burton@arm.com>

dereferenced.org is now longer controlled by the pkgconf maintainers[1],
so use the the new hosting location.

[1] https://github.com/pkgconf/pkgconf/commit/437c2a3218bfcb1cae7fa38a4ccd0cb29575ff07

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3df4594513410c7a6352e62aa928c42982eac13)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
index 4bdf03c574..ab1d1c84e8 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
@@ -15,7 +15,7 @@ LICENSE = "pkgconf"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2214222ec1a820bd6cc75167a56925e0"
 
 SRC_URI = "\
-    https://distfiles.dereferenced.org/pkgconf/pkgconf-${PV}.tar.xz \
+    https://distfiles.ariadne.space/pkgconf/pkgconf-${PV}.tar.xz \
     file://pkg-config-wrapper \
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
-- 
2.34.1


