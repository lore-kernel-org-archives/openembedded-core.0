Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6137EC3600C
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 12:41:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10212.1743165678395859652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 05:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Da/mAMfO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 693F9443E5;
	Fri, 28 Mar 2025 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743165676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYpvZHhZpsRWzkTwbbzrX2lmCSnwbmPIdOcINlM777w=;
	b=Da/mAMfOCrvmThCHMK4hVP1rpbndFvHmz3i8NdtnZP1S7C/NwCDciILDhrkrnLWsQhE0v3
	2hh0HcSZlLB53gDI8k3B3gjsqU2mJuiXstdcZZNgemiH1nYKFBKNGlQF8rEpmoSVo0sg/s
	McuG57O+YFoSfrrfEKnWKFNrBQ+mn5Ex1M/vVxGNOo9fQSP55qgjp8pp8I6/5e/8mZad7i
	9yxd55Ssjr84zBKY5/3JzWe74HXFyfNGkaAmN+kJECbffPeESLJbvHXpITXsFQaQO46SGb
	XxccraJbfjy/K47HnvzI1gj0ZAQAk8tOReqMpoNKbbhzXODBEPgOl0Vemsp0tw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 13:41:15 +0100
Message-Id: <D8RWNSC4TKU7.3DARX9RP9QHG4@bootlin.com>
Subject: Re: [OE-core] [PATCH] binutils: Fix CVE-2025-1148
Cc: <Sundeep.Kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1800bd6b-be1d-43a0-80b0-076f4471e631@windriver.com>
 <Groupsio.1.1800bd6b-be1d-43a0-80b0-076f4471e631@windriver.com>
In-Reply-To: <Groupsio.1.1800bd6b-be1d-43a0-80b0-076f4471e631@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfhgedtudffieefieetudehveehhfejuddvfeffveevgefhkeeugedvudevueelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpshhouhhrtggvfigrrhgvrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjfgrrhhishhhrdfurgguihhnvghnihesf
 ihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopefuuhhnuggvvghprdfmohhkkhhonhgurgesfihinhgurhhivhgvrhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 12:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213835

On Fri Mar 28, 2025 at 6:50 AM CET, Harish via lists.openembedded.org Sadin=
eni wrote:
> [Edited Message Follows]
>
>
> On 3/25/2025 1:23 PM, Mathieu Dubois-Briand wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed Mar 19, 2025 at 10:35 AM CET, Harish via lists.openembedded.org =
Sadineni wrote:
> >> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >>
> >> A few place dealing with ld script handling made some attempt to free
> >> memory, but this was generally ignored and would be quite a lot of
> >> work to implement.  Instead, use the stat_obstack rather than
> >> mallocing in many more cases.
> >>
> >> Backport a patch from upstream to fix CVE-2025-1148
> >> Upstream-Status: Backport [https://sourceware.org/cgit/binutils-gdb/co=
mmit/?id=3Dd4115c2c8d447e297ae353892de89192c1996211]
> >>
> >> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> >> ---
> > Hi,
> >
> > Thanks for your patch.
> >
> > I've seen it is already discussed, but as an additional note, current
> > version seems to generate some build error on the autobuilder:
> >
> > ERROR: gdb-16.2-r0 do_package_qa: QA Issue: The /usr/share/info/dir fil=
e is not meant to be shipped in a particular package. [infodir]
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1170
> >
>  I tested "bitbake world" with the same configuration as in qemux86-world=
-alt with the current patch, and the issue did not occur.
> Typically, errors like "file is not meant to be shipped in a particular p=
ackage" arise when there is a change in the recipe
> related to installation or packaging.
>

I relaunched the build and it did fail again, twice:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1170
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1206

But on the other hand, I confirm I was not able to reproduce it locally
event using the exact same commit as on the AB.

It will try to apply it again on top of my master-next and see how it
goes

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


