Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A543E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 04:41:37 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.49948.1734324088156517599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 20:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cLr0bcUi;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so3190492a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 20:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734324087; x=1734928887; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=brj9xkA0UtyJsJZrWoqcO8/cto9ZU/OHhvYdeDoaxrk=;
        b=cLr0bcUidkSggtYVJCsjpMJfRIgmTz6y928OokD2AiJn3zVXm4KGYojNRUAu4dt6aW
         sLYrY7cw/OFSniXZOAmf1Zp6AV8agCFg7BGX5Nt3qNvVCAnamFwmZEt/biQt8KctNE9l
         sRF6FRqsZs97l3CGkC7ksIkDrDI4S4Kt4TWrjTSHbrPjUDKHUbCuEroBT7A8iUVhq8wj
         3QN0Km/v3eIwrljS/TT+INM6z/ro8qZPAfxTUvR48G+7N5TkyKU3EnGGxWuMh0ixT+Ck
         t8csksikD3P0m8jQG+RXhKf9KK5iLsGfvn6Wzs/uYdyFqilGshN8UXq35MhHBQXUwwmv
         7V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734324087; x=1734928887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brj9xkA0UtyJsJZrWoqcO8/cto9ZU/OHhvYdeDoaxrk=;
        b=IHRqvJTw5b3ugA9JKIx+YPHJtO07rUKQJRyG1yZ8QXKUuEC/m+X8Mms3sfMahmn/lh
         uNOmx4p8USiQNyVG0xj8elZpU/EtCe2UPgjnrtqxGqDPpcbVeiFeJFszYJFTDfsrqihq
         uWhL9RiQ7/uP+p7uHemdbE1vUVuuGahdnhGbhRHSsLS3bqumcyHEYg8R9oYDa1ZQKjXA
         Wiv1tl4GQuMSxmpGVTnDKhKAPIlunv9hB5DAYZ/gvvMee5GMuhmnPOrLv4x04VhH2NNq
         4RhF3hZeXHXKD/CYwexmZJ+5dzxF9uBSFD+V1f6t8dCANOtadoGtjoaOs0D0jFz17mxO
         zobg==
X-Gm-Message-State: AOJu0YxYjfGgmbEQnNaGgOSVmvaMQZfvO0lo6dvf0hNroJxeta54h0G5
	Vk/HbQL9zlnzUKlPGBoxdI5OVODhIvYi3z339sxEqEPYzEN9pbGYyOs+08i+CutdpXi3QvTAGo1
	g3JklEVzd6pXi3A7Z4w8mr4rrah8=
X-Gm-Gg: ASbGncvXPGf65n7CjltJL1Nc08HAeFVX83rb9AHAIRLaBKv7vx7785wGkczF56KmkTs
	rQIVhEau7MRRv3XQL8gtmGgY9SstDA6UHRK2Hvsk=
X-Google-Smtp-Source: AGHT+IGOKwIBnkTanynkSFYJ5jvxpJaHhwJlxMlgRch1jK/imdjGix9VOP423TTW1wBJ1WpcWHpE3fpijQmQKETmn1I=
X-Received: by 2002:a17:90b:3508:b0:2ea:498d:809f with SMTP id
 98e67ed59e1d1-2f2901a29dfmr14688709a91.26.1734324087358; Sun, 15 Dec 2024
 20:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
 <20241212164407.2904755-6-adrian.freihofer@gmail.com> <CADkTA4M=j1pJmvxRJ5wap=UgJZTOv=HZ9HNw_VPWqjoSdCi3Rg@mail.gmail.com>
 <CAB3asfhrR1YgEszaw1QDWHrGKd5sKYVZkXeh18GujmnGFuUnNA@mail.gmail.com>
In-Reply-To: <CAB3asfhrR1YgEszaw1QDWHrGKd5sKYVZkXeh18GujmnGFuUnNA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 15 Dec 2024 23:41:16 -0500
Message-ID: <CADkTA4Me3XVW3X3RAEkBrM-GV9mtQhjhAaucXWONyFsOus9yXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2 5/5] systemd: split networkd into its own package
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000270ce006295bcb51"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 04:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208757

--000000000000270ce006295bcb51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 4:48=E2=80=AFPM Adrian Freihofer <adrian.freihofer@=
gmail.com>
wrote:

