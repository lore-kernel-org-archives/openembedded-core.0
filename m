Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7C3C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:50:25 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.13599.1707382222306375016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=fEj65wEF;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1707382222; x=1738918222;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=U7x5tcNjcUvI1Kw9yoDhDGtFV72F0HpBiJrQdhOOebc=;
  b=fEj65wEFAHm5/6/+U6S/LuVVfk6cnqXnBXPT1hjRpXWQChdgJ/vDe0UI
   8/td9aEBAY8u8g5ATwHvvTSI2vrN5LOV3QE/R0pVWZD+3yA9DV/YSZMJF
   VAUCF3azbdmIOKMS8mWhJ38hJHFeBduB//ZJ6MP2aGfxIKtzoWosXrgrr
   6qTRsNAvf22kbhBbqFH4qkqhTy2SexEue3m4gC3UUxmK4jAHIsrWVaI+Q
   fMsaM0bw9Hekai9U7vMYG+j6uLNmQZOz2dJmLhzKyC8hzGmGSsgr4gG1I
   rRuW+cMJSGEClQnsSHMxuXrV27zYJCwk4TKbVjKkQ5H7HYP4zBUwfcTFc
   Q==;
X-IronPort-AV: E=Sophos;i="6.05,253,1701126000"; 
   d="scan'208";a="35309328"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 08 Feb 2024 09:50:20 +0100
Received: from [192.168.153.128] (SCHIFFERM-M3.tq-net.de [10.121.49.135])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 086B1280075;
	Thu,  8 Feb 2024 09:50:20 +0100 (CET)
Message-ID: <4584b21bd67a1819159926b5331120a796f216a6.camel@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	"oss@ew.tq-group.com"
	 <oss@ew.tq-group.com>
Date: Thu, 08 Feb 2024 09:50:20 +0100
In-Reply-To: <4021EB06-42BE-45D5-9F7A-EE0F63F8EA30@arm.com>
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
	 <4021EB06-42BE-45D5-9F7A-EE0F63F8EA30@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195120

On Wed, 2024-02-07 at 15:58 +0000, Ross Burton wrote:
> ********************
> Achtung externe E-Mail: =C3=96ffnen Sie Anh=C3=A4nge und Links nur, wenn =
Sie wissen, dass diese aus einer sicheren Quelle stammen und sicher sind. L=
eiten Sie die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Helpdesk we=
iter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> On 7 Feb 2024, at 10:25, Matthias Schiffer via lists.openembedded.org <ma=
tthias.schiffer=3Dew.tq-group.com@lists.openembedded.org> wrote:
> >=20
> > Deploy the kernel configuration with the built images, so it is easy to
> > check its contents, or rebuild the same configuration outside of the
> > Yocto build system.
>=20
> For what it's worth, I added a task quite recently to tell you where the =
config file is (and generate it, if needed), so for =E2=80=9Cwhat did this =
kernel I just built have as the config=E2=80=9D that is potentially more us=
eful than deploying as it works even when the compile fails, or if it hasn=
=E2=80=99t finished yet:
>=20
> $ bitbake virtual/kernel -c showconfig
> =E2=80=A6
> Config file written to /yocto/ross/build/tmp/work/qemuarm64-poky-linux/li=
nux-yocto/6.6.12+git/linux-qemuarm64-standard-build/.config

Hmm, I *think* this will not help our particular usecase, as our CI jobs al=
ways run with `INHERIT +=3D
"rm_work"`, so I'd assume that the kernel build dir is deleted between bitb=
ake calls - but I might
be wrong about the exact point where "rm_work" runs.

>=20
>=20
> > This can be particularly convenient when running a Yocto build as a CI
> > job, and only the deploy dir is made available for download.
>=20
> I=E2=80=99m wondering if the kernel-dev package should split the config o=
ut into a subpackage, so it can be installed or examined separately.

In any case, we can update our CI to save the kernel-dev package or its con=
tents, so I'm fine with
this patch being dropped. Thanks!

Regards,
Matthias


--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

