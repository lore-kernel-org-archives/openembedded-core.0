Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FC7C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 15:48:55 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.18555.1678204127815546144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 07:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pg3ctQ4w;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id f17so9165213uax.7
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678204127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M1xkzmfhkM+CEmZRXoDlM3ZMxif4EcC2hgQ/pQvuah8=;
        b=pg3ctQ4wTXUhDY1S67eXS/4Y6XVakkuE75tnz+KI/eBGsKFv0gatq6F22BivVTPQXM
         fC9NmEBoMc6CpMuzjDCzSV1GQ9b0dBtkVPBX9nwfTqMVz1FgPVDndS5pz0TOpYrjCEu1
         fOlPhJw6bo5paol3LFl2f65GeOyy7suFDMdvsaAdsWpza+4MhftzgkLpuMLZllRPk8ue
         IR2rBk2AVaE9tCcMye6nz+E3YWa0IzZ6X7DkjnHUHDi8c3JBOgmgFTNx7ENfgdFfkSJD
         IDO9nQn/l0LKYF0BoMLWeT4uHNSUimN+cxiFl8Qp+rQlhxY9VPyalCPBTaaSWmRkksrz
         PwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1xkzmfhkM+CEmZRXoDlM3ZMxif4EcC2hgQ/pQvuah8=;
        b=GX6yfXe6+JLhKC/r5wWupLeP9bIfyZOSm7Byr09Pg5EILqosibH2unZXip/eujFePs
         /ao2uJfCftAlu47kV4vTPsW7hBalGU1WVXcYCyZbCxrD2HJrYHM42W4fQ9TLCFktdWrd
         1ci+RdkZjfSnTHhvkthJ8PsA2EupZqDaCoq0/NXb+1kkwC0Mu+lz6RnLE3hRP72nHOHQ
         Y0Z291XUFyqed/toauBqAJNZDyBgvDfsfBewmon0XTCxp6eC7+vlA4vDSLmznSHV3ggs
         SRojLD/PvX0WILh+pDSW5AXqgdvPbNSFWESyZQ9XUeVFcqW0ETZM0s25l5c19EhjRTVJ
         uoNw==
X-Gm-Message-State: AO0yUKXaqwzD4kzxSVDkzzD7C40SSSCLgcLA9k5zftAWjT9wSaz3C1pe
	/iX1/ej5qvKgCDWxWlU1GLL8R4zbHpUh+cJ+YZc=
X-Google-Smtp-Source: AK7set9yMhTAYmiDfh9WSo5NWnpr51hGttxpuYioBxFKeWy9Jbnu5GSFHS63q3UCwQuOoMI6MVCOjqO8E1spfsxmAa4=
X-Received: by 2002:a05:6122:ca1:b0:401:d1f4:bccf with SMTP id
 ba33-20020a0561220ca100b00401d1f4bccfmr16029757vkb.0.1678204126696; Tue, 07
 Mar 2023 07:48:46 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
 <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
 <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
 <ZAcq1Vp/h8ofNwl4@nuoska> <CADkTA4M5Ew-oDMXZCwMuxjEnBKb+AahVDh4QmyOSo+cGb96TDQ@mail.gmail.com>
 <CANPvuR=8NTvs0RT5uHbL_edWYcLHipLiE+dUU3di0Y+Pw-36-Q@mail.gmail.com> <CADkTA4OvoBGyMjwVZ4M7JGAegcsJQExTNfvWnbB8LELh-pVa0g@mail.gmail.com>
In-Reply-To: <CADkTA4OvoBGyMjwVZ4M7JGAegcsJQExTNfvWnbB8LELh-pVa0g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 7 Mar 2023 15:48:35 +0000
Message-ID: <CANPvuRknYg2fyQ6S2oKT689EjV7Uk4ERDDA0QD2ZUBggRE7wcQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000d5177d05f651588b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 15:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178112

--000000000000d5177d05f651588b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 7/03/=
2023
=C3=A0(s) 15:15:

