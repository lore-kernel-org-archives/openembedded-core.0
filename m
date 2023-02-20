Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE51C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.14078.1676902746004035602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pdD+UBR9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id c1so1774943plg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdSN7uB37MkPocVUgy6jpvLHgk3aJ3QnYXYPFZ1EjBA=;
        b=pdD+UBR97tr8AY0SkWd2vT9qxEXDQRmFJ4m3wu6LXoOgniJZYJ+oFVHWozIp+7uk+u
         DjXahmJu5amwfYwm25eTOjQlVRO2nQbIZlBhQ8/2S42vTewh+RKOSwQLqCj/4WMJjp8b
         QVWfPeIa/07/ag6mzFT/Lnf6odFgfXw5ks+6qYJsMGAtoKCQh1z00sSpn333sOo81Ncb
         EXGtUvUNtM+rGXplSI6dbP7AYgwSuVZiKmus75qJqNTL+DjXmKc0wQhGy+vWy1Kdigp9
         sFmd5KqsykeAz74j3eaigOnf21hm5vOHGMVKo846kRtC9pt9VfHbpFaILcW0HV4rYoPA
         C80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdSN7uB37MkPocVUgy6jpvLHgk3aJ3QnYXYPFZ1EjBA=;
        b=dTscuQ603kVpNSFbhrjVLIoXra+ASTPRwbBfoWrkJ1rwk3fyRFXY0YL2gjXPdDtSKk
         sNHngpsczaMOL4n32Wg5pj/abR6k89Ngs/f+89jqvezF0gCgErs0YGRChtUVE60Syd8y
         jtD7Dazce01tMJs+tueIa3VmwXDwNTFJbKCwxqLzIU294eX+w5GxIB//EmoD6MZ7BAS/
         EqXrxi311wwZ+TX6GJVuufeqOfIkVvK4eohEURe1qQ5yWckKGZBMIep8SUR84pb1MAqr
         PVwgb3Jqy1oVsgxE3d2wYQYofLpxwzLezNQVAs7SvgQwWSs8uiusBl3VK75G0cD8Yvod
         dGIg==
X-Gm-Message-State: AO0yUKUCPrdZZMwlmoVlA8fRM5VC74EXI/Jeiay6b3e5VfZALqHI7BAh
	For/JwEnrEp8HJf2bPCBv7PSxGy76HfkMYClNjs=
X-Google-Smtp-Source: AK7set8bJxBOP1qU3ym7jkICVyfZzJNLCUfMYvjkXP7duR+pRdAWLmKJRPHU2DKah134spDko0ijjA==
X-Received: by 2002:a05:6a20:430e:b0:ae:47a6:e6d9 with SMTP id h14-20020a056a20430e00b000ae47a6e6d9mr677436pzk.6.1676902745113;
        Mon, 20 Feb 2023 06:19:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/22] ffmpeg: fix configure failure on noexec /tmp host
Date: Mon, 20 Feb 2023 04:18:22 -1000
Message-Id: <20231fece4b7f15bae574d89a362506f39cfd967.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177421

From: Chen Qi <Qi.Chen@windriver.com>

The configure scripts uses /tmp to execute some generated files.
If /tmp is noexec, then we meet the following error.

  | Unable to create and execute files in /tmp.  Set the TMPDIR environment
  | variable to another directory and make sure that it is not mounted noexec.
  | Sanity test failed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6099b88c4decb285fd3519d5565909c15d935030)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 06eca4fefe..7970740254 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -141,6 +141,8 @@ LDFLAGS:append:x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -f
 EXTRA_OEMAKE = "V=1"
 
 do_configure() {
+    export TMPDIR="${B}/tmp"
+    mkdir -p ${B}/tmp
     ${S}/configure ${EXTRA_OECONF}
 }
 
-- 
2.34.1


