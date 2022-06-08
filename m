Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420C0CCA47B
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:49 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.7242.1654699242798439114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pFP71Qv+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id e9so8236245pju.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vIybM8xMVVyyHP4EZb4QV7puu9i/ecaO/GTsy8DVVjQ=;
        b=pFP71Qv+QhX9FNzA89Ev/SMFJgmElQknx6zD4pLhW83BbtTlt9flZpupcg+HgRqjfo
         BfLDcW+AE4Hcb7KAKvHOic1Pywxrf+PojE6T+8XkD6EIpEeRU9QqHTA9qAqgAw3Wt2Ml
         f9QzKm8dMjYyOPCboBjAFIcVabQRIuCHR8k71mZv7Fu3GVKawVi4ltJNS/Y1RL/F+71s
         DqdgzVlo/HJF/D7f9WHD0CfSLH7g03L05g3Yrb3+OT5R2XqK0eo7/22WkLcwtszcH4MU
         WLAsCZt26gZGSiq6AHN37y2A2GM0K2Li5bzNDSJCsV87fCV0zQxxvZzaBsIFiI2z1aOW
         UZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vIybM8xMVVyyHP4EZb4QV7puu9i/ecaO/GTsy8DVVjQ=;
        b=IGSo39Zq0O3wYNnV2FfNTNT9pKsuMphW5hqln8QYj4xgHVrvFu902/b0ZO4dcrRwAv
         iFhC2Ocwo44cT3hAbCRVBH+dyru7eeFJaysa5bgSTq95V0VccTWmPacfGquHDqO2AtsV
         Fzm2EaML97ULp+GzDzcNKasydkE5QezsAehlkCxkntDFKfieryT9YKEo6bHYfMSwtOwm
         azPJIsUiNdXpxiJ74/M9Q8mfK6sktFyQJHk345VwWrfremdVlPT6CPm14fzSIHPMSKFs
         FkB/5heiKjvJ7tyaiWEqSmwMDW+tE7VxNzddcXGzhza4W6Ir09qWDsc6deOIEQmiwlz/
         05Eg==
X-Gm-Message-State: AOAM533J5R/ovH6nYt8Y/YeJC2SUNOxzVAqKabiHHhawyHkh+NNrgezV
	OUU12jCczHp/UxeorzvPprQudj65Mtkzpa8y
X-Google-Smtp-Source: 
 ABdhPJzI9SkN3mvAcgVsbpNlclKXyrv9Yb120EmC4YOxMQLb+iY1gTPq3EnFkijx7uWzbRZB/1Wo7Q==
X-Received: by 2002:a17:90b:4a4c:b0:1e3:3ad6:a5bd with SMTP id
 lb12-20020a17090b4a4c00b001e33ad6a5bdmr37489174pjb.172.1654699241749;
        Wed, 08 Jun 2022 07:40:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/22] alsa-plugins: fix libavtp vs. avtp
 packageconfig
Date: Wed,  8 Jun 2022 04:39:32 -1000
Message-Id: 
 <daa6eb4deeb1650b63b712f4c25010819fe5d3f7.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166730

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Fix PACKAGECONFIG to refer to libavtp instead of avtp as this is what
the project and everything is really called everywhere.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8824d91fe2063195014c38c134b97946d3b429c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
index c435f61d4c..560fd80f0b 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG ??= "\
         speexdsp \
         ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
 "
-PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,avtp"
+PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,libavtp"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[libav] = "--enable-libav,--disable-libav,libav"
 PACKAGECONFIG[maemo-plugin] = "--enable-maemo-plugin,--disable-maemo-plugin"
-- 
2.25.1


