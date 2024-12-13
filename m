Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B486E77180
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 21:48:49 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.6701.1734126522922102365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 13:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N0HuAP/1;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f31b3db5ecso859551eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 13:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734126522; x=1734731322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RpmWysYV9D+VpzTcdOeUONYiH9TznNjSVBQ+K4R/bRM=;
        b=N0HuAP/1PU7k37udsjTWJNQ+whOrEAzW/KXPfAh2iUIiWrJyEvX7ZYFhWyHV62bHL9
         IfYUBg5iQ0rlLoIocGSw11l0SlMODY8E2RrWyM7XvmGJOfK+dOZlyahMXAZQBaY8Ntqn
         7G7tfm6b9D3UUj5OHvPEzBWa3/v83t7j0u2VDhunUvxSeUuRaI3gOwwBfT4buBTqp9LN
         QdXkAvnqgi+BUy18plapPnhot4LUD/fT6VYsDUHBdv2VsjxWaQDyeqGG6+X8SV18XONJ
         RUUveyPLt/efYInBZDMFqcqgUZ4znchBNrX4WD67Js39Bykuqx2T1tz5+UHmZDI9cFzM
         QPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734126522; x=1734731322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpmWysYV9D+VpzTcdOeUONYiH9TznNjSVBQ+K4R/bRM=;
        b=RPaCSaU/8ehtxiXefSJ3yQq0ilLFHBfRYSbVX781FG013RT1yE6FeTonie5k421h0m
         /EgEf8MiZUQsdqSzJFpDEYw0WjHRnUXor1GBYrKzseJfmgV0HZYqx0hd7I+2kzb16AeS
         dPiTFdjYBcLpelZ6Sm9RT/+K43sHEjwmY6E8JAFi/1vWETPax8IgkZ8JQbC+1ksLthOG
         VJjqIzC+5QXWdy8eC8QDbrx+qRcglOopC9b0O97LUF/gSUPW2JLZ5MhTUTZV5uVV552F
         vttFeJ1dh7TZdhEznQ/xw+rm17ipXWNU1/1c4ZtX3ouE8TEscyBjuv/yZO1ZtguXE4fu
         O81A==
X-Gm-Message-State: AOJu0YxNYQf4+8OEeqoDSibm45xInFGRmuIe9lCiZkTTrLOtGrmtGjnV
	l03rKosy3u3QUU8WytDr8UL2SGqILiIk2aHf9o36RZ0M/sXgePTPX1Tu1dWhuxeS94XRvaaltyZ
	d8whpYU+qOt44OiyL7XxA2Gnv3vU=
X-Gm-Gg: ASbGnctc9mWKwyp9xb/MEFyTAy0LExO62wRBJRPjJ9HbG/Eu2t7i8dOz9hufYDiZjMy
	2ZIFFZwBtRcJzMtdyjfQDSdstlHoyC303q0o4Izk8
X-Google-Smtp-Source: AGHT+IFEfzRIRtg050SxyiN2dxXVGhnewlkTAU+52gfp+b9Fv3hoRfzSjgOf7jGh4IbWHLUoNbAQRnZK1J8fQtx46ZE=
X-Received: by 2002:a05:6820:1b93:b0:5f2:e72c:ce55 with SMTP id
 006d021491bc7-5f3292b4282mr2313750eaf.1.1734126522051; Fri, 13 Dec 2024
 13:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
 <20241212164407.2904755-6-adrian.freihofer@gmail.com> <CADkTA4M=j1pJmvxRJ5wap=UgJZTOv=HZ9HNw_VPWqjoSdCi3Rg@mail.gmail.com>
In-Reply-To: <CADkTA4M=j1pJmvxRJ5wap=UgJZTOv=HZ9HNw_VPWqjoSdCi3Rg@mail.gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Fri, 13 Dec 2024 22:48:31 +0100
Message-ID: <CAB3asfhrR1YgEszaw1QDWHrGKd5sKYVZkXeh18GujmnGFuUnNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 5/5] systemd: split networkd into its own package
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000057b71b06292dcb2a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 21:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208698

