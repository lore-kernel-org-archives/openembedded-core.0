Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53702E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 13:54:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.15998.1734098048242885535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 05:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=brPhXN0Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee74291415so1189521a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 05:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734098048; x=1734702848; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6/zA6j1w0h/nA5E/w0GnT2JEblkL31+Dj6G/kG+UNs=;
        b=brPhXN0Q6M8iWeKlExMYF3fANlyctnBAiXKV0IUBG1NWuSjQ/PTRLF/dENL+99zmol
         VQ4RQ6J74qUEr6DlBykNwhmOqYES3Gp8egT3DYe2YQYfYChBnziNtrBREj2j7+yJkJ/v
         VwbWRkSmnWrwKp+oB8s//5ywlol+tez/Z+nwODfWH9MHw6OgS5IB36TUtuDCzVe3s352
         UFDwPCUYM/PX/mal6kL41QuQ7t2AdXlZ2GJfep9fl2JaQvMp+vK4mKlquu6W6LArT7S0
         U6Q3rQc0P7Ln0Ud++RhJgQWqFZFuBu+eW6U4jGgXxvzPgHAynvRJJgtBp2A6uO3O3n5t
         grJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734098048; x=1734702848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6/zA6j1w0h/nA5E/w0GnT2JEblkL31+Dj6G/kG+UNs=;
        b=nc6logeCjZJ9pMBJvcQdkMqp7Hb0LvawYW7XPMuRl5XLRCA2RErM7/mSVFiC49meMl
         Dae7nUXu/Azd62wuPJuHIUCKGI9WWESy+x6b8jf//8YqWYTL4pYmSxEKoFoLGp3/eXsM
         OnkIc2Q0VveeemmVpdZp+YiyWm17IMpE8aG+ZQOHpvZSYYmTpJFutRkMVVHLkP95SPc+
         VzPl6M1WDFZE/8+YXAVfNO9ZhT3wiNBTC9/aO8+PYFpPTxWUMX4+lVphw3o3H1xc5JrT
         a/OdT6UawPgsUoT6l70V/RQp5xcz4wmh6HmddeG6N0HVpPTZWUSTCguB1pq5vjWEYVOF
         dSKA==
X-Gm-Message-State: AOJu0YxbshW2aAzO6gjxhQ1KbYvbBtoRaK5/TjY106pCs2bQzJ1fzokn
	EuNHKtUTmJqEDLDqKSXmsRG9qhJydAbjP6rrTX6NoQ9yc7GXhikA0/BF+RvHXhHICDNgBYO7YS5
	+99FmwrrtXqlAPKjDEpirtlM3OFA=
X-Gm-Gg: ASbGncsB03+3+Gn05vPky4o3EpXmkhOoWQu8vSPuGg3D5nhJ7/jHEmmze4QYYlUxadA
	49damiyu9qqhE/6ZH0b/SPOBOVT0qoVuT9IahWg==
X-Google-Smtp-Source: AGHT+IHbASk7zfml/0nis4Js17mHR+K6wLzYz7mA3UTN2nfbjgUoWWOQp0X+j7B14C+N8W53OAjRHxtQWfgxCeLIDeU=
X-Received: by 2002:a17:90b:1810:b0:2ee:a127:ba96 with SMTP id
 98e67ed59e1d1-2f2901b3261mr3636343a91.23.1734098047392; Fri, 13 Dec 2024
 05:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com> <20241212164407.2904755-6-adrian.freihofer@gmail.com>
In-Reply-To: <20241212164407.2904755-6-adrian.freihofer@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Dec 2024 08:53:54 -0500
Message-ID: <CADkTA4M=j1pJmvxRJ5wap=UgJZTOv=HZ9HNw_VPWqjoSdCi3Rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 5/5] systemd: split networkd into its own package
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000001ee2d30629272ad1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 13:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208684

--0000000000001ee2d30629272ad1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 11:44=E2=80=AFAM Adrian Freihofer via lists.openemb=
edded.org
<adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:

> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Support of images with different network management implementations
> without having to recompile systemd and other components.
>
> Fedora does this as well since systemd version 246.6-2:
> https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/systemd.spec#_5=
78
> This proves that it is technically possible and officially supported by
> systemd.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/recipes-core/systemd/systemd_256.8.bb | 28 +++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_256.8.bb
> b/meta/recipes-core/systemd/systemd_256.8.bb
> index c1915d7e941..0710377d32d 100644
> --- a/meta/recipes-core/systemd/systemd_256.8.bb
> +++ b/meta/recipes-core/systemd/systemd_256.8.bb
> @@ -412,6 +412,7 @@ PACKAGE_BEFORE_PN =3D "\
>      ${PN}-journal-remote \
>      ${PN}-kernel-install \
>      ${PN}-mime \
> +    ${PN}-networkd \
>      ${PN}-rpm-macros \
>      ${PN}-udev-rules \
>      ${PN}-vconsole-setup \
> @@ -440,6 +441,7 @@ SYSTEMD_PACKAGES =3D
> "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
> '${PN}-journal-gatewayd', '', d)} \
>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
> '${PN}-journal-remote', '', d)} \
>                      ${@bb.utils.contains('PACKAGECONFIG',
> 'journal-upload', '${PN}-journal-upload', '', d)} \
> +                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd',
> '${PN}-networkd', '', d)} \
>  "
>  SYSTEMD_SERVICE:${PN}-binfmt =3D "systemd-binfmt.service"
>
> @@ -448,12 +450,13 @@ USERADD_PACKAGES =3D "${PN} \
>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
> '${PN}-journal-gatewayd', '', d)} \
>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
> '${PN}-journal-remote', '', d)} \
>                      ${@bb.utils.contains('PACKAGECONFIG',
> 'journal-upload', '${PN}-journal-upload', '', d)} \
> +                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd',
> '${PN}-networkd', '', d)} \
>  "
>

