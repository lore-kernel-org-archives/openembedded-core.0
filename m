Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AA0E69E93
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 20:30:38 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.3127.1733171427650518738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 12:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=RluP7fBz;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=oHIZPjzyR1F6RGVNYj/1pIihlHdG47fC0dPvPAY5bEg=; b=RluP7fBz4+OhVAviRej7UaRnCD
	EW0RnexBtSM7+bVYnLKlSQfc1Q4HUif6DgTB0wqxiXirmMMVQEjm4/WGHWwMhbST6p8Hx1xsRkDxk
	3LkhrybrAP4RV5tQ9kfl+ksHdUptlBCdfxvpJmNjGtEdLUQLB+XwOjPNqtdReo4Jzxz+J9THu0IAS
	g22+RzHjujH4YHaY72LyPVQKIvugy+LidLr/g8p5Pv2IHZVwfnon+p5JeRMEt3fIMZXfhu6JNA6+3
	OrDicQKhqIomNa9Hn1hUm8wGyI/woCj+RxZBSoB04xa+qNIR420CVzyH27+YDezA7DZpuadaQSyFN
	AO97BW/A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1tID3o-000KwO-VU; Mon, 02 Dec 2024 21:30:24 +0100
Received: from [93.165.249.40] (helo=[192.168.8.223])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1tID3o-000HSz-1F;
	Mon, 02 Dec 2024 21:30:24 +0100
Message-ID: <9efd769f6494bb0dd6cb72f3d2f09797fd08ede8.camel@geanix.com>
Subject: Re: [OE-core] [PATCH v2 3/5] ninja: build modified version with GNU
 Make jobserver support -> (jobserver, loadfactor, pressure and all that!)
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Randy MacLeod <randy.macleod@windriver.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin	
 <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>, Andreas Helbech
 Kleist	 <andreaskleist@gmail.com>, Ferry Toth <fntoth@gmail.com>
Date: Mon, 02 Dec 2024 21:30:23 +0100
In-Reply-To: <9844556f-5016-47fa-a3ac-ceaaca1e7d57@windriver.com>
References: <20240404111613.2574424-1-martin@geanix.com>
	 <20240404111613.2574424-4-martin@geanix.com>
	 <202404251130553913ebd5@mail.local>
	 <f47e5c53e97b190852dc5578e0c3f0fe140803da.camel@geanix.com>
	 <2024080210413291c61aec@mail.local>
	 <8074f29e-89ee-4806-8011-21fe53f66e3f@windriver.com>
	 <532902e09fce0abc0800ae193b56adc4339e2d21.camel@geanix.com>
	 <9844556f-5016-47fa-a3ac-ceaaca1e7d57@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27475/Mon Dec  2 10:41:11 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 20:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208159

On Mon, 2024-12-02 at 15:25 -0500, Randy MacLeod wrote:
> On 2024-12-02 3:07 p.m., Martin Hundeb=C3=B8ll wrote:=C2=A0
> > Hi Randy,
> > On Sun, 2024-11-17 at 21:29 -0500, Randy MacLeod wrote:=C2=A0
> > > On 2024-08-02 6:41 a.m., Alexandre Belloni wrote:
> > > > On 02/08/2024 12:24:06+0200, Martin Hundeb?ll wrote:
> > > > > Hi Alexandre,
> > > > >=20
> > > > > I see you keep carrying these patches. I'm still working with
> > > > > ninja
> > > > > upstream to add jobserver support there[1]. I was planning to
> > > > > redo
> > > > > these patches once ninja merges that. But I can do a respin
> > > > > with
> > > > > my
> > > > > patches added to ninja if you like?
> > > > >=20
> > > > > [1] https://github.com/ninja-build/ninja/pull/2450
> > > > > =C2=A0
> > > > I carry them so they get some testing, I can drop until you
> > > > submit
> > > > the new version.
> > > > =C2=A0=C2=A0
> > > Hi Martin, et. al.
> > > =C2=A0
> > > I'm going to do some experimenting with the job server patches
> > > for a=20
> > > =C2=A0talk that somehow got approved for the 2024.12 YP summit!=C2=A0
> > > =C2=A0=C2=A0 https://pretalx.com/yocto-project-summit-2024-12/talk/WG=
PUTX/
> > > =C2=A0
> > Thanks for picking this up. I got assigned to other projects, so
> > this was put on hold for now.
> > =C2=A0
> Hi Martin et. al.,=20
>=20
> Errr, some things came up and I didn't feel that I had enough new to
> say so=C2=A0I'm not presenting this week.=C2=A0
>=20
> Hopefully as you say, the ninja patch merges and I can get time to do
> more evaluation =C2=A0and comparison and one of us can get a patch merged
> to master.
>=20
> If all goes well, there will be a presentation at the next YP Summit!

Hi Randy,

No problem. We'll see if/when one of us get the time to look into this
again.

// Martin
>=20
> > > =C2=A0
> > > As expected, the patch doesn't apply with all that has changed
> > > since
> > > April.
> > >=20
> > > Do you have a a branch that you are keeping updated.
> > > If so can you same me some time otherwise, I can rebase and fix
> > > things up.
> > > =C2=A0
> > =C2=A0
> > I have no branch, no. But I did try to get jobserver client support
> > into ninja. My PR got replaced by two other PRs, and I assume you
> > are
> > following the progress on the latest one:
> > https://github.com/ninja-build/ninja/pull/2506
> >=20
> > It looks like that PR will go into ninja eventually.
> >=20
> > The qemu patches are no longer needed, so just the ninja patches,
> > the
> > jobserver bbclass, and the python server script that are needed.
> >=20
> > =C2=A0
> > > =C2=A0
> > > I'll of course give you all the credit for the real work.
> > > I plan to mention the performance/behaviour improvements that you
> > > mentioned in your cover letter:
> > > =C2=A0
> > > --- =C2=A0=20
> > > On build machines shared by multiple users, a single jobserver
> > > can be
> > > shared between multiple builds (using the JOBSERVER_FIFO
> > > variable).
> > > Running the above build in two different build directories at the
> > > same time gives a ~12% improvement (43:17 -> 37:55).
> > >=20
> > > Finally, the memory pressure from e.g. compiling multiple c++
> > > based
> > > projects is also reduced. In our case, a cloud based build
> > > machine
> > > (with 32 cores and 32GB RAM) fails to compile llvm-rust-native
> > > (in
> > > parallel to nodejs) without the jobserver due to a lack of
> > > memory.
> > > ---
> > > =C2=A0
> > > Is there anything else you'd like people to know about?
> > > =C2=A0
> > =C2=A0
> > Feel free to include my comment wherever you see fit. The credit is
> > fine, but not important to me. Again, do what you think is
> > appropriate.
> >=20
> > =C2=A0
> > > =C2=A0
> > > Does anyone else have jobserver, BB_PRESSURE_*, BB_LOADFACTOR_MAX
> > > use
> > > cases or benchmarks that they'd like to share with the YP
> > > communtiy?
> > > All input is welcome and appreciated.
> > > =C2=A0
> > =C2=A0
> > There is a comment on the github PR that mentions yocto / bitbake:
> > https://github.com/ninja-build/ninja/pull/2506#issuecomment-2437267474
> >=20
> > Good luck :)
> >=20
> > // Martin
> > =C2=A0
> =C2=A0
>=20
> =C2=A0
> =C2=A0


