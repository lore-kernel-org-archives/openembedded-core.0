Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C902BE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 16:13:50 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.60384.1734365624912978111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 08:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OywbwEhx;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6eff5f99de4so47600367b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 08:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734365624; x=1734970424; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S6Gtr0oEuTF5tC0T6eTnPLGZeU5lriAbg15mlrUHlhI=;
        b=OywbwEhxmOBLjIFKQSl0KmIwerTMezxKl8QKECxXzUaPNd5/5vfABH5xxpITbBsXri
         useDoIEDMrtZs++j7MRD8zLKiJNI3t2j3ud6MWFdctUGLk06L2bTiyGp0/isu6xYMTs1
         gOS9oIAj3FHobQSb4SJrQVlKGECWXEK+cc/9E+sCX+VjiUTnHFxbuwaK9g1SzhaQa/X8
         T7+2+X+eCo41RLp9zEkk1yAcMMRc/EZQcabsbRHhl1cvRkAqe6gYHW1doteNSBwsispc
         curnhCUUEFwG8GG9P2Ay+Aexfeof6kagMG4Oy/e8Zf7XXjfSJUd4jaWGbUIDob/md4Jm
         wQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734365624; x=1734970424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6Gtr0oEuTF5tC0T6eTnPLGZeU5lriAbg15mlrUHlhI=;
        b=xGNV1DS5xmoPuTt6w/dxcnC5sCKzTb99xhV3kcMyDuX6o8ri3NB7Vl2tZSXlWpBXr4
         Z5M+BPSNz3KjsFK/8W/HoXURmYBYWMhB4Z9k0f1E5ZSo40KsyQV3cyIQ++ylsVquN6vt
         CD+eqk20gkA5Dh/DnqA/MBL0f7DomA4Z4OZO8XLkZhMFZKJynhIxBdZnZuERp8Pc8hb5
         d0U/EyipmP1/znhPopYV2KWZeGhcsg61r9T/aUETd02halv80h/XSMSZ51VUFVZxMNVb
         9bm3Z/MoNj809wY81tzJOSoxVMX9ZILX0AOnmkbjlGTMIQrO0/kW2ect9EhmAuZ9SKFI
         oOHA==
X-Forwarded-Encrypted: i=1; AJvYcCUsmpC8DSnrG9DOvAB/rL5svStPgrx6BCaO9ERXxaSUjaPnh0deCo/6bdgSC2fsN/8KiZjlRtC4XqbQrGufOlOh5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3AvQipu65Z+YWC1iY93udLwZeZiuqgENR6Td62tfD5MrifW12
	bjMO10h+t/1s3MnEmcbU2iejwkzZeQLokLlJ43uEvV9n2lVgGM0SMG04z9M5x3d+D/tYgb59NZd
	6t+4c2nCNCgRJi22aZBHECbuPKas=
X-Gm-Gg: ASbGnctOXrluPnW9XhEgpDkRoPXp4Zg9X4VdOCR12/7kFvAz7kvRrSS6/CTe6ai8dOy
	HUNp6hR88eu8t7E3nFVm1+L0xgLXOROVCL40hJw==
X-Google-Smtp-Source: AGHT+IEm9gar9pHAEE8pcnsa1KgbwBfLBnoHYK+vZQIN4H+aWnXB6BOuJSv1Q0jShAEjX+9rnhptbpfwtlDxTGcDO3o=
X-Received: by 2002:a05:690c:7449:b0:6ea:95f5:2607 with SMTP id
 00721157ae682-6f279ac6d5fmr89248907b3.5.1734365623963; Mon, 16 Dec 2024
 08:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
 <20241212164407.2904755-6-adrian.freihofer@gmail.com> <CADkTA4M=j1pJmvxRJ5wap=UgJZTOv=HZ9HNw_VPWqjoSdCi3Rg@mail.gmail.com>
 <CAB3asfhrR1YgEszaw1QDWHrGKd5sKYVZkXeh18GujmnGFuUnNA@mail.gmail.com>
 <CADkTA4Me3XVW3X3RAEkBrM-GV9mtQhjhAaucXWONyFsOus9yXw@mail.gmail.com> <b601efa721d5d19e44df022c788442cfd2c80677.camel@siemens.com>
In-Reply-To: <b601efa721d5d19e44df022c788442cfd2c80677.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Dec 2024 11:13:31 -0500
Message-ID: <CADkTA4NtPbqpH2guU=KuNxSNch3PsNvMpLpB-_UH3_X=sX5W1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 5/5] systemd: split networkd into its own package
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Cc: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed579c06296576fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 16:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208779

