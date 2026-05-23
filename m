Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575E7CD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 01:39:31 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1141.1779500365784949969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 18:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UdrYvYZW;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6530287803cso8108852d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 18:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779500365; cv=none;
        d=google.com; s=arc-20240605;
        b=SBZX56Cl3BGV+BDSValM9k4Sz4GFFylgt59gwDrvA72RqSOBLHyTTxNDBjUvzAo8cd
         sB/sn57yIlLAdFHbXT17TWsl10zs39SBBsT3UanYX3PG3mJac4wrX8/2K33kLb5cRP85
         IQBsDgG/5IGNYKTec40le9gZX9SDSQ/P3URbC6xArreQrUmd8yH0KOjXEnJFg+pZR4az
         N0AOH54W9z/23rxWgEZNjszdqbqX14qfPZWa7KRy0w1a84Pa7TSntFs1ZfKsxsEt1s8q
         nx0eos3AU03YJLaQpr0ckcboZ/zaHZfMGPtJyjxeFqtz412u8ZObrzulo9tTw0JKNxpZ
         84Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j1OKffRn6ti/XjRX3e95aq93zHeQuQRtJw9JPEfLEKw=;
        fh=lokdjCdjsyY6KjBfIJktI8BQ5vhRQ0H3tAEZGfjN5Hs=;
        b=fSiwOhXYCbaWJURGgvFCJCLNapojtwJjL1hLTAfv3t1fIx/N+qelpWwCZF23YOrZeC
         nNTYrgzypCSD5Xl8YUsSZrYhvhRhwDozDjDqF/CLWs9qbeXS2TF/hqlm1Gsxog+9V/1f
         jsyBWargDzaIhUKMfG5bVzixFA0LM8aaebMPkGWrrdX5ARWxOUnkrGQPIsWWk09NJNul
         rMISV65SL4mxMqdQ1ACaOjXJ8opSrQ28ZPch+YgVmc9KSxLTYie4EedWpMUM3QL6J88Y
         zHIsQU0HG4UOZMSLqCXdVOENhyGblbThrqTCkd4KaZ7XuoRRwIDeITSRNzWmmFSr3fkJ
         UEpA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779500365; x=1780105165; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j1OKffRn6ti/XjRX3e95aq93zHeQuQRtJw9JPEfLEKw=;
        b=UdrYvYZWtXk84XxYo4muntHVAwMYTF7AaRZfv8RSS3640LI+jon5JkBGJxPFCNCcJZ
         /vjjouJgDmMUj/A9QmrLLf97CxLOfSYQu6Ppe3tUJrzRfxNcF6TZqsua6j6OQRQyg9gP
         3in/h458ATsA4iFlpYiJiJ3abxrmaF9oBOO6c8eXZ1nBXYgOXL36Dpu8vBfltDe95gyA
         Df6azFQO3f805HoOFxPlvc+U3gGWK4h5S3B8+VSQE3MmJcVAkAYCuxC7tTOngQgRi2lY
         aaSHQuyXdXkOY3qMPZoyvgwr+NT2B9KE7yZt32cb7tV6B/RK7m6pEN0CqjgQ06A4abuD
         C8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779500365; x=1780105165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1OKffRn6ti/XjRX3e95aq93zHeQuQRtJw9JPEfLEKw=;
        b=IfY1b8AaBMR4TTG2DZ5kWh4F9LYr2JdT4QpQfreOUGtD1vjq//2GQ3KrKJTvmHsKWt
         GzhUxcdf19yik3PCRcUx3FhOHMTVVou3IBVwyMYGhcDmkNO7ALC2xJmoZYmotWZ9350p
         97TWmdaPQ4hAivkjurCpu4gHAoSpL6kb2zqLrV1yE5aJ0IF5MO8d1QVqB2mbZjXNm11f
         sxuXMwtcMOlh7J4sOVIZfzUQ9E1HfCkiuHNCJub4t4Gl0za1gNsvhFHDZd6/I66a1yXL
         SEQNqkRQBXmOR/TD2qMFEitpiHf4KSezcLSyxGF+1gUX5UF0LRcn+RSvegqq4khsgleg
         lV9A==
X-Gm-Message-State: AOJu0YyDk1zqn67SCr0iMc0bDVwPFXpVvVEpAxHDEezcqAOLa8fP68JP
	ug9bq3enKk3vmpCTAcYguxkgNSndXf0B9h/vdm/g9fazV2tY7+kiYifxWFUgH+4X9JPyYDMBkG5
	q4ix1FL6eeXEo7oEgaxLKm+Y8cVvaroSB3TyS
X-Gm-Gg: Acq92OGQhssKR70BoMpGwGeHNEjq/dZKuNXZlYwJfsjB3VXW0h+hchpGeT9JxhCxu7y
	rAg+zPFengclWLTQ7tQeF8KL0/yPa3TQ4Eb9IDMnqtoSDJTzkw0xpsSH3cb75rtEh8DunkBpisT
	QUb+YOfXairffXno3Y+IU8MLvFHI3tvHUgSUUWx5YV+u98Zz/GkjGx5h8ey2agywAw/cPCh702J
	cqMx2ymLsZrlATchBl5foXWJCmCFJ6hlnCjTg4cNyrX2eOYZY9fb7r8Lj6kVUSSLS27myJ0JuuF
	p5DUuqa2XfAmbdCsDlGa6o11Vwn4769iMJx1Rz0EKw4zq7S6G8aNng7+r7LQPcDTNlwkpYE+DHM
	jKXxC4CaNDM3QJUhChj3VldY4OygXcwHkh/1ePlWUVEK5EBoG3FsUptHaJ1xtP5/+tXZIJ/Doq2
	OK2FqP
