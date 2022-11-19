Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28419C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.30677.1668892568955374794
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4prBoR2/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id b11so7369894pjp.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwUA8tF6734Yf51bdUKhadUmKeVNwZpdHKxlCWMmu9Q=;
        b=4prBoR2/cjpxTRr7IXJq5C3DIXetYtaCX0oq4P5y3pTLvqSI4epOcIFtNU760Y17JX
         LgSiYowk+8zST3lh2IfeJwj6E8mDzlddgwfBISCssbNmKAhu0tOBl15lXIUo+DcH7DOO
         1TU9ovYqF0US8b1cIzGaim//W1EqCZCMqvM3eUeQu6HQeH/yt91GyDjkpmW6W3xC/mdR
         5sGlY1kjDGUSrgMUELM18Rz9g1bt19QIs9HzgV9WMpCNswa5u8tTcYKwz+/jROsREs1M
         2TtjQaEaPlpAUSKKbX/iz6UzOISNPWyZKGciOzfEDZABnE1f+ZtTNmT2ntyOif0NgDxJ
         AQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwUA8tF6734Yf51bdUKhadUmKeVNwZpdHKxlCWMmu9Q=;
        b=AdbFV28ybyq1+1OeakvVDc331o5nHLipy9Elahzhd43ktYBZ+Xc4cs+G958GU54eZ6
         6Oq1z2Vd1ZnBaA9FwvkHn36cCZZnRWr8szX5UZcN7JNFlo1BbU+PcctgAYtGNmMBmCjy
         6t3EK3VhXxxmPxKGR1D+SdH8U4SpPsfJYaD1zs9muYdSzb1l3bkOlxvNR2QAv/9RLaQk
         MfIPSRMmn+n+OyBAbq+l15A8ZYm+f+QR2LQ3rZxYXt+vBGstS5BaU7hiKgcl3G9nNk3v
         0Al2YY+yVqn4rDF6u45DSZllmAy7VxWAL746GuMrSd8PAh+BHa5309rE05bv15u3xdQe
         1qfA==
X-Gm-Message-State: ANoB5pkPuTZchXwemggYAtV/uxllSjUkYyfcEW2oEzYQ09J08oYHhSuU
	r/UdTM/YErlFrazc6XS2j1rLQ/L6Eu8F7+h/Scs=
X-Google-Smtp-Source: AA0mqf6Aj6lTISF4+1tttB5JudL4Tw0nbgypwghMh1T7Fdpi12NkqTa7nH+px2/jE0e09E8WdGZmpw==
X-Received: by 2002:a17:903:26ce:b0:186:8a1e:5055 with SMTP id jg14-20020a17090326ce00b001868a1e5055mr5203709plb.116.1668892567957;
        Sat, 19 Nov 2022 13:16:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 24/35] bluez5: Point hciattach bcm43xx firmware search path to /lib/firmware
Date: Sat, 19 Nov 2022 11:15:03 -1000
Message-Id: <7f742e0f7a401d6762b12b479d05e83be4dff92a.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173564

From: Marek Vasut <marex@denx.de>

Currently the hciattach bcm43xx firmware loader looks up the firmware
blob in /etc/firmware . Change this to /lib/firmware instead, so that
the path is consistent with Linux kernel which also looks up firmware
for the WiFi part in /lib/firmware .

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 72b3b79ad8b980e8dd9470d16b72c2c70072bbc0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f07e318897..a8eaba1dd6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,8 @@ EXTRA_OECONF = "\
   --without-zsh-completion-dir \
 "
 
+CFLAGS += "-DFIRMWARE_DIR=\\"${nonarch_base_libdir}/firmware\\""
+
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.
 NOINST_TOOLS_READLINE ??= ""
-- 
2.25.1


