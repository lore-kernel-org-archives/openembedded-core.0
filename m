Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E2EC678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 13:52:55 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.15526.1678197172771607940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 05:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g64oq8f8;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id v10so5424452iox.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 05:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678197172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJiGdX3NwlomcS/GSWEwTqCFgunR1P6xdJU+NOfpP+I=;
        b=g64oq8f8eoyxgkaCAzNM57I7izSNkWPavA5e/37XVl53uytEFENLlKBDA/VDTRd3au
         jv7OfQub62fD9ozsOMstplW6q8Mnp6q6yeKs83KdKJn2x3ON3a+8ti7tOjKa7lTL2Wgf
         JDNX2L3KURkmwZSe9qOuCHneyE4OSgokr/I4GGMH1KWOaOdVFnq8bQAeC2c93PGpCfSU
         SxpOEyJLLtl8N3hfnBmoUzR9TFqh0DtWH+jQJJkwWvbqw8jDOjYcR0QGIAmW9PYK832u
         YKr3eUCF9brep/87cSR8OoWHAEDphsMzi5FZbiP/llfB5fvQNvbaK2yNREW5RC9jeN1t
         ARAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678197172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJiGdX3NwlomcS/GSWEwTqCFgunR1P6xdJU+NOfpP+I=;
        b=MPBifbtQnrnuNEosHtcZ/72+YoEnhSdgXg87ycL8TWfDJqNWjmpVKDSGaY0c4lVt5F
         MIuP0goQvGnIV1/0HIi8VsHNKWcH1wlvGLWMDhwVtpdfga3nJJhWfvPD1czp2VF//HZM
         DvCniRqwigsAb4Xe4tDBUHwB7lU++fdbv5wS13Cu8fG+3hhKLOKJnxBolPKD8wC5By72
         +UJz4AqAch6g50BviqTazVUMT9DHMtJqVIanvEqwn2aaxiSAwGwBD4uKnVr+u5BFK8T2
         WiCL2dQsxIEhSVxCeC8NjApU3vBAFXiIMXpDEcXLMLgTwGjDS/QVAIASTGNBMj5P5IJB
         N6LA==
X-Gm-Message-State: AO0yUKVAJcijowQCRAhT8J+XdvhcfFJz63BnM7u78/kgawTubFhHEhig
	V1OUtqpf08ji3XZ7naGjg1y1k40Zp2VuhWCHs8Q=
X-Google-Smtp-Source: AK7set9JdxLBzpVnqRq33HwlFSfK0NS9zFRQB1jGdhdaSd6MjZhAjD8qjTlSbGgCHkmB773aGQD0H3hUfWRI5Qn3Asc=
X-Received: by 2002:a05:6602:3142:b0:74c:deb9:538 with SMTP id
 m2-20020a056602314200b0074cdeb90538mr6579516ioy.0.1678197171890; Tue, 07 Mar
 2023 05:52:51 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
 <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
 <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com> <ZAcq1Vp/h8ofNwl4@nuoska>
In-Reply-To: <ZAcq1Vp/h8ofNwl4@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Mar 2023 08:52:40 -0500
Message-ID: <CADkTA4M5Ew-oDMXZCwMuxjEnBKb+AahVDh4QmyOSo+cGb96TDQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, Ricardo Salveti <ricardo@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 13:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178106

On Tue, Mar 7, 2023 at 7:15=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:
>
> Hi,
>
> On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote:
> > Hi,
> >
> > At Foundries.io we intend to update the docker version on the kirkstone
> > branch to the latest available upstream, currently v23.
> > Looks like the better approach can be doing that in the mixin layer,
> > for that a new kirstone lts branch will be required.
>
> FWIW, meta-virtualization master branch works well with kirkstone and
> docker can be updated that way.

And I'm also happy to maintain multiple versions in the released
meta-virt branches, that way we can keep compatibility, but also offer
a newer version that can be selected by preferred version.

I'd rather have the main/supported recipes in the layers where most of
the effort is placed, versus spraying them around in mixin layers.

But as Mikko said, also consider just trying master against the
release, as chances are it is fine, and the branching is just to put a
stake in the ground for when the release happened.

Bruce

>
> Many layers remove layer compatibility with older LTS releases even when
> technically recipes still work, at least with very few exceptions.
>
> > This requires a golang update as well but the golang on master is broke=
n
> > for some cases when -linkshared is in use and we are still debugging th=
is
> > issue.
> > I pretend to start this backport when I can stabilize first the golang =
1.20
> > on master.
>
> Cherry-picking go patches from poky master to kirkstone also works once
> the kirkstone specific security updates have been reverted.
>
> Even if Alex disagrees, CVE patch backporting is needed when SW
> components break APIs and ABIs between releases. For mature and API/ABI
> compatible SW components the updates are trivial, but even with them
> there are exceptions and surprises.
>
> I think yocto maintainers can make sensible decisions and compromises for=
 SW
> components and features which get updates vs which get CVE security patch=
es. I
> think many "development only" tools can also be updated quite freely
> also in LTS branches. For example CVE and SPDX tooling, maybe even
> bitbake itself, git, subversion etc. gcc and libc do break things on majo=
r updates, same for
> clang. go, rust, perl, python have possibly more stable updates so those
> could be aligned with all maintained branches. If no-one is posting CVE
> patches for complex SW components to LTS branches then I'd update them
> to latest release or even master branch rather than keep the affected
> CVEs open for ever. If there are not enough maintainers/resources, then e=
ven
> breaking the API compatibility is ok. nodejs, rust, go, webkit, tiff etc =
are
> really pain to maintain and thus updating them to latest release should b=
e
> considered even if APIs change.
>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178105): https://lists.openembedded.org/g/openembedde=
d-core/message/178105
> Mute This Topic: https://lists.openembedded.org/mt/97444547/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

