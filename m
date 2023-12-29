Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E2FC47079
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:58 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.151528.1703864750835677172
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pJkAa5Kt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d4006b2566so31003415ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864750; x=1704469550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EPWOKcutEkdsT/y4k3WVAV42OKnFfWqHjGQOJ2uZ+8=;
        b=pJkAa5KtBBPgDL7jEFTzFKADMF9+IKQU50S6M9rbn4jo1VjRs0iZ3ARt+RoXQuJKBR
         y73L+SzUTsyUhu5rjCCUIvzIoUoiWMoictzYGGk+XwnYw5a4S3Cel8V6LOIjKESVbDY7
         KiNWMde18ty0uKmnOCNEzwLa5BU1xLzj5NU9aFKRXMb7NUpd5YWpC7v+rvyZm5gu+MrK
         mYD7I/4FqVzaBOfJqdDVqO4zi8DSnfZcLHlDVholmmX+N22JWRgyrQgIjvG1RDE4znrf
         S38US4fYxRgKdmL1f11xJhChwpM7Q4MF5EZ9CUCg2lIpfIzCebL2wLy/faXGNMJxYvZq
         CmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864750; x=1704469550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EPWOKcutEkdsT/y4k3WVAV42OKnFfWqHjGQOJ2uZ+8=;
        b=FDm7Q8jAYXWsCLYYIznWwv6fh/o4p36w4xlWomPQvIlxuRmXUCk9wsyJB2+aA8WJB7
         vOu6iNhrQKSwcxKqdNRxoydSt9pRQXoaxWYDyknuNrGfab+dzMvHvpndpnZ6BW2Yw2un
         Q25aE/M+pW1UnpabTWTS9q0cCp8OdyYmnyctW63xHzUV7NyEqIo41BGy6Vx40ghuvSTP
         WPv1QVlmoOd17A6WjYGktHz4etYFF+ZeAHVGCL7s8D6I71qqQG7iovkAyXGRxuBvWtZg
         zRstnss7uCPBcODsn643litBmq1IvMM2udmIOngZ50nYUvM7QKYvgaH2XUH2a847IfD0
         qAqg==
X-Gm-Message-State: AOJu0Yw+tCj09fzMkVeMXzyG2hjFr/kw21CNOxTEa//uLUideNvDrCLz
	XsnKIPeJD29bAdhbB5ger/xzapSEVqpG8ak6YQBoozVQNRoAzw==
X-Google-Smtp-Source: AGHT+IFEapGX0iTYz58qSV5jTFz3ouNpZlpdII8PnaePwKA8Ul0PegarEO/l0jngSPpRR6X9KriCeg==
X-Received: by 2002:a17:903:2b07:b0:1d4:6484:f184 with SMTP id mc7-20020a1709032b0700b001d46484f184mr3960383plb.125.1703864750007;
        Fri, 29 Dec 2023 07:45:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 25/41] gtk: Add rdepend on printbackend for cups
Date: Fri, 29 Dec 2023 05:44:39 -1000
Message-Id: <a241b3f3466d50c73dfbd8001a027e6b8ba67aea.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193042

From: Markus Volk <f_l_k@t-online.de>

install the required printbackends

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0a97892920db46043102d54ef1623669241e9780)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc      | 2 +-
 meta/recipes-gnome/gtk+/gtk4_4.12.3.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 8d01e6077f..4a04c06432 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -41,7 +41,7 @@ PACKAGECONFIG[x11] = "-Dx11_backend=true,-Dx11_backend=false,at-spi2-atk fontcon
 # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
 PACKAGECONFIG[opengl] = "-Dopengl=true,-Dopengl=false,libepoxy"
 PACKAGECONFIG[wayland] = "-Dwayland_backend=true,-Dwayland_backend=false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
-PACKAGECONFIG[cups] = ",,cups,cups"
+PACKAGECONFIG[cups] = ",,cups,cups gtk3-printbackend-cups"
 PACKAGECONFIG[colord] = "-Dcolord=yes,-Dcolord=no,colord"
 PACKAGECONFIG[cloudproviders] = "-Dcloudproviders=true,-Dcloudproviders=false,libcloudproviders"
 PACKAGECONFIG[tracker3] = "-Dtracker3=true,-Dtracker3=false,tracker,tracker-miners"
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
index a547db8376..001b06934e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
@@ -66,7 +66,7 @@ PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)
 PACKAGECONFIG[x11] = "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes xinerama"
 PACKAGECONFIG[wayland] = "-Dwayland-backend=true,-Dwayland-backend=false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-native"
 PACKAGECONFIG[cloudproviders] = "-Dcloudproviders=enabled,-Dcloudproviders=disabled,libcloudproviders"
-PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups"
+PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups gtk4-printbackend-cups"
 PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
 PACKAGECONFIG[iso-codes] = ",,iso-codes,iso-codes"
 PACKAGECONFIG[ffmpeg] = "-Dmedia-ffmpeg=enabled,-Dmedia-ffmpeg=disabled,ffmpeg"
-- 
2.34.1


