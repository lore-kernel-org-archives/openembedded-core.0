Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F36C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.28064.1658155808031232534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1cNXZxaS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id b133so7038219pfb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Sf7zrHy3sQRtYUR0Aetr0Rb4uIAk/kLXPD2edu3/xgc=;
        b=1cNXZxaSExV+tvex64BQHPh00VwPDKzhmHUzqp8abmYKYxktMKhpePqWU0/bHp+Dej
         x94AP4fT+/odlvQn1UTJgkpnNailpUccTlHfgvIGYz72O2A2DgLeHK1YFg3shZubDdAb
         Y3oRxvRWUTN78wz9Z0jAbF3T6YEAbTPXBTCzD/8K77BAcu2ixQ26pms2TxahrXDsUpxE
         +AGYz/T/wdOyVIjdIB5gFhuPNP+OT9TpbNIV8KblUm8dwfUHMgicSpRSgLnfgfFpPnUJ
         hVhwZ3Mk9ikHk85IHYWdUmC0AgzV1TcSxKapQyNQdoyS+A7TfU0X4lxMkWGFWFlHjEMr
         Ot7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sf7zrHy3sQRtYUR0Aetr0Rb4uIAk/kLXPD2edu3/xgc=;
        b=K9aFmlN+BLhFW+rj2RSu4DFhdKyUMqPUgHkDIYzrYzzxPdSlmlRu4P4Yh9t0gL20qi
         IfrooZEG1AXa0HuAnIBBxAfW+cj6/sUQWprPgSR2cjgOjH5Vz4sb1fXe6eRSjZOvbDHp
         /bo8IPkEqVnYL67HMMseqq9OJvWsfH3+5uywv4vAQMjvg1GCR0uFJHSeRHboBotP56kx
         gGZzZ3KKcSAXZi56g6j5ZSSoyk4Mv9AeBssyvgR2RlwlAYho75HR6lRsXZgN7he03Tj/
         msexf2t6vW/PoxpaWU6ZYuobaGV8Eg05bAzM/Vs5ORWYqMAjZZliDyoEVxtBC8e12qat
         gq+g==
X-Gm-Message-State: AJIora//uWr02d7yODkG2apNi/uEPy6a2jlaQ9MB0Qho97Dd1N1Z9EoW
	BCn2iPdSJbmgeoUb1v2DTohMXh0lKz8Arde3
X-Google-Smtp-Source: 
 AGRyM1utKaIKvauo31Hrh1kaRoURM3bcBqJZ+VbFwEq9YqqdL+iP41vnyzaq9g8xOlWwAImkAsL5Bw==
X-Received: by 2002:a63:1f4b:0:b0:41a:daa:3068 with SMTP id
 q11-20020a631f4b000000b0041a0daa3068mr8177763pgm.330.1658155806922;
        Mon, 18 Jul 2022 07:50:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/35] lua: Fix multilib buildpath
 reproducibility issues
Date: Mon, 18 Jul 2022 04:48:43 -1000
Message-Id: 
 <dfe0a723bc76f6f98b8edcaf84563a39a64e2c3c.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168218

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The .pc we install ourselves for lua has hardcoded /lib assumptions in it
which means in a multilib environment, full build paths end up in users
like rpm's configuration.

Fix the .pc file to use a correct includedir and libdir to resolve
those reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 93bee5c74b8d181adf93de4b4101e25d24780603)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/lua/lua/lua.pc.in | 5 ++---
 meta/recipes-devtools/lua/lua_5.4.4.bb  | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/lua/lua/lua.pc.in b/meta/recipes-devtools/lua/lua/lua.pc.in
index c27e86e85d..1fc288c4fe 100644
--- a/meta/recipes-devtools/lua/lua/lua.pc.in
+++ b/meta/recipes-devtools/lua/lua/lua.pc.in
@@ -1,6 +1,5 @@
-prefix=/usr
-libdir=${prefix}/lib
-includedir=${prefix}/include
+libdir=@LIBDIR@
+includedir=@INCLUDEDIR@
 
 Name: Lua
 Description: Lua language engine
diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index d704841378..6f2cea5314 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -45,7 +45,7 @@ do_install () {
         install
     install -d ${D}${libdir}/pkgconfig
 
-    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
+    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
     install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
     rmdir ${D}${datadir}/lua/5.4
     rmdir ${D}${datadir}/lua
-- 
2.25.1


