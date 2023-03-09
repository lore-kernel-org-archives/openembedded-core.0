Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802BBC74A44
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5721.1678402703283987520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oxvel8t3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id v11so3662258plz.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9JAsufL/Af3e/a0gVcz+v+1aY74Y3szmp38T6xXnRw=;
        b=oxvel8t3JHDthzIfvMrhv1pVe/9fVTBQJeOFG+le1A2BVnsQLx9pAvJX+c4YuR4kYQ
         8V+Nl58gzhjiK2oZo88hLdc27e6yTZjtkWOGxUVDXe9RZvZWAdsIZaLIL9BUge8sTFk0
         +HqbnQ3wtX54V/8da5BwO3jJiw9SZddIOcxjaFCQgZ0ney45b6MKUxcJvn8GBRfQiZPv
         clRlyBq3OIzzAH7oQZYaW6bGnQIRt99jAvv9l5xjgO48J1G++21Cvd89//LVtLpRdtt3
         RfumbqinZcC/+PMoenZDrl9RGvIvkMRnuNsC/9LkJaNbQyz7wDLoITucLhZJNuYPtyHC
         hp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9JAsufL/Af3e/a0gVcz+v+1aY74Y3szmp38T6xXnRw=;
        b=uMzerU8TMscluEc4CqJZU+3kk/R8vAAf8JKih7pOLVxbpUYpoGUUhOWsbkDb7IDCJ6
         q67r4oIsrW33j7LJOsA+cMSyXn8nAWtXHLaFVZI4SFRcbRjicVEGMDMAcDpHf24BZhor
         AJrNiQrPfMYHpiIXKDhCg4H9g6wmPj+I6DUB+NUMyluTnc92sW68m+uLW93mXaD7kP4V
         vwSX2vVCuxa48zpR2QYzVLThCSkquo+mDDFjQ12fnB2uLzh0P1fD9Vg7PMa+P3ujhDHu
         5i3cWvAjN1xgyEi7gUy3C0jxsyhjp7zQzb3+BadYTy9sMLZG7DdR1k5t2UEWohLDF2YK
         Csfg==
X-Gm-Message-State: AO0yUKVaTs5207Kw2o6tY70tKrE4RB/82ZmJTn9Hvj9QN01OgGk+gkun
	qXdF/iVQbgo5b4bndQNRGUyRzgyraSaEKCTRQJ4=
X-Google-Smtp-Source: AK7set/1ht8uFkzLTGNi1frKhrf06vKg97b6Lt0jyFA8EML4E0dtIbC9CEdF3keOftUAPNYQyfXYdw==
X-Received: by 2002:a05:6a21:33a2:b0:cc:606a:4349 with SMTP id yy34-20020a056a2133a200b000cc606a4349mr28069183pzb.8.1678402731668;
        Thu, 09 Mar 2023 14:58:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/27] meson: Fix wrapper handling of implicit setup command
Date: Thu,  9 Mar 2023 12:57:57 -1000
Message-Id: <23b7baa02e765998baf9de6254f376e07221b984.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178295

From: Tom Hochstein <tom.hochstein@nxp.com>

From an SDK, running a meson setup build without an explicit setup
command can result in a native build when a cross build is expected.

The problem is in meson-wrapper where it tries to detect whether a
setup command is being used. The logic looks through all arguments for
a command, and the first argument it finds that doesn't start with a -
is treated as the command. This doesn't work for an implicit setup
command if any option with a space-separated argument exists. In this
case, the argument is incorrectly selected as the command, causing the
setup command options for the cross build to be excluded from the
command line, and thus a native build.

Improve the logic by just looking at the first argument. If it is
a known comand, then record it. Otherwise just assume it is the
implicit setup command.

Note that this fix does not address the possibility of a new meson
command. Two new echo statements are included to help the user in case
of trouble:

```
~/git/weston-imx$ meson --warnlevel 3 --prefix=/usr -Ddoc=false -Dbackend-drm-screencast-vaapi=false -Dcolor-management-lcms=false -Dpipewire=false -Dbackend-x11=false -Dxwayland=true -Dsimple-clients=all -Dbackend-wayland=false  -Dbackend-default=drm -Dbackend-rdp=false -Dtest-junit-xml=false -Dlauncher-libseat=false -Dimage-jpeg=false -Dimage-webp=false -Drenderer-g2d=true build
meson-wrapper: Implicit setup command assumed
meson-wrapper: Running meson with setup options: " --cross-file=/opt/fsl-imx-internal-xwayland/6.1-langdale/sysroots/x86_64-pokysdk-linux/usr/share/meson/aarch64-poky-linux-meson.cross --native-file=/opt/fsl-imx-internal-xwayland/6.1-langdale/sysroots/x86_64-pokysdk-linux/usr/share/meson/meson.native "
The Meson build system
Version: 0.63.3
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9338bd66a3c9ab5cb781f2ee588306c5b31a3cb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index fca64a5692..7455985297 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -13,20 +13,19 @@ fi
 # config is already in meson.cross.
 unset CC CXX CPP LD AR NM STRIP
 
-for arg in "$@"; do
-    case "$arg" in
-    -*) continue ;;
-    *) SUBCMD="$arg"; break ;;
-    esac
-done
+case "$1" in
+setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite|compile|devenv|env2mfile|help) MESON_CMD="$1" ;;
+*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=setup ;;
+esac
 
-if [ "$SUBCMD" = "setup" ] || [ -d "$SUBCMD" ]; then
-    MESON_SUB_OPTS=" \
+if [ "$MESON_CMD" = "setup" ]; then
+    MESON_SETUP_OPTS=" \
         --cross-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PREFIX}meson.cross" \
         --native-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.native" \
         "
+    echo meson-wrapper: Running meson with setup options: \"$MESON_SETUP_OPTS\"
 fi
 
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
     "$@" \
-    $MESON_SUB_OPTS
+    $MESON_SETUP_OPTS
-- 
2.34.1


