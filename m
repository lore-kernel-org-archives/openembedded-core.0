Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645FFD15DB7
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 16:56:18 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20465.1764780976533257776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 08:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2/5aIJK;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787c9f90eccso73177337b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764780976; x=1765385776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hYBqF0ww68sjeLjtJvsFZkDYL/2Cs1x/dJ2DIfVG/So=;
        b=V2/5aIJKKKXEWBwTmen99SMdGqfrT/Bu/7LEJft/81XUM+ho40GnQF+oRJeAxlmmua
         AcB3Czzb6cPVvNSm6RNRXDaqVs5Huvy5kA+Ild+7YjdJ04P3hM2LK/QtZguLJDPi6rRQ
         B3pnPURQ7uKJlcOd4t2I3uZ2T2/IoTynIovLgB+1/L/B9fI1FEnMTnPIiANYnAPsMhIW
         0IrKH4Efi96KobJ2phKlo3Lg5atif+goCQLeGe3azSTZH+z3LsZkcTKSAr+XMra5rnkc
         of+crJdfyW32/o9/Rev6a5jJbeRtU7f+nOl/sYHiaMiddzxznJaGMGp2hrkpyr7ag+Sz
         gnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764780976; x=1765385776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYBqF0ww68sjeLjtJvsFZkDYL/2Cs1x/dJ2DIfVG/So=;
        b=vKCV1eEbw44juXWl9X6DGLjxd69669S3owsvuufihqsMqewmV/xiO499UavgRw/LWc
         wJATtV7j9U5gYNluxKQ2WiC8Gii0H3q5gGQLGhUC+Ve1h3whdFHn43zc9eP3pcHsDJ2Z
         99l/CYNpfuAvZ/HWnWAv5tVlduX6yEjF5oCN3PIdKNlymxXZV5y0winZz5CIMU0ftSNB
         EKj7XrjYbItnyugRQOrhpOQvT3/0bWbV4h/4oDt6T1aJvVMB2qaDCyIlpjU4RPTyWkyc
         7LF5zHWStQ4VLTVOY1JgQQpA1e7ZhjkC87w80m8G7wz/VIFzPcIqhNdGMiZL2n9CueKs
         Etgg==
X-Gm-Message-State: AOJu0YzDBPiwLJ3WwEEjMsaFWC7LLasio43ErDd577ocSQACtNOlJldz
	S1TybKqXclnbMXQy2uTx03jgi+FE/pWl9awFK2WHcX/CGWrAgH9agiRuBLPv+gz7n3X2UVPaQs6
	TNDBb9Mlt1ty00ercwWIKv3WdyxRwrYEj789h
X-Gm-Gg: ASbGncvoiRJ2auv6gD5nZlQ9kMmouWY5A+VhtSXuK0nD1vHJ13BxULnDbX6rZXjg3/s
	6iuXZEPEiqYpqPiuivryUl+v4y38jsj+EjRv7m1LYLVCCANR0tlCOxgQd8zH0HWGrzLXBqhEDLu
	s/sinDk1fQaC2nR6cWJvFRn/axxHknxFlbOq0irZisN+Kez81YDnTl3OC1dX0d5U1tGE+GP/b/x
	+f88bbF+9FGwHlaxAkskLtRMFJ5j0pjQqp9WFDflNFdA6wuWHa9Lx8KKV783zCtOwuv9085q1Ux
	8xGGfIZ6rO5AXPoCpbD8hH2jjs2Sh9huvwDDJ1kjRQ+3XAtNSeQ6Zb3AIxhTLvmojsb4YjMHyHe
	Q1MVZ/E2nFiOnmvXuKiAN7gk=
X-Google-Smtp-Source: AGHT+IGLu8wSwWFXWFdcelJAgkLO6uJ1QaIjqeqK1rKYk3HCYp8GqUK+QqyFvXUhff6fanOWoIKybdoeSFAiQRkfoVg=
X-Received: by 2002:a05:690c:3507:b0:786:5620:fad8 with SMTP id
 00721157ae682-78c0c17f9bemr23732867b3.55.1764780975506; Wed, 03 Dec 2025
 08:56:15 -0800 (PST)