> Am Fr., 13. Dez. 2024 um 14:54 Uhr schrieb Bruce Ashfield <
> bruce.ashfield@gmail.com>:
>
>>
>>
>> On Thu, Dec 12, 2024 at 11:44=E2=80=AFAM Adrian Freihofer via
>> lists.openembedded.org <adrian.freihofer=3Dgmail.com@lists.openembedded.=
org>
>> wrote:
>>
>>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>>
>>> Support of images with different network management implementations
>>> without having to recompile systemd and other components.
>>>
>>> Fedora does this as well since systemd version 246.6-2:
>>>
>>> https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/systemd.spec#=
_578
>>> This proves that it is technically possible and officially supported by
>>> systemd.
>>>
>>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>>> ---
>>>  meta/recipes-core/systemd/systemd_256.8.bb | 28 +++++++++++++++++++---
>>>  1 file changed, 25 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_256.8.bb
>>> b/meta/recipes-core/systemd/systemd_256.8.bb
>>> index c1915d7e941..0710377d32d 100644
>>> --- a/meta/recipes-core/systemd/systemd_256.8.bb
>>> +++ b/meta/recipes-core/systemd/systemd_256.8.bb
>>> @@ -412,6 +412,7 @@ PACKAGE_BEFORE_PN =3D "\
>>>      ${PN}-journal-remote \
>>>      ${PN}-kernel-install \
>>>      ${PN}-mime \
>>> +    ${PN}-networkd \
>>>      ${PN}-rpm-macros \
>>>      ${PN}-udev-rules \
>>>      ${PN}-vconsole-setup \
>>> @@ -440,6 +441,7 @@ SYSTEMD_PACKAGES =3D
>>> "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
>>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd'=
,
>>> '${PN}-journal-gatewayd', '', d)} \
>>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd'=
,
>>> '${PN}-journal-remote', '', d)} \
>>>                      ${@bb.utils.contains('PACKAGECONFIG',
>>> 'journal-upload', '${PN}-journal-upload', '', d)} \
>>> +                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd',
>>> '${PN}-networkd', '', d)} \
>>>  "
>>>  SYSTEMD_SERVICE:${PN}-binfmt =3D "systemd-binfmt.service"
>>>
>>> @@ -448,12 +450,13 @@ USERADD_PACKAGES =3D "${PN} \
>>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd'=
,
>>> '${PN}-journal-gatewayd', '', d)} \
>>>                      ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd'=
,
>>> '${PN}-journal-remote', '', d)} \
>>>                      ${@bb.utils.contains('PACKAGECONFIG',
>>> 'journal-upload', '${PN}-journal-upload', '', d)} \
>>> +                    ${@bb.utils.contains('PACKAGECONFIG', 'networkd',
>>> '${PN}-networkd', '', d)} \
>>>  "
>>>
>>
>> Possibly an already asked and answered question (I scanned quickly, but =
I
>> didn't see it).
>>
>> Is there any reason why networkd shouldn't be in the default
>> PACKAGECONFIG ? This is a change of behaviour, that should be opt-in, no=
t
>> opt-out.
>>
> I'm not sure what you mean. networkd was and remains part of the default
> PACKAGECONFIG.
> My intention is not to change the default behavior. Could you give me a
> hint where this is mistakenly happening anyway in this case?
>

I almost always read patches looking at the patch itself, and don't
do any research or looking outside of the patch itself. If something
isn't explained in the patch or causes me to wonder, it usually means
that the patch commit needs some tweaking.

In this case from the context of this patch, I see you packaging
based on a PACKAGECONFIG, but since the PACKAGECONFIG
isn't in the patch itself, I have no idea what the default of the recipe
in question is.

I also only see RRECOMMENDS for the new package on the main
PN, which means that someone without rrecommends enabled
will see different behaviour.

So my point would be that the comment that the default isn't
changed (and then describe what that is so), as well as commenting
on rrecommends vs rdepends, should be captured in the commit
log.

Bruce



>
>

> Adrian
>
>>
>> Bruce
>>
>>
>>
>>>  GROUPADD_PARAM:${PN} =3D "-r systemd-journal;"
>>>  GROUPADD_PARAM:udev =3D "-r render"
>>>  GROUPADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>>> 'polkit_hostnamed_fallback', '-r systemd-hostname;', '', d)}"
>>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>>> 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;',=
 '',
>>> d)}"
>>> -USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>>> 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', =
'',
>>> d)}"
>>> +USERADD_PARAM:${PN}-networkd =3D "--system -d / -M --shell /sbin/nolog=
in
>>> systemd-network"
>>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polki=
t',
>>> '--system --no-create-home --user-group --home-dir ${datadir}/polkit-1
>>> polkitd;', '', d)}"
>>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>>> 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', =
'',
>>> d)}"
>>>  USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>>> 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;'=
,
>>> '', d)}"
>>> @@ -620,6 +623,27 @@ FILES:${PN}-extra-utils =3D "\
>>>  FILES:${PN}-mime =3D "${MIMEDIR}"
>>>  RRECOMMENDS:${PN} +=3D "${PN}-mime"
>>>
>>> +FILES:${PN}-networkd =3D "\
>>> +    ${bindir}/networkctl \
>>> +    ${datadir}/dbus-1/system-services/org.freedesktop.network1.service=
 \
