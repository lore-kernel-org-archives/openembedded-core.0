Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59BBC43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 14:50:35 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.16375.1658069432511153918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 07:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m0Kq0PY1;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id s27so8508963pga.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mcD85LKBGMfszjZfc7HI4i50Seyf6pNkQle7EdHF9A=;
        b=m0Kq0PY1PZtGcfOybE31+D603JD07fXnfBUOh/j/V23CbOhWf3qUWxhCVHURTd2xWA
         ggu0Q6o51GnPU7HEGjaqTJ4nLlxh3rknFmH/kjIfW5fBzyD5XSAUklkPnWL3GBjaDrJS
         PEUX3W03CttONn0S9MffrlW+Jlc68e0DV3YpV/tj4oogSbo3ntcfU41WcQjQVCqbP+rl
         TOsrFOGU3M4wuTujL6h3vDekuZgS+GzDtYO61rdn0sJVYoavqoNe0Skblug2xdkChKGW
         YREgmRhkADNuTCrt+pyJdI05pLf9hTUemvqd3vJfxmvXqvmBBWhA3haHAr3wmQb+6Uyb
         ugTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mcD85LKBGMfszjZfc7HI4i50Seyf6pNkQle7EdHF9A=;
        b=EJxF2ENMExqtK5UfR3EoOwMJ6XtXwVoicc+WjqPdugDufIr/9Qx03mKMHnvTGlPPU5
         gDmdHzmmk+bzpOcYMdFtqdBa8AXXuhi2Kua641XvHz9SK22RrmD2hwLlvfacQaGPCyUU
         hMCovPToyTSKLDl5XgUgAeVyHOzecnYSdqaqGA1dWii3RogSawmjTgnNQCz0nuM3zLHe
         LUIIqfQjnQGfOgzhM0IcwQVHkh5gk3SfIcTpwgewn8kx0EfJlNyw98aeHKRyFvDtFBnr
         FGlW+AoLAMqfA8kjxIdAXiP1hTcBhblYQR+dcQ44aeXBY7CF0KZXkcfDy/ER2aGvXV4Z
         1iYw==
X-Gm-Message-State: AJIora/pSxxNzE83tPjUeZd3IA5QmMpWgLbwhVaA5AXBStGaoULWiwP9
	SuXiaUchrZfkSyalk/kNBnDbCBuD+M3BiQ==
X-Google-Smtp-Source: 
 AGRyM1vUK6QXg4Sld7a/gRLPpU6ReqOshFyw+fREGmCVhVKjUxSwiVDK83Hf5rD7HvIVhAr/DxiI/Q==
X-Received: by 2002:a63:d5:0:b0:41a:58f:929e with SMTP id
 204-20020a6300d5000000b0041a058f929emr4798783pga.260.1658069431534;
        Sun, 17 Jul 2022 07:50:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 j10-20020a170902da8a00b0016c09e23b21sm7457629plx.215.2022.07.17.07.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 07:50:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lua: Backport fix for CVE-2022-33099
Date: Sun, 17 Jul 2022 07:50:27 -0700
Message-Id: <20220717145027.4109980-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 14:50:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168159

Fixes stack overflow while handling recurring errors in Lua-stack

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lua/lua/CVE-2022-33099.patch              | 61 +++++++++++++++++++
 meta/recipes-devtools/lua/lua_5.4.4.bb        |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-33099.patch

diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
new file mode 100644
index 00000000000..fe7b6065c2a
--- /dev/null
+++ b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
@@ -0,0 +1,61 @@
+From 42d40581dd919fb134c07027ca1ce0844c670daf Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Fri, 20 May 2022 13:14:33 -0300
+Subject: [PATCH] Save stack space while handling errors
+
+Because error handling (luaG_errormsg) uses slots from EXTRA_STACK,
+and some errors can recur (e.g., string overflow while creating an
+error message in 'luaG_runerror', or a C-stack overflow before calling
+the message handler), the code should use stack slots with parsimony.
+
+This commit fixes the bug "Lua-stack overflow when C stack overflows
+while handling an error".
+
+CVE: CVE-2022-33099
+
+Upstream-Status: Backport [https://github.com/lua/lua/commit/42d40581dd919fb134c07027ca1ce0844c670daf]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ldebug.c | 5 ++++-
+ lvm.c    | 6 ++++--
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+--- a/src/ldebug.c
++++ b/src/ldebug.c
+@@ -824,8 +824,11 @@ l_noret luaG_runerror (lua_State *L, con
+   va_start(argp, fmt);
+   msg = luaO_pushvfstring(L, fmt, argp);  /* format message */
+   va_end(argp);
+-  if (isLua(ci))  /* if Lua function, add source:line information */
++  if (isLua(ci)) {  /* if Lua function, add source:line information */
+     luaG_addinfo(L, msg, ci_func(ci)->p->source, getcurrentline(ci));
++    setobjs2s(L, L->top - 2, L->top - 1);  /* remove 'msg' from the stack */
++    L->top--;
++  }
+   luaG_errormsg(L);
+ }
+ 
+--- a/src/lvm.c
++++ b/src/lvm.c
+@@ -656,8 +656,10 @@ void luaV_concat (lua_State *L, int tota
+       /* collect total length and number of strings */
+       for (n = 1; n < total && tostring(L, s2v(top - n - 1)); n++) {
+         size_t l = vslen(s2v(top - n - 1));
+-        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl))
++        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl)) {
++          L->top = top - total;  /* pop strings to avoid wasting stack */
+           luaG_runerror(L, "string length overflow");
++        }
+         tl += l;
+       }
+       if (tl <= LUAI_MAXSHORTLEN) {  /* is result a short string? */
+@@ -672,7 +674,7 @@ void luaV_concat (lua_State *L, int tota
+       setsvalue2s(L, top - n, ts);  /* create result */
+     }
+     total -= n-1;  /* got 'n' strings to create 1 new */
+-    L->top -= n-1;  /* popped 'n' strings and pushed one */
++    L->top = top - (n - 1);  /* popped 'n' strings and pushed one */
+   } while (total > 1);  /* repeat until only 1 result left */
+ }
+ 
diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index 6f2cea53147..0b2e754b313 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -7,6 +7,7 @@ HOMEPAGE = "http://www.lua.org/"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
            file://CVE-2022-28805.patch \
+           file://CVE-2022-33099.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "
 
-- 
2.37.1


