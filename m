Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F8FC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 12:13:28 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.5243.1700136804331556423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 04:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UN/9egwN;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7b9f08482c8so276391241.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 04:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700136803; x=1700741603; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n8zZMuoDLFRwZLtS7BeEwu7j51EehMf8aUXZCAp0Pvs=;
        b=UN/9egwN/k2+SLh2EJbe83VvcqSsBN7HTiGzyEfRqpSoOIF+XwFF2nqnE+3U1VKwr9
         UjPbmUriVODoH8zG9GW2hkfK0WVtP1AYsYwu2g7dj8tgInjO3EE6I8PJ8micDBw8Kq7x
         EVgZGMq94rRZvqrvn+Pjm91MGISCNmHlfKyoSK3AjRsMxYyRWeb6OSsaHs8aXavNJWTg
         P9Ct36oyrbeDzqya4WjXMYsY/A8gUkA3EXI4wRpNVS+G5n71U0VsGRpBRjOy31v7KAsY
         v2VHRy7H5qGyudrRCAcBAycWTuDM9s+AUCa+z8WSXJg2OatdCoZEcqByCGLcjV5fL4YA
         MhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136803; x=1700741603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8zZMuoDLFRwZLtS7BeEwu7j51EehMf8aUXZCAp0Pvs=;
        b=u/+d4jalzWDUBeEI0cM0yhEsyaCFu2on9XAgYh7KH9IN+5yNLtF83tBKUFqnonc6PP
         j+XT4IpdOr2wHFmiLF8SV1UMcnm3fND5oXZpvBIRyhRRxmqGIe/4nBWZb375wKIMdSKY
         56D1AN9kCqXi+1uTaSusVlnTJqXKhQSxTC3bi54gek3SYfDfuxVYtI8Ov15MIv76h1OO
         TzUmc+GTuQMUDIdISgiw5tSdpbBOYdVKbBh4Ie1oNbFOi08Fh480q6qhzk/FqMYeI0xY
         7MIyLGEbMaxkHXxJ+i/FSEQuA1GCY3SrJaKqyXYErFySz9E3edXVufeb3ngwhGUeUKdS
         DmLA==
X-Gm-Message-State: AOJu0YwPWp7SWhnZfzpfn8d9+qywqyZMcSgHnIYQe/LsY4FdCiS4C6ru
	QzFEP8djTdTCezKc4HF+fmAhs/G2+554qkxGaYUGoHRLAyQ=
X-Google-Smtp-Source: AGHT+IHUjWF0oCf3fMGmiAWBAM5bqtL5U+aAQelqhZhR1YFV5UlqKybPnoxHxhjNlw0pPcVyUWOtfNXiT4eGGQ4cOLw=
X-Received: by 2002:a67:c10b:0:b0:45f:1107:95f3 with SMTP id
 d11-20020a67c10b000000b0045f110795f3mr12004396vsj.34.1700136803165; Thu, 16
 Nov 2023 04:13:23 -0800 (PST)
MIME-Version: 1.0
References: <20231116115457.1462082-1-lukas.funke-oss@weidmueller.com> <20231116115457.1462082-2-lukas.funke-oss@weidmueller.com>
In-Reply-To: <20231116115457.1462082-2-lukas.funke-oss@weidmueller.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 16 Nov 2023 12:13:12 +0000
Message-ID: <CANPvuRmC7t-2zj2ZfJyUO35SqceBRXKBpq1L4S6BGZm2_VW7ow@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 1/4] systemd: use nonarch libdir for tmpfiles.d
To: lukas.funke-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org, 
	Malte Schmidt <malte.schmidt@weidmueller.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, 
	Lukas Funke <lukas.funke@weidmueller.com>
Content-Type: multipart/alternative; boundary="00000000000038ea9a060a43f22c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 12:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190792

--00000000000038ea9a060a43f22c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<lukas.funke-oss@weidmueller.com> escreveu no dia quinta, 16/11/2023 =C3=A0=
(s)
11:55:

> From: Malte Schmidt <malte.schmidt@weidmueller.com>
>
> The documentation of systemd states that /etc/tmpfiles.d should be
> reserved for the local administrator and packages should put their files
> in /usr/lib/tmpfiles.d [1].
>
> [1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html
>
> Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> b/meta/recipes-core/systemd/systemd_254.4.bb
> index cc0e29fdd2..6d71fbaba2 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -282,12 +282,12 @@ do_install() {
>         [ ! -e ${D}/${base_sbindir}/udevd ] && ln -s
> ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
>
>         install -d ${D}${sysconfdir}/udev/rules.d/
> -       install -d ${D}${sysconfdir}/tmpfiles.d
> +       install -d ${D}${nonarch_libdir}/tmpfiles.d
>         for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name
> "*.rules"); do
>                 install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
>         done
>
> -       install -m 0644 ${WORKDIR}/00-create-volatile.conf
> ${D}${sysconfdir}/tmpfiles.d/
> +       install -m 0644 ${WORKDIR}/00-create-volatile.conf
> ${D}${exec_prefix}/lib/tmpfiles.d/
>

${nonarch_libdir} still missing there.


>
>         if
> ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; the=
n
>                 install -d ${D}${sysconfdir}/init.d
> --
> 2.30.2
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000038ea9a060a43f22c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:lukas.funke-oss=
@weidmueller.com">lukas.funke-oss@weidmueller.com</a>&gt; escreveu no dia q=
uinta, 16/11/2023 =C3=A0(s) 11:55:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Malte Schmidt &lt;<a href=3D"mailto:malte.schmidt@=
weidmueller.com" target=3D"_blank">malte.schmidt@weidmueller.com</a>&gt;<br=
>
<br>
The documentation of systemd states that /etc/tmpfiles.d should be<br>
reserved for the local administrator and packages should put their files<br=
>
in /usr/lib/tmpfiles.d [1].<br>
<br>
[1] <a href=3D"https://www.freedesktop.org/software/systemd/man/tmpfiles.d.=
html" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop.org/soft=
ware/systemd/man/tmpfiles.d.html</a><br>
<br>
Signed-off-by: Malte Schmidt &lt;<a href=3D"mailto:malte.schmidt@weidmuelle=
r.com" target=3D"_blank">malte.schmidt@weidmueller.com</a>&gt;<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
Signed-off-by: Lukas Funke &lt;<a href=3D"mailto:lukas.funke@weidmueller.co=
m" target=3D"_blank">lukas.funke@weidmueller.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_254.4.bb</a><br>
index cc0e29fdd2..6d71fbaba2 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
@@ -282,12 +282,12 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -e ${D}/${base_sbindir}/udevd ] &amp;&amp; =
ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/udev/rules.d/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/tmpfiles.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${nonarch_libdir}/tmpfiles.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for rule in $(find ${WORKDIR} -maxdepth 1 -type=
 f -name &quot;*.rules&quot;); do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 $ru=
le ${D}${sysconfdir}/udev/rules.d/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/00-create-volatile.c=
onf ${D}${sysconfdir}/tmpfiles.d/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/00-create-volatile.c=
onf ${D}${exec_prefix}/lib/tmpfiles.d/<br></blockquote><div><br></div><div>=
<span style=3D"color:rgb(0,0,0)">${nonarch_libdir} still missing there.</sp=
an><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
sconfdir}/init.d<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000038ea9a060a43f22c--

