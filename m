Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D497C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 18:07:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.23185.1658945244059541788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CV3g4KaK;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id v17so2928582edc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c7ET7Ad0bMPAc6wfn4FoWD2tSRXqMd0rIzU4ctX+EdQ=;
        b=CV3g4KaKN3ePyLppSNYSoITzM5ZpelhytwYCgqGbMAP+tsoHkDmuDf8MemK7b+Sauj
         ec8maUnQQgF63Oags2MUoajnLXBD9HZWEHW8CyRXJtfMn2leq52n/DX6MhoST1xGMGFc
         pdmwK6emEx+D7vncFF5WqT2JboVENMrHfzWcoXPqP7W3XM31rQqu0xveFnV2il8vBuB1
         ohvw6yacKpMhe6vXMTsWkVRrhoeNzPW86hMFrpWuezOyMwcGCoRDLbxUEcFXk2Bxq3Fo
         Kv7QuHHk0EdO7bTgEYQdRyZVQul4Bda9s7vkft1djXoJQIUfQt/50Oqm1D4zDRh9FGy+
         J/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c7ET7Ad0bMPAc6wfn4FoWD2tSRXqMd0rIzU4ctX+EdQ=;
        b=ksMr9h0/qSQPT+vYhVFnJo5bbrnr3XZr2bO38U4Y7Wd0Kj144Bc3DzHygi0p4KMUWj
         DEARRc1EolfrxS7wL4grQf175mDAFD3QXSZSAvWoRNw1i8Fazb0x/elzsX0EnwUIUiFb
         JzfHakNsROgb6JVq0Y/MGN4YqemG3ljc3vFvwCzXBwz82rzFyRlBCYnzUrz7d4THBa0g
         UXmliVCAfXi1aw6MxIQOlb9N8R7GpYYhMTzm/mLGvhP9uhNBrZ3UBDYrSUNXb6o8GorL
         /QauyYEDsel/Glm2n5g2J16HmmSY2igGaBeZU8Kk9v3ho1YqiLPex8zDZo2NAyqceVWB
         QcpA==
X-Gm-Message-State: AJIora8tst/Z7OjIYOwdfUzKmaEu0EX2wSpt8rgr1q28k+3MDJ3qSZZo
	v7h+uVAteWEszCf32OUTNLQyBKP4fl4PNdpb4L4f0Q==
X-Google-Smtp-Source: 
 AGRyM1voXapSrZ964veBNak+FONyNPhaV/Xxvd4nnu7W3Tz9odnP69bFJEYVLqpNiZcdcTVFTz6yBT8m/qfgoPxBGYI=
X-Received: by 2002:a05:6402:5193:b0:43b:e957:cdef with SMTP id
 q19-20020a056402519300b0043be957cdefmr19174133edd.345.1658945241688; Wed, 27
 Jul 2022 11:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220727174851.793703-1-joe.slater@windriver.com>
In-Reply-To: <20220727174851.793703-1-joe.slater@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 27 Jul 2022 08:07:10 -1000
Message-ID: 
 <CAOSpxdZp6FtWcCu-ckn2AF4JNpLStrbtLudaNtSytpONGOLp=A@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] lua: Backport fix for
 CVE-2022-33099
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 18:07:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168586

This patch is in the set currently out for review:

https://lists.openembedded.org/g/openembedded-core/message/168524

So it should hit kirkstone in the next few days.

Steve




On Wed, Jul 27, 2022 at 7:48 AM Joe Slater <joe.slater@windriver.com> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Fixes stack overflow while handling recurring errors in Lua-stack
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit caad9d5f7184f0fa60fa7770e5d3da3f533647cb)
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../lua/lua/CVE-2022-33099.patch              | 61 +++++++++++++++++++
>  meta/recipes-devtools/lua/lua_5.4.4.bb        |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
>
> diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
> new file mode 100644
> index 0000000000..fe7b6065c2
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
> @@ -0,0 +1,61 @@
> +From 42d40581dd919fb134c07027ca1ce0844c670daf Mon Sep 17 00:00:00 2001
> +From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
> +Date: Fri, 20 May 2022 13:14:33 -0300
> +Subject: [PATCH] Save stack space while handling errors
> +
> +Because error handling (luaG_errormsg) uses slots from EXTRA_STACK,
> +and some errors can recur (e.g., string overflow while creating an
> +error message in 'luaG_runerror', or a C-stack overflow before calling
> +the message handler), the code should use stack slots with parsimony.
> +
> +This commit fixes the bug "Lua-stack overflow when C stack overflows
> +while handling an error".
> +
> +CVE: CVE-2022-33099
> +
> +Upstream-Status: Backport [https://github.com/lua/lua/commit/42d40581dd919fb134c07027ca1ce0844c670daf]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + ldebug.c | 5 ++++-
> + lvm.c    | 6 ++++--
> + 2 files changed, 8 insertions(+), 3 deletions(-)
> +
> +--- a/src/ldebug.c
> ++++ b/src/ldebug.c
> +@@ -824,8 +824,11 @@ l_noret luaG_runerror (lua_State *L, con
> +   va_start(argp, fmt);
> +   msg = luaO_pushvfstring(L, fmt, argp);  /* format message */
> +   va_end(argp);
> +-  if (isLua(ci))  /* if Lua function, add source:line information */
> ++  if (isLua(ci)) {  /* if Lua function, add source:line information */
> +     luaG_addinfo(L, msg, ci_func(ci)->p->source, getcurrentline(ci));
> ++    setobjs2s(L, L->top - 2, L->top - 1);  /* remove 'msg' from the stack */
> ++    L->top--;
> ++  }
> +   luaG_errormsg(L);
> + }
> +
> +--- a/src/lvm.c
> ++++ b/src/lvm.c
> +@@ -656,8 +656,10 @@ void luaV_concat (lua_State *L, int tota
> +       /* collect total length and number of strings */
> +       for (n = 1; n < total && tostring(L, s2v(top - n - 1)); n++) {
> +         size_t l = vslen(s2v(top - n - 1));
> +-        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl))
> ++        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl)) {
> ++          L->top = top - total;  /* pop strings to avoid wasting stack */
> +           luaG_runerror(L, "string length overflow");
> ++        }
> +         tl += l;
> +       }
> +       if (tl <= LUAI_MAXSHORTLEN) {  /* is result a short string? */
> +@@ -672,7 +674,7 @@ void luaV_concat (lua_State *L, int tota
> +       setsvalue2s(L, top - n, ts);  /* create result */
> +     }
> +     total -= n-1;  /* got 'n' strings to create 1 new */
> +-    L->top -= n-1;  /* popped 'n' strings and pushed one */
> ++    L->top = top - (n - 1);  /* popped 'n' strings and pushed one */
> +   } while (total > 1);  /* repeat until only 1 result left */
> + }
> +
> diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
> index 6f2cea5314..0b2e754b31 100644
> --- a/meta/recipes-devtools/lua/lua_5.4.4.bb
> +++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
> @@ -7,6 +7,7 @@ HOMEPAGE = "http://www.lua.org/"
>  SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
>             file://lua.pc.in \
>             file://CVE-2022-28805.patch \
> +           file://CVE-2022-33099.patch \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
>             "
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168584): https://lists.openembedded.org/g/openembedded-core/message/168584
> Mute This Topic: https://lists.openembedded.org/mt/92654482/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