MIME-Version: 1.0
References: <187D937D5EDF22BD.489296@lists.openembedded.org> <20251203062704.138197-1-changqing.li@windriver.com>
In-Reply-To: <20251203062704.138197-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Dec 2025 08:55:48 -0800
X-Gm-Features: AWmQ_bm4GMeZBALOrupyqk5zuF3QSE_EHgfC6UVsRpvtkzIadVL0AgfrziHom4M
Message-ID: <CAMKF1soiPObK5M_JhwvWCg3NZ4oKuEpOqdcDopJfj5070=BA4w@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] shadow: disable econf for native
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000026cadc06450f1777"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 16:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227235

--00000000000026cadc06450f1777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 10:27=E2=80=AFPM Changqing Li via lists.openembedded=
.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> When libeconf is installed on the host and GCC from extended buildtools
> is used, the host=E2=80=99s libeconf is detected and -DUSE_ECONF=3D1 gets=
 enabled.
> However, the buildtools GCC cannot see the host header files, causing
> the shadow-native do_compile fail with error:
> ../../shadow-4.17.3/lib/getdef.c:22:10: fatal error: libeconf.h: No such
> file or directory
>
> This patch disable econf to workaround above issue.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-extended/shadow/shadow_4.18.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb
> b/meta/recipes-extended/shadow/shadow_4.18.0.bb
> index ba65fc7196..42d0d54b3a 100644
> --- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
> @@ -46,6 +46,8 @@ EXTRA_OECONF +=3D " \
>                   --without-sssd \
>                   ${NSCDOPT}"
>
> +CACHED_CONFIGUREVARS:class-native +=3D "ac_cv_lib_econf_econf_readDirs=
=3Dno"
> +
>

I think it would be good to add it to all shadow recipe classes.


>  CFLAGS:append:libc-musl =3D " -DLIBBSD_OVERLAY"
>
>  NSCDOPT =3D ""
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227201):
> https://lists.openembedded.org/g/openembedded-core/message/227201
> Mute This Topic: https://lists.openembedded.org/mt/116590532/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000026cadc06450f1777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 2, =
2025 at 10:27=E2=80=AFPM Changqing Li via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;<a href=3D"http://changqing.li">cha=
ngqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">win=
driver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:c=
hangqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>=
&gt;<br>
<br>
When libeconf is installed on the host and GCC from extended buildtools<br>
is used, the host=E2=80=99s libeconf is detected and -DUSE_ECONF=3D1 gets e=
nabled.<br>
However, the buildtools GCC cannot see the host header files, causing<br>
the shadow-native do_compile fail with error:<br>
../../shadow-4.17.3/lib/getdef.c:22:10: fatal error: libeconf.h: No such fi=
le or directory<br>
<br>
This patch disable econf to workaround above issue.<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/shadow/<a href=3D"http://shadow_4.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">shadow_4.18.0.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.18.0.b=
b" rel=3D"noreferrer" target=3D"_blank">shadow_4.18.0.bb</a> b/meta/recipes=
-extended/shadow/<a href=3D"http://shadow_4.18.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">shadow_4.18.0.bb</a><br>
index ba65fc7196..42d0d54b3a 100644<br>
--- a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">shadow_4.18.0.bb</a><br>
+++ b/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">shadow_4.18.0.bb</a><br>
@@ -46,6 +46,8 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-ss=
sd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${NSCDOPT}&q=
uot;<br>
<br>
+CACHED_CONFIGUREVARS:class-native +=3D &quot;ac_cv_lib_econf_econf_readDir=
s=3Dno&quot;<br>
+<br></blockquote><div><br></div><div>I think it would be good to add it to=
 all shadow recipe classes.=C2=A0=C2=A0</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
=C2=A0CFLAGS:append:libc-musl =3D &quot; -DLIBBSD_OVERLAY&quot;<br>
<br>
=C2=A0NSCDOPT =3D &quot;&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#227201): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/227201" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/227201</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116590532/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116590532/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000026cadc06450f1777--

