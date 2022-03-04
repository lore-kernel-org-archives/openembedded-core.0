Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EC6C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:18 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.7950.1646406316729376203
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=W+37K89U;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id bc27so7745264pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q/rjlvK/axnWLbDMS0ZHZC2K9h+cBOFreGdP7kdLmo0=;
        b=W+37K89Ul3ZGsLFWxHToa/WiQIwDtCM0IbLo0Qq0KNsgwZPlfVfnb3jECIGw8nTnhK
         stzM8Qz78ZOLIqnqJ2Tu5A7203UiiDTPMa7BJmIMKzXWDT5OPTxmAp1Su6PE0bh5+L5F
         lPPBEUzbBbAQHqGRXkprKE+YK9s7GHwDcAF+NaodsnQwFFH5KKKW5CCd1IL5XmtPKK8z
         i3YMEJd6yzpzgbPXMOlrEejOBaVekkEPeNCAoDT0JWQYJjS1C0qCkjvO/KEj5aqKU4Kk
         V36kafyb3fkmi7vRe+v4IUZ6MFs0/y7Ln38UGoJdwS21G1mgqbv8YErLve+MD4JRfzfU
         792w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q/rjlvK/axnWLbDMS0ZHZC2K9h+cBOFreGdP7kdLmo0=;
        b=xEq0TX96lobX+A1tO/il/dtQXbyLHGD/WYPKI1GpbINGiFk0oh9X+PvqAGpmMA8jfO
         K/2cPznpbLWESWkzUSDJpAJ9h7xURKu9iY5lE5B97mv0bgz7dXgv0GPn1mqxaJDeMoly
         P1gzpk2Lct2hpxQpkn21bAtEqTRizc2oboZWWJxFML63rE1+7RX64KSZ+uhcg7Ug6uUX
         2BMpp4500hGUFf4e4xeuZZQ6q3GZwTluDI8Wtp4gpseL0anovyOqpHNvXk8IYQCbpb63
         JINnSrmAvp2ywtosgmYauTRxk2i9flForMtSyi3TKlUn18cVci7dctJkExaoJXcl72ly
         UZpw==
X-Gm-Message-State: AOAM5320NrdC1joPs2x5u5Mk3HR888JceJusN77rMQuEn8f4D3ed0a8l
	3KSCg5VK8KqPdqargnhA4A+/Nx9OrsKqu/dHivk=
X-Google-Smtp-Source: 
 ABdhPJwmTWok9f6hck3jFtuDgf5nT2FRAhZ+z7/vQhqmJCvvoXldDU+2/l3L9Vzs8IX1oxjeGymo5Q==
X-Received: by 2002:a63:4386:0:b0:378:b62e:28b3 with SMTP id
 q128-20020a634386000000b00378b62e28b3mr20795162pga.442.1646406315853;
        Fri, 04 Mar 2022 07:05:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/18] cml1.bbclass: Handle ncurses-native being
 available via pkg-config
Date: Fri,  4 Mar 2022 05:04:22 -1000
Message-Id: 
 <dc6b20475a69c9fbab9a97a93119aeedf54deb23.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162733

From: Nathan Rossi <nathan@nathanrossi.com>

The linux kernel will by default use pkg-config to get ncurses(w) paths,
falling back to absolute path checks otherwise. If the build host does
not have ncurses installed this will fail as pkg-config will not search
the native sysroot for ncurses.

To more all kernel/kconfig sources, inject the equivalent native
pkg-config variables similar to what is done by the pkg-config-native
script. This only affects the menuconfig python task itself and the
oe_terminal call inside it.

(cherry picked from commit abb95c421bb67d452691819e3f63dabd02e2ba37)
Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cml1.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 8ab240589a..46a19fce32 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -36,6 +36,14 @@ python do_menuconfig() {
     except OSError:
         mtime = 0
 
+    # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
+    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pkgconfig")
+    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NATIVE}/pkgconfig")
+    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
+    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
+    # ensure that environment variables are overwritten with this tasks 'd' values
+    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
+
     oe_terminal("sh -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
 
-- 
2.25.1


