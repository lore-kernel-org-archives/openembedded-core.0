Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCFEC76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 03:05:29 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.92490.1680577521352719471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 20:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gFdS523M;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id a30-20020a9d3e1e000000b006a13f728172so13528054otd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 20:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680577520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpK3JqR+T1icehlNfViyvC1SE+IXkXMtqoBdkjbUAJc=;
        b=gFdS523MSdHkL+xMRBNpmoV/CJ/gDWyqFAm9V1+bnh3sn2h/PN3pyRF6Wu15S9d27H
         RPv4mtg+jASEnVJ9FlrKvSYkAJ7C4HhT5Li7sVp4SBZuoKCE3/EVvigBvO7qtqX+TKqJ
         6ilW5JT1kumBwqxB1LGw4geaMm1Sw+2bqEqwGUtFwUdW2QMILCmPDNJHibDsSfGlsdeq
         zaBSblNCn5gn4IKzdMRWwmcrfiiRLNM10tarXqJjn+thTMH9VpyVo1STBqxDVyEMOcik
         tN38xhAtgYaqsg6OQU9oZMGvUmP8Sf3vIeqTq+eFkGVXqQyEHGlpf2k7hFpjGZxJrNzY
         /j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680577520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpK3JqR+T1icehlNfViyvC1SE+IXkXMtqoBdkjbUAJc=;
        b=RbDO/EaK2ej3E3SnVMlMutaDFrUb6nVcSvkpFJgDhooyK2wU+T8c7Lk02KskK3o2Of
         URWBXADA2PmKevJLuAKhWrEy/dCr6t14gENg1MzjhlSnYJKJWVJeia6yz6MJdbFr2evb
         LbafZlhnhiVsujbijiRosS7iE0HaPVJSij+y4ZJmfdxeDxW4ftz08ujlc5qkUJl66dYH
         fAdFsrnEeG3zUiV+VQEztAouQbSBGBBQftNZrVYnWKb4znJAM6d6sIhjg7toOYzJ0yg+
         n425JNaB6Vb87v3pW1k78fx8mv7rAOclcd56Pe301Cc2wcUj4RCDNhEZGvCktKo4wRT9
         0P1g==
X-Gm-Message-State: AAQBX9d3JeGS63xRMhwCsMO6rPK/0bd9NpHyx7TWwDpo2ML4SlkhPqJc
	2Uah7TaTFHe0rJi3rhtLmGPPcT44zIWavEe6N0o=
X-Google-Smtp-Source: AKy350aAYguNYieJPnngm/6xFBoXxWM9c3t91hEsA0Reu7cBkvAFrJB1ym7zFbQANFAwpw8EOeJ6Ce3m/3uVZjaPRqQ=
X-Received: by 2002:a9d:6a5a:0:b0:69f:573:6113 with SMTP id
 h26-20020a9d6a5a000000b0069f05736113mr416367otn.2.1680577520474; Mon, 03 Apr
 2023 20:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <51ba3bfc-caa0-0a31-c295-e59c8416e672@kernel.crashing.org>
 <CO6PR11MB5602C3D93B44F41049BBDCECED939@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CAMKF1sqq+H5_1YQGikajgdpnwmDwrTrXYeBNv=_+4PhTiMx8pA@mail.gmail.com> <ddd3f85f-e77c-c48f-02ea-1f6a8144354c@kernel.crashing.org>
In-Reply-To: <ddd3f85f-e77c-c48f-02ea-1f6a8144354c@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Apr 2023 20:04:54 -0700
Message-ID: <CAMKF1sp_1D6GzcGQV0m_rFoY4Lnnr-GZ7-FcAYmoOMe4o6c-Qw@mail.gmail.com>
Subject: Re: [OE-core] mesa-native fails on master
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Chen Qi <Qi.Chen@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 03:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179671

On Mon, Apr 3, 2023 at 7:57=E2=80=AFPM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> I'm fine with saying either Ubuntu 18.04 is no longer 'supported', or run=
ning
> some kind of check that says gcc 7.5.0 is too old..  But I'm not sure wha=
t
> minimum (host) compiler version would be needed to avoid this error.
>
> I'm happy to work up a patch to adjust the minimum gcc version, if someon=
e can
> give me a bit of a clue what the appropriate minimum should be.
>
> The current check (in sanity.bbclass) looks for 7.5 or newer.

https://docs.mesa3d.org/install.html

says it should 8.0.0 or newer. So perhaps that check should be bumped
to check for 8.0 in master.

>
> --Mark
>
> On 4/3/23 9:48 PM, Khem Raj wrote:
> > On Mon, Apr 3, 2023 at 7:39=E2=80=AFPM Chen Qi <Qi.Chen@windriver.com> =
wrote:
> >>
> >> I just met the same issue. My host is ubuntu18, gcc version is 7.5.0.
> >>
> >> Regards,
> >> Qi
> >>
> >> -----Original Message-----
> >> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Mark Hatle
> >> Sent: Tuesday, April 4, 2023 10:25 AM
> >> To: Patches and discussions about the oe-core layer <openembedded-core=
@lists.openembedded.org>
> >> Subject: [OE-core] mesa-native fails on master
> >>
> >> It's been a few weeks since I last built master, but starting with tod=
ay's pull I'm getting errors building mesa-native -- which pretty much kill=
s the whole build.
> >>
> >> I'm on an Ubuntu 18.04 host, and have the 'buildtools-tarball' from th=
e last
> >> 4.1.3 loaded so I can get to the minimum version of python to run a bu=
ild.
> >>
> >> (I tried with buildtools-tarball-extended and that DOES appear to work=
.  If this is expected, you can ignore the rest of this.  But I expected th=
e system to complain before trying to build everything if the compiler wasn=
't new enough.)
> >>
> >>
> >> The error is:
> >>
> >> brw_simd_selection.cpp:205:7: sorry, unimplemented: non-trivial design=
ated initializers not supported
> >>
> >>
> >> The host gcc is 7.5.0
> >>
> >> What is strange is I had 2 successful builds, and then it started fail=
ing.  All
> >> fresh builds.  I've no idea why one was successful and the others fail=
ed.  I'm
> >> wondering if maybe there is some sort of race in mesa, but lowered my =
parallel
> >> build (-j) to 1 and I'm still getting it.
> >
> >
> > You need a newer gcc compiler > 7.x
> > I just abandoned using ubuntu 18.04
> > see - https://lists.openembedded.org/g/openembedded-core/message/178783=
?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cnon-trivial+designated+init=
ializers+not+supported%2C20%2C2%2C0%2C97647023
> >>
> >>
> >> Reproducer:
> >>
> >> git clone https://git.yoctoproject.org/poky
> >>
> >> cd poky
> >>
> >> wget
> >> http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/buildtool=
s/x86_64-buildtools-nativesdk-standalone-4.1.3.sh
> >>
> >> bash x86_64-buildtools-nativesdk-standalone-4.1.3.sh -d buildtools -y
> >>
> >> . ./buildtools/environment-...
> >>
> >> . ./oe-init-build-env
> >>
> >> bitbake mesa-native
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#179669): https://lists.openembedded.org/g/openembe=
dded-core/message/179669
> >> Mute This Topic: https://lists.openembedded.org/mt/98052337/3616948
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[mark.hatle@kernel.crashing.org]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

