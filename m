Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6329DD2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 09:00:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2524.1768899626841070600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 01:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d//x+6/8;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso35432145e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 01:00:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768899625; cv=none;
        d=google.com; s=arc-20240605;
        b=TQL5EawEJWtZ/G6MlteuupuUOTodGd8iWVm6kDXLBmO3BFt5WY+Z/MQAzCnu5DGS/e
         DDcIOWV7pwNX3+ns6zCMPaYvlvMILjtzoh6JJPwKf0A01qY+z7gY/eBxAMKbqkt0fuv6
         2zsnLJ19H0c8AQTnZnn6XHqKVqfFZlXmMiN8upUeJoRTbBoyf4fiSs5VtQxth9GewlXJ
         06QSolvv0aS5wszaFpAE6C2dbx5C2bAXbjQvsDHjKEa1KIERo4rl/Sy8/tyLLdaFL4qO
         evnYPPRtMo4gcFqiQVHmNIR4TG0kAOKSP2tbHuhXthvvb6LffesWdz5fj9e66ebYa/XQ
         hkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zF09vULCPquEOkyznMUvhIvZQ8PR/Mp0VCH3grhU2mY=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=KW1tAHs06Uagmq5mAKv8mB/tAnCGFIqlfN56L30Gfxud4IV+Bz/eML0UrLAvGYMkMn
         YJ17Pnhr9gDd9DuSYOcvxM+TXb2LKsZYmnPoQ47hOTpUsZLpOrhclk+WVWPBa2yQcJLx
         FRyM3zaNbT4kltmtc9uuYqrXTnmi+5RmBcW1/O4U0hB2GndaO4vmDhlLhQVpOSTjkhjZ
         Ucly8BvF6DhNI5hDK4UbJfAeUEKcW13umzg/ripf8nPF1pcHfrgNF1kGJ+RuJXY//va4
         ho6nZV2nJQJoOupPf9vAnQOqMqB2cMc6wPtwBYQ6GqU84dsBhy9zoLHq02R5ODhGC8ok
         n1Cg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768899625; x=1769504425; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zF09vULCPquEOkyznMUvhIvZQ8PR/Mp0VCH3grhU2mY=;
        b=d//x+6/8JamF9H4S7OpN/9CZX0YrHoKd6Freq0PyVBxvbgWfmnKZ8ysCJcQVZ+lqEf
         90aD9SlApxB+MMiPqeYPSTWoS7ZAXPC1IT8vCqwltPpOtgc/ufcWMYvSKHFdn7GrmPj4
         /QZgFhWCNP1TfQ3xNO5Zp8ym94xrBM4ZtYKhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899625; x=1769504425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF09vULCPquEOkyznMUvhIvZQ8PR/Mp0VCH3grhU2mY=;
        b=jIWrDuDx2gBlxrDVgFaWiDRohA1lWLaBv7NKBWz4cOa9sfVJTLvP7gxQ4IydsdHa0a
         A/Y1C2xTM4hyJrBKFP92UvjYuWVvuSjOX+qd7D7LF9UjvIIab/lRB2zs18w8BHsOhl5K
         40SEiT6UQBWJE28aemXSoqwEsB8hvtjCJmk1p76QCyo0JwEhN10v54iW7NGg280fimtv
         +WaAy3DZZz/y5NcsfQHVS0Tcb/r4F10cITzmvvCvM7nuMf8bn8X6N6JOX/rpXuCZX5yC
         xhCu7GtElC/u8W18VlF32fZIy70e6Gwkgp73MEOKNjEvhZhR+RNZwdW/nQgf4G269WR5
         134w==
X-Gm-Message-State: AOJu0Yx3swatZloApn1H7vTmmvaf7l7XOwJ79egrwfB3cKLcGKCQUlBS
	lUOYAWUzyYb3sOzPaMy/UzTSZZ7AwuNcH8GZNU/uwnP+O8JxAtg5jaPtm+Be+e5212k5Qq3YVYM
	BTz834ygON/E6z/vyxvDb3eliMe7fE3zCIvwlvY+s89m5tEDOGrUy
X-Gm-Gg: AY/fxX4k5B4L/P43CNXPa6taayNBPQVgA4ZhGkC2YLRvLXAf2e7cxIHWbWJi6D/7gQP
	auxwpC4XDAnOwpeSYtsMa07KyOxtj402LeW+FeuLjJ58dzMSH+wiRHKqm3ycjSshAl9GXCRtY80
	W0eZzU1or2ZjbeUsJBLSqfOHKgFYeQw+5y6LYHC2YXtA7A3hZ16idkHh9WGpEl/4v5uu6aL0Aph
	WotCHvCMWip74T3lHXULfKnmrxC4d5BOYnloHhrwSRx6RfDg/Q/dq7ktunFePnNWnG24VHAIA==