--000000000000ed579c06296576fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 11:08=E2=80=AFAM Freihofer, Adrian <
adrian.freihofer@siemens.com> wrote:

> On Sun, 2024-12-15 at 23:41 -0500, Bruce Ashfield wrote:
>
>
>
> On Fri, Dec 13, 2024 at 4:48=E2=80=AFPM Adrian Freihofer <
> adrian.freihofer@gmail.com> wrote:
>
> Am Fr., 13. Dez. 2024 um 14:54 Uhr schrieb Bruce Ashfield <
> bruce.ashfield@gmail.com>:
>
>
>
> On Thu, Dec 12, 2024 at 11:44=E2=80=AFAM Adrian Freihofer via
> lists.openembedded.org <adrian.freihofer=3Dgmail.com@lists.openembedded.o=
rg>
> wrote:
>
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
>
> Possibly an already asked and answered question (I scanned quickly, but I
> didn't see it).
>
> Is there any reason why networkd shouldn't be in the default PACKAGECONFI=
G
> ? This is a change of behaviour, that should be opt-in, not opt-out.
>
> I'm not sure what you mean. networkd was and remains part of the default
> PACKAGECONFIG.
> My intention is not to change the default behavior. Could you give me a
> hint where this is mistakenly happening anyway in this case?
>
>
> I almost always read patches looking at the patch itself, and don't
> do any research or looking outside of the patch itself. If something
> isn't explained in the patch or causes me to wonder, it usually means
> that the patch commit needs some tweaking.
>
> In this case from the context of this patch, I see you packaging
> based on a PACKAGECONFIG, but since the PACKAGECONFIG
> isn't in the patch itself, I have no idea what the default of the recipe
> in question is.
>
> I also only see RRECOMMENDS for the new package on the main
> PN, which means that someone without rrecommends enabled
> will see different behaviour.
>
> So my point would be that the comment that the default isn't
> changed (and then describe what that is so), as well as commenting
> on rrecommends vs rdepends, should be captured in the commit
> log.
>
>
> Thank you for the explanation. Now it's understandable. Your suggesting
> that I should add something like the following sentence to the commit
> message:
>
> The systemd package RRECOMMENDS the new package systemd-networkd. As long
> as the RRECOMMENDED packages are not excluded, the change is expected to =
be
> fully backward compatible.
> However, for builds where the RRECOMMENDED packages are not installed,
> systemd-networkd was installed before this commit, but no longer after th=
is
> commit.
>
>
Yes, that's it. That'd do the job!

Bruce



> Adrian
>
>
> Bruce
>
>
>
>
>
>
> Adrian
>
>
> Bruce
>
>
>
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
>
>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ed579c06296576fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 11:08=
=E2=80=AFAM Freihofer, Adrian &lt;<a href=3D"mailto:adrian.freihofer@siemen=
s.com">adrian.freihofer@siemens.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div class=3D"msg1502483019594178923">




<div>
<div>On Sun, 2024-12-15 at 23:41 -0500, Bruce Ashfield wrote:</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small"><br>
</div>
</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 13, 2024 at 4:48=E2=80=AF=
PM Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.com" targe=
t=3D"_blank">adrian.freihofer@gmail.com</a>&gt; wrote:<br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 13. Dez. 2024 um 14:54=C2=A0U=
hr schrieb Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;:<br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"font-size:small"><br>
</div>
</div>
<br>
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 12, 2024 at 11:44=E2=80=
=AFAM Adrian Freihofer via
<a href=3D"http://lists.openembedded.org/" target=3D"_blank">
lists.openembedded.org</a> &lt;adrian.freihofer=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div>From: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siemens.=
com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
</div>
<div><br>
Support of images with different network management implementations<br>
without having to recompile systemd and other components.<br>
</div>
<div><br>
Fedora does this as well since systemd version 246.6-2:<br>
</div>
<div><a href=3D"https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/s=
ystemd.spec#_578" rel=3D"noreferrer" target=3D"_blank">https://src.fedorapr=
oject.org/rpms/systemd/blob/rawhide/f/systemd.spec#_578</a><br>
This proves that it is technically possible and officially supported by<br>
systemd.<br>
</div>
<div><br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb/" rel=3D=
"noreferrer" target=3D"_blank">systemd_256.8.bb</a>
 | 28 +++++++++++++++++++---<br>
=C2=A01 file changed, 25 insertions(+), 3 deletions(-)<br>
</div>
<div><br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb/"=
 rel=3D"noreferrer" target=3D"_blank">systemd_256.8.bb</a>
 b/meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb/" rel=3D"no=
referrer" target=3D"_blank">systemd_256.8.bb</a><br>
index c1915d7e941..0710377d32d 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb/" rel=3D=
"noreferrer" target=3D"_blank">systemd_256.8.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_256.8.bb/" rel=3D=
"noreferrer" target=3D"_blank">systemd_256.8.bb</a><br>
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
</div>
<div><br>
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
=C2=A0&quot;<br>
</div>
<br>
</blockquote>
<div><br>
</div>
<div>
<div style=3D"font-size:small">Possibly an already asked and answered quest=
ion (I scanned quickly, but I didn&#39;t see it).</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Is there any reason why networkd shouldn&#39=
;t be in the default PACKAGECONFIG ? This is a change of behaviour, that sh=
ould be opt-in, not opt-out.</div>
</div>
</div>
</div>
<br>
</blockquote>
I&#39;m not sure what you mean. networkd was and remains part of the defaul=
t PACKAGECONFIG.<br>
My intention is not to change the default behavior. Could you give me a hin=
t where this is mistakenly happening anyway in this case?</div>
</div>
<br>
</blockquote>
<div><br>
</div>
<div>
<div style=3D"font-size:small">I almost always read patches looking at the =
patch itself, and don&#39;t</div>
<div style=3D"font-size:small">do any research or looking outside of the pa=
tch itself. If something</div>
<div style=3D"font-size:small">isn&#39;t explained in the patch or causes m=
e to wonder, it usually means</div>
<div style=3D"font-size:small">that the patch commit needs some tweaking.</=
div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">In this case from the context of this patch,=
 I see you packaging</div>
<div style=3D"font-size:small">based on a PACKAGECONFIG, but since the PACK=
AGECONFIG</div>
<div style=3D"font-size:small">isn&#39;t in the patch itself, I have no ide=
a what the default of the recipe</div>
<div style=3D"font-size:small">in question is.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">I also only see RRECOMMENDS for the new pack=
age on the main</div>
<div style=3D"font-size:small">PN, which means that someone without rrecomm=
ends=C2=A0enabled</div>
<div style=3D"font-size:small">will see different behaviour.</div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">So my point would be that the comment that t=
he default isn&#39;t</div>
<div style=3D"font-size:small">changed (and then describe what that is so),=
 as well as commenting</div>
<div style=3D"font-size:small">on rrecommends vs rdepends, should be captur=
ed in the commit</div>
<div style=3D"font-size:small">log.</div>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>Thank you for the explanation. Now it&#39;s understandable. Your sugge=
sting that I should add something like the following sentence to the commit=
 message:</div>
<div><br>
</div>
<div></div>
<div></div>
<div>
<div>The systemd package RRECOMMENDS the new package systemd-networkd. As l=
ong as the RRECOMMENDED packages are not excluded, the change is expected t=
o be fully backward compatible.</div>
<div>However, for builds where the RRECOMMENDED packages are not installed,=
 systemd-networkd was installed before this commit, but no longer after thi=
s commit.</div>
</div>
<div><br></div></div></div></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">Yes, that&#39;s it. That&#39;d do t=
he job!</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 class=3D"msg1502483019594178923"><div><div>
</div>
<div>Adrian</div>
<div><br>
</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Bruce</div>
<br>
</div>
<div>=C2=A0</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div style=3D"font-size:small">=C2=A0</div>
</div>
</div>
<br>
</blockquote>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div class=3D"gmail_quote"><br>
</div>
<div class=3D"gmail_quote">Adrian<br>
</div>
<div class=3D"gmail_quote">
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div style=3D"font-size:small"><br>
</div>
<div style=3D"font-size:small">Bruce</div>
<br>
</div>
<div>=C2=A0</div>
<blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;border-left:2px=
 solid rgb(114,159,207);padding-left:1ex">
<div>=C2=A0GROUPADD_PARAM:${PN} =3D &quot;-r systemd-journal;&quot;<br>
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
</div>
<div><br>
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
</div>
</blockquote>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
<div><br>
</div>
<div><span>
<pre><br></pre>
<pre></pre>
</span></div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000ed579c06296576fe--

