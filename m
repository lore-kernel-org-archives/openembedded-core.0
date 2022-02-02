Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4947AC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:20 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.2292.1643826499021618230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QFpaycsf;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w25so390550edt.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQY4EneKJzejJgMT+Ge8lSYQU+y5hDmbD9R0I3HJvI0=;
        b=QFpaycsfPSWcbF4/JWF9EN3VT1/8yvFTEx4PfPnQ+x3xAeSn6IW0LYfKbortIl4rke
         Q46X+xAre+3gA/GU3U5E7RIRzqbnwrfv/aihz20w59iYz2Uf4IRTZCZaF+/2Gqu2LfBc
         gY942lvvD9xrbxlt4Sh3uuovwXgts9pPiiCr24C55FHM54mrbtVOMjOjE8uP3yvXSmhs
         KTxgf+7Tpp8kn6CLfDYVcCAlTDIi1CDZFPTqnRMBU8yOECOF6XeMzJF5m6fMUjRCSWeI
         ulXpLUmjX3dwblCFlC71SABYikoAn+ongDdpT8OxIHA/NCAxGoFMT42Qu+c4Kbu0gy5x
         m42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQY4EneKJzejJgMT+Ge8lSYQU+y5hDmbD9R0I3HJvI0=;
        b=q10fd3M1eCfiBj8skDFmleqYyen+INDJFPilYlF1TyVYOHN7zX6i9tEPk5wfLs27tq
         SS4MMdPCYLiLJv7F33vKXkGTrTaTP/a/NueTP0KvLGKHDxREm8lq+QZ8z4hObuaCWnRo
         IQxXVC/jfb6KV+Wp2vBHjTlKn1VHpkzTQI0gR++UkUrk323DQp8A12mGWu0KTrwcHzSR
         aFigVXL83QiKgBElt10T3iaHrbpASHzQm8O4xut/84hpy3JkqBU1KV00wMYvDGOWe9LX
         UZ2jx5ByP1c5tCPx8zqwWep0DM54UCCLwE/Gty2IJ1jRKqXMdinIpQYuRWB4zYVtRzoV
         EpFg==
X-Gm-Message-State: AOAM530MCAJx2C2M7/m61CQ87Xe8umzhSE+3yv5zd+aHRlYOSuaciTyN
	hmTIl2KaGftNJEQty+B3cDvc4GDQdbc=
X-Google-Smtp-Source: 
 ABdhPJyOLqAWlp+nKOjcguLBg0Xtc+lv73jkb7xspoPfWiJ/wtJiTcCCyjHDEy0mlhcmpVKNh1Vktg==
X-Received: by 2002:a05:6402:2792:: with SMTP id
 b18mr31281684ede.344.1643826497551;
        Wed, 02 Feb 2022 10:28:17 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/33] lua: upgrade 5.4.3 -> 5.4.4
Date: Wed,  2 Feb 2022 19:27:42 +0100
Message-Id: <20220202182758.919991-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161242

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...9057a5146755e737c479850f87fd0e3b6868.patch | 43 -------------------
 .../lua/{lua_5.4.3.bb => lua_5.4.4.bb}        | 12 ++----
 2 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch
 rename meta/recipes-devtools/lua/{lua_5.4.3.bb => lua_5.4.4.bb} (80%)

diff --git a/meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch b/meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch
deleted file mode 100644
index dcdc04837d..0000000000
--- a/meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 74d99057a5146755e737c479850f87fd0e3b6868 Mon Sep 17 00:00:00 2001
-From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
-Date: Wed, 3 Nov 2021 15:04:18 -0300
-Subject: [PATCH] Bug: C stack overflow with coroutines
-
-'coroutine.resume' did not increment counter of C calls when
-continuing execution after a protected error (that is,
-while running 'precover').
----
- ldo.c             |  6 ++++--
- testes/cstack.lua | 14 ++++++++++++++
- 2 files changed, 18 insertions(+), 2 deletions(-)
-
-Upstream-Status: Backport [https://github.com/lua/lua/commit/74d99057a5146755e737c479850f87fd0e3b6868.patch]
-CVE: CVE-2021-43519
-
-diff --git a/src/ldo.c b/src/ldo.c
-index d0edc8b4f..66f890364 100644
---- a/src/ldo.c
-+++ b/src/ldo.c
-@@ -759,11 +759,10 @@ static void resume (lua_State *L, void *ud) {
-   StkId firstArg = L->top - n;  /* first argument */
-   CallInfo *ci = L->ci;
-   if (L->status == LUA_OK)  /* starting a coroutine? */
--    ccall(L, firstArg - 1, LUA_MULTRET, 1);  /* just call its body */
-+    ccall(L, firstArg - 1, LUA_MULTRET, 0);  /* just call its body */
-   else {  /* resuming from previous yield */
-     lua_assert(L->status == LUA_YIELD);
-     L->status = LUA_OK;  /* mark that it is running (again) */
--    luaE_incCstack(L);  /* control the C stack */
-     if (isLua(ci)) {  /* yielded inside a hook? */
-       L->top = firstArg;  /* discard arguments */
-       luaV_execute(L, ci);  /* just continue running Lua code */
-@@ -814,6 +813,9 @@ LUA_API int lua_resume (lua_State *L, lua_State *from, int nargs,
-   else if (L->status != LUA_YIELD)  /* ended with errors? */
-     return resume_error(L, "cannot resume dead coroutine", nargs);
-   L->nCcalls = (from) ? getCcalls(from) : 0;
-+  if (getCcalls(L) >= LUAI_MAXCCALLS)
-+    return resume_error(L, "C stack overflow", nargs);
-+  L->nCcalls++;
-   luai_userstateresume(L, nargs);
-   api_checknelems(L, (L->status == LUA_OK) ? nargs + 1 : nargs);
-   status = luaD_rawrunprotected(L, resume, &nargs);
diff --git a/meta/recipes-devtools/lua/lua_5.4.3.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
similarity index 80%
rename from meta/recipes-devtools/lua/lua_5.4.3.bb
rename to meta/recipes-devtools/lua/lua_5.4.4.bb
index a204242bc0..f50328ecfd 100644
--- a/meta/recipes-devtools/lua/lua_5.4.3.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -7,19 +7,13 @@ HOMEPAGE = "http://www.lua.org/"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
-           file://74d99057a5146755e737c479850f87fd0e3b6868.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-PV_testsuites = "5.4.3"
+PV_testsuites = "5.4.4"
 
-SRC_URI[tarballsrc.sha256sum] = "f8612276169e3bfcbcfb8f226195bfc6e466fe13042f1076cbde92b7ec96bbfb"
-SRC_URI[tarballtest.sha256sum] = "5d29c3022897a8290f280ebe1c6853248dfa35a668e1fc02ba9c8cde4e7bf110"
-
-# remove at next version upgrade or when output changes
-# was added after intermittent repro failures poisoned the cache
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".2"
+SRC_URI[tarballsrc.sha256sum] = "164c7849653b80ae67bec4b7473b884bf5cc8d2dca05653475ec2ed27b9ebf61"
+SRC_URI[tarballtest.sha256sum] = "04d28355cd67a2299dfe5708b55a0ff221ccb1a3907a3113cc103ccc05ac6aad"
 
 inherit pkgconfig binconfig ptest
 
-- 
2.20.1


