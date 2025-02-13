Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C5AC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 03:49:48 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.3628.1739418581340681110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 19:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFyDvhBu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30795988ebeso4456781fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 19:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739418579; x=1740023379; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ9UBycuT1nZoARM7Y7g7UifdR3Nuq5PGZ3AMvTPzkQ=;
        b=MFyDvhBuvSJ3a2IbbN6b+lz3/B2dcOYmclh07uPmox2Bp6/i7SjMLrjAMrrPvjrpNu
         gGQ7+8lBEVn0/YAKdzRAmXJB7OkEm3ih9yKHlA7FHl8nuXn3Ry9CseU9FqavTN+uB/m7
         Co+TGmiHRkIIN+kXkYOA7MUIa3YQiCYtqfnuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739418579; x=1740023379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQ9UBycuT1nZoARM7Y7g7UifdR3Nuq5PGZ3AMvTPzkQ=;
        b=fUOXwiuSxd+WRLb/1TTxy23GS0iwhrxRDobVUEga2ZWQJkLEMg3LQW6Ax5eCI4Haft
         zabQwYOdkqWGr/xGIwEX5RLJ1AydmzyYVy2DZ3NRYoKruiqmRZ+dPa8PhbOLduLva51U
         3ombFBeDElMJKbvgZaCN/dy5o/Fs+jMl3klTvYFsVGfX2BSh57oYPYWNaxz0Rs9gTjYU
         JBlTI5yVFxs2xkJ8Hobbx+Rn9fr9Xi9XIDrN+UMhonjutdpyyK66fMda1ziztaAOTVqy
         2szGrRr27YCuU4vhenN60vRy9xA+hZdaD/qEEK+658ZMaRZj5G4+f7MgfSfjSB45icL2
         pwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqEscqlMoIBppL4+e7rRG9k+kB5AlM4JsT+V2aJ8xPkSYalrXXOAWVo+GOsmT+Q68v3iOmkYgYVJ5FyTAfNUgwDw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw38V/mqKLTvsqeV7QsG9aJMrsSxEMnk2IKIFee/6ANBJeTETpi
	Lkl8lUh71YJLbiNsB8RqNKRUEmtfdHggHAxA+IfIt08adewtpkUJu7epN5rDmVLwejUhnqVUQds
	JoSUwUkaFkW5mCrlFyHfZ6yKVpxqaBC1fYX1x4g==
X-Gm-Gg: ASbGnctNaB9Z9Z8y1vFTotJ2UbGhF9iFxj9c2rccTip/lJAVt6ywYaNVN4TFczPVKdY
	H1p7v1JiJS/KZ0nCXWwp37+uF516zNFBa4auA/ZlaeAXow6Eugd6mwXedmn/UqQRZ8Db5XgS/lF
	0ZnnEI
X-Google-Smtp-Source: AGHT+IFnh+PKqL3+ql/QhxP8qcXmtk1zkNy/2ir+jLPubqcwwqJwBMUGJy5ohV9LsAZUE7V1WuZI1N6fxwhEdJ+GdzY=
X-Received: by 2002:a05:651c:2109:b0:309:bc3:36b4 with SMTP id
 38308e7fff4ca-3090dcb7181mr4607451fa.6.1739418579294; Wed, 12 Feb 2025
 19:49:39 -0800 (PST)
MIME-Version: 1.0
References: <ceec6a83-58cd-40ac-ba16-06115217f4d8@app.fastmail.com> <CAOMZO5BGuBrf2XQLcnVSTMeGoJ8bPEF+FF6xQmP=p+PJXbz1Zw@mail.gmail.com>
In-Reply-To: <CAOMZO5BGuBrf2XQLcnVSTMeGoJ8bPEF+FF6xQmP=p+PJXbz1Zw@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 12 Feb 2025 19:49:27 -0800
X-Gm-Features: AWEUYZmB0CtkpuOXfFcXx5DIP6bC2tqQ1gCMdRP6kgCzDNvGPqZ9s2mS-FDOR_0
Message-ID: <CADfgfoaz_Qy0EjBaduJ-4PhacLd04oZS3mdK7pGNS4POZ46nXg@mail.gmail.com>
Subject: Re: [OE-core] Unable to access 'https://git.openembedded.org/meta-openembedded/'
To: festevam@gmail.com, Philip Balister <philip@balister.org>
Cc: javier.tia@linaro.org, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000890c2e062dfdf28b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 03:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211288

--000000000000890c2e062dfdf28b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are currently experiencing issues with the Oregon mirror certificate. To
ensure uninterrupted service, I've temporarily redirected all traffic to
the Amsterdam mirror, which is fully operational.

I will resolve the Oregon mirror issue tomorrow and restore all mirrors to
active status.

Please reply if issues continue,
Michael Halstead


On Wed, Feb 12, 2025 at 4:17=E2=80=AFPM Fabio Estevam via lists.openembedde=
d.org
<festevam=3Dgmail.com@lists.openembedded.org> wrote:

> On Wed, Feb 12, 2025 at 8:41=E2=80=AFPM Javier Tia via lists.openembedded=
.org
> <javier.tia=3Dlinaro.org@lists.openembedded.org> wrote:
> >
> > Hi,
> >
> > Getting Git error accessing
> https://git.openembedded.org/meta-openembedded/.
>
> Yes, it seems to be down.
>
> Try accessing https://github.com/openembedded/meta-openembedded as an
> alternative.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211284):
> https://lists.openembedded.org/g/openembedded-core/message/211284
> Mute This Topic: https://lists.openembedded.org/mt/111153974/1003190
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> mhalstead@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000890c2e062dfdf28b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>We are currently experiencing issues with the Oregon =
mirror certificate.  To ensure uninterrupted service, I&#39;ve temporarily =
redirected all traffic to the Amsterdam mirror, which is fully operational.=
 </div><div><br></div><div>I will resolve the Oregon mirror issue tomorrow =
and restore all mirrors to active status.</div><div><br></div><div>Please r=
eply if issues continue,</div><div>Michael Halstead</div><div><br></div></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Feb 12, 2025 at 4:17=E2=80=AFPM Fabio Estevam vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
festevam=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wed, Feb 12, 2025 at 8:41=E2=80=AFPM Javier Tia via =
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;javier.tia=3D<a href=3D"mailto:linaro.org@lists.openembedded.org" targe=
t=3D"_blank">linaro.org@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Getting Git error accessing <a href=3D"https://git.openembedded.org/me=
ta-openembedded/" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/meta-openembedded/</a>.<br>
<br>
Yes, it seems to be down.<br>
<br>
Try accessing <a href=3D"https://github.com/openembedded/meta-openembedded"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/meta-=
openembedded</a> as an<br>
alternative.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211284): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211284" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211284</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111153974/100=
3190" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111153974/1003190</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:mhalstead@linuxfoundation.=
org" target=3D"_blank">mhalstead@linuxfoundation.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Pr=
oject</div><div>Systems Operations Engineer</div></div></div>

--000000000000890c2e062dfdf28b--

