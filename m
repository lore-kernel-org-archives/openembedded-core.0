Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B337C6FD1A
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 14:58:05 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.17279.1678201083965913673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 06:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TwKIaE2i;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id f31so12557825vsv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 06:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678201083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=warnzM0OnAl5JlCRAKmqM7fPzl93KY62Kiv13CrTJvE=;
        b=TwKIaE2i3natigjl0WulnMdIg8OLASKVUdcl5TRyS3MrZ6SG/6cIQ/1Molai5wSWAR
         l/v4GdW50trTOIdz2m2nftyHlay7zUjDL8XOyivJjNaYZ/wTxLhmyHBIOFcG9EEQh39d
         2Zya0Q+T+a/tyW0zkMVFIg0XmY/xtAfh8G1YRtMVWcdP2QD4BrmzOtyhkfVNAvxLDi4A
         uVBa63MXeEEHBf3JuzYli+UeBmIkU66pIaXMXxwNG67fYY2XItvHLyUedqyVFn0HYEBC
         E0qCq6RV9MXQf2/cWgav00noLWvK39Hj4ykIcmi21IPSaR20faw1lIkxN6U2ThoeElT1
         ab8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678201083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=warnzM0OnAl5JlCRAKmqM7fPzl93KY62Kiv13CrTJvE=;
        b=Cs7DN1jAxkgDTNxlkYvCAPaknY8qTog4iOxEgmt6yw4jGkSNFTc2EX3oA5xksylI6N
         uFyXuJBXw5RH7a2l54/pJZHT/ZhjMhv/Zedj2IL2wiAuoTU2NqnPSHpymYZ3+UfQyWlY
         dKL8TBQEB2VvEChDMHWpzp2BvEWtKYeKV5M/5mLYPkXElc9w7z9w4hkmiZ6ceyNqHxK+
         mmueJKJf/+nyQxZpzBQXq6AMWg+Zg2NKy7NN+S/jY7nn0qy5UnZqXG4YIfaauQn8ggwD
         5gI3Pu1EvfPHQ4PwC2aw2xYa2DCXdvEVE7cKH6kaE6XGD4WJcvyAVUn8BRbfnthb/1mY
         fH3w==
X-Gm-Message-State: AO0yUKUUAr+N6bY1HOFcthw/UPqfDdhwZyqCE2cFw2Cp+QaPItL/kf1N
	qvGPtoNdx5mbZk85Piukn/XVtg9MC1MfWmd2Hig=
X-Google-Smtp-Source: AK7set//6t77vg9XcANhzWTnI5Xbg/eRFtPrKGimTiI5dBzXEv6eBn/JEnFEjXACSjhlRyKgi8ipDDpBi0+go6yMRMs=
X-Received: by 2002:a67:b142:0:b0:412:bca:d304 with SMTP id
 z2-20020a67b142000000b004120bcad304mr10117744vsl.7.1678201082497; Tue, 07 Mar
 2023 06:58:02 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
 <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
 <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
 <ZAcq1Vp/h8ofNwl4@nuoska> <CADkTA4M5Ew-oDMXZCwMuxjEnBKb+AahVDh4QmyOSo+cGb96TDQ@mail.gmail.com>
In-Reply-To: <CADkTA4M5Ew-oDMXZCwMuxjEnBKb+AahVDh4QmyOSo+cGb96TDQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 7 Mar 2023 14:57:51 +0000
Message-ID: <CANPvuR=8NTvs0RT5uHbL_edWYcLHipLiE+dUU3di0Y+Pw-36-Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000062539905f650a392"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178107

--00000000000062539905f650a392
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 7/03/=
2023
=C3=A0(s) 13:52:

> On Tue, Mar 7, 2023 at 7:15=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.=
org>
> wrote:
> >
> > Hi,
> >
> > On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote:
> > > Hi,
> > >
> > > At Foundries.io we intend to update the docker version on the kirksto=
ne
> > > branch to the latest available upstream, currently v23.
> > > Looks like the better approach can be doing that in the mixin layer,
> > > for that a new kirstone lts branch will be required.
> >
> > FWIW, meta-virtualization master branch works well with kirkstone and
> > docker can be updated that way.
>
> And I'm also happy to maintain multiple versions in the released
> meta-virt branches, that way we can keep compatibility, but also offer
> a newer version that can be selected by preferred version.
>
> I'd rather have the main/supported recipes in the layers where most of
> the effort is placed, versus spraying them around in mixin layers.
>
> But as Mikko said, also consider just trying master against the
> release, as chances are it is fine, and the branching is just to put a
> stake in the ground for when the release happened.
>

One of the problems with this approach of using the master branch of
meta-virt
is because some go recipes/projects require a recent version of the golang
to build the latest version.
At last the golang needs to be backported on the mixin layer to circumvent
these problems.

Anyway I will try to build oe-core kirkstone with meta-virt master branch
to get a better overview of the build requirements.

Jose