Possibly an already asked and answered question (I scanned quickly, but I
didn't see it).

Is there any reason why networkd shouldn't be in the default PACKAGECONFIG
? This is a change of behaviour, that should be opt-in, not opt-out.

Bruce



>  GROUPADD_PARAM:${PN} =3D "-r systemd-journal;"
>  GROUPADD_PARAM:udev =3D "-r render"
>  GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'coredum=
p',
> '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
> -USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'network=
d',
> '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
> +USERADD_PARAM:${PN}-networkd =3D "--system -d / -M --shell /sbin/nologin
> systemd-network"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit'=
,
> '--system --no-create-home --user-group --home-dir ${datadir}/polkit-1
> polkitd;', '', d)}"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'resolve=
d',
> '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;',
> '', d)}"
> @@ -620,6 +623,27 @@ FILES:${PN}-extra-utils =3D "\
>  FILES:${PN}-mime =3D "${MIMEDIR}"
>  RRECOMMENDS:${PN} +=3D "${PN}-mime"
>
> +FILES:${PN}-networkd =3D "\
> +    ${bindir}/networkctl \
> +    ${datadir}/dbus-1/system-services/org.freedesktop.network1.service \
> +    ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
> +    ${datadir}/polkit-1/actions/org.freedesktop.network1.policy \
> +    ${nonarch_libdir}/sysusers.d/systemd-network.conf \
> +    ${nonarch_libdir}/tmpfiles.d/systemd-network.conf \
> +    ${sysconfdir}/systemd/networkd.conf \
> +    ${systemd_system_unitdir}/systemd-networkd* \
> +    ${systemd_unitdir}/network/*.network \
> +    ${systemd_unitdir}/network/*.network.example \
> +    ${systemd_unitdir}/networkd.conf \
> +    ${systemd_unitdir}/systemd-networkd* \
> +"
> +# systemd-networkd-persistent-storage.service
> BindsTo=3Dsystemd-networkd.service
> +# systemd-networkd.service has Also=3Dsystemd-networkd-wait-online.servi=
ce
> +SYSTEMD_SERVICE:${PN}-networkd =3D "systemd-networkd.service"
> +CONFFILES:${PN}-networkd =3D "${sysconfdir}/systemd/networkd.conf"
> +RDEPENDS:${PN}-networkd +=3D "${PN}"
> +RRECOMMENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'networkd'=
,
> '${PN}-networkd', '', d)}"
> +
>  FILES:${PN}-udev-rules =3D "\
>                          ${nonarch_libdir}/udev/rules.d/70-uaccess.rules =
\
>                          ${nonarch_libdir}/udev/rules.d/71-seat.rules \
> @@ -630,7 +654,6 @@ FILES:${PN}-udev-rules =3D "\
>  CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>         ${sysconfdir}/systemd/journald.conf \
>         ${sysconfdir}/systemd/logind.conf \
> -       ${sysconfdir}/systemd/networkd.conf \
>         ${sysconfdir}/systemd/pstore.conf \
>         ${sysconfdir}/systemd/resolved.conf \
>         ${sysconfdir}/systemd/sleep.conf \
> @@ -698,7 +721,6 @@ FILES:${PN} =3D " ${base_bindir}/* \
>                  ${nonarch_libdir}/modprobe.d/README \
>                  ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.con=
f
> \
>                  ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf =
\
> -                ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf=
 \
>                  ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.conf=
 \
>                  ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf=
 \
>                  ${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback',
> '${datadir}/dbus-1/system.d/org.freedesktop.hostname1_no_polkit.conf', ''=
,
> d)} \
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208658):
> https://lists.openembedded.org/g/openembedded-core/message/208658
> Mute This Topic: https://lists.openembedded.org/mt/110082903/1050810
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

--0000000000001ee2d30629272ad1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 12, 2024 at 11:44=
=E2=80=AFAM Adrian Freihofer via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;adrian.freihofer=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Adrian Fre=
ihofer &lt;<a href=3D"mailto:adrian.freihofer@siemens.com" target=3D"_blank=
">adrian.freihofer@siemens.com</a>&gt;<br>
<br>
Support of images with different network management implementations<br>
without having to recompile systemd and other components.<br>
<br>
Fedora does this as well since systemd version 246.6-2:<br>
<a href=3D"https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/system=
d.spec#_578" rel=3D"noreferrer" target=3D"_blank">https://src.fedoraproject=
.org/rpms/systemd/blob/rawhide/f/systemd.spec#_578</a><br>
This proves that it is technically possible and officially supported by<br>
systemd.<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_256.8.bb</a> | 28 +++++++++++++++++++=
---<br>
=C2=A01 file changed, 25 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_256.8.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_256.8.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_256.8.bb</a><br>
index c1915d7e941..0710377d32d 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_256.8.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_256.8.bb</a><br>
@@ -412,6 +412,7 @@ PACKAGE_BEFORE_PN =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-journal-remote \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-kernel-install \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-mime \<br>
+=C2=A0 =C2=A0 ${PN}-networkd \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-rpm-macros \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-udev-rules \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-vconsole-setup \<br>
@@ -440,6 +441,7 @@ SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;PA=
CKAGECONFIG&#39;, &#39;binfmt&#39;, &#39;${PN}-binfm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;microhttpd&#39;, &#39=
;${PN}-journal-gatewayd&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;microhttpd&#39;, &#39=
;${PN}-journal-remote&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;journal-upload&#39;, =
&#39;${PN}-journal-upload&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@b=
b.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;networkd&#39;, &#39;${PN}-ne=
tworkd&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
=C2=A0SYSTEMD_SERVICE:${PN}-binfmt =3D &quot;systemd-binfmt.service&quot;<b=
r>
<br>
@@ -448,12 +450,13 @@ USERADD_PACKAGES =3D &quot;${PN} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;microhttpd&#39;, &#39=
;${PN}-journal-gatewayd&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;microhttpd&#39;, &#39=
;${PN}-journal-remote&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;journal-upload&#39;, =
&#39;${PN}-journal-upload&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@b=
b.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;networkd&#39;, &#39;${PN}-ne=
tworkd&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Possibly an already asked and answered questio=
n (I scanned quickly, but I didn&#39;t see it).</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Is there any reason why networkd shouldn&#39;t be in=
 the default PACKAGECONFIG ? This is a change of behaviour, that should be =
opt-in, not opt-out.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0GROUPADD_PARAM:${PN} =3D &quot;-r systemd-journal;&quot;<br>
=C2=A0GROUPADD_PARAM:udev =3D &quot;-r render&quot;<br>
=C2=A0GROUPADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;-r systemd-hostname;&#39=
;, &#39;&#39;, d)}&quot;<br>
=C2=A0USERADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;coredump&#39;, &#39;--system -d / -M --shell /sbin/nologin sys=
temd-coredump;&#39;, &#39;&#39;, d)}&quot;<br>
-USERADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39=
;, &#39;networkd&#39;, &#39;--system -d / -M --shell /sbin/nologin systemd-=
network;&#39;, &#39;&#39;, d)}&quot;<br>
+USERADD_PARAM:${PN}-networkd =3D &quot;--system -d / -M --shell /sbin/nolo=
gin systemd-network&quot;<br>
=C2=A0USERADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;polkit&#39;, &#39;--system --no-create-home --user-group --hom=
e-dir ${datadir}/polkit-1 polkitd;&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0USERADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;resolved&#39;, &#39;--system -d / -M --shell /sbin/nologin sys=
temd-resolve;&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0USERADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;timesyncd&#39;, &#39;--system -d / -M --shell /sbin/nologin sy=
stemd-timesync;&#39;, &#39;&#39;, d)}&quot;<br>
@@ -620,6 +623,27 @@ FILES:${PN}-extra-utils =3D &quot;\<br>
=C2=A0FILES:${PN}-mime =3D &quot;${MIMEDIR}&quot;<br>
=C2=A0RRECOMMENDS:${PN} +=3D &quot;${PN}-mime&quot;<br>
<br>
+FILES:${PN}-networkd =3D &quot;\<br>
+=C2=A0 =C2=A0 ${bindir}/networkctl \<br>
+=C2=A0 =C2=A0 ${datadir}/dbus-1/system-services/org.freedesktop.network1.s=
ervice \<br>
+=C2=A0 =C2=A0 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \<b=
r>
+=C2=A0 =C2=A0 ${datadir}/polkit-1/actions/org.freedesktop.network1.policy =
\<br>
+=C2=A0 =C2=A0 ${nonarch_libdir}/sysusers.d/systemd-network.conf \<br>
+=C2=A0 =C2=A0 ${nonarch_libdir}/tmpfiles.d/systemd-network.conf \<br>
+=C2=A0 =C2=A0 ${sysconfdir}/systemd/networkd.conf \<br>
+=C2=A0 =C2=A0 ${systemd_system_unitdir}/systemd-networkd* \<br>
+=C2=A0 =C2=A0 ${systemd_unitdir}/network/*.network \<br>
+=C2=A0 =C2=A0 ${systemd_unitdir}/network/*.network.example \<br>
+=C2=A0 =C2=A0 ${systemd_unitdir}/networkd.conf \<br>
+=C2=A0 =C2=A0 ${systemd_unitdir}/systemd-networkd* \<br>
+&quot;<br>
+# systemd-networkd-persistent-storage.service BindsTo=3Dsystemd-networkd.s=
ervice<br>
+# systemd-networkd.service has Also=3Dsystemd-networkd-wait-online.service=
<br>
+SYSTEMD_SERVICE:${PN}-networkd =3D &quot;systemd-networkd.service&quot;<br=
>
+CONFFILES:${PN}-networkd =3D &quot;${sysconfdir}/systemd/networkd.conf&quo=
t;<br>
+RDEPENDS:${PN}-networkd +=3D &quot;${PN}&quot;<br>
+RRECOMMENDS:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;,=
 &#39;networkd&#39;, &#39;${PN}-networkd&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
=C2=A0FILES:${PN}-udev-rules =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${nonarch_libdir}/udev/rules.d/70-uaccess.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0${nonarch_libdir}/udev/rules.d/71-seat.rules \<br>
@@ -630,7 +654,6 @@ FILES:${PN}-udev-rules =3D &quot;\<br>
=C2=A0CONFFILES:${PN} =3D &quot;${sysconfdir}/systemd/coredump.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/systemd/journald.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/systemd/logind.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/systemd/networkd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/systemd/pstore.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/systemd/resolved.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/systemd/sleep.conf \<br>
@@ -698,7 +721,6 @@ FILES:${PN} =3D &quot; ${base_bindir}/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${nonarch_lib=
dir}/modprobe.d/README \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/system.d/org.freedesktop.timedate1.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/system.d/org.freedesktop.locale1.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/dbus-1/=
system.d/org.freedesktop.network1.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/system.d/org.freedesktop.resolve1.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/db=
us-1/system.d/org.freedesktop.systemd1.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.c=
ontains(&#39;PACKAGECONFIG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;=
${datadir}/dbus-1/system.d/org.freedesktop.hostname1_no_polkit.conf&#39;, &=
#39;&#39;, d)} \<br>
-- <br>
2.47.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#208658): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208658" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/208658</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110082903/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110082903/1050810</a><br>
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

--0000000000001ee2d30629272ad1--

