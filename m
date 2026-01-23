Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A157D778BF
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 23:55:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9357.1769212535439332106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 15:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dy8SbvRA;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7aa9efc55so20676955ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 15:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769212535; cv=none;
        d=google.com; s=arc-20240605;
        b=WDih4kgj5ZgOqG79xxaC+1AlarMy7MjqmglYXOQ8rKrzY3h1eGrBXyZIsUSRcgF2mo
         TxtEMfHcMS5quP6oucQV9yqRykELaZgVk68HVV46yTDGVjPcOP3n3X/l8SdPpxGPCGav
         mapeRFfScIohdI/3HCsjrc5KwFLgfXP8c2KLcXxUpMeRjeQjqZR2YNn0EnUw4MMoUtde
         B1qrBbi92heHcSpYquwfjlkypAoTDoQ+5wd+OXPPGQ/zjyabbT70pOVRDg2q4uQnAWAp
         YrQOQn25BcgN+DbXj2geUeEtfqW9Vg3HGJDr8CCH5mvzkioZKI8oB4GE3qsZPm/hTcY2
         fLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eeTlzWUKq5NXl0Ft71Kjw92OJNpj2nsWH6hEK58UnCE=;
        fh=2xcRdSrxlcJCAhyqdTeDZp4r2MPP2xGLphvyZhgylH0=;
        b=bu40QYqXZmJgUL95SPk2EJsRUBzT0bTHOgjVekKbYZsguIkCJj+Q7afcpCH2aXijka
         msYIeB1mAru71Fbs3w8LYKxy8ss2pRXF76vnREa17IRhjGz4q/gfUtl/YrfXR5L4CdwG
         Dnp0kAUoD8N/ofWgDxlN6iQIj7nTLRt1JLsoyfL/GkS+1ynQqj9QIR0H2x/tDnZ7x5sq
         qwA+Qa5bgXuyrYprxEvV4vTia65THAyJz8038F1jt0Jz4+90znnRj0itQXBHu6ur9xUG
         uxlGh+5LmGA1X+IBTmx8XYapmme8rJLT9ArtTSx1Sqdos2KTFhDWhDB+eTwyg3W9Jc3R
         dZ8Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769212535; x=1769817335; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eeTlzWUKq5NXl0Ft71Kjw92OJNpj2nsWH6hEK58UnCE=;
        b=dy8SbvRAIKZGt6nodPZK4Bf6TlifI6fwibWcRqZ/cyBVD+xfbFK+ExGbLiOPYttlCM
         iEf1IHj7iKnmxT9vUZHalmOMOxzDCvRqvLbEyXsZdeVWujuEBaIwqaCYk+KkTg5rqQOu
         6GmRa/WpHiBa9lnbyXUkX+ZTlh2RIfDcBUx71S9JF6yPS0IfCTGGmywrduuoweNzo6of
         nhe6m2Mw3Pn2aEjGhsIpuBZPR+C0b9Rl2kNL36hc9ear+7qWoEqPe6SDVlWU0oBYQSMv
         MDItteHObB6U1nt7OI+sPVnej3z5jBV4veCI2waPrKB/Hrz1stbUqWvP7RG4IQsydkjv
         m72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769212535; x=1769817335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeTlzWUKq5NXl0Ft71Kjw92OJNpj2nsWH6hEK58UnCE=;
        b=LWOMLCIeaAbN50WGtCKwHi9JVA7+DO+u9qVCQuRf+l6oZQJFP1BMidJRJqr4TrMzn8
         MIQGnRqrMDwJ3GmFnxTw1cwiiRYt5ysRTkSki0bQ5M4cYwD5dUMTvdRPDra3OQY07Tws
         USJd3SHHk0NoYpvMsL8fuuGbqxsF9l1x/iuXRrhSAzefJZLLKqzJqE9Svi3cFPiFdxOz
         iKocoLI8J43JVrfksSNvMoH8AW2qIiv2rjhFG0at4voUnV55FMFlgc0kHikfRIvXr4MD
         UCvhsLU3J1CGqE8yDYhSlwxmpJtoLD3VkitKK3uwfhOpu38Zmpk49J5DqZdw9J7nhqPw
         +/cw==
X-Gm-Message-State: AOJu0Yzvmf8jvYHuTwQULevzwXVXX5aBYyKJ06awyY9t8uA50wuKENwP
	Px70AbkKhgOjlXf2TnPOSqdLPASPYVfPtip03KRslbzs+d+MkSidIXnqB19cQqhj7DXvwUXdV+D
	7QwSu+QMGxqPEODSt22PrRYAhy6gqf4Q=
X-Gm-Gg: AZuq6aKs9/lp3uR4JwEocexl6Tu1Pn+oRNER1P9rOMrNShNiDqMsdQAr7yJEou1DFLO
	HvwUmtbdEWk/gVLRky0x6++xRWwfGqeODp+Ck5m0xmauLK/fu4oUS2GexVKmGJInCKrBc4TsNVl
	u5mWnKvMKAi+E1sXI+jPTEl3PkrTDAR1YSspQ2rGt2T33zlSOZzqbJ8+LTma8+RrOMpXBUgHDAL
	K2BjwpSm4ULeuBrYcDrNFs1NdcmPayS+L6HwJL8QbVzW6uqfByXq9yvb/7ovdoZT7Xvmt9H
X-Received: by 2002:a17:903:2c04:b0:298:5abe:4b1 with SMTP id
 d9443c01a7336-2a7fe755ecdmr39002695ad.52.1769212531275; Fri, 23 Jan 2026
 15:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20260123230820.289540-1-reatmon@ti.com>
