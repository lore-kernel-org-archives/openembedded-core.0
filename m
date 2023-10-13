Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D0FCDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:33 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.51152.1697234011750871531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jrpHqFkO;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57bbb38d5d4so1301161eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234011; x=1697838811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhOdPua4lEyr/gp5PS3UecArM1XwDixugcl4W/wTDJ0=;
        b=jrpHqFkOS6ZzUW1XGqRfIOoSRwqQstXIUEr1+0AI02nlJ8UJseV+mmkyQGi+BWBaSt
         8XCHo0fJknGDZllu8TwzQpxmFxxdxrXViqdrUHhDVPcG2A4wVvWCjxeY+YODG4QJcsA/
         iKJvE/gbXtuwe5ZOoxDLm3KrHGvbwWmtoOhcZaSFeNUE0n4Lh4EVgNOp99z5j8JKXz3E
         /4WPsSBsLhzLWYmJbq+9kFM4uKZ96v+ahCvEpLsXnz/IBRiuOZh0UJfL0vuVZF7z+ODz
         oLnHBtmVRwPd7b7kp2g1w2TW0iFIYp+Dx09lMI7uIMlBCvlaPVbIxQaTioegByItFXyy
         FVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234011; x=1697838811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhOdPua4lEyr/gp5PS3UecArM1XwDixugcl4W/wTDJ0=;
        b=GMzpKMdCxa0Tui+Fb+doMkHzIZhL0yWDKfxlrrYTvv1dfSJVKgWB2hV2eItHSkUInM
         AxJEylfvsmwbjeg6y/c8LfrRnNHm+9OT+BVSkQYyqrb16VIFjRX4v7Qm+KZI9WeIa06a
         7ZuUoZyZ+T049z1P3P/HVOJ++k5WM1aNeerEhKwBEAn0ufUst9FpZkgLa4qgR5+AYcCn
         CK9Kna0KOzF85bL+ueHv7kW0OCElrFfc3shylTkbnO9KHg3t7MCDsMvp2C+w13Ss7QP2
         ZtMgBspqRMCSYS5huX3lp3niicBFXXH26qnQGC2VEmJtjLBcGI2QcODGLQMOjnTEg5nr
         od0Q==
X-Gm-Message-State: AOJu0YzmqUWTix9Bc32KE0Vjix4NqXgWIqr0EQZVYTJun9zhKuYKsK5j
	TWBrawyzoq9MuHpUVTeU7pUODRppEvzX1Yjp6VM=
X-Google-Smtp-Source: AGHT+IGxHqipxIGvJNwqVxbxB81pBgoqQxcndqLfKhaRntOOC/TbjmTWhUmfvLsTDP5sNhq8yvBqbw==
X-Received: by 2002:a05:6358:2904:b0:141:bfc:b11d with SMTP id y4-20020a056358290400b001410bfcb11dmr31080822rwb.16.1697234010706;
        Fri, 13 Oct 2023 14:53:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/27] weston-init: fix init code indentation
Date: Fri, 13 Oct 2023 11:52:40 -1000
Message-Id: <feb3af7fe3f1a062946de71a76c11388f9e50c90.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189093

From: Otavio Salvador <otavio@ossystems.com.br>

Tested-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c08d474c97ce071ba376b66f30d6ee0a6159d596)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston-init/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index d3b0d1873e..a5c54e001e 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -30,7 +30,7 @@ done
 case "$1" in
   start)
         . /etc/profile
-	export HOME=ROOTHOME
+	      export HOME=ROOTHOME
 
         WESTON_USER=weston weston-start $OPTARGS &
   ;;
-- 
2.34.1