> On Tue, Mar 7, 2023 at 9:58=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail=
.com>
> wrote:
> >
> >
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a,
> 7/03/2023 =C3=A0(s) 13:52:
> >>
> >> On Tue, Mar 7, 2023 at 7:15=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lina=
ro.org>
> wrote:
> >> >
> >> > Hi,
> >> >
> >> > On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote:
> >> > > Hi,
> >> > >
> >> > > At Foundries.io we intend to update the docker version on the
> kirkstone
> >> > > branch to the latest available upstream, currently v23.
> >> > > Looks like the better approach can be doing that in the mixin laye=
r,
> >> > > for that a new kirstone lts branch will be required.
> >> >
> >> > FWIW, meta-virtualization master branch works well with kirkstone an=
d
> >> > docker can be updated that way.
> >>
> >> And I'm also happy to maintain multiple versions in the released
> >> meta-virt branches, that way we can keep compatibility, but also offer
> >> a newer version that can be selected by preferred version.
> >>
> >> I'd rather have the main/supported recipes in the layers where most of
> >> the effort is placed, versus spraying them around in mixin layers.
> >>
> >> But as Mikko said, also consider just trying master against the
> >> release, as chances are it is fine, and the branching is just to put a
> >> stake in the ground for when the release happened.
> >
> >
> > One of the problems with this approach of using the master branch of
> meta-virt
> > is because some go recipes/projects require a recent version of the
> golang to build the latest version.
> > At last the golang needs to be backported on the mixin layer to
> circumvent these problems.
>
> Right. You may still need some sort of mixin layer (for go, etc), I'm
> more saying that I would be willing to get whatever version of
> meta-virt tools available in the appropriate branches, since it
> doesn't mean a forced upgrade to all users if we just keep the
> multiple versions around.
>

Having on meta-virt more than one version available on the stable/lts
branches
looks like a great improvement. The newest version can use
default_prefference -1
so we can maintain some type of abi/api stabilization enabled by default.

However it will always be difficult to decide which version of golang the
tool on meta-virt needs.
And of course, the adicional maintenance overhead can increase a lot.

Jose


