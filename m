Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73807C0015E
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 12:45:59 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.6723.1689079551040119196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 05:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lq/+45Eg;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b6f943383eso89781071fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689079549; x=1691671549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wwyTxpb+dW/S+GKvpO06SC0DXz4m3ZqJg1DQN/JLB8Y=;
        b=lq/+45Eg7cVmp5mbwP1X5CAapUI0LcJmKS6zPKGy34bojCMAC1FsVy9YnL8gy3Q4Yq
         JOk/IdJ/lcenUqg66SlfydWL1Jw2Yr5bR+wg8ZCl0Gb9KZCoiCf9kRifEmbuSk3SFT6a
         QRD1h8bjmc11txS2Qyo7LwDT2yxEe71wW3p+ppLFV8/UN8ZYMW5scYMI9e2bBHAIL4W9
         +p5d/vMheK28eED5n4wV9Z1GYtgOwA2Zzi5H5idDmXb5XUAN3veegusftRb3KndHqOL8
         n6ip6VxcNg+S10iQyGi8C42xOPxb/DmWUpdC/bPXsf4BcCmtW7W9xNeJHShGtzPSOev+
         5mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689079549; x=1691671549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwyTxpb+dW/S+GKvpO06SC0DXz4m3ZqJg1DQN/JLB8Y=;
        b=GTZogsjwxm5OcYmkV4sDy8rBfpwS/6L/BM1woVlWf+MP4Xmsir1DgmER3qhnurnefI
         8zJntwcGpU9YVkDyMMdqVzDu7sWNo5f0wK0NmSjtNg7XQ8v0tOUDhNvn+EUIOES2ufQa
         BEY7uKlEhDiJf4uOJIWaaEu7LYNiYtJH92Ew91nPYKXsDMNqW0zhCaL4KeX0mGQ5VyV+
         xsFKS1Xuamby5kAgzUx1rGZ+qMl1a8cjaAs9PS3292c7vhR7jQ2wKtsJVOCnYmOl/vMm
         dR2ipN4n5qe54XpFtSd+WHM8SPvANz/XhWU5y/H17GF59zFg8gfYFMI39Qt8M72Y1syu
         dQdg==
X-Gm-Message-State: ABy/qLZYTMbwE6J9bynRTWt3wWbKzlLP8Vds1cper5quxFrYQgGo19uK
	QnNTy6Epu6nfNiD3teoQOo4fa/DH/5iKytjonTE=
X-Google-Smtp-Source: APBJJlGLaou2HY9pERaeh0YzSC6bAlVD6vbs9IoXuhvJZTYj/7HM+CS0oz+cUn0L+MsKnIbv6gFEHJu/9VBCcDECnkM=
X-Received: by 2002:a2e:80cd:0:b0:2b6:dfef:d523 with SMTP id
 r13-20020a2e80cd000000b002b6dfefd523mr11700616ljg.50.1689079548800; Tue, 11
 Jul 2023 05:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230711063629.7627-1-peter.marko@siemens.com>
 <20230711063629.7627-2-peter.marko@siemens.com> <A4D67F2A-877E-42E6-8843-4328749A6F9C@arm.com>
In-Reply-To: <A4D67F2A-877E-42E6-8843-4328749A6F9C@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 11 Jul 2023 14:45:36 +0200
Message-ID: <CAApg2=RG3T_DkJi93jL0R-L28b9r4Yv7EHD5T25jkWCtAUCP2w@mail.gmail.com>
Subject: Re: [OE-core][master][mickledore][kirkstone][dunfell][PATCH 2/2]
 cve-update-nvd2-native: increase retry count
To: Ross Burton <ross.burton@arm.com>
Cc: "peter.marko@siemens.com" <peter.marko@siemens.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000080f4c60600357a32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 12:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184134

--00000000000080f4c60600357a32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter, what is the probability it passes (for the complete download) with
those settings? Is it every time?

Kind regards,
Marta

On Tue, Jul 11, 2023 at 1:17=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> Horrible, but in my testing it works. Thanks Peter!
>
> Ross
>
> > On 11 Jul 2023, at 07:36, Peter Marko via lists.openembedded.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Current 503 errors seem to last several seconds.
> > In most cases there are two errors and third request succeeds.
> > However sometimes the outage takes more than time needed
> > for two retries and third one also fails.
> >
> > Extend retry count from 3 to 5 to improve the probablity
> > that the fetcher succeeds.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> > meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > index a7392405e0..b3d0038c2f 100644
> > --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> > @@ -129,7 +129,7 @@ def nvd_request_next(url, api_key, args):
> >
> >     full_request =3D url + '?' + data
> >
> > -    for attempt in range(3):
> > +    for attempt in range(5):
> >         try:
> >             r =3D urllib.request.urlopen(full_request)
> >
> > --
> > 2.30.2
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184130):
> https://lists.openembedded.org/g/openembedded-core/message/184130
> Mute This Topic: https://lists.openembedded.org/mt/100074007/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000080f4c60600357a32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Peter, what is the probability it passes (for the com=
plete download) with those settings? Is it every time?<br></div><div><br></=
div><div>Kind regards,</div><div>Marta<br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 11, 2023 at 1:17=E2=
=80=AFPM Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton=
@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Horrible, but in my testing it works. Thanks Peter!<br>
<br>
Ross<br>
<br>
&gt; On 11 Jul 2023, at 07:36, Peter Marko via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org" =
target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; <br>
&gt; Current 503 errors seem to last several seconds.<br>
&gt; In most cases there are two errors and third request succeeds.<br>
&gt; However sometimes the outage takes more than time needed<br>
&gt; for two retries and third one also fails.<br>
&gt; <br>
&gt; Extend retry count from 3 to 5 to improve the probablity<br>
&gt; that the fetcher succeeds.<br>
&gt; <br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" re=
l=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-=
native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</=
a> b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" re=
l=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; index a7392405e0..b3d0038c2f 100644<br>
&gt; --- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; @@ -129,7 +129,7 @@ def nvd_request_next(url, api_key, args):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0full_request =3D url + &#39;?&#39; + data<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 for attempt in range(3):<br>
&gt; +=C2=A0 =C2=A0 for attempt in range(5):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D urllib.request.ur=
lopen(full_request)<br>
&gt; <br>
&gt; -- <br>
&gt; 2.30.2<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184130): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184130" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184130</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100074007/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100074007/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000080f4c60600357a32--

