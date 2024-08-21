Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402BEC52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 07:17:32 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.14720.1724224648493567930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 00:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JpfzZHKO;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2fbf1d14so4392331fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 00:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724224646; x=1724829446; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gKfJFeaTnr+8XuySCoOqAPT2C/0jsS8pFdm72BY3njg=;
        b=JpfzZHKOqpj1vdLOoLF+oZJjosYCvcbliFla7dqZwqg3Mg33QI6ApV0dcHBdAGSbUt
         TGzm26/iJUQljwSnZfCo6b0ZT2QLiEay59kWzr8X60zly/rcK+W1jHzSi1smayXc/sn1
         H7M9Ny8ucXAhI0zBwp8KlPuPc2nA3biUnb7/woJQ8Yp4s+kUXBin/OTeAZ703fgzjFU/
         ++gNTRrdFKTBy3hPysJZLsBgKodr0hqXqipqLKrGYsJq/5KY6np/hlUjNLE/dcsSStNf
         HNEZPAMABQJXeZKPnwmrSRBKQY7xCPeUT4u/bSR1mn7Q4ljDNk/IfHxFQrl216ccEBAI
         XrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724224646; x=1724829446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKfJFeaTnr+8XuySCoOqAPT2C/0jsS8pFdm72BY3njg=;
        b=nlnUifnUalw0f6dJNV+uweqzZugNTR2DkSYwXQA4M4hldYT7af0Mp71ZJ5ChYMLSla
         c/kHPbrXxXQvyFGJq8GTsu0T4skIigyxpCm34fHoziG3nIfIflqaiVsnUK2Sm3qey/Gq
         f+M+xJ5vNhhTwwLnAdGaCJ4IZp24VuGTTYeR13JSnPTNFQj6BC+IwHUbhaPSvYaT4Coe
         ER5rKbj5cZChRotLN2l2WoUqjkiKeCUt8BGVx2lCLv4UYJPe6SsdvG8zN5MNsEpwi25D
         naBi4C80LZERSBfp7fHsRl4G/Ttg7I2pj6tToEJPr31TN9ORF1iMHQ58hKHAadfXiWSy
         woMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpujTsEBB/D2DP5RtxPoQf9ft+D0/NeAe1TtAiHgunMby9Qziqgz9VP3XNyr9plqPM2Chc7pL4kNKagxCftoquVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzx9tbndyu481G2E3lWLjGWvsBKfQyJFkcAMtkwxK1sjRIIWIQR
	Aj0NBl7wSaUBghX0DZr+dmltDNrVJbYLQKWbYCknrF0Nw1jxLc+N7lY2kfTqlsNmocSeBsLSyaS
	N03moxiYZRTUWxY3aotJujWRfRCUCzA==
X-Google-Smtp-Source: AGHT+IFcIAjp9vGNJDy1yNGkHPlXrpSUd+Rzl2VqhmafawR0/g5s4mA5Aujto4/EGnYA8dAFR4uZ6TZYcUbHxLLrxpc=
X-Received: by 2002:a05:6512:118d:b0:52e:f91b:f7c7 with SMTP id
 2adb3069b0e04-533483de527mr395302e87.19.1724224645674; Wed, 21 Aug 2024
 00:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <1724142644-20746-1-git-send-email-wangmy@fujitsu.com> <710ec238fc73efaedfbdb3a06c4c57214b6d926b.camel@linuxfoundation.org>
In-Reply-To: <710ec238fc73efaedfbdb3a06c4c57214b6d926b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 21 Aug 2024 09:17:14 +0200
Message-ID: <CANNYZj-OjZ2--ZHCQz6vkxHbsS7CQ4HCJ0gRSYc91Ba12qE-Fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kmod: upgrade 32 -> 33
To: richard.purdie@linuxfoundation.org
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084bcff06202c55b2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 07:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203576

--00000000000084bcff06202c55b2
Content-Type: text/plain; charset="UTF-8"

I have a patch where this is addressed in
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates

The whole set is being tested in a-full now.

Alex

