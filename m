Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48C3C4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:11:10 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web11.10372.1699960261718023404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ayy5tXDP;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-45d955fcabdso1727488137.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 03:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699960261; x=1700565061; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Umk2vbOdjuy8hxjVi1HUh0StjjYMxplzE0LsJFTIlfg=;
        b=ayy5tXDPXiF43eTRHTivKVIIFsCjDWRGmZc/e1UnZyJNFvjfPmZVQbFDap3E/WBIpe
         9Ac0wgtgYh0XU386XjV8G+MiAP2yfSSGDIL4NKyP7VV9/9GMSUg/vKPO7TglQh73H2xf
         VzzSdjKMBapSDqp7Yoqs1pSh+RPW6iH/EUhAP++julat3JSSe6i1UWGDuDgee8wcuWAf
         bXDnwi+w6VLJ+4KUZVBRTFWS/QG9OOF6/Rc3VibtoElXdfgipyS8pI27WI6IUwD04iKw
         B9uO6eAgbn3wKuQN5yVddXAut+m7soPMJzL+W39a57SpZA11ScT5l5bIJ5jiscYV6R3J
         QgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699960261; x=1700565061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Umk2vbOdjuy8hxjVi1HUh0StjjYMxplzE0LsJFTIlfg=;
        b=Fv9zB2Ot7MeE/nFUX9UukZRcbvQRGkkB9VrgaBCezICRe3f+cwR5dv241idZGqlpBb
         QFnygHir0n0lFDeqDWZ/Qv2RSJi13FY1KVBR5ZA4HRmnkGyvohkYp/oSnzomrkS/MRyy
         87eHMwYCUB2SC5Ef6Dz1be5QmTy4TypJASoBc++l4p9GRc67sSE8Lf0DPtecBqxIJdS4
         FSif2VNmHgoR1akmsV3VegS2APnez/WvN3v5V1x9bPGm5Evg5zIX/LYmq5tK/S7JCgkq
         ywbk4c3V3NL8oBc3jGFQ/teyPTLseAUZiPC7jWDSHlxWswahDpmcBgk0gacIAYcUW0Fr
         GVJg==
X-Gm-Message-State: AOJu0YwDpx4Z7iZGZtK32viAoJa1S9SX5YS6B3WOCAwni3NavmpW42Nl
	TM7S+P5k1tjyk2Ehlv3g2bgxfuaxLl1Codzp9iU=
X-Google-Smtp-Source: AGHT+IGhyHZ9lMZeSiOdZBJQ3NJyS/B4R2NlwNTtd8BqQRxzyHT0F5LRAR6+QQGhYXK4iyjXo25BOyMmnsFOfn64s6s=
X-Received: by 2002:a67:a407:0:b0:45d:9cc7:b8df with SMTP id
 n7-20020a67a407000000b0045d9cc7b8dfmr5092858vse.1.1699960260717; Tue, 14 Nov
 2023 03:11:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699958492.git.lukas.funke@weidmueller.com> <997d53a3599a9c3c203f3ea538df1e411241b2c2.1699958492.git.lukas.funke@weidmueller.com>
In-Reply-To: <997d53a3599a9c3c203f3ea538df1e411241b2c2.1699958492.git.lukas.funke@weidmueller.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 14 Nov 2023 11:10:49 +0000
Message-ID: <CANPvuR=RwiOcL4GX87D49npyXWzs-AqDy940FC-Ybqi=F76r_w@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/4] systemd: use nonarch libdir for tmpfiles.d
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	Malte Schmidt <malte.schmidt@weidmueller.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="00000000000078f321060a1ad760"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190500

--00000000000078f321060a1ad760
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lukas Funke <lukas.funke-oss@weidmueller.com> escreveu no dia ter=C3=A7a,
14/11/2023 =C3=A0(s) 11:00:

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
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> b/meta/recipes-core/systemd/systemd_254.4.bb
> index cc0e29fdd2..48d467dfdd 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -282,12 +282,12 @@ do_install() {
>         [ ! -e ${D}/${base_sbindir}/udevd ] && ln -s
> ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
>
>         install -d ${D}${sysconfdir}/udev/rules.d/
> -       install -d ${D}${sysconfdir}/tmpfiles.d
> +       install -d ${D}${exec_prefix}/lib/tmpfiles.d

        for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name "*.rules");
> do
>                 install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
>         done
>
> -       install -m 0644 ${WORKDIR}/00-create-volatile.conf
> ${D}${sysconfdir}/tmpfiles.d/
> +       install -m 0644 ${WORKDIR}/00-create-volatile.conf
> ${D}${exec_prefix}/lib/tmpfiles.d/
>
>         if
> ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; the=
n
>                 install -d ${D}${sysconfdir}/init.d
> --
> 2.30.2
>
>
Hi Lukas,

Why not ${nonarch_libdir} instead of ${exec_prefix}/lib as in all the other
patches in this series?

Jose


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190493):
> https://lists.openembedded.org/g/openembedded-core/message/190493
> Mute This Topic: https://lists.openembedded.org/mt/102581153/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000078f321060a1ad760
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Lukas Funke &lt;<a href=3D"mailto:luk=
as.funke-oss@weidmueller.com">lukas.funke-oss@weidmueller.com</a>&gt; escre=
veu no dia ter=C3=A7a, 14/11/2023 =C3=A0(s) 11:00:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Malte Schmidt &lt;<a href=3D"mailt=
o:malte.schmidt@weidmueller.com" target=3D"_blank">malte.schmidt@weidmuelle=
r.com</a>&gt;<br>
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
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_254.4.bb</a><br>
index cc0e29fdd2..48d467dfdd 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${exec_prefix}/lib/tmpfiles.d=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for rule in $(find ${WORKDIR} -maxdepth 1 -type=
 f -name &quot;*.rules&quot;); do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 $ru=
le ${D}${sysconfdir}/udev/rules.d/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/00-create-volatile.c=
onf ${D}${sysconfdir}/tmpfiles.d/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/00-create-volatile.c=
onf ${D}${exec_prefix}/lib/tmpfiles.d/<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
sconfdir}/init.d<br>
-- <br>
2.30.2<br>
<br></blockquote><div><br></div><div>Hi Lukas,<br><br>Why not ${nonarch_lib=
dir} instead of ${exec_prefix}/lib as in all the other patches in this seri=
es?<br><br>Jose<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190493): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190493" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190493</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102581153/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102581153/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000078f321060a1ad760--

