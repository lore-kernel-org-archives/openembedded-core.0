Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51C8CCA47A
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.11784.1655667073999670314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=X8LvTpcF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso8394041pja.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+0DPwyGW8Miiaxh9inw3hujhJwdEK4nhqh2I0BLaGhQ=;
        b=X8LvTpcFvl3tea7YQ9x9aBFKlzWH8ld9RT9F1jE2ywy74cXmUoHTPr6TMjDrpCn6gu
         0zXhHvUbHDvcLxXumRFWc0EMz3Gp3EuirrYKCDXo0nd3txrK7zDJOh17vj2uiA5NmTQv
         nrBC0eu+4CR7i1RBrhgZG8i/OLXMim3QvyoTLdMjKl1yV/d5oy+OeUqIgZeP3rVF5Cw/
         RMlrOX0hrYDWyulGWZ8xl4/kKqQlgs++duLLQvMqyEhwxR5ljpGFRFtlteYQTWI5xtvI
         8HmfGS99Yw4XgT+ouDesCJviojpytrTSb+bNd7bwneqWid8/BNDxhuQHOjpkv3gUU6JN
         B6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0DPwyGW8Miiaxh9inw3hujhJwdEK4nhqh2I0BLaGhQ=;
        b=Z8ueRt48kE8gwNjQOsn/t0jpNKGJnZ4xUwp5dNBkfZHfPT25BRO57leFRgHTnjR8At
         LmWW62ObDKAd2d7pq0PqOOQ0OuDB8mA0uLFR7Id348c5XYj6jolCJ9RsTsvDGyXiSfXx
         KlLEt8EkNc82bnjN9F3AvGdekFMTzGaqXltoikEwPgHeDeAr4KzK/ZLn2sAv2AEXsfd1
         IbU6JUFBLwiGyp4+S9U5z65FgkqsyysPjfEjBpT/RmbrNL8/7405XvNEIUr/eet86rQ0
         7qz9mP1kX9qNSoSzxHPJkhwqD6gEW3ATVNus9RoCJEE8CRDybNK9O+0ryqoQBXuE/L49
         Lw/w==
X-Gm-Message-State: AJIora+LbsdMPPLhruXoMMX3w+xp8S3hF36ze4zEvbUMqUalIAKblO6g
	pnm9v2Wspz+K9ueceCt8bz2F5TZxQW4fYSlK
X-Google-Smtp-Source: 
 AGRyM1ubbGPVcuz0cq3cLe6WDP3DPM4aO7bvGzPCcJ4m21nQQTUKsfeFjmVhHncltdC6g6FxLfSP6A==
X-Received: by 2002:a17:902:7d94:b0:168:f2b5:a989 with SMTP id
 a20-20020a1709027d9400b00168f2b5a989mr20746215plm.50.1655667072977;
        Sun, 19 Jun 2022 12:31:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] meson.bbclass: add cython binary to
 cross/native toolchain config
Date: Sun, 19 Jun 2022 09:30:40 -1000
Message-Id: 
 <3beb0f1d44b52e27adf9687d0240883bd9066db5.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167051

From: Jack Mitchell <ml@embed.me.uk>

This allows building Cython based Python modules with the native
meson support which has been present since meson version 0.59.

https://mesonbuild.com/Cython.html

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1dcb1eb69032c30f5a8faf4d7120fc6c4ecd051)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 0bfe945811..19b54e0fdc 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -59,6 +59,7 @@ do_write_config() {
 [binaries]
 c = ${@meson_array('CC', d)}
 cpp = ${@meson_array('CXX', d)}
+cython = 'cython3'
 ar = ${@meson_array('AR', d)}
 nm = ${@meson_array('NM', d)}
 strip = ${@meson_array('STRIP', d)}
@@ -98,6 +99,7 @@ EOF
 [binaries]
 c = ${@meson_array('BUILD_CC', d)}
 cpp = ${@meson_array('BUILD_CXX', d)}
+cython = 'cython3'
 ar = ${@meson_array('BUILD_AR', d)}
 nm = ${@meson_array('BUILD_NM', d)}
 strip = ${@meson_array('BUILD_STRIP', d)}
-- 
2.25.1


