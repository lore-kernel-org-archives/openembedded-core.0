Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514A4C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 13:00:46 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.21938.1751547638724945303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 06:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HdgHT2Qj;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecf99dd567so76658646d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 06:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751547638; x=1752152438; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=feNjy3hlytxAuLwc1Ik2rpW17n+XmF4x16acFUq72ew=;
        b=HdgHT2QjTtTd+s+O60oyK5/7VS7McAJiGGCUA3btKuDdqCB3Xv2H9Ce4hC9Wxsqeg2
         kxvnyKaoXRCt3LW0G5v3h6NBOn51WHix7Jxa9L86veZeLQBg4NnIYrorjSdL0HwfI6HC
         VvNztXDdVgnhdJ4AG1Yc6qyJsZyOaNNWn4HCRrqTnua02dmquYAyyvs8SZQsPwHzOS35
         t/TWZw3JBHAn9QsrFJmnZpSO/x/cTXULOGSetKqc57bALjYYVlv2K2flTOmCHXd2PqzI
         0VXGDGZ7hM7arnkqCkEGFWEM9nJ9Oq1qtBI5fyZPZ1d+TZrha50eZCsGNg00RISOD90F
         M8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547638; x=1752152438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feNjy3hlytxAuLwc1Ik2rpW17n+XmF4x16acFUq72ew=;
        b=tAugEShrsBJWML+1nN6+wNReKVVJ7UtEoYP1DgDesQBIxhOArxyZIs3EnXMW8FO8l/
         6G5VVqaIRR1XoUGuoeM0FcbsZJuQf5nsU5icYSgrVDszOAaYfhmHSxYrpeOabG47eXex
         ReTjXCqWHxwKz4mCL6uptdhYWTgP0zyuA3VtYltTPvQr8r7XqLBkNQ0LdA8CbFT8UXYe
         sdq6qqdr5qji5I21030gLkOkAQJMgzNs0MAvZYhBbvL/fb4FB5NqblNYc6gJtNwgQILB
         pPXVvPHK+oFxNePPAwXvPOeHp46UswyuDAC+xGFzR8faUf7sGjaLdnG/KaVudIHBuUST
         cCpw==
X-Gm-Message-State: AOJu0YwFOLO4dNdHfwyQ8Sg3bILg9AHzj88CGy1YO04+4F4QxJg7WhG7
	NjJLFL/spULUM4JgqNRN3r0L0Xp/2So6wjoVAmgoI/UAl3wrfzfZZapjbxoaiAUUfz/WzoXyfPl
	d0D+hgMenSSuI5sBbxlZOArGfmzVQ5D0bYA==
X-Gm-Gg: ASbGnctMJYlr+W7PqZhJPwrR4Ipm8YdDElw20JG+yTgTGyuwHrneOUzqDFt4Vu0E9gU
	E27+cxnx0s2Vtom0otYekad6jFCvaKoEkChWsLS2kQQ8kwp9DZyC9fy+Q12TxljiuXnReOa968O
	QVA/eQoCfFtc4pibhnuEV8lcHN83AwPxCzRu5GfKKPwRHcbcw+8Zy5GQRRkU7W8CAejeo4BztUh
	g==
X-Google-Smtp-Source: AGHT+IEgMVZD8yPEgW2zh29/Whf29gfEYg4Ybt5J1o97JBbrstGY3mquU0fg9lA01rEq2qPTwQQ1B/URASaKXMgqYQY=
X-Received: by 2002:a05:6214:dce:b0:700:9eea:efc9 with SMTP id
 6a1803df08f44-702b1c0ed56mr100249696d6.44.1751547636701; Thu, 03 Jul 2025
 06:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-sshd_perm-v1-1-f92e5fbb18c7@non.se.com>
In-Reply-To: <20250703-sshd_perm-v1-1-f92e5fbb18c7@non.se.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Jul 2025 15:00:25 +0200
X-Gm-Features: Ac12FXy3qbWkdaxGesEIEz9zX-PuIjGRMvbxf6Ps8vZlQuTq0B14ALgas2dHXv8
Message-ID: <CANNYZj92XhvGTZFDQsdLxi-5qsgpT0G_2yKG9pn2PcvAN=eeEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: limit read access to sshd_config
To: louis.rannou@non.se.com
Cc: openembedded-core@lists.openembedded.org, pascal.eberhard@se.com
Content-Type: multipart/alternative; boundary="000000000000b16f9d063905f6af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 13:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219879

--000000000000b16f9d063905f6af
Content-Type: text/plain; charset="UTF-8"

Wait. This is security by obscurity. If the configuration are insecure,
then that problem should be fixed, not papered over with permissions that
deviate from upstream default.

Alex

On Thu 3. Jul 2025 at 14.14, Louis Rannou via lists.openembedded.org
<louis.rannou=non.se.com@lists.openembedded.org> wrote:

