Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB3C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 11:51:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.21362.1636977085987779470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 03:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C7i7WOJ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id u18so30129346wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 03:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LW2b6cA8q0GTuQzF/uKJs2UW3Y6wVPgnTSsW86dkYT0=;
        b=C7i7WOJ89g0eHcxqfgJSCxytIBm11D96JD8VXuxFgp2MwSEcn2cXNyKlausm4hUfAG
         QvxmCo6rBXVQAnKHkzSIDxZDom6XeC/0RBnUv6JIAD23vC3wEbvWGSClS5jsG6GXaUrN
         gKVdJS920m2aaEcB0+TPD9OvHq0J87w6mGA7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LW2b6cA8q0GTuQzF/uKJs2UW3Y6wVPgnTSsW86dkYT0=;
        b=toxOhy/kukZqykiOnhlSHJSQovnFXw5yiRkIB8eYa6bGMLaISKpotj3jc7Y5jEFbrD
         HE/XbbQJA/5qjsx2tB1ft+gwcAHIZKUlyAdAsLHCBBUq4h7YgGIWxiqgzRfwkdxefFyd
         OodEFRCRob3oRgjRJMJmPTKK/5VLRm5G+VHtQstwli/g69slbjmn8ZnAhjAkOwBLVWUD
         R+Kq1FjxtgHyQiHOCNIVGEQB2DDlCr8jeqMXBTWUQpBdxLlOi8T716+Sy04/nk7MHqL9
         CrP6GTrVghi1ckb4eI7iCtayQx4B+OB12W3AScFYHG8A4Nfu1umk3gCPgem0kZpdMsaq
         A4jA==
X-Gm-Message-State: AOAM532fz6TB8m+9PU0O4VXZ88VmaDPm4+tFhv8iq+C0O9sl9MbeX0fY
	rk0KnQOy5qRoq7J0OdANzYhlKovtK9A5Zg==
X-Google-Smtp-Source: 
 ABdhPJwY0csvmHXeuYe2vJRfDnz6TdhMuCJUEPEzYKeklBTbr6XnAmRqNGW0Kn7JS1b7TDHzQK8AOw==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr33539177wrt.233.1636977083971;
        Mon, 15 Nov 2021 03:51:23 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c4af:9769:123a:c249])
        by smtp.gmail.com with ESMTPSA id
 g13sm13153278wrd.57.2021.11.15.03.51.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 03:51:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lua: Backport fix for CVE-2021-43396
Date: Mon, 15 Nov 2021 11:51:22 +0000
Message-Id: <20211115115123.3978178-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 11:51:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158281

Backport the fix for CVE-2021-43396 ("C stack overflow with coroutines")
from upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...9057a5146755e737c479850f87fd0e3b6868.patch | 43 +++++++++++++++++++
 meta/recipes-devtools/lua/lua_5.4.3.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch

diff --git a/meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch b/meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch
new file mode 100644
index 00000000000..dcdc04837d6
--- /dev/null
+++ b/meta/recipes-devtools/lua/lua/74d99057a5146755e737c479850f87fd0e3b6868.patch
@@ -0,0 +1,43 @@
+From 74d99057a5146755e737c479850f87fd0e3b6868 Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Wed, 3 Nov 2021 15:04:18 -0300
+Subject: [PATCH] Bug: C stack overflow with coroutines
+
+'coroutine.resume' did not increment counter of C calls when
+continuing execution after a protected error (that is,
+while running 'precover').
+---
+ ldo.c             |  6 ++++--
+ testes/cstack.lua | 14 ++++++++++++++
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+Upstream-Status: Backport [https://github.com/lua/lua/commit/74d99057a5146755e737c479850f87fd0e3b6868.patch]
+CVE: CVE-2021-43519
+
+diff --git a/src/ldo.c b/src/ldo.c
+index d0edc8b4f..66f890364 100644
+--- a/src/ldo.c
++++ b/src/ldo.c
+@@ -759,11 +759,10 @@ static void resume (lua_State *L, void *ud) {
+   StkId firstArg = L->top - n;  /* first argument */
+   CallInfo *ci = L->ci;
+   if (L->status == LUA_OK)  /* starting a coroutine? */
+-    ccall(L, firstArg - 1, LUA_MULTRET, 1);  /* just call its body */
++    ccall(L, firstArg - 1, LUA_MULTRET, 0);  /* just call its body */
+   else {  /* resuming from previous yield */
+     lua_assert(L->status == LUA_YIELD);
+     L->status = LUA_OK;  /* mark that it is running (again) */
+-    luaE_incCstack(L);  /* control the C stack */
+     if (isLua(ci)) {  /* yielded inside a hook? */
+       L->top = firstArg;  /* discard arguments */
+       luaV_execute(L, ci);  /* just continue running Lua code */
+@@ -814,6 +813,9 @@ LUA_API int lua_resume (lua_State *L, lua_State *from, int nargs,
+   else if (L->status != LUA_YIELD)  /* ended with errors? */
+     return resume_error(L, "cannot resume dead coroutine", nargs);
+   L->nCcalls = (from) ? getCcalls(from) : 0;
++  if (getCcalls(L) >= LUAI_MAXCCALLS)
++    return resume_error(L, "C stack overflow", nargs);
++  L->nCcalls++;
+   luai_userstateresume(L, nargs);
+   api_checknelems(L, (L->status == LUA_OK) ? nargs + 1 : nargs);
+   status = luaD_rawrunprotected(L, resume, &nargs);
diff --git a/meta/recipes-devtools/lua/lua_5.4.3.bb b/meta/recipes-devtools/lua/lua_5.4.3.bb
index 0224744fe7a..a204242bc02 100644
--- a/meta/recipes-devtools/lua/lua_5.4.3.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.3.bb
@@ -7,6 +7,7 @@ HOMEPAGE = "http://www.lua.org/"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
+           file://74d99057a5146755e737c479850f87fd0e3b6868.patch \
            "
 
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
-- 
2.32.0


