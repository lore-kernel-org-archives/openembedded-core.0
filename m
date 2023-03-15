Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DB8C761A6
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:02:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.8796.1678888916788775816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iVUErLk4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so1911231pjv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cB4t0yOtWEfxOqUmMWZaq/TPhlj0lpvGPOrHBE1iF/c=;
        b=iVUErLk4qxQMQ8UTZhfvnfC2wufOxv4AEJqVTjHVINqTlkSHthUsqTT5DohQTwdk4w
         lOZ+1sSZ3EcrLgvmEu1i3xbcwKQTP41e7UukD+52e+RBNXrZMZHSUVDo8bEFdaXUyEmF
         ZD+4Gec4yQXQ5EAsEswYG72uwsiN28LhGm2TUmUpZEKXWJxvhJDAo3FqMAj1n8hxxF+j
         6VQaYdOiiAvIrs+C30NyxcrSyf9BjwQDJfsbgsBdujH90GlhpIlaWTUlxZJpNZB5z7Z2
         o5DJBGsBc3NqB1uOd2V2tMzJSTq1IEPbjvd7GMVnUyYkrudRlegBuCrDunhxTzgCBFeH
         nRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cB4t0yOtWEfxOqUmMWZaq/TPhlj0lpvGPOrHBE1iF/c=;
        b=qo9lgFuuMUEmx0pmyHu7yRqExftRmPav0nnJxZQ1IgO5mfwjUM/LNnk6RPWIE1gjX4
         Rax25aGXt4OkJ1JVcH8hPXlCEfb3cie+VRGUzndii/RwGCSI+e+ndyNNl+zVMsUO+xaU
         JSbkLSpoEZ3R6Q6QO/zj0HKQN8TR9XPvotI5vy1R8bkJ6KB/RSg19SKhso2BYLCPPqei
         Fo3AwoYJzj1q4FUzK4kIiFymzddiY3w5vtydKYs8hpqKMzy1ZlfidXqYFgQ+mKzVhxHf
         EZ1Uj9me2NX8QZN/f2DYZS142qXog1r4dw5OAq+QJDlsG29mGWvUYvB9ebcnrp6PF/lz
         hgYA==
X-Gm-Message-State: AO0yUKXSzwugxv5q+Wumic5gXKDeU67C9Sk9TcvoHs5oatabMyoDyV5S
	KIdQl+bYsDrmw/eaMDsky8GDne1O+CEMyEBbsWM=
X-Google-Smtp-Source: AK7set+C8BqWssRSShnaA59oWSqVCqMwlNtTxDotXbT4AG29TCB+1VxBBkjQZlTgn6cDvWcozZrfLw==
X-Received: by 2002:a17:902:e484:b0:19f:2339:b2ec with SMTP id i4-20020a170902e48400b0019f2339b2ecmr2272651ple.33.1678888915873;
        Wed, 15 Mar 2023 07:01:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/22] meson: Fix wrapper handling of implicit setup command
Date: Wed, 15 Mar 2023 04:01:09 -1000
Message-Id: <1f30dedee80669475557d9de5f130b7a23eaa7ec.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178569

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
index b65ba8e803..71c61db84f 100755
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


