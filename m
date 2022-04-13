Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DBEC47081
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web09.1652.1649872234321228883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oXzltct+;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id c15so3125135ljr.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxyCUlYPMBWK+QihBq+vIlIIW2uBFEos7vL0CBuPFQI=;
        b=oXzltct+uehd4OxuEMG4qTsiJspvX9JnxNfbEV16O+ZV0Ay6wH+fo1kS5PmQvTA4Hl
         uKzb5rEnK1fWEzuctXTWsXhe0XP/2dy0IEi8azZVkieQJ9srNZ2vGl0ZyCxPSCgWdeDv
         2Mz3VofXT2sHyCydDgZBCWD3R8YvVjn2jzjXj9uf8bYwVewa779h4cQeynIJEFsRDdX4
         B0vvcNPxh076htN9Ao+mLoOyFf+Xh7BrPmzj0ytF67JzPC1wC5m+/nTVoEbTY+WUOgtn
         CMGLjvX3/zYYuYI3hVaUIOZOdZNrqPeSzzRkO/AeK2us6Q3HpdXI0pxbAc/DO/jxU/aX
         UlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxyCUlYPMBWK+QihBq+vIlIIW2uBFEos7vL0CBuPFQI=;
        b=Wye72Jd1fQPogKusS4VCVYGlU+8AOMr370N2gnh3h00vtIr61lzR96NNYaAPaN+HTD
         0R9Cawf0OhiB95GuNY/uC/0cUNQCpLYK2JOq0QYYpkxGOGyJssEXousV6x2MkrBAdei5
         8UAuRQC7U8ILFu44hkks50fLCOLDG3B001/5fieOK59OHcXAcx/mVf5YTQMNRFvRlaKA
         +Mj7yT8wb2i2XrjQxoW/p2B0jaGIbSv+UHQr+NWjDB/TLShmFMYizfivW3xvMuXjvN6c
         zZ7cLzhOdq134Qs3icuI2+73Np8nSrwDEUWNhmx7tSJ0M4m5I8bADH8DsRFQIlXinX+7
         MAdA==
X-Gm-Message-State: AOAM531V66r45aNgjdMXdoEGo1r1KIlrrLKM93T60COSqhaX5SBLyH2i
	idhPjzIhRZTXzNx0g46Icw++IOykMgLP+gPOtgQ=
X-Google-Smtp-Source: 
 ABdhPJzgOuBTh0K4d6X5JtDGtLU5BkQVLe2nkgWY/5e76i5I62nMC0hsAIBqQTQaPCCAhZtdwtzOxGuHFbq+8xVmr+0=
X-Received: by 2002:a2e:a905:0:b0:24a:fed2:d12e with SMTP id
 j5-20020a2ea905000000b0024afed2d12emr28563896ljq.255.1649872232511; Wed, 13
 Apr 2022 10:50:32 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
 <Ylb9RoAyRpDHTaqe@mcrowe.com>
 <CAOSpxdbaE-=NOsQVG_+tK1J9oojA9qT8sMoR3c06uEssXJ0mFQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbaE-=NOsQVG_+tK1J9oojA9qT8sMoR3c06uEssXJ0mFQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 13 Apr 2022 18:50:21 +0100
Message-ID: 
 <CANPvuRnK32V61n7TKf6aBd8xoRi3drO4o0B0BBm_Y=431B89Hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Mike Crowe <mac@mcrowe.com>, Ralph Siemsen <ralph.siemsen@linaro.org>,
	Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000057fbff05dc8cd074"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164352

--00000000000057fbff05dc8cd074
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Steve Sakoman <steve@sakoman.com> escreveu no dia quarta, 13/04/2022 =C3=A0=
(s)
18:37:

> On Wed, Apr 13, 2022 at 6:41 AM Mike Crowe <mac@mcrowe.com> wrote:
> >
> > On Wednesday 13 April 2022 at 06:02:22 -1000, Steve Sakoman wrote:
> > > Both runs completed and I'm still seeing success without the zlib
> patch:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/506=
9
> > >
> > > and failure with the patch:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/507=
0
> >
> > I'm certainly no expert with the autobuilder, but it looks like nothing
> was
> > actually compiled for both of those builds - everything came from the
> > sstate cache.
> >
> > I believe that Ralph's reproduction of the test failure without the zli=
b
> > patch was from a complete rebuild without anything coming from the ssta=
te
> > cache.
> >
> > I suspect that if a PR bump or something similar that causes zlib and a=
ll
> > its reverse dependencies to be built were tested on top of the commit
> used
> > for build 5069 then the test failure would occur then as well and
> > exonerate the zlib patch.
>
> A valid point, let's see what happens with a PR bump:
>

I think that bumping the PR is not enough to rebuild a package.
The sstate cache needs to be invalidated and bumped as well
with HASHEQUIV_HASH_VERSION.

PR =3D "r1"
HASHEQUIV_HASH_VERSION .=3D ".1"

Jose


>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5072
>
> I see plenty of rebuilds in process . . .
>
> Steve
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164349):
> https://lists.openembedded.org/g/openembedded-core/message/164349
> Mute This Topic: https://lists.openembedded.org/mt/90107518/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000057fbff05dc8cd074
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Steve Sakoman &lt;<a href=3D"mailto:steve@sa=
koman.com">steve@sakoman.com</a>&gt; escreveu no dia quarta, 13/04/2022 =C3=
=A0(s) 18:37:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Wed, Apr 13, 2022 at 6:41 AM Mike Crowe &lt;<a href=3D"mailto:mac@mcrowe.c=
om" target=3D"_blank">mac@mcrowe.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wednesday 13 April 2022 at 06:02:22 -1000, Steve Sakoman wrote:<br>
&gt; &gt; Both runs completed and I&#39;m still seeing success without the =
zlib patch:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/50/builds/5069" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/50/builds/5069</a><br>
&gt; &gt;<br>
&gt; &gt; and failure with the patch:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/50/builds/5070" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/50/builds/5070</a><br>
&gt;<br>
&gt; I&#39;m certainly no expert with the autobuilder, but it looks like no=
thing was<br>
&gt; actually compiled for both of those builds - everything came from the<=
br>
&gt; sstate cache.<br>
&gt;<br>
&gt; I believe that Ralph&#39;s reproduction of the test failure without th=
e zlib<br>
&gt; patch was from a complete rebuild without anything coming from the sst=
ate<br>
&gt; cache.<br>
&gt;<br>
&gt; I suspect that if a PR bump or something similar that causes zlib and =
all<br>
&gt; its reverse dependencies to be built were tested on top of the commit =
used<br>
&gt; for build 5069 then the test failure would occur then as well and<br>
&gt; exonerate the zlib patch.<br>
<br>
A valid point, let&#39;s see what happens with a PR bump:<br></blockquote><=
div><br></div><div>I think that bumping the PR is not enough=C2=A0to rebuil=
d a package.</div><div>The sstate=C2=A0cache needs to be invalidated and bu=
mped as well</div><div>with HASHEQUIV_HASH_VERSION.</div><div><br></div>PR =
=3D &quot;r1&quot;<br><div>HASHEQUIV_HASH_VERSION .=3D &quot;.1&quot;</div>=
<div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/50/build=
s/5072" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/5072</a><br>
<br>
I see plenty of rebuilds in process . . .<br>
<br>
Steve<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164349): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164349" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164349</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90107518/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90107518/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000057fbff05dc8cd074--

