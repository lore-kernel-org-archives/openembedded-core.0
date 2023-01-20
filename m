Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0BFC25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 12:53:28 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.73164.1674219206637369077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 04:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=HNOfGUJ5;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674219207;
  x=1705755207;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EIb5rDgqq9REcvTkmQGxXHe1nAXiB22H5o7SoDUBtlM=;
  b=HNOfGUJ5wJfgVmXH35h2V612FP/RVdF8gVTHglpuqYWN5zAjscjCDplt
   lk3XpzV+dE6mEoVzD4QB4WuHfC1q04o2rqwM5oWV7ZW5SdHKTyXoKKNzp
   LkzIF0YYbT/wo/Iq1rXVBixbRG1veMFJhdm1sPX4b7La2GG0ICo+C3Ne1
   yNAFR47omPq2tp221C2n7g/ylH1MHc6vtRFewSwIfwQ3xFUwy7W1prSca
   8SKy+/6iodWMlzbrBqvhXPc6GTkl73X6eB9pjLd3oT9PAaptwgkODlOlU
   N0OiHlN840rsgLznmfmtGVY0oVJ+H8k+eTLDNxnpnmnUZaq98TTtVNcu+
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, "Luca Ceresoli via
 lists.openembedded.org" <luca.ceresoli=bootlin.com@lists.openembedded.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
Thread-Topic: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
Thread-Index: AQHZK1kNyi5+VDsjPU235XwjSSfBWK6kvxEwgAGgWcCAAOVboA==
Date: Fri, 20 Jan 2023 12:53:24 +0000
Message-ID: <f639c09d5171480aac693fbbdacaceee@axis.com>
References: <20230118112759.3909741-1-pkj@axis.com>
	<20230118172227.28bdb930@booty>	<2c4678f5a769445f90b4759a6d6dd259@axis.com>
	<173BABCA291B8E2A.14781@lists.openembedded.org>
 <20230120000913.3cec96a7@booty>
In-Reply-To: <20230120000913.3cec96a7@booty>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 12:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176187

> -----Original Message-----
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Sent: den 20 januari 2023 00:09
> To: Luca Ceresoli via lists.openembedded.org
> <luca.ceresoli=3Dbootlin.com@lists.openembedded.org>
> Cc: luca.ceresoli@bootlin.com; Peter Kjellerstedt
> <peter.kjellerstedt@axis.com>; openembedded-core@lists.openembedded.org;
> Richard Purdie <richard.purdie@linuxfoundation.org>
> Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
> GObject Introspection is enabled
>=20
> Hi Peter,
>=20
> On Thu, 19 Jan 2023 10:29:26 +0100
> "Luca Ceresoli via lists.openembedded.org"
> <luca.ceresoli=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> > Hello Peter,
> >
> > On Wed, 18 Jan 2023 22:22:22 +0000
> > "Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:
> >
> > > > -----Original Message-----
> > > > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > > Sent: den 18 januari 2023 17:22
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > Cc: openembedded-core@lists.openembedded.org; Richard Purdie
> > > > <richard.purdie@linuxfoundation.org>
> > > > Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala
> bindings if
> > > > GObject Introspection is enabled
> > > >
> > > > Hello Peter,
> > > >
> > > > On Wed, 18 Jan 2023 12:27:59 +0100
> > > > "Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:
> > > >
> > > > > This avoids the following error:
> > > > >
> > > > >   configure: error: Vala bindings require GObject Introspection
> > > > >
> > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > >
> > > > A different patch [0] to address the same bug is already in my test=
ing
> > > > branch and is possibly being merged soon on master by Richard. Can =
you
> > > > please check whether your think your patch is better and let us kno=
w?
> > >
> > > I had not seen that patch when I sent mine. I think mine is a little =
better
> > > since it defines and uses a PACKAGECONFIG for the vala support, which=
 should
> > > make it easier for anyone wanting to, e.g., disable the vala support =
even if
> > > it is enabled by default.
> >
> > Indeed. I'm replacing Alex's patch with yours in my testing branch in
> > order to have both tested. None is on master at the moment.
>=20
> I'm afraid testing with this patch applied caused lots of autobuilder
> failures:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/6553/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/6551/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/6443/st=
eps/12/logs/stdio
> ...and more
>=20
> So I removed it from my testing branch and got the patch by Alex again.
> You'd be welcome to send a fixed version of your patch.

Meh. After having taken a closer look at gobject-introspection.bbclass,=20
it appears it only adds --enable-introspection for target, so my patch=20
needs to do the same. I'll send a v2.

>=20
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

//Peter


