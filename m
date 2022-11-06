Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A45DC4321E
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:04:22 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.17571.1667750656479486971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ne51eKSC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id g129so8422799pgc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 08:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmaCXYSKM8fehfsPYvn9cHHfnUhnODty/4ZRsK7DAUk=;
        b=Ne51eKSCBTWhLn8uzPRdvffaJky1OwwiE9orNMIoqV6trb8/wSKZdJdt7vYQaSAUl1
         jxtwPoP/ULws8rguez2uD2Q3hJ0pY5qsu9c7DwgclH3uFZ8ZrEDPbLfTTtYqffx5Drk2
         LI61qE128YF/0ZALY2VhR/cCTsz5xeWwJB5ljCT57TdGh1XbpbcNSD7mBBGLYfAyOhoL
         kI5KV2m8EDddePH48et+1Scxyngf0Yh9tTEpZPaqo69cuZ5jmCOcTKfFvgj+KH/y7TyD
         umdV+DE6gUl7VAKsMRbPkfIECGNG9waQqNSiBE728UCTXL2Gs2HGuvngGqigoUtiURA4
         BvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmaCXYSKM8fehfsPYvn9cHHfnUhnODty/4ZRsK7DAUk=;
        b=XTC0KenlvPfEKf+b+OdTNjxwmJN5Umeu1vP63mWAkTAYgTWWlxxHLv/stgv+j8voQJ
         F5urFL2NiO6DETS0YO2gpF0/cOv6f458ZvsIXHhxRcTSl55K54ywlLCSNaocAaCh9MF9
         7jicN6RfwQUkla0pTPob7dPACE6OOCKUEIFijpLdMkK9gplsPUQg+v6dhUa4YItDlDoV
         Y0CgNKm1NlbAOJdtH7Lpj071V19XPT1cWnNFwkHFNQYRuPm+3Wz7RlPsVooldwHFHhhk
         P/ei7oSu6b0b4DYpRkmaItL1YeD0kNZWs7im82PqdcoOmnE0pDHEEAdu1d6dY6yrp7Hj
         0kQg==
X-Gm-Message-State: ACrzQf33euPdbpVpMJPwOe6b7NYYpBqkz3TP0Qd2LgkoPCnWg4IxO00n
	W6yrWRoIzCBF3kMcw7zjBZgoyNHKmms+edx0
X-Google-Smtp-Source: AMsMyM6RKMDp3rK7TNTVsQI4iwFbzzJB8M9uvE4ylRfaKyBr5VGUSR88QUmbzFAMZ9VduRd0v+eoxg==
X-Received: by 2002:a63:ee4f:0:b0:46f:87a8:97ab with SMTP id n15-20020a63ee4f000000b0046f87a897abmr36400356pgk.349.1667750655525;
        Sun, 06 Nov 2022 08:04:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b0018700ba9090sm3294683plg.185.2022.11.06.08.04.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 08:04:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] coreutils: add openssl PACKAGECONFIG
Date: Sun,  6 Nov 2022 06:03:52 -1000
Message-Id: <590d8f2bdbb7ea558b9e99e58a1dae2b5eb58153.1667750511.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667750511.git.steve@sakoman.com>
References: <cover.1667750511.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172813

From: Daniel McGregor <daniel.mcgregor@vecima.com>

coreutils-native will pick up openssl on the host if it's GPL
compatible (version >= 3), which causes uninative failures with hosts
that don't have openssl3.

Add a PACKAGECONFIG entry for openssl so it can be enabled, but isn't
by default.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9859a8124a0c09ac38d476445e7df7097f41d153)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 3d569881e8..3841f71155 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -51,6 +51,7 @@ PACKAGECONFIG_class-nativesdk ??= "xattr"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[xattr] = "--enable-xattr,--disable-xattr,attr,"
 PACKAGECONFIG[single-binary] = "--enable-single-binary,--disable-single-binary,,"
+PACKAGECONFIG[openssl] = "--with-openssl=yes,--with-openssl=no,openssl"
 
 # [ df mktemp nice printenv base64 gets a special treatment and is not included in this
 bindir_progs = "arch basename chcon cksum comm csplit cut dir dircolors dirname du \
-- 
2.25.1


