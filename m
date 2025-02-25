Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD38AC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 17:19:43 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.14384.1740503980089179710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 09:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4vseZmf;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5fe944a4243so290025eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 09:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740503979; x=1741108779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2K7SNc/VfDq5LNdaqTzL90NGr3e0x6w84irvZPcr1To=;
        b=d4vseZmfAa5LO9ohhirNwls/anKHQYW7Wz0NQ8FVytYkv3MalTX/tlPx6F6TNCHFRY
         N/sZGKxVTb1BMvZ340snjCyGXJgKeXAMdrJHq6Lie4CLxa2gnpDcSftIr+VOmaKVe0Mp
         pL22b9K+IVKBDYnM34FkCarSqIHhHuN42GH6KvzmTldsx4MNHY2SIKIF3stAuqfvT1L9
         MC52qobaGRZzSde2ecGxvV+0ctelVTEGKkqEp30tMEexJNNPmoGuGF2BFkTcdMGH06Ri
         f537QqhKYshe/Yvnen0ircYRt8it2l6j8cRVuRM4/2hn8nHSXZ3QiQoeai1tLhT78g+m
         m6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503979; x=1741108779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K7SNc/VfDq5LNdaqTzL90NGr3e0x6w84irvZPcr1To=;
        b=EZlZYkdGby313jTcZosJTSvrGVLturlP0S1aSGze87SrW9UZLu8zFAVR82HYoofPGE
         7BaIUpLG7U8PBmsbiVC635nCtt6apXXRxCNXLQPM+T6Hu9brrxPWcM00+Jzpa7CO+0sG
         ek2lDmPY6egshRjxLgCTPtHXTfDQ9llFSUNf40rwSGmvh4UPPi8QDxREe3qNEm2jlYAv
         yc1xrr9cOn0CBNmaNwoK8UbQQeNntD2BQ8T5xgR5LAWhllaBdq8gJfCUkk2ZT+raiBlj
         qu/SbJJKfvYfBYQRuOp88sRL8uPp91d5pcU/yX97poO6OalouoJuK84Mn5mA12ZXH45u
         e1uA==
X-Gm-Message-State: AOJu0YwI96uEOAVrXERKLcfZaOHf8ehtjdomiwKyuQWpLVIY1Z4cppZp
	Wmz2G+VCC2ubzMOePM5c6c3CH/5NAW4WJHVITXwH7ttM7FbncvD4HaTvbuhu/e6gOw+A9lxvuBf
	9qyv4UIHesZVIeDrrT/M3aE9NqkjSjw==
X-Gm-Gg: ASbGnctOqaCk9OFmXP853moGgM3LWYXIrZ/KeYJUBdgHGLURRs/ZN2AQ/517KlCa/DR
	ZdPJWazBQbg+hAG/YpaRCcygC4my+7LzOB+NSscLujlnwKM4chwT2i0U/ngKShXe3H1/nuZ/CZe
	EPk5ucntzP7QbIKIshaz2I3GbkECuWZWCjiJw4Cvwa5Q==
X-Google-Smtp-Source: AGHT+IFHQlSgRoByHbf0nqW1vu909hh2peNacVSTFIumxIYfuoDlyi4WLzQEApe2DzQL2jclmY9Zwkn8wCObsBmhZww=
X-Received: by 2002:a05:6808:3a07:b0:3f4:141b:b82f with SMTP id
 5614622812f47-3f540eeb873mr2729600b6e.22.1740503979276; Tue, 25 Feb 2025
 09:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20250225070341.2349532-1-yi.zhao@windriver.com>
In-Reply-To: <20250225070341.2349532-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2025 09:19:28 -0800
X-Gm-Features: AWEUYZmuYV30lFs24xOox70Pu8VpxuzVoq4dB7xmILuO-jVxxCB04IpzV7nfuUA
Message-ID: <CAMKF1srHd0gM2ewCUaRm-LS54kxWyyFS9B9yTVPvok-NM=n1eA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nfs-utils: fix rpc.statd path in initscript
To: yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006a44f9062efaa93f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 17:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211917

--0000000000006a44f9062efaa93f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 11:04=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:

> The location of rpc.statd is /usr/sbin instead of /sbin.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> index 6c7b92bdb1..9b7fd17b41 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
> @@ -137,7 +137,7 @@ case "$1" in
>             fi
>             start-stop-daemon --start --oknodo --quiet \
>                 --pidfile /run/rpc.statd.pid \
> -               --exec /sbin/rpc.statd
> +               --exec /usr/sbin/rpc.statd


Is this always the case or depends upon usrmerge distro feature


>             RET=3D$?
>             if [ $RET !=3D 0 ]; then
>                 echo " failed" $RET
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211865):
> https://lists.openembedded.org/g/openembedded-core/message/211865
> Mute This Topic: https://lists.openembedded.org/mt/111373723/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006a44f9062efaa93f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24, 2025 at 11:04=E2=80=AFP=
M Yi Zhao via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.openembedde=
d.org">eng.windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">The location of rpc.statd is /usr/sbin instead =
of /sbin.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon b/meta=
/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
index 6c7b92bdb1..9b7fd17b41 100644<br>
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
@@ -137,7 +137,7 @@ case &quot;$1&quot; in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start-stop-daemon --start --oknod=
o --quiet \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pidfile /run/rpc.=
statd.pid \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--exec /sbin/rpc.st=
atd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--exec /usr/sbin/rp=
c.statd</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Is this a=
lways the case or depends upon usrmerge distro feature=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RET=3D$?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $RET !=3D 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot; failed&=
quot; $RET<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211865): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211865" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211865</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111373723/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111373723/1997914</a><br>
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

--0000000000006a44f9062efaa93f--