On Wed 21. Aug 2024 at 9.08, Richard Purdie via lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> On Tue, 2024-08-20 at 16:30 +0800, wangmy via lists.openembedded.org
> wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > 0001-Use-portable-implementation-for-basename-API.patch
> > removed since it's included in 33
> >
> > avoid_parallel_tests.patch
> > gtkdocdir.patch
> > refreshed for 33
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  ...able-implementation-for-basename-API.patch | 136 ------------------
> >  .../kmod/kmod/avoid_parallel_tests.patch      |  10 +-
> >  meta/recipes-kernel/kmod/kmod/gtkdocdir.patch |   9 +-
> >  .../kmod/{kmod_32.bb => kmod_33.bb}           |   3 +-
> >  4 files changed, 8 insertions(+), 150 deletions(-)
> >  delete mode 100644
> meta/recipes-kernel/kmod/kmod/0001-Use-portable-implementation-for-basename-API.patch
> >  rename meta/recipes-kernel/kmod/{kmod_32.bb => kmod_33.bb} (96%)
>
> It looks like this has failures when manpages are enabled:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/7027/steps/14/logs/stdio
>
> (selftest)
>
> | checking for scdoc... no
> | configure: error: *** scdoc needed for building manpages. Either install
> it or pass --disable-manpages
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6302/steps/11/logs/stdio
>
> (docs world build)
>
> Cheers,
>
> Richard
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203575):
> https://lists.openembedded.org/g/openembedded-core/message/203575
> Mute This Topic: https://lists.openembedded.org/mt/107997333/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000084bcff06202c55b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have a patch where this is addressed in=C2=A0<div><a hr=
ef=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/package-v=
ersion-updates">https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin=
/package-version-updates</a></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">The whole set is being tested in a-full now.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alex</div></div><div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 21. Aug 2024 at 9.08, Richa=
rd Purdie via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.op=
enembedded.org">linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)">On Tue, 2024-08-20 at 16:30 +0800, wangmy via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a> wrote:<br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; <br>
&gt; 0001-Use-portable-implementation-for-basename-API.patch<br>
&gt; removed since it&#39;s included in 33<br>
&gt; <br>
&gt; avoid_parallel_tests.patch<br>
&gt; gtkdocdir.patch<br>
&gt; refreshed for 33<br>
&gt; <br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...able-implementation-for-basename-API.patch | 136 ------------=
------<br>
&gt; =C2=A0.../kmod/kmod/avoid_parallel_tests.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 10 +-<br>
&gt; =C2=A0meta/recipes-kernel/kmod/kmod/gtkdocdir.patch |=C2=A0=C2=A0 9 +-=
<br>
&gt; =C2=A0.../kmod/{<a href=3D"http://kmod_32.bb" rel=3D"noreferrer" targe=
t=3D"_blank">kmod_32.bb</a> =3D&gt; <a href=3D"http://kmod_33.bb" rel=3D"no=
referrer" target=3D"_blank">kmod_33.bb</a>}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-<br>
&gt; =C2=A04 files changed, 8 insertions(+), 150 deletions(-)<br>
&gt; =C2=A0delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Use-portab=
le-implementation-for-basename-API.patch<br>
&gt; =C2=A0rename meta/recipes-kernel/kmod/{<a href=3D"http://kmod_32.bb" r=
el=3D"noreferrer" target=3D"_blank">kmod_32.bb</a> =3D&gt; <a href=3D"http:=
//kmod_33.bb" rel=3D"noreferrer" target=3D"_blank">kmod_33.bb</a>} (96%)<br=
>
<br>
It looks like this has failures when manpages are enabled:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/7027/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/80/builds/7027/steps/14/logs/=
stdio</a><br>
<br>
(selftest)<br>
<br>
| checking for scdoc... no<br>
| configure: error: *** scdoc needed for building manpages. Either install =
it or pass --disable-manpages<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/108/buil=
ds/6302/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6302/steps/11/log=
s/stdio</a><br>
<br>
(docs world build)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#203575): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/203575" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/203575</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107997333/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107997333/1686489</a><br>
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

--00000000000084bcff06202c55b2--

