Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EA0CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 14:29:31 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30363.1780324166362114279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 07:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 651ETMbL1767734;
	Mon, 1 Jun 2026 09:29:23 -0500
Received: from [192.168.2.62] ([192.168.2.62])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 651ETLAU027152;
	Mon, 1 Jun 2026 09:29:21 -0500
Message-ID: <a883fdca-5c9f-4dcb-bd08-8944d653c197@kernel.crashing.org>
Date: Mon, 1 Jun 2026 09:29:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemuboot.bbclass: regenerate .qemuboot.conf
 after do_image
Content-Language: en-US
To: sivakumar.bs@gmail.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20260601112329.142238-1-sivakumar.bs@gmail.com>
 <d8fc1abd30e80b4d689270bbb21538f6c299e4f7.camel@linuxfoundation.org>
 <CACFV95+ADrPV=0_YKXJYhKQ0AmSDbwVBfeLcZeVR-Gietx0bQA@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CACFV95+ADrPV=0_YKXJYhKQ0AmSDbwVBfeLcZeVR-Gietx0bQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 651ETMbL1767734
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 14:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237836



On 6/1/26 8:57 AM, Siva Balasubramanian via lists.openembedded.org wrote:
> Thank you for the review.
>=20
> You are right, the fix needs proper [depends] declarations rather than
> just reordering. I will look at what the conf file actually references
> and add the appropriate task dependencies so do_write_qemuboot_conf is
> correctly invalidated whenever those artifacts change.
>=20
> Will send a v2 shortly.

Just adding a dependency on virtual/kernel or linux-yocto or... it's righ=
t=20
either.  We have firmware and baremetal components that use QEMU that we =
depend=20
on as well.

So this dependency mechanism is needed, but it's not as simple as just ha=
rd=20
coding Linux.

--Mark

> On Mon, Jun 1, 2026 at 6:28=E2=80=AFPM Richard Purdie=20
> <richard.purdie@linuxfoundation.org <mailto:richard.purdie@linuxfoundat=
ion.org>>=20
> wrote:
>=20
>     On Mon, 2026-06-01 at 16:53 +0530, Siva Balasubramanian via
>     lists.openembedded.org <http://lists.openembedded.org> wrote:
>      > do_write_qemuboot_conf was chained after do_rootfs, so it only r=
an
>      > when the rootfs was rebuilt. If only the kernel was rebuilt (or =
any
>      > change that regenerates the image without invalidating the rootf=
s
>      > sstate), the .qemuboot.conf was left stale while new image artif=
acts
>      > were deployed with a new timestamp suffix. This caused runqemu t=
o
>      > reference mismatched or missing artifacts.
>      >
>      > Move the task to run after do_image instead, so the conf file is
>      > always consistent with whatever was last deployed.
>      >
>      > Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
>     <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520>
>      > Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com
>     <mailto:sivakumar.bs@gmail.com>>
>      > ---
>      > =C2=A0meta/classes-recipe/qemuboot.bbclass | 2 +-
>      > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      > diff --git a/meta/classes-recipe/qemuboot.bbclass
>     b/meta/classes-recipe/qemuboot.bbclass
>      > index 56106b1958..47ce16935f 100644
>      > --- a/meta/classes-recipe/qemuboot.bbclass
>      > +++ b/meta/classes-recipe/qemuboot.bbclass
>      > @@ -127,7 +127,7 @@ QB_DRIVE_TYPE ?=3D "/dev/sd"
>      > =C2=A0inherit image-artifact-names
>      >
>      > =C2=A0# Create qemuboot.conf
>      > -addtask do_write_qemuboot_conf after do_rootfs before do_image
>      > +addtask do_write_qemuboot_conf after do_image before do_build
>      >
>      > =C2=A0def qemuboot_vars(d):
>      > =C2=A0=C2=A0=C2=A0=C2=A0 build_vars =3D ['MACHINE', 'TUNE_ARCH',=
 'DEPLOY_DIR_IMAGE',
>=20
>     Shouldn't we be fixing the task's dependencies so that it runs at t=
he
>     right time anything it references changes?
>=20
>     I'm not really seeing how this will improve things if to use your
>     example, the kernel is rebuilt since you haven't added a dependency=
 on
>     that...
>=20
>     Cheers,
>=20
>     Richard
>=20
>=20
>=20
> --=20
>=20
> Sivakumar B
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237834): https://lists.openembedded.org/g/openembed=
ded-core/message/237834
> Mute This Topic: https://lists.openembedded.org/mt/119588648/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

