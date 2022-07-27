Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25E7C19F21
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:26 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.14400.1658882478851420184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cF2twhnV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 x24-20020a17090ab01800b001f21556cf48so547506pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8EvD88UKmgYRQYykSnfqEISHV6TwiBhTO4oxXX3qFK0=;
        b=cF2twhnVq8hDri3IclaJ4/jvs6OlMEvYcjTi13LiSytSxorqgf64whp97uB2DRm9Tg
         xCbYOk6BYzOxic+haeWvbgDj8OPNiLiwCS7Bx7d5LpXpR/NKilP2V14X9c66EmCnVNRf
         Dz8unmJLnDAMTFhuEKN8PHbdHAAcqbWMsY6bKA7OwZM36NVMoGMOum+RYtZlLS2jQvBh
         +okFGP90jEksSbf+0HNd6TOznN1AUiECiLZwkTOeyXsLCSN+kxz/8EQgmIi73N3VKfLk
         XguNXVtLXZcyLAt1IgBTaJiD3gydLk3fGpHseGd6XUJlc6v47zoSd8MVisdxePHmcGXX
         FtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8EvD88UKmgYRQYykSnfqEISHV6TwiBhTO4oxXX3qFK0=;
        b=aC5CvAfl8CerS1tPOtnzPtP9iaMS44lZDRCUpDbEvIl9g1cHjWY1gdbdX2/S8APNY7
         KHryGGcGXdKffpjWmFpKvrTC9ZhkYzcAv3QDwzDfvwaSV1406qWyGBjfLnveV44qBY7t
         HWgegSsm19J4TLAu/Jsm7ucr+tTMDHiNIb//QMlg5QpSF+XjlKwnp2gHVIhDX2iAGPfb
         0Ax7X1r/MjuWnQkdA7Qqird9iM1KIaFZp05I3cz0S6IguH9yPZ5IV3N2oHUCdm/NXfhj
         pW2uBGRhTyjOXt6QhnLCfVykMrICScLGsYzVuE0Y1NWcqdTD+0kdHs2HtqY4LFuQJMeg
         TdRQ==
X-Gm-Message-State: AJIora/hXUjTbKwlVRUT74eVgzN+z+16X5rrsy3vtK1NmaWNpWaDvlwt
	VK4hetaE4RMi0VQinZkCnLEAp9BFABRkPiG4
X-Google-Smtp-Source: 
 AGRyM1ts6pyZ2r4V00jp/6ktXlX7bl0Uj3PQeGd0+Jgw/XjLAPbVtb1M+gdC+Awn0UyCNI3Uxok1Ng==
X-Received: by 2002:a17:90a:5:b0:1f2:ea98:a273 with SMTP id
 5-20020a17090a000500b001f2ea98a273mr1697646pja.155.1658882475450;
        Tue, 26 Jul 2022 17:41:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] lua: Backport fix for CVE-2022-33099
Date: Tue, 26 Jul 2022 14:40:32 -1000
Message-Id: 
 <16be6e3b750c66aab3ef68eaa805b71abd50319a.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168524

From: Khem Raj <raj.khem@gmail.com>

Fixes stack overflow while handling recurring errors in Lua-stack

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit caad9d5f7184f0fa60fa7770e5d3da3f533647cb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lua/lua/CVE-2022-33099.patch              | 61 +++++++++++++++++++
 meta/recipes-devtools/lua/lua_5.4.4.bb        |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-33099.patch

diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
new file mode 100644
index 0000000000..fe7b6065c2
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
index 6f2cea5314..0b2e754b31 100644
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
2.25.1


