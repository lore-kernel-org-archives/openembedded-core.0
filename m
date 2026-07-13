Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08028C44501
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 16:30:09 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.235.1783960200913492798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 09:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YGNO6stp;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8051ad12d23so538467b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 09:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783960200; cv=none;
        d=google.com; s=arc-20260327;
        b=f4unpR1j4+QYkuSlhFsDIutCfYYqmqZKHXEu/6XKPi3Y+FgVzUvLzyRr/QGhSYU9ie
         Iay6inqUdqV/2Hs1kd8ZLnLt88VGQTB0wzGIZJq8DsNORcsHkh2R1DBiFqcyzLTHVPgc
         tItH8Qw7eHj1zWCIIgMM0jYUud/kjHUT2t/OqFdXJpa/zUyfIoK1MkcU5Bqnn1LDNPqU
         PeNMSBORvBgezhAlK3oSEjePkMdsPhcM8X/pV8kZQTVt9n3WhZBbiGphbPBjcWGVKjvb
         nuhJGuZjsTvbai1bPJae/RvfL1mCtgNOKlBhlgjPz4rqfvL5ND+uqm+ZBYygX6VoTX16
         usCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GP4kiuiRnFNLepobG+4SJnPeOfUSiI78vLwUPWuwhb4=;
        fh=1SKin3FyNL/yjYebWy3SofrjNos6wUywKamYUrL8cfg=;
        b=nqTQ2/Uap6YDfpDaUpIVw7EZMjs5IzdEmEeXFESTTU6B7nvXF3YgvWehwdFhOMme2u
         O7tXIrnkparekrTlGulO4iJPIEnb/JdXZqDb/X+J2vblF3qYxCmfpaXLBLmos+VwXzvI
         loVLtzuAIaD/3nxkPOoiBEJDM7//i08MjwupzYRszF8mjScxP9zGS9j+6RDRPbh0/Vlg
         tlyTVfeUuynOEHBkYmf+MhfrbErZTK0DZSuhU5R53BuwOPTybBwkK35OZFTM8cUfLxfa
         vFJyxEPf9cqgAsehUNyxmlxIjOP9ARduBtdPt6shTeoq+/xSsReOpy0ZKNCWQQB/blU7
         iIgQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783960200; x=1784565000; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GP4kiuiRnFNLepobG+4SJnPeOfUSiI78vLwUPWuwhb4=;
        b=YGNO6stp0Y2iLgcBcXdMI9yB4SsIvmLj1FM0T2nwBen8OwN6TRzC6gWA78c5Sghld/
         0CjTw/GABmg+8lEK2ido3MBvDCmlqIoX+Ezr0dMBFTmX873uw7HQFxPxR+jGB4UKkeYp
         KwqLzTVWVo6FFZ5ysWASr60ZR3GMppAkKtOAklI8oKZ/Iw3JqrLJCaInTxBj9BjGP9F1
         dVpJFbqZZgudL9CLAY3LuZ9T2EeCumzh+uRR5rLoTykn0Wd1mYuDsC7P9zSX7Ck0/fEz
         Gg/BhTg7PfpLRzxrGYes6VlBhpePhTa1KEBCVX5VguIU3v7sF3dUk52WgGxuIGpn7I7W
         RGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783960200; x=1784565000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GP4kiuiRnFNLepobG+4SJnPeOfUSiI78vLwUPWuwhb4=;
        b=cxJS64+ZCc8DPsjER7FRPloBlvo6WLNwY8/5clCAmbIncdFaXD98TLtSdNz1+IuHSi
         igedyMMPGAauCb0cWEpFhaZVk5NQ91fPd+o15gIRlqTv9fsI/uKn9z/o/2X+PWklfHi0
         QtCyrgaZaLLU4R2c2C5A6Jy46LgsPhFoZoxOACUMcSweFykhGl500AGb72LrCTS2dq7F
         KIyyxFxySt11XDgTWl3XOV4ba4jjO7UaK7j7Icq8UYMmIb8re6IXTtzROTOP6igZ/wO0
         VGI5lRYveZi0CPg0Liaf248FFz/Ef71sZIIq6t7XFkaZmVYAT6a8uwt1ZfBNpj7zPK4d
         j09Q==
X-Gm-Message-State: AOJu0YzzC9RGBO4/UM1FGt9E2hB6hMdHFg4VUB7JX31P3g1cwE9la7YQ
	/f44l6+m0XHPTBa7CgMst52xrwNaCIy569iBtqy1sSEEYi0SIEasI/eEaEF8F1EAzDgDK1or7Aq
	g23WbfVROmDpbDUwD9bb4oIsNa/FwxYpxBQ==
