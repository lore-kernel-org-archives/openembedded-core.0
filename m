Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB333C54EE9
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:31 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.26241.1661956825220919756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gVOLgsbp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id 199so14552457pfz.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=uY/c0WLrA0ecX8TLAHjSEod3SBMj1XeB9Mb5FMynvfY=;
        b=gVOLgsbpzCNOygtbXg/RCsJnK7arJOwbHWD23rSKuieQa7wpAUxBwIX8XnuWEClaXg
         hZGXHHLOiUugX363RkZTJXb0xPxhSYcTYv4wnblW0Vc+ndXp6FALxq6L52KIgGq6wq4p
         avPxGa2IukbD1YliD3ZSjcKx4pl2cqWzmq3K0tGGa1VsM8LV76Act9DIKkt0oUtDAmtF
         A2s3VRM5KcB9u4HKw2cUgXJfJT52mDL8neGfEN3PemPOBj+VIdvIMCFCYFV7b6PGq7GR
         eCBiF4M3Bz0Qc52Jp1qQBQr3wOzRCAljOxzGaxUn+XY/IoOtRgMHQoyiBUacB+GP5WZV
         rskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=uY/c0WLrA0ecX8TLAHjSEod3SBMj1XeB9Mb5FMynvfY=;
        b=wcshi7K/ZFwaneYYL/WdjFdvzoghYwlTJtFD2WsPw5h+2cB1xBiRcNhbamXeu6v9We
         fmLHP+qa3qvpug2xbSxPm6PczzQcQg+8wzbFL45HXNVeXTDCLCjHenLkYD3qK7T64OYn
         +IaArS81nceectPyv3eWhi8ZZBI7e4hI+8OchpJ2HkgfyC9hn1shVlBqopUcsqvwxkbA
         n7TaB94+o3gQfMt98x9bGrnwyV02xRgEkKrXhD3jKDR2tpebgV6Hj1vvY0vRxu8Z0tgd
         QI7YpWKMguNwRwgcpdcQVhlYA9h9jL4A/14tgbm2Q3a3ZvvewjBmbIEBEk/Zg3vZR7ZD
         n6tg==
X-Gm-Message-State: ACgBeo37juiXvptgaAvngclO/KLNAFYBCormrQZZ6sleYjSYv8nNYHcQ
	crgSC8QoFP6Rk+qcaz23pjzszaeR2fK/DUyk
X-Google-Smtp-Source: 
 AA6agR57WUGEO6m3sEyyyGf6MjMDeY6fVNtFdFg2OHOecpF9fK1UUFdPBlUiiBI4OzESVSzmfBCKrg==
X-Received: by 2002:a65:6255:0:b0:42c:87b1:485b with SMTP id
 q21-20020a656255000000b0042c87b1485bmr8221895pgv.491.1661956824240;
        Wed, 31 Aug 2022 07:40:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/19] xinetd: Pass missing -D_GNU_SOURCE
Date: Wed, 31 Aug 2022 04:39:35 -1000
Message-Id: 
 <e9e3eb43709867a99403a0ab4472ad9b0f1cc9e4.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170126

From: Khem Raj <raj.khem@gmail.com>

We do not get proper function definitions otherwise e.g. fcvt()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 21dd5bae177b64e314a6423e5ffbd7b28b6b5891)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 62ee70d244..897417314d 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -30,6 +30,8 @@ INITSCRIPT_PARAMS = "defaults"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 CONFFILES:${PN} = "${sysconfdir}/xinetd.conf"
 
 do_install:append() {
-- 
2.25.1