>
> Bruce
>
> >
> > Many layers remove layer compatibility with older LTS releases even whe=
n
> > technically recipes still work, at least with very few exceptions.
> >
> > > This requires a golang update as well but the golang on master is
> broken
> > > for some cases when -linkshared is in use and we are still debugging
> this
> > > issue.
> > > I pretend to start this backport when I can stabilize first the golan=
g
> 1.20
> > > on master.
> >
> > Cherry-picking go patches from poky master to kirkstone also works once
> > the kirkstone specific security updates have been reverted.
> >
> > Even if Alex disagrees, CVE patch backporting is needed when SW
> > components break APIs and ABIs between releases. For mature and API/ABI
> > compatible SW components the updates are trivial, but even with them
> > there are exceptions and surprises.
> >
> > I think yocto maintainers can make sensible decisions and compromises
> for SW
> > components and features which get updates vs which get CVE security
> patches. I
> > think many "development only" tools can also be updated quite freely
> > also in LTS branches. For example CVE and SPDX tooling, maybe even
> > bitbake itself, git, subversion etc. gcc and libc do break things on
> major updates, same for
> > clang. go, rust, perl, python have possibly more stable updates so thos=
e
> > could be aligned with all maintained branches. If no-one is posting CVE
> > patches for complex SW components to LTS branches then I'd update them
> > to latest release or even master branch rather than keep the affected
> > CVEs open for ever. If there are not enough maintainers/resources, then
> even
> > breaking the API compatibility is ok. nodejs, rust, go, webkit, tiff et=
c
> are
> > really pain to maintain and thus updating them to latest release should
> be
> > considered even if APIs change.
> >
> > Cheers,
> >
> > -Mikko
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178105):
> https://lists.openembedded.org/g/openembedded-core/message/178105
> > Mute This Topic: https://lists.openembedded.org/mt/97444547/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000062539905f650a392
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
ter=C3=A7a, 7/03/2023 =C3=A0(s) 13:52:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, Mar 7, 2023 at 7:15=E2=80=AFAM Mikko Rapeli =
&lt;<a href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rape=
li@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; At Foundries.io we intend to update the docker version on the kir=
kstone<br>
&gt; &gt; branch to the latest available upstream, currently v23.<br>
&gt; &gt; Looks like the better approach can be doing that in the mixin lay=
er,<br>
&gt; &gt; for that a new kirstone lts branch will be required.<br>
&gt;<br>
&gt; FWIW, meta-virtualization master branch works well with kirkstone and<=
br>
&gt; docker can be updated that way.<br>
<br>
And I&#39;m also happy to maintain multiple versions in the released<br>
meta-virt branches, that way we can keep compatibility, but also offer<br>
a newer version that can be selected by preferred version.<br>
<br>
I&#39;d rather have the main/supported recipes in the layers where most of<=
br>
the effort is placed, versus spraying them around in mixin layers.<br>
<br>
But as Mikko said, also consider just trying master against the<br>
release, as chances are it is fine, and the branching is just to put a<br>
stake in the ground for when the release happened.<br></blockquote><div><br=
>One of the problems with this approach of using the master branch of meta-=
virt</div><div>is because some go recipes/projects require a recent version=
 of the golang to build the latest version.=C2=A0</div><div>At last the gol=
ang needs to be backported on the=C2=A0mixin layer to=C2=A0circumvent these=
 problems.</div><div><br></div><div>Anyway I will try to build oe-core kirk=
stone=C2=A0with meta-virt=C2=A0master branch=C2=A0</div><div>to get a bette=
r overview of the build requirements.</div><div><br></div><div>Jose<br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Many layers remove layer compatibility with older LTS releases even wh=
en<br>
&gt; technically recipes still work, at least with very few exceptions.<br>
&gt;<br>
&gt; &gt; This requires a golang update as well but the golang on master is=
 broken<br>
&gt; &gt; for some cases when -linkshared is in use and we are still debugg=
ing this<br>
&gt; &gt; issue.<br>
&gt; &gt; I pretend to start this backport when I can stabilize first the g=
olang 1.20<br>
&gt; &gt; on master.<br>
&gt;<br>
&gt; Cherry-picking go patches from poky master to kirkstone also works onc=
e<br>
&gt; the kirkstone specific security updates have been reverted.<br>
&gt;<br>
&gt; Even if Alex disagrees, CVE patch backporting is needed when SW<br>
&gt; components break APIs and ABIs between releases. For mature and API/AB=
I<br>
&gt; compatible SW components the updates are trivial, but even with them<b=
r>
&gt; there are exceptions and surprises.<br>
&gt;<br>
&gt; I think yocto maintainers can make sensible decisions and compromises =
for SW<br>
&gt; components and features which get updates vs which get CVE security pa=
tches. I<br>
&gt; think many &quot;development only&quot; tools can also be updated quit=
e freely<br>
&gt; also in LTS branches. For example CVE and SPDX tooling, maybe even<br>
&gt; bitbake itself, git, subversion etc. gcc and libc do break things on m=
ajor updates, same for<br>
&gt; clang. go, rust, perl, python have possibly more stable updates so tho=
se<br>
&gt; could be aligned with all maintained branches. If no-one is posting CV=
E<br>
&gt; patches for complex SW components to LTS branches then I&#39;d update =
them<br>
&gt; to latest release or even master branch rather than keep the affected<=
br>
&gt; CVEs open for ever. If there are not enough maintainers/resources, the=
n even<br>
&gt; breaking the API compatibility is ok. nodejs, rust, go, webkit, tiff e=
tc are<br>
&gt; really pain to maintain and thus updating them to latest release shoul=
d be<br>
&gt; considered even if APIs change.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; -Mikko<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#178105): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/178105" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/178105</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97444547=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/97444547/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000062539905f650a392--

