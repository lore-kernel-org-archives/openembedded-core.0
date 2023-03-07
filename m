Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA72C678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 15:15:55 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.17630.1678202152995341005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 07:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V3A7SYIa;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id p13so8569363ilp.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 07:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678202152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VwhDuBXgN0jIRFBjU66IypyAOlvuHh6+vNBlAKH0r8=;
        b=V3A7SYIaFkh/M8FSwQ2nCt6a5o/9Em+j7raMQcGlhPDa3tINMpDD2+5jc4BpJD+/XD
         rLfJqOeeALKfIDOYfGc0e3JvrEVShXTzgAnAaMyHJKty3p1TbgXFDnmjl43qLZLctgBr
         c9UxgI/CMgMytKPq5LoDnZZxG8HfJ2t36jKVKh+fSlSYGRGUnxF4UhkOev7xLVifKRtF
         2p/iYvdlyxWQrLRS8mjrZau7D9povuuna4zc52HKQduUtAjb46zzX0owYU4PHwimwx5z
         RbVz/iVD/rh+PRUQPAHlZ7isEsO9htZ1nlRv4pSPo86MaKTahwjqp9rnqJfiEyjZ1Ppa
         2BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678202152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VwhDuBXgN0jIRFBjU66IypyAOlvuHh6+vNBlAKH0r8=;
        b=m+QwFG+pvPkuffgiwrA5HpfKb/uJp22Ma5c5Wn+xJVuDGBYvO6UMA8n4ryC2aKuC9Y
         S1W5MMioYePN5BrUtg0YE7V9SKQ7ECoEPnQA7W4QrhKKtiGpKJdkUfFKbZTDhi63Bxfp
         TJ43LDhOUBDVutJFqzeUAbAACKTx4DnU6wDG9EUDmijzbRxcvbyjq4lEaW4j6s+C1ORG
         CN1q+iBOxkhxYgg8s1s5Y67WMNpTT9xHCBEihKmxaPzD+PZoVP1B7JJCVjyZ17nPsG7F
         MZWRGrfCClwOEp/wfLwoUq+D7k7IeGltWG+znLtS2SsHkhDFJO54JjSubJwOzr7RftRb
         sPMw==
X-Gm-Message-State: AO0yUKWEm4gXZrpjFT8W/Rf2f30QNIeah/MuSIQ2f1RswDoMDVqO3SFf
	sXN/dMCz1U8vejVe6ncJ8dAEYtidffRkpLRtLlY=
X-Google-Smtp-Source: AK7set+k03f7ZAu4VKezJMftJaX3msJ04Vi4okiPqeh9ixQWzUfm4bhXgWCvN/qFjFJAJL73r94Erh4QSIOSyZ77v20=
X-Received: by 2002:a05:6e02:cc4:b0:315:9b88:a50d with SMTP id
 c4-20020a056e020cc400b003159b88a50dmr7333174ilj.0.1678202152156; Tue, 07 Mar
 2023 07:15:52 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
 <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
 <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
 <ZAcq1Vp/h8ofNwl4@nuoska> <CADkTA4M5Ew-oDMXZCwMuxjEnBKb+AahVDh4QmyOSo+cGb96TDQ@mail.gmail.com>
 <CANPvuR=8NTvs0RT5uHbL_edWYcLHipLiE+dUU3di0Y+Pw-36-Q@mail.gmail.com>
In-Reply-To: <CANPvuR=8NTvs0RT5uHbL_edWYcLHipLiE+dUU3di0Y+Pw-36-Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Mar 2023 10:16:03 -0500
Message-ID: <CADkTA4OvoBGyMjwVZ4M7JGAegcsJQExTNfvWnbB8LELh-pVa0g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, Ricardo Salveti <ricardo@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 15:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178109

On Tue, Mar 7, 2023 at 9:58=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 7/0=
3/2023 =C3=A0(s) 13:52:
>>
>> On Tue, Mar 7, 2023 at 7:15=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro=
.org> wrote:
>> >
>> > Hi,
>> >
>> > On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote:
>> > > Hi,
>> > >
>> > > At Foundries.io we intend to update the docker version on the kirkst=
one
>> > > branch to the latest available upstream, currently v23.
>> > > Looks like the better approach can be doing that in the mixin layer,
>> > > for that a new kirstone lts branch will be required.
>> >
>> > FWIW, meta-virtualization master branch works well with kirkstone and
>> > docker can be updated that way.
>>
>> And I'm also happy to maintain multiple versions in the released
>> meta-virt branches, that way we can keep compatibility, but also offer
>> a newer version that can be selected by preferred version.
>>
>> I'd rather have the main/supported recipes in the layers where most of
>> the effort is placed, versus spraying them around in mixin layers.
>>
>> But as Mikko said, also consider just trying master against the
>> release, as chances are it is fine, and the branching is just to put a
>> stake in the ground for when the release happened.
>
>
> One of the problems with this approach of using the master branch of meta=
-virt
> is because some go recipes/projects require a recent version of the golan=
g to build the latest version.
> At last the golang needs to be backported on the mixin layer to circumven=
t these problems.

Right. You may still need some sort of mixin layer (for go, etc), I'm
more saying that I would be willing to get whatever version of
meta-virt tools available in the appropriate branches, since it
doesn't mean a forced upgrade to all users if we just keep the
multiple versions around.

Bruce

>
> Anyway I will try to build oe-core kirkstone with meta-virt master branch
> to get a better overview of the build requirements.
>
> Jose
>
>>
>>
>> Bruce
>>
>> >
>> > Many layers remove layer compatibility with older LTS releases even wh=
en
>> > technically recipes still work, at least with very few exceptions.
>> >
>> > > This requires a golang update as well but the golang on master is br=
oken
>> > > for some cases when -linkshared is in use and we are still debugging=
 this
>> > > issue.
>> > > I pretend to start this backport when I can stabilize first the gola=
ng 1.20
>> > > on master.
>> >
>> > Cherry-picking go patches from poky master to kirkstone also works onc=
e
>> > the kirkstone specific security updates have been reverted.
>> >
>> > Even if Alex disagrees, CVE patch backporting is needed when SW
>> > components break APIs and ABIs between releases. For mature and API/AB=
I
>> > compatible SW components the updates are trivial, but even with them
>> > there are exceptions and surprises.
>> >
>> > I think yocto maintainers can make sensible decisions and compromises =
for SW
>> > components and features which get updates vs which get CVE security pa=
tches. I
>> > think many "development only" tools can also be updated quite freely
>> > also in LTS branches. For example CVE and SPDX tooling, maybe even
>> > bitbake itself, git, subversion etc. gcc and libc do break things on m=
ajor updates, same for
>> > clang. go, rust, perl, python have possibly more stable updates so tho=
se
>> > could be aligned with all maintained branches. If no-one is posting CV=
E
>> > patches for complex SW components to LTS branches then I'd update them
>> > to latest release or even master branch rather than keep the affected
>> > CVEs open for ever. If there are not enough maintainers/resources, the=
n even
>> > breaking the API compatibility is ok. nodejs, rust, go, webkit, tiff e=
tc are
>> > really pain to maintain and thus updating them to latest release shoul=
d be
>> > considered even if APIs change.
>> >
>> > Cheers,
>> >
>> > -Mikko
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#178105): https://lists.openembedded.org/g/openembe=
dded-core/message/178105
>> > Mute This Topic: https://lists.openembedded.org/mt/97444547/1050810
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