In-Reply-To: <20260123230820.289540-1-reatmon@ti.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Jan 2026 18:55:20 -0500
X-Gm-Features: AZwV_Qgp7DJKPexYvivWP2OLGjrmnFMkYoLJA9fRYbYylpBwVG57zYyJQV0IGk4
Message-ID: <CADkTA4OA-Vx9tPqkuyK4tLsxv2BXB8r_1+jKxJ6x5vB-5xC-Dg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lttng-modules: Fix CONFIG_TRACEPOINTS patch
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000757a0c064916e4e3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 23:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229917

--000000000000757a0c064916e4e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:08=E2=80=AFPM Ryan Eatmon via lists.openembedded.=
org
<reatmon=3Dti.com@lists.openembedded.org> wrote:

> The check for CONFIG_TRACEPOINTS is guarded by a check for
> CONFIG_LOCALVERSION.  But what happens if your .config has
> CONFIG_LOCALVERSION=3D"" ?  Then the check never runs and you try and
> build the module even though CONFIG_TRACEPOINTS is missing.
>
> Update the guard to check for either CONFIG_LOCALVERSION or
> CONFIG_LOCALVERSION_AUTO.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git
> a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> index 1854d9a944..a47b5b9789 100644
> ---
> a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> +++
> b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-=
CONFIG_TRACEPOINTS-to-warn.patch
> @@ -16,8 +16,8 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>  ---
> - src/Kbuild | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> + src/Kbuild | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
>
>  Index: lttng-modules-2.14.0/src/Kbuild
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> @@ -25,7 +25,8 @@ Index: lttng-modules-2.14.0/src/Kbuild
>  +++ lttng-modules-2.14.0/src/Kbuild
>  @@ -3,10 +3,13 @@
>
> - ifdef CONFIG_LOCALVERSION     # Check if dot-config is included.
> +-ifdef CONFIG_LOCALVERSION     # Check if dot-config is included.
> ++ifneq ($(CONFIG_LOCALVERSION)$(CONFIG_LOCALVERSION_AUTO),)    # Check i=
f
> dot-config is included.
>     ifeq ($(CONFIG_TRACEPOINTS),)
>  -    $(error The option CONFIG_TRACEPOINTS needs to be enabled in your
> kernel configuration)
>  +    $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your
> kernel configuration)
>

Why is this changing to a warning ?

You have no mention of it in the changelog. Although the check wasn't
working, the intention of making this an error is still the same.

Bruce



> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229916):
> https://lists.openembedded.org/g/openembedded-core/message/229916
> Mute This Topic: https://lists.openembedded.org/mt/117427953/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000757a0c064916e4e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 23, 2026 at 6:08=
=E2=80=AFPM Ryan Eatmon via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.openembe=
dded.org">ti.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">The check for CONFIG_TRACEPOINTS is =
guarded by a check for<br>
CONFIG_LOCALVERSION.=C2=A0 But what happens if your .config has<br>
CONFIG_LOCALVERSION=3D&quot;&quot; ?=C2=A0 Then the check never runs and yo=
u try and<br>
build the module even though CONFIG_TRACEPOINTS is missing.<br>
<br>
Update the guard to check for either CONFIG_LOCALVERSION or<br>
CONFIG_LOCALVERSION_AUTO.<br>
<br>
Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" target=3D"=
_blank">reatmon@ti.com</a>&gt;<br>
---<br>
=C2=A0...-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 7 ++++--=
-<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change=
-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng=
-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch<br=
>
index 1854d9a944..a47b5b9789 100644<br>
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missin=
g-CONFIG_TRACEPOINTS-to-warn.patch<br>
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missin=
g-CONFIG_TRACEPOINTS-to-warn.patch<br>
@@ -16,8 +16,8 @@ Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
=C2=A0---<br>
- src/Kbuild | 7 ++++++-<br>
- 1 file changed, 6 insertions(+), 1 deletion(-)<br>
+ src/Kbuild | 9 +++++++--<br>
+ 1 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0Index: lttng-modules-2.14.0/src/Kbuild<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
@@ -25,7 +25,8 @@ Index: lttng-modules-2.14.0/src/Kbuild<br>
=C2=A0+++ lttng-modules-2.14.0/src/Kbuild<br>
=C2=A0@@ -3,10 +3,13 @@<br>
<br>
- ifdef CONFIG_LOCALVERSION=C2=A0 =C2=A0 =C2=A0# Check if dot-config is inc=
luded.<br>
+-ifdef CONFIG_LOCALVERSION=C2=A0 =C2=A0 =C2=A0# Check if dot-config is inc=
luded.<br>
++ifneq ($(CONFIG_LOCALVERSION)$(CONFIG_LOCALVERSION_AUTO),)=C2=A0 =C2=A0 #=
 Check if dot-config is included.<br>
=C2=A0 =C2=A0 ifeq ($(CONFIG_TRACEPOINTS),)<br>
=C2=A0-=C2=A0 =C2=A0 $(error The option CONFIG_TRACEPOINTS needs to be enab=
led in your kernel configuration)<br>
=C2=A0+=C2=A0 =C2=A0 $(warning The option CONFIG_TRACEPOINTS needs to be en=
abled in your kernel configuration)<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">Why is this changing to=
 a warning ?</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">You have no =
mention of it in the changelog. Although the check wasn&#39;t</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">working, the intention of ma=
king this an error is still the same.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229916): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229916" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229916</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117427953/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117427953/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000757a0c064916e4e3--

