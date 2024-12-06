Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7892CE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 08:53:49 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.32866.1733475228987384480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 00:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FW0FRKiB;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d8edad9932so1805516d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733475228; x=1734080028; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u3unMpGvCECvy37fIYS4p5PA4r8KYuU2fvf6afO8/SM=;
        b=FW0FRKiBfMjg2Tj1bXtCRyBLbSK6b/BB+NXrlhBm0VtghP3D3Bh3eWUzmHLJVAjY5W
         x8uYjp7vFW/bcQ5GIVRyHpCELQDTzQM3MmgjAAOClAlGsBgPcAkoBkbnp+9zp6ZngKId
         nrcFnHb5543GSUGYoHGbiXI1hRn5e+pRp4Y9qHFleTYldx41sWCRVOgzU8eJKCgDNt+c
         c2wT6oMF9T4om38/8DXIX1vnfnRj5Sb/5smJg43L62zHqA3eZnHc2YI8GBwdtGk/59Fy
         NpTkSx6me6Wj2Npb9DWAM4zBo6Y50ffiuaLalTPwYyHyE18Y9hYGhEhUbFoLgMiYO0wX
         ZE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475228; x=1734080028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3unMpGvCECvy37fIYS4p5PA4r8KYuU2fvf6afO8/SM=;
        b=crosgjWdYDBoDuGiNQcDgnunwzwJpw+ZY4dm2/MvIetoSzD/WqfQwNeKkAKliHCwwa
         lXBGGXlkNYefv8GG4f8kuLe+G55BPGPmDLxv76bIN0QfBQCH42mJPj+8dU5LhjFuvlpf
         RApBC+G64JqBQATjO2+wCZo0QbjZI/UjoZGgyXLDIgRE/K7KQ6429MMgYlTyFfOMcNKJ
         GFsf3rv/DAY1v+v/cHBqx/KKF6HA3zgl29Nw73NtVbA3kWTbhPCgcVzamx2eULtpR9KW
         lWpdnmfJSe8d/w/TRlAKs/dL4MI4NRglwPF0eTOtvqc37AuAjJYd/z06O/Rmex+Mb7EC
         sjsw==
X-Gm-Message-State: AOJu0YwepkKXvtSiWcqJv7iQCjiJOew2xa6T086v7wOgXDHTMIy4DeV4
	aqaUERMO7g4FTOHVsSNkQxzSziLX7GQDPxEPNe+VoNoRp7dYjLSBHNFtw/nNp6mybQXGlMLNx/n
	nRcMyeAhj6QUvHEVEPjsu0vmqHqLKcw==
X-Gm-Gg: ASbGnctVQzeiWMgVTUq0/DnrksaXPEMlAnyuYLVC5jMVRK0nuLNg55dJ3U2vZY2agl5
	9BsGN9DjBxqwZVdP244OLPG0CO5AylcbhVJbzMy6AzvdScIfkl+xvlRcB44nzq/1h
X-Google-Smtp-Source: AGHT+IFm8Pvtc27jvY56FmbyqGyYnFEPWVIt5rTL9XFaHTRdht7U5NC5QndmGbvzvij0bySQdF77vtAnlPWX2wxXkSY=
X-Received: by 2002:a05:6214:400b:b0:6d8:aeda:dd93 with SMTP id
 6a1803df08f44-6d8e72020c5mr39701746d6.39.1733475227904; Fri, 06 Dec 2024
 00:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20241206084550.2424753-1-changqing.li@windriver.com>
In-Reply-To: <20241206084550.2424753-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Dec 2024 09:53:37 +0100
Message-ID: <CANNYZj_BEkNP1=JXSFvN_ruU=fqjeAbdurVrv6ndpz_UDMkOQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: fix RRECOMMENDS extend issue for multilib
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002fb3f6062896270c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 08:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208406

--0000000000002fb3f6062896270c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This location looks odd. Shouldn=E2=80=99t it be done where rdepends is ext=
ended?

Alex

