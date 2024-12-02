Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61933E69E90
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 20:07:58 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.2570.1733170068164051432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 12:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=wTd1bwDV;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=aH02wtX7Hou+gjN13CW57nxZ20NjTM3+ibmaL4d4WW4=; b=wTd1bwDVhxT+RN0bl4faWZE9oU
	OewuxtY9S86+h9wJQbFnFUp4Z6kUlM81h64N8VPtbFeWzbXwNxi+PHkZ+nQ+6h0LnVkol52837Xlv
	WfI+5iw7MTR2PUfDM+iNB729WU9K/diPibrnOM1LDcrLbU/qXU3UiEmv6iStCEC9LBByZoUp4BMee
	2M3nLr1bQ3omPrhmFZZvuBL6PSyKE0Nw4hApr77NSLsSHpVMphfCZlQcKDE143TKySkMY5uZFD0if
	e7h7tkflZjXfx5iK2IRqNNZLLeLEk3vrYV+d5EVKuC4+EQdJnYE2ZrlhGzCvPlu2yN3XyRd8lWD1a
	OPVFwpyA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1tIChs-000Gyg-JB; Mon, 02 Dec 2024 21:07:44 +0100
Received: from [93.165.249.40] (helo=[192.168.8.223])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1tIChs-000PTZ-08;
	Mon, 02 Dec 2024 21:07:44 +0100
Message-ID: <532902e09fce0abc0800ae193b56adc4339e2d21.camel@geanix.com>
Subject: Re: [OE-core] [PATCH v2 3/5] ninja: build modified version with GNU
 Make jobserver support -> (jobserver, loadfactor, pressure and all that!)
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: randy.macleod@windriver.com, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin	
 <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>, Andreas Helbech
 Kleist	 <andreaskleist@gmail.com>
Date: Mon, 02 Dec 2024 21:07:44 +0100
In-Reply-To: <8074f29e-89ee-4806-8011-21fe53f66e3f@windriver.com>
References: <20240404111613.2574424-1-martin@geanix.com>
	 <20240404111613.2574424-4-martin@geanix.com>
	 <202404251130553913ebd5@mail.local>
	 <f47e5c53e97b190852dc5578e0c3f0fe140803da.camel@geanix.com>
	 <2024080210413291c61aec@mail.local>
	 <8074f29e-89ee-4806-8011-21fe53f66e3f@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27475/Mon Dec  2 10:41:11 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 20:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208157

Hi Randy,

On Sun, 2024-11-17 at 21:29 -0500, Randy MacLeod wrote:
> On 2024-08-02 6:41 a.m., Alexandre Belloni wrote:
> > On 02/08/2024 12:24:06+0200, Martin Hundeb?ll wrote:
> > > Hi Alexandre,
> > >=20
> > > I see you keep carrying these patches. I'm still working with
> > > ninja
> > > upstream to add jobserver support there[1]. I was planning to
> > > redo
> > > these patches once ninja merges that. But I can do a respin with
> > > my
> > > patches added to ninja if you like?
> > >=20
> > > [1] https://github.com/ninja-build/ninja/pull/2450
> >=20
> > I carry them so they get some testing, I can drop until you submit
> > the new version.
> > =C2=A0=C2=A0
> Hi Martin, et. al.
> =C2=A0
> I'm going to do some experimenting with the job server patches for a=20
> =C2=A0talk that somehow got approved for the 2024.12 YP summit!=C2=A0
> =C2=A0=C2=A0 https://pretalx.com/yocto-project-summit-2024-12/talk/WGPUTX=
/
>=20


Thanks for picking this up. I got assigned to other projects, so this
was put on hold for now.

> As expected, the patch doesn't apply with all that has changed since
> April.
>=20
> Do you have a a branch that you are keeping updated.
> If so can you same me some time otherwise, I can rebase and fix
> things up.

I have no branch, no. But I did try to get jobserver client support
into ninja. My PR got replaced by two other PRs, and I assume you are
following the progress on the latest one:
https://github.com/ninja-build/ninja/pull/2506

It looks like that PR will go into ninja eventually.

The qemu patches are no longer needed, so just the ninja patches, the
jobserver bbclass, and the python server script that are needed.

> I'll of course give you all the credit for the real work.
> I plan to mention the performance/behaviour improvements that you
> mentioned in your cover letter:
> =C2=A0
> --- =C2=A0=20
> On build machines shared by multiple users, a single jobserver can be
> shared between multiple builds (using the JOBSERVER_FIFO variable).
> Running the above build in two different build directories at the
> same time gives a ~12% improvement (43:17 -> 37:55).
>=20
> Finally, the memory pressure from e.g. compiling multiple c++ based
> projects is also reduced. In our case, a cloud based build machine
> (with 32 cores and 32GB RAM) fails to compile llvm-rust-native (in
> parallel to nodejs) without the jobserver due to a lack of memory.
> ---
> =C2=A0
> Is there anything else you'd like people to know about?

Feel free to include my comment wherever you see fit. The credit is
fine, but not important to me. Again, do what you think is appropriate.

> Does anyone else have jobserver, BB_PRESSURE_*, BB_LOADFACTOR_MAX use
> cases or benchmarks that they'd like to share with the YP communtiy?
> All input is welcome and appreciated.

There is a comment on the github PR that mentions yocto / bitbake:
https://github.com/ninja-build/ninja/pull/2506#issuecomment-2437267474

Good luck :)

// Martin

