Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DAFC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:33 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.143577.1671132093450204625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LIiZjtUN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id g10so7866199plo.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGq3zr3oKEUUZvtA/kvIr8L80NEKFWs2vPvuImFUWNM=;
        b=LIiZjtUNLZW55Vh4ol9wToyyXq3tEkv5AT5GPzuw4qvdDlUBc1YwpFKOqiAKlj1Gzw
         H0smbSnT45mDX9md5xPxrFdKfvJMdPGOalpdVPlzVSkUAoRIjIUTUtpVpqCxNzXDkktv
         xLvt3uaSikqI12O2XoVxrVpDYkZaB5wCpgFhBfeRGoKHBPnhCG3DfP7Yuy8EOsS2NYIX
         DxoCtX0zPsm8mqYbJ1YQ/4jCTfgSrqGVHFysZve4b7SJp3kvvQ9wfePA7FYJoObo/2Uh
         Kh0NlXGlvEZqT+ui/nlL4LiDSvn91+PNuxNWt1h28PJR4M4Wi+X+cK8rimsBD58b/AhA
         g/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGq3zr3oKEUUZvtA/kvIr8L80NEKFWs2vPvuImFUWNM=;
        b=nRX4AvPsHBJtCaTv89+BbfUwM4yeaYYE22NnzAuituKXVJeOLS8ez629rF6pSOF9m3
         ynqAKe3SbYZgoUsy7uXgYZmZqWMSm5zDIlheu9kVLS2KmPXvLJjEak68IGIo+yxLZfCl
         ZEl1z3/DG8B9WHLmRRxik6V8u+EriYDYTYcaavnwwI8KGjQvSa/DhEjlNkUTCpDcX7Ci
         +z/GuIt80vPXE1OxlMsUKO4ZMEXtNu4Ze9gpPW5za88/1NywdnYbQobQyB8ayoTzkrNh
         BHPgJ8qGamHpQlywSa6mHeqb/YX6K+gXh3b/fcSE5QPu+w6RNgagvtZF1Dafl33f0bRS
         Pj/A==
X-Gm-Message-State: ANoB5plo3ev/sTtDSN7k7WowCwSZpuw0OZHm7fy4bP5uc8pkEmbMcBc8
	EYClNTwNvtGW5Q4jZckmuMNkRGnE+vv40Ggxo7Y=
X-Google-Smtp-Source: AA0mqf5kp7iwslXIp81v+2q4dOqywCClS9lU5WojtwG9LEYOoHH627UAfkmUvtoLvTPuF3FuRS5MpA==
X-Received: by 2002:a17:902:6a85:b0:185:441e:2dda with SMTP id n5-20020a1709026a8500b00185441e2ddamr32505954plk.44.1671132092494;
        Thu, 15 Dec 2022 11:21:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/30] xwayland: libxshmfence is needed when dri3 is enabled
Date: Thu, 15 Dec 2022 09:20:42 -1000
Message-Id: <72482a16bb499052248ad155402667654ca911b6.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174610

From: Carlos Alberto Lopez Perez <clopez@igalia.com>

* The build error happens already at configure time:

| meson.build: ERROR: Problem encountered: DRI3 requested, but xshmfence not found

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 451fe4a067432b432b9cd38d2fc78072f6ce5421)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xwayland/xwayland_22.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
index c1c5407dee..51d847a093 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.5.bb
@@ -23,7 +23,7 @@ OPENGL_PKGCONFIGS = "glx glamor dri3"
 PACKAGECONFIG ??= "${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
 "
-PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false"
+PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false,libxshmfence"
 PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false,virtual/libgl virtual/libx11"
 PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false,libepoxy virtual/libgbm,libegl"
 PACKAGECONFIG[unwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
-- 
2.25.1


