Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58262CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 17:43:53 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.383.1759945431494793001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 10:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gfJgwvRC;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-89018e9f902so37446241.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 10:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759945430; x=1760550230; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qiSR9ArZPS+WCuzS754Utp4g7KR9O2A3pLJlYn0leoE=;
        b=gfJgwvRCIvgD8IVixivtt7o+98lhv39pPWiF97QV5UPF2sjkhZUBdDTeOVcHFBQXUc
         Bxuj6RDyDE65zMk7cB5vZoTETGryFFIrK5FIv3fQWS9ERxWiiiDR9XLSzuj4cn5W7UPW
         7Q1hiunRuT7uTetgklLYSYaZcfxUNGdYAQGuJKnQR/LF2pb5Q+NGsf4xuwdIYrYFmpdl
         TqyNZzvK/VdeUjCjWtEL3D19IJItzn6JMkoJSj7G/uL/yQR1cBtUnEq6vmYuL7ghkITl
         xrdZHsbYmDzpzc4KkT8yXZUdjVHPdAKP/aDlli2gOYGzGWEroB3zaPigOQf01F+lJSiW
         iQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759945430; x=1760550230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiSR9ArZPS+WCuzS754Utp4g7KR9O2A3pLJlYn0leoE=;
        b=c+uuOPH6TDGUV7eFAykV7gD4u1pwhmEfBTP3U43fSIf58FD88TEXNoM8EjgkrmlrPO
         RoQKF0Udw7I0pwhFsVbm+ksmfHG6qNGpG0/D044zOjCNuyd1E82qu+2+Xp21ZHKQpbRc
         xWm9wwg3DAg+md8xjOlxOe0L570FRBVkCZGur2pWvbDijiLPIhDnEqI1xcn/nxnXnYIr
         kQ54KVED3mIFkoOn+IvroDb/a4RJU26zO0JkR6HyDBvmQiIU7TloxqSvD0HazUs0NFDr
         koooaMNEQ6T5L7voSfZpQpHcVQiMZSHsgyOjzNb6lWjQ/F2RjR4GV62/uNC5IC48Pk+K
         0ncg==
X-Gm-Message-State: AOJu0YwI05KD8St/L2A+pnRrVLi+fgWF2DsGEoQHhD+VuMSOoxMn0K64
	EfRGjkb8S/TaWKiqEt9Ze8Pq3FXVsfPAuX6wIy2Na3F8pVGlVUl63ZHrOvR4vebdJs2HfV51oNl
	slr8pvD3xZ/W7wSgFHWeK2sTtbjJKm43IRguX58s=
X-Gm-Gg: ASbGnctrabpYwFByOi++tRxNwASDrP1Lxi524Bt3sbV6mA/LGHLq4vRzEpWwtIJaFpy
	AS+LXUGAuQtNBqO8gAWJbOyaXjWdpMYKKhUSPtSRGEI+nb22XHeVv7ZwN6VyISNW68uPPoHzhVE
	0XUFLhZjW1bO4Y8qHniijLtO5NkJquONrbVWS+t5KkcRr5NHPlYRCy+GszdlUvYHZjLamGzT3GW
	OlLG8IQHQisXeRP+WTjxA+waV3e5cY2
X-Google-Smtp-Source: AGHT+IFM2iVSqO7C4qiub8byy0fbP8Y4wBV4YJ4z2rtwLBwyoHvfr2LJi+p1SE/c61Kmz3SIEZKrvdrpgFTtaLu+PEo=
X-Received: by 2002:a05:6102:15a0:b0:5be:57a1:3eda with SMTP id
 ada2fe7eead31-5d5e21d6a79mr2452587137.2.1759945430341; Wed, 08 Oct 2025
 10:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20251008130137.2266449-1-Yash.Shinde@windriver.com>
In-Reply-To: <20251008130137.2266449-1-Yash.Shinde@windriver.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 8 Oct 2025 19:43:38 +0200
X-Gm-Features: AS18NWD2nx54vMI1ZxWnGk8DH_ZcDSsxyr2wn2mgGK8kOxCLa9kDmqWEGvM7hEA
Message-ID: <CA+cAker8MWe6PCE9VfoWs=9CqnkGxzuAa2OA+3wpkEHh+BYJ+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-c: fix debug symbols containing TMPDIR references
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000331c000640a93ad8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224585

--000000000000331c000640a93ad8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you think it is cargo-c specific? Or all recipes which inherits cargo
class must have that?

