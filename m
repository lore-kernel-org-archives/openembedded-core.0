Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62D4C27C51
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.36167.1717244718676266582
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yqkIMLTe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-702548b056aso546796b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244718; x=1717849518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcQHhN3rdzFS7YtD/JnWT+kubW/eOOcJUuN4JOG1wRA=;
        b=yqkIMLTeCyufqL78hHwjBNPhz3661q+MYih0nX1I7XeHGHpjoAOREJqzjBHolGfiQN
         N94imowPXfqR2il3nUDfvp+2oaiLg0JRVoiW/oMS0U0A44CGhSLMitCXGcnOTiR15GJK
         m/w3k2D4UqG3QI2DmgsZlV2CT4+IINiCb18SXVfjIsQ/vRWbLMVr7/rCfVLtcgEBsd5x
         a8UcdQJpGH/Du1cyH4ETg98IRVogrkHjTPiVhkn220CxCQUq9Np/FZV0Htt2kJ3I87eG
         5u49rN/gdRNoGpwo93fbu5rjxFk2/gx0H1JMzJ4Mz+GAnf9tHDKlnI9LTOvkBpXnMhPj
         BZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244718; x=1717849518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcQHhN3rdzFS7YtD/JnWT+kubW/eOOcJUuN4JOG1wRA=;
        b=Tiu4PhP1zJvy82K+4oOm1r4MhWPi7B6Ww35as8T+rS0LftxKA19WN1kRHNYyemKtO3
         etjSe8GVYysrGSI4m/W3A0kOUOBhOfNGqKM5Ps6g93eUQoHU4VnW+Yzflc/IRJlnmK8/
         VZFLH3LRzbo/aSbUFIpZV4UIaiz7RzDOropSn59Cr1asYYaGBhJghDNAaVSHiMPe75PS
         EqtxDTAGeik9H4v+OFM1xkk+uFq0tA6Opzu1xJatGIxHrlvFgx9U7RAxD39dtRVmOV/c
         LAA5QUh3F4uAQ9XzTuQhv9j5bzb5c9oYm/wmm0cABwe8MihumGWBCy/peX6ihPD5ZxlJ
         SxFA==
X-Gm-Message-State: AOJu0YwT2B98SZO9ui9T5XaZARtUTw7Kvt4HHVSf/SakLRkIOtujh/ii
	+KrHa54ZqV+FqVM1uRPNEir7ZTR3z76wdvGID9/hDhlQBVpU6DhleIBT5njgiTqsEPXkJ0MgGdd
	I
X-Google-Smtp-Source: AGHT+IFMarXfFUK6c6HlKSge7V1NB/YbCbJ1IU6KGM47VXywZ9sd+A2+PVOptZ/vRzw5am8J06ITXA==
X-Received: by 2002:a05:6a20:96ca:b0:1b1:f6a9:6b0a with SMTP id adf61e73a8af0-1b26f275a5fmr3956298637.47.1717244717694;
        Sat, 01 Jun 2024 05:25:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/21] gstreamer1.0-plugins-good: Include qttools-native during the build with qt5 PACKAGECONFIG
Date: Sat,  1 Jun 2024 05:24:43 -0700
Message-Id: <4e9274f2719eea91de3c98b9f88a7e2ebebcce90.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200113

From: Marek Vasut <marex@denx.de>

The qttools provide 'lrelease' tool, which is checked by recent
versions of meson build system. Unless the qttools are available
in sysroot, meson will fail to detect qt5 installation at build
time and the gstreamer build will fail. Fix this by including
the qttools-native.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae2ca4af54695003638da38f8548aa8573d18201)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.22.11.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
index edd8609b7c..85143aa1b9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
@@ -52,7 +52,7 @@ PACKAGECONFIG[libpng]     = "-Dpng=enabled,-Dpng=disabled,libpng"
 PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-utils"
 PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
 PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
-PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
+PACKAGECONFIG[qt5]        = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native qttools-native ${QT5WAYLANDDEPENDS}"
 PACKAGECONFIG[soup2]      = "-Dsoup=enabled,,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3]      = "-Dsoup=enabled,,libsoup,,,soup2"
 PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
-- 
2.34.1


