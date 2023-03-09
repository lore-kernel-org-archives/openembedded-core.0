Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714AEC6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:59:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5735.1678402739783205527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=I8kzpDut;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id y11so3703054plg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKCJHEE1EEXHUk5J4tqp1SIVL5zX7uOHvscgrWEav8g=;
        b=I8kzpDutX3OCTji5ju4GUSikxv1Y6jWjiII4I41kQj1qo83zOmljfo1J5vMHNOzZIW
         LJVzkTqIraQ4ax2I0fMnZVAxq9mzLRInjBeqwi1vMbz/Y/pig6dB39DWWaJKbdbjpddH
         QByzML3EkT5yxmd5lppLfF3ypfnZ2khLWqmrmhpY2FqsrpVzf3gS9DtMWAkrFSdv6nKk
         //jCnSWJHN8v2WtbyaQohmm2pzTLXnrb4eATs+eJRfCu0ribaXcH+XeZrSwhLHrUyd8i
         fdnV5ebyhKsB4SWjE1IQov4GHvEi9i3/cGx/TlWhfJhD8/Pt201PQG3tvAYw6Z+TAokQ
         XRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKCJHEE1EEXHUk5J4tqp1SIVL5zX7uOHvscgrWEav8g=;
        b=jBOcvepu5LWXlFACJH+0waRFW6vXV96cSvklnS9yEoYCLY6uklIRk89WR2J9F//s3L
         Sr4o2lsLNe9aIsxp5bp9qqwonVaMalBkweYZbIPoG2SVbU1H4ZmNwsCWX9x5ZL24gcNm
         AJHe0QJfBvz6dcb+q/FwJY9uv974R+umBLdi9Q4+o9Vx1eq+M9nErEJfqym8VTemVipP
         k1bdYMb0duXvpjRrOe5jrUUCl8LwZ4N9hmGfhJoJXU0Ig72lvQDvyn/+0ohvo4KRIDRo
         PluW9hVe3hZr1j1UjCPWHFGxxD2BJILv07E5xU8HDQVpMl203XBTPLTsyuUhQF2EkvU1
         R9aA==
X-Gm-Message-State: AO0yUKWg4duddrhRpIlVNDPDQu8HpkuG1CVKre0ZVjpFz0EoIC5k4n4q
	nHP1dlq1mNItsqlFL6hqOpQPyfUKru/W7jU4+l4=
X-Google-Smtp-Source: AK7set/E/QzjJG9BvnMj1lr9V9FPfSTRGWRgz4Ijrfxk87jk+iPzYGiA6IFLToIexrToU+PtOFSULg==
X-Received: by 2002:a05:6a20:729b:b0:be:cbee:edbc with SMTP id o27-20020a056a20729b00b000becbeeedbcmr234452pzk.24.1678402738817;
        Thu, 09 Mar 2023 14:58:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/27] lua: Fix install conflict when enable multilib.
Date: Thu,  9 Mar 2023 12:58:01 -1000
Message-Id: <e1b76afecfa97766ce05ad541f9e95178a2b1b55.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178299

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/luaconf.h conflicts between attempted installs of lua-dev-5.4.4-r0.aarch64 and lib32-lua-dev-5.4.4-r0.armv7ahf_neon

The differences between the two files are as follows:
@@ -219,7 +219,7 @@

 #define LUA_ROOT       "/usr/"
 #define LUA_LDIR       LUA_ROOT "share/lua/" LUA_VDIR "/"
-#define LUA_CDIR       LUA_ROOT "lib64/lua/" LUA_VDIR "/"
+#define LUA_CDIR       LUA_ROOT "lib/lua/" LUA_VDIR "/"

 #if !defined(LUA_PATH_DEFAULT)
 #define LUA_PATH_DEFAULT  \

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b58d86f9902a7eb7a821a3e36ba298c082c0f1f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/lua/lua_5.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index 0b2e754b31..a39d888ec2 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -57,3 +57,6 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${includedir}/luaconf.h"
-- 
2.34.1


