Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8F0C63797
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:32 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.24073.1675260870353519887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=b9aX5YJe;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 7so12593725pga.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3RSP7IhndWp6uDr/Vqzn70fIX3qxBrAhYxG+6hhm3k=;
        b=b9aX5YJeFhT/AWf4Exp7Ga0XrK00uge1ottCn/Woe1Z6Q+GFAOC7m94AVfXfLaw2UO
         7y3hHw0YZYQNnrtc95V3r+4JrX4imTkdHw0CHZ5pun3hbkmV9Ey4+ZLOJPCS8qhaLp+i
         PaDx4Crgt0oCsxnSk6mx/PYvSxnoSF1fnqB0Ni9viXKJHm1TZqJVOq2YKr4QwE+NgMxX
         jRSxX4v7X6bRcbEJE0NF7nrkL3QvziiacjPwrV161m/HqG8DJBLZzG2WrdpYyPzTPnWK
         0vlOxoUwdDmolDkbKoc1KxlJbvxHL4kttCD07Iwvm0/oIPZrvrH+CuNaRaIWqjAEx2aF
         VtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3RSP7IhndWp6uDr/Vqzn70fIX3qxBrAhYxG+6hhm3k=;
        b=C61S4h92NDckDkyQuNhx0AGO6qOq36KwQ1yBU3DB9WQqsa8iFn1dUv5GyF4bBW9ou2
         6qLAHkkfjBXkGuxUp1smu+7KNYTXEbRt6R3AtBqWP58vDQiPUxqDlh3e/lmSw4zUtniW
         L9YqrZDjHUc6hRB3oHjwOhFeYNM7sYJyC680k++GuvEeeaeZiteBUDJnTT3y8hBJOWoL
         bKO/oaHzBt712VigUVpMvkB9QryOBv1jTnwL+76CVflU6B+d7HkqpG/cwjxH3Fsd4kL8
         QpY5hA3Rt32EBEciMCPy9cepQxDV3wcc3h4eJu0Z/teBOmo7IXTWwxzvJokmRe+IADih
         Tspw==
X-Gm-Message-State: AO0yUKXdjworHKrtnBhDCrGrST2HsecE5kQvS+UT4APFFNC3Wx8A6nd7
	LXoiRd2w7wh3+3wwdBt4cTY5Tuy8KJwMJwCoMIY=
X-Google-Smtp-Source: AK7set/xfCnFHI96Qo+rJUrFe4vQ7t9Q/3RET6NrGRviT6sTbDoguL5hKh8KRrNX5At4Sk3E3fBEXQ==
X-Received: by 2002:a05:6a00:26f2:b0:593:c7d4:22b0 with SMTP id p50-20020a056a0026f200b00593c7d422b0mr2108727pfw.2.1675260869255;
        Wed, 01 Feb 2023 06:14:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/17] librsvg: Only enable the Vala bindings if GObject Introspection is enabled
Date: Wed,  1 Feb 2023 04:13:52 -1000
Message-Id: <3bf9e22c0ca34595106f5421654cccbce7920cf7.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176549

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This avoids the following error:

  configure: error: Vala bindings require GObject Introspection

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 31daea70b18b2b2266bf94063b655aaf142a6166)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
index b2e93a2684..59278d1b16 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -42,8 +42,6 @@ do_configure[postfuncs] += "cargo_common_do_configure"
 
 inherit rust-target-config
 
-EXTRA_OECONF:class-target = "--enable-vala"
-
 # rust-cross writes the target linker binary into target json definition without any flags.
 # This breaks here because the linker isn't going to work without at least knowing where
 # the sysroot is. So copy the json to workdir, and patch in the path to wrapper from rust class
@@ -58,8 +56,10 @@ CVE_CHECK_IGNORE += "CVE-2018-1000041"
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
 PACKAGECONFIG ??= "gdkpixbuf"
+PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)}"
 # The gdk-pixbuf loader
 PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-pixbuf-native"
+PACKAGECONFIG[vala] = "--enable-vala,--disable-vala"
 
 do_install:append() {
 	# Loadable modules don't need .a or .la on Linux
-- 
2.25.1


