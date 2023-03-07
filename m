Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65405C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 15:54:25 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.18899.1678204457808830251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 07:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Swdgmrdp;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id p13so8637426ilp.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 07:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678204457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgwZckX3jNOIFke7KtMQSC4dIAGXCTqU/0GxqCP/bzc=;
        b=SwdgmrdpG9WbwPg4YbScXtMC309/ePUUeSzfKkwX4Rr2H290mP09pL64V9k9V92Cew
         czuZ2LRRhUWCQwPCzXdmSNXZAKv3NzTLyLTgcQv6KaJYd01rImz8ORfDuoZtaDa8vqHP
         R5z8hEQxdv1ch8egOn19Oakm9zWB6mhG5xwIs3e5yv8t4WP8WtOeQedIB3y5DnVGVoAS
         PgUVNtRiJkar3ZtS2AlACKaR47Oi6vXRzDIrez1LK0B2a9jXtPrBculma1umkDKm2jm9
         CCDzT8pZlnQjBcPjl+GtOQ96TIkHZWoa+U7sYo6liXvWL6kCApJWnRg4K+rtuRi3TVK3
         AlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgwZckX3jNOIFke7KtMQSC4dIAGXCTqU/0GxqCP/bzc=;
        b=GgNZh7A3L0AjMEiNCxjWedLtVam37WuYhMSGp3dJgMJdYkkDOL9RPWjkzBSBqP0vg/
         vlNTKtiinVPXeIbCivAp6ffy2km4ZaKXKBnp+hXjWcYz2oMZgOb5rDzvlNSDlyw7ukja
         6uCd31IGkig0c+qjGiyt9swgCgeU7OpNO5Ju3wGenxTSqaMrDWZnt6LTPBpVB23arFWG
         e/TcU5sV7gz0iqC6IDgJmt1LJ5k0mYNQjCqwmyEO5IRKy8cjGvC4QOIWKwmkq8j+Kkpc
         I93Z9XbAhwnMxgN2J8Ds2OQJ/xCnky0p+fYD1WdLETqiqPuEzRB1W7nTKDaIusOOD5W4
         KSFQ==
X-Gm-Message-State: AO0yUKVVT5wC72ckZmvEnbLALesxZT6YBsQ0Ua67X3aYqOPDXZk1ZLGp
	kZy89jtEiDJp958SyJ3ljDRrfK1aoF6G2LU3kdI=
X-Google-Smtp-Source: AK7set+CpU1qhkxXR6erNM7rjO1Ev1MLRE2mukmVG3aZp9WtCbM0kPDaF8AxSh1graa1O16yUYzBBWBYuWKb6NXbIc8=
X-Received: by 2002:a05:6e02:13f4:b0:310:9fc1:a92b with SMTP id
 w20-20020a056e0213f400b003109fc1a92bmr7681429ilj.0.1678204456921; Tue, 07 Mar
 2023 07:54:16 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
 <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
 <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
 <ZAcq1Vp/h8ofNwl4@nuoska> <CADkTA4M5Ew-oDMXZCwMuxjEnBKb+AahVDh4QmyOSo+cGb96TDQ@mail.gmail.com>
 <CANPvuR=8NTvs0RT5uHbL_edWYcLHipLiE+dUU3di0Y+Pw-36-Q@mail.gmail.com>
 <CADkTA4OvoBGyMjwVZ4M7JGAegcsJQExTNfvWnbB8LELh-pVa0g@mail.gmail.com> <CANPvuRknYg2fyQ6S2oKT689EjV7Uk4ERDDA0QD2ZUBggRE7wcQ@mail.gmail.com>
In-Reply-To: <CANPvuRknYg2fyQ6S2oKT689EjV7Uk4ERDDA0QD2ZUBggRE7wcQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Mar 2023 10:54:27 -0500
Message-ID: <CADkTA4Ob0ms_OrOWaRzDBOXkuAajgwQXPa+jUkDnLAu7QRc8fA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 15:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178113