> From: Louis Rannou <louis.rannou@non.se.com>
>
> Enhance security by limiting read access for /etc/sshd_config to user root
> as it
> may reveal unsecure configurations.
>
> Reading access is limited in the install append as the default value 0644
> is
> hardcoded in the openssh makefile and is not configurable. Therefore the
> permissions are modified in the install append.
>
> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_10.0p1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
> b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
> index a044aec063..2f446b5540 100644
> --- a/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
> @@ -102,7 +102,7 @@ CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
>
>  do_configure:prepend () {
>         export LD="${CC}"
> -       install -m 0644 ${UNPACKDIR}/sshd_config ${B}/
> +       install -m 0600 ${UNPACKDIR}/sshd_config ${B}/
>         install -m 0644 ${UNPACKDIR}/ssh_config ${B}/
>  }
>
> @@ -153,9 +153,12 @@ do_install:append () {
>         install -m 644 ${UNPACKDIR}/volatiles.99_sshd
> ${D}/${sysconfdir}/default/volatiles/99_sshd
>         install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
>
> +       # Limit sshd_config access to the owner (default is 0644)
> +       chmod 0600 ${D}${sysconfdir}/ssh/sshd_config
> +
>         # Create config files for read-only rootfs
>         install -d ${D}${sysconfdir}/ssh
> -       install -m 644 ${D}${sysconfdir}/ssh/sshd_config
> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +       install -m 0600 ${D}${sysconfdir}/ssh/sshd_config
> ${D}${sysconfdir}/ssh/sshd_config_readonly
>
>         install -d ${D}${systemd_system_unitdir}
>         if
> ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)};
> then
>
> ---
> base-commit: 77a93e8cf1da4231341c56f64f9d4d474f9f2bb7
> change-id: 20250703-sshd_perm-63c8407f962f
>
> Best regards,
> --
> Louis Rannou <louis.rannou@non.se.com>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219877):
> https://lists.openembedded.org/g/openembedded-core/message/219877
> Mute This Topic: https://lists.openembedded.org/mt/113964575/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b16f9d063905f6af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wait. This is security by obscurity. If the configuration=
 are insecure, then that problem should be fixed, not papered over with per=
missions that deviate from upstream default.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 3. Jul 2025 at 1=
4.14, Louis Rannou via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;louis.rannou=3D<a href=3D"mailto:non.se.com@lists.open=
embedded.org">non.se.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)">From: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.=
com" target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
<br>
Enhance security by limiting read access for /etc/sshd_config to user root =
as it<br>
may reveal unsecure configurations.<br>
<br>
Reading access is limited in the install append as the default value 0644 i=
s<br>
hardcoded in the openssh makefile and is not configurable. Therefore the<br=
>
permissions are modified in the install append.<br>
<br>
Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" =
target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb=
" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a> | 7 +++++--<br=
>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10=
.0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a> b/meta/=
recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb" rel=3D"no=
referrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
index a044aec063..2f446b5540 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb=
" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb=
" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
@@ -102,7 +102,7 @@ CACHED_CONFIGUREVARS +=3D &quot;ac_cv_header_maillock_h=
=3Dno&quot;<br>
<br>
=C2=A0do_configure:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LD=3D&quot;${CC}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${UNPACKDIR}/sshd_config ${B}/<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0600 ${UNPACKDIR}/sshd_config ${B}/<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${UNPACKDIR}/ssh_config ${B}/<b=
r>
=C2=A0}<br>
<br>
@@ -153,9 +153,12 @@ do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${UNPACKDIR}/volatiles.99_sshd $=
{D}/${sysconfdir}/default/volatiles/99_sshd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/contrib/ssh-copy-id ${D}${=
bindir}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Limit sshd_config access to the owner (defaul=
t is 0644)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 0600 ${D}${sysconfdir}/ssh/sshd_config<br=
>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create config files for read-only rootfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/ssh<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${D}${sysconfdir}/ssh/sshd_confi=
g ${D}${sysconfdir}/ssh/sshd_config_readonly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0600 ${D}${sysconfdir}/ssh/sshd_conf=
ig ${D}${sysconfdir}/ssh/sshd_config_readonly<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
,&#39;systemd-sshd-socket-mode&#39;,&#39;true&#39;,&#39;false&#39;,d)}; the=
n<br>
<br>
---<br>
base-commit: 77a93e8cf1da4231341c56f64f9d4d474f9f2bb7<br>
change-id: 20250703-sshd_perm-63c8407f962f<br>
<br>
Best regards,<br>
-- <br>
Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=3D"_blan=
k">louis.rannou@non.se.com</a>&gt;<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#219877): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/219877" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/219877</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113964575/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113964575/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b16f9d063905f6af--