X-Gm-Gg: AfdE7cnnzk2qZ3ktYQnhncqMl+lP64OIyvjNVFerX+419boiZeqHo7K/VZR50WOeSw4
	dgQPuFxR6o/92/rJ/0D/ghf2+eaX5V38dUwQJ7B7hfjnYJKjsw2CfEEhvC1ezceopsF1aJu86Q7
	g8vqo7Xc6h7HP8Osnoyob6aq0ynYz9MVm4kyj65HwEQN5r1EK+maSGrOiFjD9LMlXFg6moVo/5B
	HiRt1GjJwJOjW+eOZhSveM2h8j1R2D7ip5FnonM7MsAsuoPn0c6tjmYOPJ80ryH356MLT/6k9I3
	+FgRYpUIlB0=
X-Received: by 2002:a05:690c:6a0e:b0:80d:b8ea:75d3 with SMTP id
 00721157ae682-81e9010c668mr71587317b3.40.1783960199684; Mon, 13 Jul 2026
 09:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
 <4baea9df11ee5e91a5a425a63d91fcb4b22d03a2.1783357184.git.joerg.sommer@navimatix.de>
In-Reply-To: <4baea9df11ee5e91a5a425a63d91fcb4b22d03a2.1783357184.git.joerg.sommer@navimatix.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 13 Jul 2026 10:29:47 -0600
X-Gm-Features: AUfX_mxWwSjmLim00KzmGMRiXdNnCqSmjTtl_d3qtvBKiZSN_hHj-6YhFAUJjNI
Message-ID: <CAJdd5GYCYRiXjb9c9DNhvXJhAMt22hLtEVrseh-4N6t237+Gog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] base-files: Install /etc/mtab in a
 systemd-friendly way
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fee6b206568099db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 16:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240846

--000000000000fee6b206568099db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:59=E2=80=AFAM J=C3=B6rg Sommer via lists.openembe=
dded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> The old mtab pointed to /proc/mounts which itself is a symlink. Systemd
> therefore tries to replace it with a symlink to /proc/self/mounts, but
> fails
> on a read-only rootfs:
>
>     systemd-tmpfiles: symlink(../proc/self/mounts, /etc/mtab) failed:
> Read-only file system
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index d4d777b485..aafc0aa923 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -109,7 +109,7 @@ do_install () {
>         install -m 0644 ${S}/host.conf ${D}${sysconfdir}/host.conf
>         install -m 0644 ${S}/motd ${D}${sysconfdir}/motd
>
> -       ln -sf /proc/mounts ${D}${sysconfdir}/mtab
> +       ln -sf ../proc/self/mounts ${D}${sysconfdir}/mtab
>

This should be absolute /proc/self/mounts otherwise it's assuming
sysconfdir is only one directory level deep, and AFIACT, there is no reason
for it to be absolute


>
>         # deal with hostname
>         if [ "${hostname}" ]; then
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240283):
> https://lists.openembedded.org/g/openembedded-core/message/240283
> Mute This Topic: https://lists.openembedded.org/mt/120143149/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fee6b206568099db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 6, =
2026 at 10:59=E2=80=AFAM J=C3=B6rg Sommer via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailt=
o:navimatix.de@lists.openembedded.org">navimatix.de@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimatix.de" targ=
et=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
<br>
The old mtab pointed to /proc/mounts which itself is a symlink. Systemd<br>
therefore tries to replace it with a symlink to /proc/self/mounts, but fail=
s<br>
on a read-only rootfs:<br>
<br>
=C2=A0 =C2=A0 systemd-tmpfiles: symlink(../proc/self/mounts, /etc/mtab) fai=
led: Read-only file system<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.=
14.bb" rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a> b/meta=
/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
index d4d777b485..aafc0aa923 100644<br>
--- a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
+++ b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
@@ -109,7 +109,7 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/host.conf ${D}${sysconfdir=
}/host.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/motd ${D}${sysconfdir}/mot=
d<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf /proc/mounts ${D}${sysconfdir}/mtab<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../proc/self/mounts ${D}${sysconfdir}/mt=
ab<br></blockquote><div><br></div><div>This should be absolute /proc/self/m=
ounts otherwise it&#39;s assuming sysconfdir is only one directory level de=
ep, and AFIACT, there is no reason for it to be absolute</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # deal with hostname<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${hostname}&quot; ]; then<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240283): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240283" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/240283</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120143149/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120143149/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fee6b206568099db--