> Bruce
>
> >
> > Anyway I will try to build oe-core kirkstone with meta-virt master bran=
ch
> > to get a better overview of the build requirements.
> >
> > Jose
> >
> >>
> >>
> >> Bruce
> >>
> >> >
> >> > Many layers remove layer compatibility with older LTS releases even
> when
> >> > technically recipes still work, at least with very few exceptions.
> >> >
> >> > > This requires a golang update as well but the golang on master is
> broken
> >> > > for some cases when -linkshared is in use and we are still
> debugging this
> >> > > issue.
> >> > > I pretend to start this backport when I can stabilize first the
> golang 1.20
> >> > > on master.
> >> >
> >> > Cherry-picking go patches from poky master to kirkstone also works
> once
> >> > the kirkstone specific security updates have been reverted.
> >> >
> >> > Even if Alex disagrees, CVE patch backporting is needed when SW
> >> > components break APIs and ABIs between releases. For mature and
> API/ABI
> >> > compatible SW components the updates are trivial, but even with them
> >> > there are exceptions and surprises.
> >> >
> >> > I think yocto maintainers can make sensible decisions and compromise=
s
> for SW
> >> > components and features which get updates vs which get CVE security
> patches. I
> >> > think many "development only" tools can also be updated quite freely
> >> > also in LTS branches. For example CVE and SPDX tooling, maybe even
> >> > bitbake itself, git, subversion etc. gcc and libc do break things on
> major updates, same for
> >> > clang. go, rust, perl, python have possibly more stable updates so
> those
> >> > could be aligned with all maintained branches. If no-one is posting
> CVE
> >> > patches for complex SW components to LTS branches then I'd update th=
em
> >> > to latest release or even master branch rather than keep the affecte=
d
> >> > CVEs open for ever. If there are not enough maintainers/resources,
> then even
> >> > breaking the API compatibility is ok. nodejs, rust, go, webkit, tiff
> etc are
> >> > really pain to maintain and thus updating them to latest release
> should be
> >> > considered even if APIs change.
> >> >
> >> > Cheers,
> >> >
> >> > -Mikko
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#178105):
> https://lists.openembedded.org/g/openembedded-core/message/178105
> >> > Mute This Topic: https://lists.openembedded.org/mt/97444547/1050810
> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [bruce.ashfield@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
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

--000000000000d5177d05f651588b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt=
; escreveu no dia ter=C3=A7a, 7/03/2023 =C3=A0(s) 15:15:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Tue, Mar 7, 2023 at 9:58=E2=80=
=AFAM Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=
=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 7/=
03/2023 =C3=A0(s) 13:52:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Mar 7, 2023 at 7:15=E2=80=AFAM Mikko Rapeli &lt;<a href=3D=
"mailto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org<=
/a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote=
:<br>
&gt;&gt; &gt; &gt; Hi,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; At Foundries.io we intend to update the docker version o=
n the kirkstone<br>
&gt;&gt; &gt; &gt; branch to the latest available upstream, currently v23.<=
br>
&gt;&gt; &gt; &gt; Looks like the better approach can be doing that in the =
mixin layer,<br>
&gt;&gt; &gt; &gt; for that a new kirstone lts branch will be required.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; FWIW, meta-virtualization master branch works well with kirks=
tone and<br>
&gt;&gt; &gt; docker can be updated that way.<br>
&gt;&gt;<br>
&gt;&gt; And I&#39;m also happy to maintain multiple versions in the releas=
ed<br>
&gt;&gt; meta-virt branches, that way we can keep compatibility, but also o=
ffer<br>
&gt;&gt; a newer version that can be selected by preferred version.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d rather have the main/supported recipes in the layers where=
 most of<br>
&gt;&gt; the effort is placed, versus spraying them around in mixin layers.=
<br>
&gt;&gt;<br>
&gt;&gt; But as Mikko said, also consider just trying master against the<br=
>
&gt;&gt; release, as chances are it is fine, and the branching is just to p=
ut a<br>
&gt;&gt; stake in the ground for when the release happened.<br>
&gt;<br>
&gt;<br>
&gt; One of the problems with this approach of using the master branch of m=
eta-virt<br>
&gt; is because some go recipes/projects require a recent version of the go=
lang to build the latest version.<br>
&gt; At last the golang needs to be backported on the mixin layer to circum=
vent these problems.<br>
<br>
Right. You may still need some sort of mixin layer (for go, etc), I&#39;m<b=
r>
more saying that I would be willing to get whatever version of<br>
meta-virt tools available in the appropriate branches, since it<br>
doesn&#39;t mean a forced upgrade to all users if we just keep the<br>
multiple versions around.<br></blockquote><div><br></div><div>Having on met=
a-virt more than one version available on the stable/lts branches=C2=A0<br>=
<div>looks like a great improvement. The newest=C2=A0version can use defaul=
t_prefference -1</div></div><div>so we can maintain some type of abi/api st=
abilization enabled by default.</div><div><br>However it will always be dif=
ficult=C2=A0to decide which version of golang the tool on meta-virt needs.<=
br></div><div>And of course, the adicional maintenance=C2=A0overhead can in=
crease=C2=A0a lot.<br><br>Jose<br><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Anyway I will try to build oe-core kirkstone with meta-virt master bra=
nch<br>
&gt; to get a better overview of the build requirements.<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Many layers remove layer compatibility with older LTS release=
s even when<br>
&gt;&gt; &gt; technically recipes still work, at least with very few except=
ions.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; This requires a golang update as well but the golang on =
master is broken<br>
&gt;&gt; &gt; &gt; for some cases when -linkshared is in use and we are sti=
ll debugging this<br>
&gt;&gt; &gt; &gt; issue.<br>
&gt;&gt; &gt; &gt; I pretend to start this backport when I can stabilize fi=
rst the golang 1.20<br>
&gt;&gt; &gt; &gt; on master.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cherry-picking go patches from poky master to kirkstone also =
works once<br>
&gt;&gt; &gt; the kirkstone specific security updates have been reverted.<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Even if Alex disagrees, CVE patch backporting is needed when =
SW<br>
&gt;&gt; &gt; components break APIs and ABIs between releases. For mature a=
nd API/ABI<br>
&gt;&gt; &gt; compatible SW components the updates are trivial, but even wi=
th them<br>
&gt;&gt; &gt; there are exceptions and surprises.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I think yocto maintainers can make sensible decisions and com=
promises for SW<br>
&gt;&gt; &gt; components and features which get updates vs which get CVE se=
curity patches. I<br>
&gt;&gt; &gt; think many &quot;development only&quot; tools can also be upd=
ated quite freely<br>
&gt;&gt; &gt; also in LTS branches. For example CVE and SPDX tooling, maybe=
 even<br>
&gt;&gt; &gt; bitbake itself, git, subversion etc. gcc and libc do break th=
ings on major updates, same for<br>
&gt;&gt; &gt; clang. go, rust, perl, python have possibly more stable updat=
es so those<br>
&gt;&gt; &gt; could be aligned with all maintained branches. If no-one is p=
osting CVE<br>
&gt;&gt; &gt; patches for complex SW components to LTS branches then I&#39;=
d update them<br>
&gt;&gt; &gt; to latest release or even master branch rather than keep the =
affected<br>
&gt;&gt; &gt; CVEs open for ever. If there are not enough maintainers/resou=
rces, then even<br>
&gt;&gt; &gt; breaking the API compatibility is ok. nodejs, rust, go, webki=
t, tiff etc are<br>
&gt;&gt; &gt; really pain to maintain and thus updating them to latest rele=
ase should be<br>
&gt;&gt; &gt; considered even if APIs change.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -Mikko<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#178105): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/178105" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/178105</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/97444547/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/97444547/1050810</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</di=
v></div></div></div>

--000000000000d5177d05f651588b--