On Tue, Mar 7, 2023 at 10:48=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 7/0=
3/2023 =C3=A0(s) 15:15:
>>
>> On Tue, Mar 7, 2023 at 9:58=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com> wrote:
>> >
>> >
>> >
>> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, =
7/03/2023 =C3=A0(s) 13:52:
>> >>
>> >> On Tue, Mar 7, 2023 at 7:15=E2=80=AFAM Mikko Rapeli <mikko.rapeli@lin=
aro.org> wrote:
>> >> >
>> >> > Hi,
>> >> >
>> >> > On Tue, Mar 07, 2023 at 11:43:32AM +0000, Jose Quaresma wrote:
>> >> > > Hi,
>> >> > >
>> >> > > At Foundries.io we intend to update the docker version on the kir=
kstone
>> >> > > branch to the latest available upstream, currently v23.
>> >> > > Looks like the better approach can be doing that in the mixin lay=
er,
>> >> > > for that a new kirstone lts branch will be required.
>> >> >
>> >> > FWIW, meta-virtualization master branch works well with kirkstone a=
nd
>> >> > docker can be updated that way.
>> >>
>> >> And I'm also happy to maintain multiple versions in the released
>> >> meta-virt branches, that way we can keep compatibility, but also offe=
r
>> >> a newer version that can be selected by preferred version.
>> >>
>> >> I'd rather have the main/supported recipes in the layers where most o=
f
>> >> the effort is placed, versus spraying them around in mixin layers.
>> >>
>> >> But as Mikko said, also consider just trying master against the
>> >> release, as chances are it is fine, and the branching is just to put =
a
>> >> stake in the ground for when the release happened.
>> >
>> >
>> > One of the problems with this approach of using the master branch of m=
eta-virt
>> > is because some go recipes/projects require a recent version of the go=
lang to build the latest version.
>> > At last the golang needs to be backported on the mixin layer to circum=
vent these problems.
>>
>> Right. You may still need some sort of mixin layer (for go, etc), I'm
>> more saying that I would be willing to get whatever version of
>> meta-virt tools available in the appropriate branches, since it
>> doesn't mean a forced upgrade to all users if we just keep the
>> multiple versions around.
>
>
> Having on meta-virt more than one version available on the stable/lts bra=
nches
> looks like a great improvement. The newest version can use default_preffe=
rence -1
> so we can maintain some type of abi/api stabilization enabled by default.
>
> However it will always be difficult to decide which version of golang the=
 tool on meta-virt needs.
> And of course, the adicional maintenance overhead can increase a lot.

Having battled the go applications in meta-virt for a long time now,
it really isn't all that often we have issues with golang versions, in
the sense of needing matched versions. It is normally new features
that are required, versus a new golang dropping features. So a newer
go has almost always worked for all the versions we need.

The extra maintenance isn't significant, in particular when balanced
around trying to keep a centre of gravity around the recipes.

Bruce

>
> Jose
>
>>
>> Bruce
>>
>> >
>> > Anyway I will try to build oe-core kirkstone with meta-virt master bra=
nch
>> > to get a better overview of the build requirements.
>> >
>> > Jose
>> >
>> >>
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> > Many layers remove layer compatibility with older LTS releases even=
 when
>> >> > technically recipes still work, at least with very few exceptions.
>> >> >
>> >> > > This requires a golang update as well but the golang on master is=
 broken
>> >> > > for some cases when -linkshared is in use and we are still debugg=
ing this
>> >> > > issue.
>> >> > > I pretend to start this backport when I can stabilize first the g=
olang 1.20
>> >> > > on master.
>> >> >
>> >> > Cherry-picking go patches from poky master to kirkstone also works =
once
>> >> > the kirkstone specific security updates have been reverted.
>> >> >
>> >> > Even if Alex disagrees, CVE patch backporting is needed when SW
>> >> > components break APIs and ABIs between releases. For mature and API=
/ABI
>> >> > compatible SW components the updates are trivial, but even with the=
m
>> >> > there are exceptions and surprises.
>> >> >
>> >> > I think yocto maintainers can make sensible decisions and compromis=
es for SW
>> >> > components and features which get updates vs which get CVE security=
 patches. I
>> >> > think many "development only" tools can also be updated quite freel=
y
>> >> > also in LTS branches. For example CVE and SPDX tooling, maybe even
>> >> > bitbake itself, git, subversion etc. gcc and libc do break things o=
n major updates, same for
>> >> > clang. go, rust, perl, python have possibly more stable updates so =
those
>> >> > could be aligned with all maintained branches. If no-one is posting=
 CVE
>> >> > patches for complex SW components to LTS branches then I'd update t=
hem
>> >> > to latest release or even master branch rather than keep the affect=
ed
>> >> > CVEs open for ever. If there are not enough maintainers/resources, =
then even
>> >> > breaking the API compatibility is ok. nodejs, rust, go, webkit, tif=
f etc are
>> >> > really pain to maintain and thus updating them to latest release sh=
ould be
>> >> > considered even if APIs change.
>> >> >
>> >> > Cheers,
>> >> >
>> >> > -Mikko
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#178105): https://lists.openembedded.org/g/opene=
mbedded-core/message/178105
>> >> > Mute This Topic: https://lists.openembedded.org/mt/97444547/1050810
>> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [bruce.ashfield@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>> > --
>> > Best regards,
>> >
>> > Jos=C3=A9 Quaresma
>>
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