X-Received: by 2002:a05:600c:4695:b0:477:9eb8:97d2 with SMTP id
 5b1f17b1804b1-4803e7900bamr15600585e9.8.1768899623486; Tue, 20 Jan 2026
 01:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20260120085227.3719998-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260120085227.3719998-1-richard.purdie@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 20 Jan 2026 09:59:56 +0100
X-Gm-Features: AZwV_QiBInSu3Br2ErC6rrZwsAobPdZOh8u2x68YsTdUPnqaC3vEj0EUsnEheZQ
Message-ID: <CAMSfU+5Xyi8RZFaC4q4b9B9DGGB7=AjbKkvn2s+WtJKcsBVRKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pseudo: Update to 1.9.3 release
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b3a3a20648ce092e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229654

--000000000000b3a3a20648ce092e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Le mar. 20 janv. 2026 =C3=A0 09:52, Richard Purdie via lists.openembedded.o=
rg
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> a =C3=A9crit =
:

> Pulls in the following changes:
>
>   Makefile.in: Bump version to 1.9.3
>   configure: Minor code quality changes
>   pseudo: code quality scan - resolved various potential issues
>   makewrappers: improve error handling and robustness
>   Update COPYRIGHT files
>   ports/linux/pseudo_wrappers.c: Call the wrappers where possible
>   ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11
>   ports/linux/pseudo_wrappers.c: Reorder the syscall operations
>   ports/unix/guts/realpath.c: Fix indents
>   pseudo_util.c: Skip realpath like expansion for /proc on Linux
>   test/test-proc-pipe.sh: Add test case for proc pipes
>   ports/unix/guts/realpath.c: realpath fails if the resolved path doesn't
> exist
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Do you think I should take this for stable inclusion? (leaning toward yes)


> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
> b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 19b0d29b718..ed1e8fb3e01 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk =3D " \
>      file://older-glibc-symbols.patch"
>  SRC_URI[prebuilt.sha256sum] =3D
> "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
>
> -SRCREV =3D "125b020dd2bc46baa37a80784704e382732357b4"
> -PV =3D "1.9.2+git"
> +SRCREV =3D "750362cc7b9fa58dffccd95d919b435c6d8ac614"
> +PV =3D "1.9.3+git"
>
>  # largefile and 64bit time_t support adds these macros via compiler flag=
s
> globally
>  # remove them for pseudo since pseudo intercepts some of the functions
> which will be
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229653):
> https://lists.openembedded.org/g/openembedded-core/message/229653
> Mute This Topic: https://lists.openembedded.org/mt/117360386/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000b3a3a20648ce092e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Richard,</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20 j=
anv. 2026 =C3=A0=C2=A009:52, Richard Purdie via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"m=
ailto:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists=
.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Pulls in the following changes:<br>
<br>
=C2=A0 Makefile.in: Bump version to 1.9.3<br>
=C2=A0 configure: Minor code quality changes<br>
=C2=A0 pseudo: code quality scan - resolved various potential issues<br>
=C2=A0 makewrappers: improve error handling and robustness<br>
=C2=A0 Update COPYRIGHT files<br>
=C2=A0 ports/linux/pseudo_wrappers.c: Call the wrappers where possible<br>
=C2=A0 ports/linux/pseudo_wrappers.c: Workaround compile error on Debian 11=
<br>
=C2=A0 ports/linux/pseudo_wrappers.c: Reorder the syscall operations<br>
=C2=A0 ports/unix/guts/realpath.c: Fix indents<br>
=C2=A0 pseudo_util.c: Skip realpath like expansion for /proc on Linux<br>
=C2=A0 test/test-proc-pipe.sh: Add test case for proc pipes<br>
=C2=A0 ports/unix/guts/realpath.c: realpath fails if the resolved path does=
n&#39;t exist<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br></blockquote><div>=
<br></div><div>Do you think I should take this for stable inclusion? (leani=
ng toward yes)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_git.bb</a> b/meta/recipes-devto=
ols/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"noreferrer" target=3D"_b=
lank">pseudo_git.bb</a><br>
index 19b0d29b718..ed1e8fb3e01 100644<br>
--- a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
+++ b/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a><br>
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://older-glibc-symbols.patch&quot;<br>
=C2=A0SRC_URI[prebuilt.sha256sum] =3D &quot;ed9f456856e9d86359f169f46a70ad7=
be4190d6040282b84c8d97b99072485aa&quot;<br>
<br>
-SRCREV =3D &quot;125b020dd2bc46baa37a80784704e382732357b4&quot;<br>
-PV =3D &quot;1.9.2+git&quot;<br>
+SRCREV =3D &quot;750362cc7b9fa58dffccd95d919b435c6d8ac614&quot;<br>
+PV =3D &quot;1.9.3+git&quot;<br>
<br>
=C2=A0# largefile and 64bit time_t support adds these macros via compiler f=
lags globally<br>
=C2=A0# remove them for pseudo since pseudo intercepts some of the function=
s which will be<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229653): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229653" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229653</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117360386/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117360386/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000b3a3a20648ce092e--