On Fri 6. Dec 2024 at 9.46, Changqing Li via lists.openembedded.org <
changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> After following commit in meta-oe,
> [fe3ba7ac5c cryptsetup: demote udev runtime dependency to recommendation]
>
> bitbake lib32-cryptsetup will failed with error:
> ERROR: QA Issue: lib32-cryptsetup package lib32-cryptsetup - suspicious
> values 'udev lvm2' in RRECOMMENDS [multilib]
>
> This is because RRECOMMENDS is not extended with mlprefix, with
> this fix, RRECOMMENDS:lib32-cryptsetup is corrected.
>
> Without this fix:
> RRECOMMENDS:lib32-cryptsetup=3D"kernel-module-aes-generic kernel-module-c=
bc
> kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic
> kernel-module-xts udev lvm2"
> Whith this fix:
> RRECOMMENDS:lib32-cryptsetup=3D"kernel-module-aes-generic kernel-module-c=
bc
> kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic
> kernel-module-xts lib32-udev lib32-lvm2"
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes-global/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> index b81e61fdb7..3aaabb67e9 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -471,7 +471,7 @@ python () {
>          def appendVar(varname, appends):
>              if not appends:
>                  return
> -            if varname.find("DEPENDS") !=3D -1:
> +            if varname.find("DEPENDS") !=3D -1 or
> varname.find("RRECOMMENDS") !=3D -1:
>                  if bb.data.inherits_class('nativesdk', d) or
> bb.data.inherits_class('cross-canadian', d) :
>                      appends =3D expandFilter(appends, "", "nativesdk-")
>                  elif bb.data.inherits_class('native', d):
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208405):
> https://lists.openembedded.org/g/openembedded-core/message/208405
> Mute This Topic: https://lists.openembedded.org/mt/109954831/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002fb3f6062896270c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This location looks odd. Shouldn=E2=80=99t it be done whe=
re rdepends is extended?</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri 6. Dec 2024 at 9.46, Changqing Li via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;<a href=3D"http://chan=
gqing.li">changqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.openembe=
dded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windrive=
r.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
After following commit in meta-oe,<br>
[fe3ba7ac5c cryptsetup: demote udev runtime dependency to recommendation]<b=
r>
<br>
bitbake lib32-cryptsetup will failed with error:<br>
ERROR: QA Issue: lib32-cryptsetup package lib32-cryptsetup - suspicious val=
ues &#39;udev lvm2&#39; in RRECOMMENDS [multilib]<br>
<br>
This is because RRECOMMENDS is not extended with mlprefix, with<br>
this fix, RRECOMMENDS:lib32-cryptsetup is corrected.<br>
<br>
Without this fix:<br>
RRECOMMENDS:lib32-cryptsetup=3D&quot;kernel-module-aes-generic kernel-modul=
e-cbc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic=
 kernel-module-xts udev lvm2&quot;<br>
Whith this fix:<br>
RRECOMMENDS:lib32-cryptsetup=3D&quot;kernel-module-aes-generic kernel-modul=
e-cbc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic=
 kernel-module-xts lib32-udev lib32-lvm2&quot;<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/base.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class<br>
index b81e61fdb7..3aaabb67e9 100644<br>
--- a/meta/classes-global/base.bbclass<br>
+++ b/meta/classes-global/base.bbclass<br>
@@ -471,7 +471,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def appendVar(varname, appends):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not appends:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if varname.find(&quot;DEPENDS&qu=
ot;) !=3D -1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if varname.find(&quot;DEPENDS&qu=
ot;) !=3D -1 or varname.find(&quot;RRECOMMENDS&quot;) !=3D -1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.in=
herits_class(&#39;nativesdk&#39;, d) or bb.data.inherits_class(&#39;cross-c=
anadian&#39;, d) :<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0appends =3D expandFilter(appends, &quot;&quot;, &quot;nativesdk-&quot;)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif bb.data.=
inherits_class(&#39;native&#39;, d):<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#208405): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208405" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/208405</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109954831/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109954831/1686489</a><br>
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

--0000000000002fb3f6062896270c--