Le mer. 8 oct. 2025, 15:01, Yash Shinde via lists.openembedded.org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> When building cargo-c with DEBUG mode, QA checks fail due to
> absolute paths from the build environment (TMPDIR) being embedded into
> the debug symbols/binaries. This causes issues such as:
>
>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-capi contains referenc=
e
> to TMPDIR [buildpaths]
>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-cinstall contains
> reference to TMPDIR [buildpaths]
>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-cbuild contains
> reference to TMPDIR [buildpaths]
>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-ctest contains
> reference to TMPDIR [buildpaths]
>
> To fix this, pass an additional -ffile-prefix-map option to
> DEBUG_PREFIX_MAP to
> ensure that paths under `${CARGO_HOME}` are remapped to
> `${TARGET_DBGSRC_DIR}`.
> This ensures debug info is reproducible and does not leak host-specific
> paths.
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
> b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
> index fd15f02da9..5ef68e13c2 100644
> --- a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
> +++ b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
> @@ -12,6 +12,8 @@ SRC_URI =3D "crate://crates.io/cargo-c/${PV};name=3Dcar=
go-c
> <http://crates.io/cargo-c/$%7BPV%7D;name=3Dcargo-c> \
>  SRC_URI[cargo-c.sha256sum] =3D
> "17d431789b050b0fcf678455dfd5ceb7e5b45cd806140f8fe03b16b995d6cbff"
>  S =3D "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
>
> +DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGS=
RC_DIR}"
> +
>  inherit cargo cargo-update-recipe-crates pkgconfig
>
>  DEPENDS =3D "openssl curl"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224581):
> https://lists.openembedded.org/g/openembedded-core/message/224581
> Mute This Topic: https://lists.openembedded.org/mt/115653303/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000331c000640a93ad8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Do you think it is cargo-c specific? Or all recipes =
which inherits cargo class must have that?=C2=A0</div><div dir=3D"auto"><br=
><div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=3D"=
ltr" class=3D"gmail_attr">Le mer. 8 oct. 2025, 15:01, Yash Shinde via <a hr=
ef=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;Yash.Sh=
inde=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.co=
m@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Yash Shinde &lt;<a href=3D"mailt=
o:Yash.Shinde@windriver.com" target=3D"_blank" rel=3D"noreferrer">Yash.Shin=
de@windriver.com</a>&gt;<br>
<br>
When building cargo-c with DEBUG mode, QA checks fail due to<br>
absolute paths from the build environment (TMPDIR) being embedded into<br>
the debug symbols/binaries. This causes issues such as:<br>
<br>
=C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-capi contains refer=
ence to TMPDIR [buildpaths]<br>
=C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-cinstall contains r=
eference to TMPDIR [buildpaths]<br>
=C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-cbuild contains ref=
erence to TMPDIR [buildpaths]<br>
=C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-ctest contains refe=
rence to TMPDIR [buildpaths]<br>
<br>
To fix this, pass an additional -ffile-prefix-map option to DEBUG_PREFIX_MA=
P to<br>
ensure that paths under `${CARGO_HOME}` are remapped to `${TARGET_DBGSRC_DI=
R}`.<br>
This ensures debug info is reproducible and does not leak host-specific pat=
hs.<br>
<br>
Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">Yash.Shinde@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D"http://cargo-0.=
91.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.0.bb</a=
> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D"http://c=
argo-0.91.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.=
0.bb</a> b/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D"http://car=
go-0.91.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.0.=
bb</a><br>
index fd15f02da9..5ef68e13c2 100644<br>
--- a/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D"http://cargo-0.=
91.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.0.bb</a=
><br>
+++ b/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D"http://cargo-0.=
91.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.0.bb</a=
><br>
@@ -12,6 +12,8 @@ SRC_URI =3D &quot;crate://<a href=3D"http://crates.io/car=
go-c/$%7BPV%7D;name=3Dcargo-c" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">crates.io/cargo-c/${PV};name=3Dcargo-c</a> \<br>
=C2=A0SRC_URI[cargo-c.sha256sum] =3D &quot;17d431789b050b0fcf678455dfd5ceb7=
e5b45cd806140f8fe03b16b995d6cbff&quot;<br>
=C2=A0S =3D &quot;${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}&quot;<br>
<br>
+DEBUG_PREFIX_MAP +=3D &quot;-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_D=
BGSRC_DIR}&quot;<br>
+<br>
=C2=A0inherit cargo cargo-update-recipe-crates pkgconfig<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl curl&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224581): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224581" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/224581</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115653303/621=
3388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/115653303/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000331c000640a93ad8--