X-Received: by 2002:a05:690e:1549:10b0:651:d6a2:f766 with SMTP id
 956f58d0204a3-65ec98eac18mr4714187d50.35.1779500364812; Fri, 22 May 2026
 18:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com> <20260519072534.24588-8-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260519072534.24588-8-Hemanth.KumarMD@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 May 2026 18:38:58 -0700
X-Gm-Features: AVHnY4K3AxU0vBzEDJ2AuigY_VigQnAx7gxNon6A0itIlic-qxDtvKAphZ6Lm2I
Message-ID: <CAMKF1spaC4NPT8rL6GHhtP8aDwV87Kmr0EM5yuPZ5YJhxpau7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 07/12] gcc-runtime: avoid passing
 MULTIBUILDTOP to libatomic
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000001f542606527237e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 May 2026 01:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237559

--0000000000001f542606527237e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:26=E2=80=AFAM Hemanth Kumar M D via
lists.openembedded.org <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.=
org>
wrote:

> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> libatomic constructs gcc_objdir using `pwd` and assumes
> MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP
> from OE results in malformed paths during libtool install
> operations in both compile and install stages.
>
> Avoid passing MULTIBUILDTOP for libatomic and use the upstream
> default handling instead.
>
> Link:
> https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40fa=
ca10ea2e
>
>
It would be good to start a discussion/bug in gcc about it, I think
using pwd relative paths is perhaps
less than ideal to use here. We can accept this additional logic here for
OE in the meantime.


> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 30b2832c82..e305180c64 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -83,14 +83,22 @@ do_configure[depends] +=3D "${COMPILERDEP}"
>  do_compile () {
>         for d in libgcc ${RUNTIMETARGET}; do
>                 cd ${B}/${TARGET_SYS}/$d/
> -               oe_runmake MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/
> +               if [ "$d" =3D "libatomic" ]; then
> +                       oe_runmake
> +               else
> +                       oe_runmake MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/
> +               fi
>         done
>  }
>
>  do_install () {
>         for d in ${RUNTIMETARGET}; do
>                 cd ${B}/${TARGET_SYS}/$d/
> -               oe_runmake 'DESTDIR=3D${D}'
> MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install
> +               if [ "$d" =3D "libatomic" ]; then
> +                       oe_runmake 'DESTDIR=3D${D}' install
> +               else
> +                       oe_runmake 'DESTDIR=3D${D}'
> MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install
> +               fi
>         done
>         install -d ${D}${datadir}/gdb/auto-load/${libdir}
>         mv ${D}${libdir}/libstdc++*-gdb.py
> ${D}${datadir}/gdb/auto-load/${libdir}
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237280):
> https://lists.openembedded.org/g/openembedded-core/message/237280
> Mute This Topic: https://lists.openembedded.org/mt/119387078/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001f542606527237e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19,=
 2026 at 12:26=E2=80=AFAM Hemanth Kumar M D via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D"=
mailto:windriver.com@lists.openembedded.org">windriver.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@windriv=
er.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
<br>
libatomic constructs gcc_objdir using `pwd` and assumes<br>
MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP<br>
from OE results in malformed paths during libtool install<br>
operations in both compile and install stages.<br>
<br>
Avoid passing MULTIBUILDTOP for libatomic and use the upstream<br>
default handling instead.<br>
<br>
Link: <a href=3D"https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7d=
de1bf499d3d40faca10ea2e" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e</a><br=
>
<br></blockquote><div><br></div><div>It would be good to start a discussion=
/bug in gcc about it, I think using=C2=A0pwd relative paths is perhaps</div=
><div>less than ideal to use here. We can accept this additional logic here=
 for OE in the meantime.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.KumarMD@wind=
river.com" target=3D"_blank">Hemanth.KumarMD@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++--<br>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc<br>
index 30b2832c82..e305180c64 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
@@ -83,14 +83,22 @@ do_configure[depends] +=3D &quot;${COMPILERDEP}&quot;<b=
r>
=C2=A0do_compile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in libgcc ${RUNTIMETARGET}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}/${TARGET_SY=
S}/$d/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake MULTIBUI=
LDTOP=3D${B}/${TARGET_SYS}/$d/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$d&quot;=
 =3D &quot;libatomic&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0oe_runmake<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0oe_runmake MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in ${RUNTIMETARGET}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}/${TARGET_SY=
S}/$d/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DES=
TDIR=3D${D}&#39; MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$d&quot;=
 =3D &quot;libatomic&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; MULTIBUILDTOP=3D${B}/${TARGET=
_SYS}/$d/ install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${datadir}/gdb/auto-load/${libdi=
r}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadi=
r}/gdb/auto-load/${libdir}<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#237280): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/237280" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/237280</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119387078/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119387078/1997914</a><br>
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

--0000000000001f542606527237e9--

