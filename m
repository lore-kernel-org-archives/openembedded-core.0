Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C088C47089
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:56:23 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.91898.1669557378770204600
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:56:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MZf39Cfb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id q71so7704061pgq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boy1ZgaCdxAY/38Uj9UWf2dnE+3UHSybwSvP9nP0+ow=;
        b=MZf39Cfbfj7oLVgzsZgSVJs8rKTdf+sReWWVsPvaZB9IT+A6vSM5TM6eUwYxfVhkoo
         85AQfgX5didQg+qiD2fkNb7VrtD3xA9+ymKFInv3KMj8mH5KEe3+Ny1a6BNIasx92oZy
         KvKwBMnVgOUMiIEu7UaUXrrffKze0eIyFj9WVmtmV0EGRWDTJzHSh/B/AatySs4IX6So
         iB0g2GCX6C+s59xnQp0L5gHp0Uxh+dAJLDAp6JO+vcDXX6+CEedQwH65bIXgo25u86o8
         EGfz+yHySPOarrwvF9Jc9zmYqE+I5Y9niaM4n2bgYQx3cZ2P97NcQ+ol9iE4I70eORj0
         D1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boy1ZgaCdxAY/38Uj9UWf2dnE+3UHSybwSvP9nP0+ow=;
        b=5nVDRwc7UmQGJKRy+qZlXCxf+FOvDCAExgW0XoYkEs33BxXoeTYsp2zgBTdWyuN/69
         0dkMY0oV621bQV+TPLH8CWBDYsAMMSEusAc5RYgi8wjs0A3yuONZP7WjH6pMP9pOwpRD
         b7yEATvvr/7GVsSXhtLeil0Jkl/t2o5HvluILps1o/7SCah8F/fdylB4izjlGaYQwivX
         W0VpLjeyUm3XMuuzALsc74AmKfKO5hqZ0Lai/uV/4V3VxPuELKhVNw8hrc8R9mLozL8u
         uvZzi2oXkDCoMK4NLw5cQesNAYdu6AA59ldOoZ+3iow/n730nGoQjrygbhm8596LgK2i
         FYeQ==
X-Gm-Message-State: ANoB5pkZwJUHdFvL6Fx0LHuLxNmHfbdKX0UV0ajAwF4Hc3fPaO8n0Rk6
	nAVpeiZUF/ozyEkUGktilYuvCyyj2eotKHI43uM=
X-Google-Smtp-Source: AA0mqf7c6issn906SYXMWf8WzYNYs4nBBHlrP+v2XjecxyKJoN/4Xx/nbQt8JxSZ7bYuGZyroeQS5A==
X-Received: by 2002:a63:d60a:0:b0:476:85ed:5596 with SMTP id q10-20020a63d60a000000b0047685ed5596mr23118449pgg.88.1669557377838;
        Sun, 27 Nov 2022 05:56:17 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.56.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:56:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/31] vala: install vapigen-wrapper into /usr/bin/crosscripts and stage only that
Date: Sun, 27 Nov 2022 03:55:09 -1000
Message-Id: <66bdef9f5cae941c5067d88b1d26b2d6236ec56d.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173868

From: Alexander Kanavin <alex.kanavin@gmail.com>

Staging the whole /usr/bin is not correct, as it pulls in also
all the vala's cross binaries, which may be discovered by other recipes
and things will go wrong then.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 52629d9db0344146ff4734632b17bd731e247fd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 974baa33f5..d3daee37dc 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -42,20 +42,20 @@ EXTRA_OECONF += " --disable-valadoc"
 # Vapigen wrapper needs to be available system-wide, because it will be used
 # to build vapi files from all other packages with vala support
 do_install:append:class-target() {
-        install -d ${D}${bindir}/
-        install ${B}/vapigen-wrapper ${D}${bindir}/
+        install -d ${D}${bindir_crossscripts}/
+        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
 }
 
 # Put vapigen wrapper into target sysroot so that it can be used when building
 # vapi files.
-SYSROOT_DIRS:append:class-target = " ${bindir}"
+SYSROOT_DIRS += "${bindir_crossscripts}"
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
         # up our wrapper.
         sed -i \
-           -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
+           -e "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
            ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
 }
 
@@ -64,5 +64,5 @@ SSTATE_SCAN_FILES += "vapigen-wrapper"
 PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
-	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir}/vapigen-wrapper
+	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
 }
-- 
2.25.1