--00000000000057b71b06292dcb2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Fr., 13. Dez. 2024 um 14:54 Uhr schrieb Bruce Ashfield <
bruce.ashfield@gmail.com>:

>
>
> On Thu, Dec 12, 2024 at 11:44=E2=80=AFAM Adrian Freihofer via
> lists.openembedded.org <adrian.freihofer=3Dgmail.com@lists.openembedded.o=
rg>
> wrote:
>
>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>
>> Support of images with different network management implementations
>> without having to recompile systemd and other components.
>>
>> Fedora does this as well since systemd version 246.6-2:
>>
>> https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/systemd.spec#_=
578
>> This proves that it is technically possible and officially supported by
>> systemd.
>>
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>  meta/recipes-core/systemd/systemd_256.8.bb | 28 +++++++++++++++++++---
>>  1 file changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_256.8.bb
>> b/meta/recipes-core/systemd/systemd_256.8.bb
>> index c1915d7e941..0710377d32d 100644
>> --- a/meta/recipes-core/systemd/systemd_256.8.bb
>> +++ b/meta/recipes-core/systemd/systemd_256.8.bb
>> @@ -412,6 +412,7 @@ PACKAGE_BEFORE_PN =3D "\
>>      ${PN}-journal-remote \
>>      ${PN}-kernel-install \
>>      ${PN}-mime \
>> +    ${PN}-networkd \
>>      ${PN}-rpm-macros \
>>      ${PN}-udev-rules \
>>      ${PN}-vconsole-setup \
>> @@ -440,6 +441,7 @@ SYSTEMD_PACKAGES =3D
>> "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
>> '${PN}-journal-gatewayd', '', d)} \
>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
>> '${PN}-journal-remote', '', d)} \
>>                      ${@bb.utils.contains('PACKAGECONFIG',
>> 'journal-upload', '${PN}-journal-upload', '', d)} \
>> +                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd',
>> '${PN}-networkd', '', d)} \
>>  "
>>  SYSTEMD_SERVICE:${PN}-binfmt =3D "systemd-binfmt.service"
>>
>> @@ -448,12 +450,13 @@ USERADD_PACKAGES =3D "${PN} \
>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
>> '${PN}-journal-gatewayd', '', d)} \
>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
>> '${PN}-journal-remote', '', d)} \
>>                      ${@bb.utils.contains('PACKAGECONFIG',
>> 'journal-upload', '${PN}-journal-upload', '', d)} \
>> +                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd',
>> '${PN}-networkd', '', d)} \
>>  "
>>
>
> Possibly an already asked and answered question (I scanned quickly, but I
> didn't see it).
>
> Is there any reason why networkd shouldn't be in the default PACKAGECONFI=
G
> ? This is a change of behaviour, that should be opt-in, not opt-out.
>
I'm not sure what you mean. networkd was and remains part of the default
PACKAGECONFIG.
My intention is not to change the default behavior. Could you give me a
hint where this is mistakenly happening anyway in this case?

Adrian

>
> Bruce
>
>
>
>>  GROUPADD_PARAM:${PN} =3D "-r systemd-journal;"
>>  GROUPADD_PARAM:udev =3D "-r render"
>>  GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', =
'',
>> d)}"
>> -USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '=
',
>> d)}"
>> +USERADD_PARAM:${PN}-networkd =3D "--system -d / -M --shell /sbin/nologi=
n
>> systemd-network"
>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit=
',
>> '--system --no-create-home --user-group --home-dir ${datadir}/polkit-1
>> polkitd;', '', d)}"
>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '=
',
>> d)}"
>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;',
>> '', d)}"
>> @@ -620,6 +623,27 @@ FILES:${PN}-extra-utils =3D "\
>>  FILES:${PN}-mime =3D "${MIMEDIR}"
>>  RRECOMMENDS:${PN} +=3D "${PN}-mime"
>>
>> +FILES:${PN}-networkd =3D "\
>> +    ${bindir}/networkctl \
>> +    ${datadir}/dbus-1/system-services/org.freedesktop.network1.service =
\
>> +    ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
>> +    ${datadir}/polkit-1/actions/org.freedesktop.network1.policy \
>> +    ${nonarch_libdir}/sysusers.d/systemd-network.conf \
>> +    ${nonarch_libdir}/tmpfiles.d/systemd-network.conf \
>> +    ${sysconfdir}/systemd/networkd.conf \
>> +    ${systemd_system_unitdir}/systemd-networkd* \
>> +    ${systemd_unitdir}/network/*.network \
>> +    ${systemd_unitdir}/network/*.network.example \
>> +    ${systemd_unitdir}/networkd.conf \
>> +    ${systemd_unitdir}/systemd-networkd* \
>> +"
>> +# systemd-networkd-persistent-storage.service
>> BindsTo=3Dsystemd-networkd.service
>> +# systemd-networkd.service has Also=3Dsystemd-networkd-wait-online.serv=
ice
>> +SYSTEMD_SERVICE:${PN}-networkd =3D "systemd-networkd.service"
>> +CONFFILES:${PN}-networkd =3D "${sysconfdir}/systemd/networkd.conf"
>> +RDEPENDS:${PN}-networkd +=3D "${PN}"
>> +RRECOMMENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'networkd=
',
>> '${PN}-networkd', '', d)}"
>> +
>>  FILES:${PN}-udev-rules =3D "\
>>                          ${nonarch_libdir}/udev/rules.d/70-uaccess.rules=
 \
>>                          ${nonarch_libdir}/udev/rules.d/71-seat.rules \
>> @@ -630,7 +654,6 @@ FILES:${PN}-udev-rules =3D "\
>>  CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>>         ${sysconfdir}/systemd/journald.conf \
>>         ${sysconfdir}/systemd/logind.conf \
>> -       ${sysconfdir}/systemd/networkd.conf \
>>         ${sysconfdir}/systemd/pstore.conf \
>>         ${sysconfdir}/systemd/resolved.conf \
>>         ${sysconfdir}/systemd/sleep.conf \
>> @@ -698,7 +721,6 @@ FILES:${PN} =3D " ${base_bindir}/* \
>>                  ${nonarch_libdir}/modprobe.d/README \
>>
>>  ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
>>                  ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf=
 \
>> -                ${datadir}/dbus-1/system.d/org.freedesktop.network1.con=
f
>> \
>>                  ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.con=
f
>> \
>>                  ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.con=
f
>> \
>>                  ${@bb.utils.contains('PACKAGECONFIG',
>> 'polkit_hostnamed_fallback',
>> '${datadir}/dbus-1/system.d/org.freedesktop.hostname1_no_polkit.conf', '=
',
>> d)} \
>> --
>> 2.47.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208658):
>> https://lists.openembedded.org/g/openembedded-core/message/208658
>> Mute This Topic: https://lists.openembedded.org/mt/110082903/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--00000000000057b71b06292dcb2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Am Fr., 13. Dez. 2024 um 14:54=C2=A0Uhr schri=
eb Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ash=
field@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, Dec 12, 2024 at 11:44=E2=80=AFAM Adrian Freihofer via <a=
 href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedde=
d.org</a> &lt;adrian.freihofer=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Adrian Fr=
eihofer &lt;<a href=3D"mailto:adrian.freihofer@siemens.com" target=3D"_blan=
k">adrian.freihofer@siemens.com</a>&gt;<br>
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
=C2=A0&quot;<br></blockquote><div><br></div><div><div style=3D"font-size:sm=
all">Possibly an already asked and answered question (I scanned quickly, bu=
t I didn&#39;t see it).</div><div style=3D"font-size:small"><br></div><div =
style=3D"font-size:small">Is there any reason why networkd shouldn&#39;t be=
 in the default PACKAGECONFIG ? This is a change of behaviour, that should =
be opt-in, not opt-out.</div></div></div></div></blockquote>I&#39;m not sur=
e what you mean. networkd was and remains part of the default PACKAGECONFIG=
.<br>My intention is not to change the default behavior. Could you give me =
a hint where this is mistakenly happening anyway in this case?</div><div cl=
ass=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quo=
te gmail_quote_container">Adrian<br></div><div class=3D"gmail_quote gmail_q=
uote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small"><br=
></div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--00000000000057b71b06292dcb2a--