>>> +    ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
>>> +    ${datadir}/polkit-1/actions/org.freedesktop.network1.policy \
>>> +    ${nonarch_libdir}/sysusers.d/systemd-network.conf \
>>> +    ${nonarch_libdir}/tmpfiles.d/systemd-network.conf \
>>> +    ${sysconfdir}/systemd/networkd.conf \
>>> +    ${systemd_system_unitdir}/systemd-networkd* \
>>> +    ${systemd_unitdir}/network/*.network \
>>> +    ${systemd_unitdir}/network/*.network.example \
>>> +    ${systemd_unitdir}/networkd.conf \
>>> +    ${systemd_unitdir}/systemd-networkd* \
>>> +"
>>> +# systemd-networkd-persistent-storage.service
>>> BindsTo=3Dsystemd-networkd.service
>>> +# systemd-networkd.service has Also=3Dsystemd-networkd-wait-online.ser=
vice
>>> +SYSTEMD_SERVICE:${PN}-networkd =3D "systemd-networkd.service"
>>> +CONFFILES:${PN}-networkd =3D "${sysconfdir}/systemd/networkd.conf"
>>> +RDEPENDS:${PN}-networkd +=3D "${PN}"
>>> +RRECOMMENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'network=
d',
>>> '${PN}-networkd', '', d)}"
>>> +
>>>  FILES:${PN}-udev-rules =3D "\
>>>                          ${nonarch_libdir}/udev/rules.d/70-uaccess.rule=
s
>>> \
>>>                          ${nonarch_libdir}/udev/rules.d/71-seat.rules \
>>> @@ -630,7 +654,6 @@ FILES:${PN}-udev-rules =3D "\
>>>  CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>>>         ${sysconfdir}/systemd/journald.conf \
>>>         ${sysconfdir}/systemd/logind.conf \
>>> -       ${sysconfdir}/systemd/networkd.conf \
>>>         ${sysconfdir}/systemd/pstore.conf \
>>>         ${sysconfdir}/systemd/resolved.conf \
>>>         ${sysconfdir}/systemd/sleep.conf \
>>> @@ -698,7 +721,6 @@ FILES:${PN} =3D " ${base_bindir}/* \
>>>                  ${nonarch_libdir}/modprobe.d/README \
>>>
>>>  ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
>>>                  ${datadir}/dbus-1/system.d/org.freedesktop.locale1.con=
f
>>> \
>>> -
>>> ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
>>>
>>>  ${datadir}/dbus-1/system.d/org.freedesktop.resolve1.conf \
>>>
>>>  ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
>>>                  ${@bb.utils.contains('PACKAGECONFIG',
>>> 'polkit_hostnamed_fallback',
>>> '${datadir}/dbus-1/system.d/org.freedesktop.hostname1_no_polkit.conf', =
'',
>>> d)} \
>>> --
>>> 2.47.0
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#208658):
>>> https://lists.openembedded.org/g/openembedded-core/message/208658
>>> Mute This Topic: https://lists.openembedded.org/mt/110082903/1050810
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> bruce.ashfield@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000270ce006295bcb51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 13, 2024 at 4:48=
=E2=80=AFPM Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.c=
om">adrian.freihofer@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Am Fr., 13. Dez. 2024 um 14:54=C2=A0Uh=
r schrieb Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div st=
yle=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 12, 2024 at 11:44=E2=80=AFAM =
Adrian Freihofer via <a href=3D"http://lists.openembedded.org" target=3D"_b=
lank">lists.openembedded.org</a> &lt;adrian.freihofer=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@sieme=
ns.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
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
ass=3D"gmail_quote"><div class=3D"gmail_default" style=3D"font-size:small">=
</div></div></div></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">I almost always read patches looking at the =
patch itself, and don&#39;t</div><div class=3D"gmail_default" style=3D"font=
-size:small">do any research or looking outside of the patch itself. If som=
ething</div><div class=3D"gmail_default" style=3D"font-size:small">isn&#39;=
t explained in the patch or causes me to wonder, it usually means</div><div=
 class=3D"gmail_default" style=3D"font-size:small">that the patch commit ne=
eds some tweaking.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">In thi=
s case from the context of this patch, I see you packaging</div><div class=
=3D"gmail_default" style=3D"font-size:small">based on a PACKAGECONFIG, but =
since the PACKAGECONFIG</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">isn&#39;t in the patch itself, I have no idea what the default of =
the recipe</div><div class=3D"gmail_default" style=3D"font-size:small">in q=
uestion is.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">I also only s=
ee RRECOMMENDS for the new package on the main</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">PN, which means that someone without rrecom=
mends=C2=A0enabled</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">will see different behaviour.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">So my point would be that the comment that the default isn&#39;t=
</div><div class=3D"gmail_default" style=3D"font-size:small">changed (and t=
hen describe what that is so), as well as commenting</div><div class=3D"gma=
il_default" style=3D"font-size:small">on rrecommends vs rdepends, should be=
 captured in the commit</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">log.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_default" =
style=3D"font-size:small">=C2=A0</div></div></div></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><br></div><div class=3D"gmail_quote">Adrian<br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small"><br></di=
v><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000270ce006295bcb51--

