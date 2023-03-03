Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED94C7EE32
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.27599.1677860257650685133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=x2ZemCWh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id y11so3215011plg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fcejv/l6QBrzLy9JL5sarH6ivo99OyIK7qvFWC9br4=;
        b=x2ZemCWhZuYUigtTGaPZDGxp79oppeGj6UDR/MSJw0T4mwV+F4Qw9iAXoN8eqEjAUR
         jADTNHq6S27QmP89ySx/ZbPX37QhYegZYrBCnuIkfeu3KaJxyZz6Pg54z1B7HwFdsqSY
         n3ql6F/edFWxTjeV7dhWp9SulfzFw9tvUog6u3zuMAVKeuSVq1e30naYnqVNkNDssK1n
         tC4FFA5f5CXw5runKJHk0bLg4n705kx0q5af8pwVLnOW6l59Vn1zLQz+e4NQfkBJ1Hib
         j68/Hu4gFZ/2KqYxgiJU/NP+WkLei/pmnNJtZ7k/J3XeSU7kOtvbZZHwWtvKlsYqG1pl
         OX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fcejv/l6QBrzLy9JL5sarH6ivo99OyIK7qvFWC9br4=;
        b=cO6B6pMCRgy5qZHFpVuF8y/sOW0kKJZBF0QtWp/NmlRRLDaJ62iFl6AC6EUGuI13Se
         tMubKMjHHfR5ZZY5MBFZYvK+QnZ2P8PoWdYXQ3Fp3VnxwceF8H+kDXPgiW5ZuIKQ7I65
         9GJ4aPX4kBAfKqIe5Jz5f4CIiNIPALvkzmmJ6MXgFvs7q56twWYHW/4VDH0rLO1jNnGg
         39PQ9hMHQngra4yNpd4Jb2eLsWalLKPz7pyO4Xh0FAtnIrQMp9YcD1yOM74fRFlcUNfd
         Lkig+3wf9F89mIxP4V+W63wciagFsN0BZuW0U5sblJAFGYb5ikKTc4zhoBMBjgyTVAnq
         6d/g==
X-Gm-Message-State: AO0yUKWcTEfJ7/HyGsnbMEyJRTj0h0QmcnF6a0TKuLxYi0mrbDAOqPes
	RgAw1tPKMQSXisU3YMBkuYKnuVIRzPa1ZUHZb2c=
X-Google-Smtp-Source: AK7set8f6scGWA/qNE8hR/BoBLti71AzVWYXRAkBKo7n9JhfZ0DPDqmCHhYi1E3f1prgzdtj6m1ApA==
X-Received: by 2002:a17:902:f68a:b0:19e:6084:da58 with SMTP id l10-20020a170902f68a00b0019e6084da58mr2938383plg.4.1677860256761;
        Fri, 03 Mar 2023 08:17:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/29] libsdl2: fix CVE-2022-4743
Date: Fri,  3 Mar 2023 06:17:01 -1000
Message-Id: <01b75e75fceff8dfe4676772ab0653f52c0584e4.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177992

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ial-memory-leak-in-GLES_CreateTextur.patch | 40 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.20.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch
new file mode 100644
index 0000000000..31bda54dd3
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch
@@ -0,0 +1,40 @@
+From 3cf2048b647484cc3a6abd0d78be60cead47b42d Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 24 Feb 2023 16:59:19 +0800
+Subject: [PATCH] Fix potential memory leak in GLES_CreateTextur
+
+CVE: CVE-2022-4743
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/00b67f55727bc0944c3266e2b875440da132ce4b]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/render/opengles/SDL_render_gles.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/render/opengles/SDL_render_gles.c b/src/render/opengles/SDL_render_gles.c
+index a6b58f2..237b1d6 100644
+--- a/src/render/opengles/SDL_render_gles.c
++++ b/src/render/opengles/SDL_render_gles.c
+@@ -368,6 +368,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+     renderdata->glGenTextures(1, &data->texture);
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++           SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glGenTextures()", result);
+     }
+@@ -396,6 +399,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+ 
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++            SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glTexImage2D()", result);
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index c1c827af79..abcf232e25 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -24,6 +24,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://optional-libunwind-generic.patch \
            file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
+           file://0001-Fix-potential-memory-leak-in-GLES_CreateTextur.patch \
            "
 SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch"
 
-- 
2.34.1


