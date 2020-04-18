Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.3940.1587235518926162919
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 11:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Ieqft+D8;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2172; q=dns/txt; s=axis-central1;
  t=1587235519; x=1618771519;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KdAaFsSHbjirRTH7diZ8S5V8rEuByRO5ulNIgGMzV08=;
  b=Ieqft+D8cygTlJTsVJtjBDgy5MMO7mGFu1ypkON7LQm7Tih8n6WaXRYd
   /R9YqT78BgfXA9VL1IxrphFn+0CdGWktoTUmxwYalG0ORved+lAXYHBZP
   Z04bST6YmgK36kj3aBs5tHRky623NarV7yZCVKZ8infpCkuQModrOARv0
   Gg4it7mwx/RqHD+LBROd0jbbadwbOPJe1kb9W3PO7br3z920AogMw2415
   1WfJkrMUUp9RTDv8HaYdbdaXOknRofVLQFUlMfcSn26ekKGXfcgQ5ekQv
   v/9hzLUQfzMJZNMibN2AmMDAfC8Gz92GOVPHjEGousQkXhy7bv4ADfyTY
   A==;
IronPort-SDR: vJaThq3X2rhuuNB1gcGjPSII2Ro4+E0bZQhz7qreAFQz4lHkr640hRGrKZGQfsvrs6hrBasLkU
 yaIprIyeZ9ScHg09NhewvcA2/PMw9KoJ01auXXnTr3MMOK+4nK8iLNrn+rFOznqv9vsTsZ/w8Z
 WMt3nvyGYuIzydj5f9S5nLkPqWnxYCjmkKP2+JMBGtNXgUrKIBas8onb+i6X4USlvO4DWJLpFf
 12AvlBzQNaL9NXy6JYuglQptEoGD/npOxqbDafOrJJh6zfhtmIdgB3b5VlGDNeUz9xzY6L5Bch
 iS0=
X-IronPort-AV: E=Sophos;i="5.72,400,1580770800"; 
   d="scan'208";a="7559204"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "chris.laplante@agilent.com"
	<chris.laplante@agilent.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
Thread-Topic: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
Thread-Index: AQHWFZsbjcS3LlIvO061mGrRBLmq8Kh+8L0AgAADb4CAAAb1gIAABFUAgAA3AXA=
Date: Sat, 18 Apr 2020 18:45:14 +0000
Message-ID: <fc3149fc55b34156baee2c375002a2a6@XBOX03.axis.com>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>
 <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>
 <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain>
 <DM5PR12MB24711A9EF9D90BB86E95EDAA8BD60@DM5PR12MB2471.namprd12.prod.outlook.com>
 <alpine.LFD.2.21.2004181320230.1304434@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2004181320230.1304434@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert P. J. Day
> Sent: den 18 april 2020 19:24
> To: chris.laplante@agilent.com
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; OE Core mailing
> list <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] why does oe-buildenv-internal check for -z
> "$BDIR"?
>=20
> On Sat, 18 Apr 2020, chris.laplante@agilent.com wrote:
>=20
> > >   i know that -- in fact, it's the only way i use it -- the question
> > > is the purpose for checking if $BDIR is zero length first. that is,
> > > under what circumstances could it *not* be? even invoking the way you
> > > demonstrate, that variable is empty when tested, and i see nothing
> > > that could cause it to have a value before that test.
> >
> > FWIW I was curious/bored and looked to see if 'BDIR' was ever used
> > in poky (outside of the script of course), and I found no results.
> >
> > git rev-list --all | xargs git grep -w BDIR -- './*' ':!scripts/oe-
> buildenv-internal'
>=20
>   that's kind of the point i was making ... that variable appeared out
> of nowhere, clearly seemed like a local variable, and is even "unset"
> after it's used in that script. i poked around, trying to figure if
> there was some other flow of control that got you into that script
> from another direction, but i didn't find one.
>=20
>   and, yes, it seems trivial to obsess over it, but it's just those
> sorts of things that make me wonder, "hmmmmm ... maybe i *don't*
> really understand how this script can be used."
>=20
>   anyway, moving on ...
>=20
> rday

When it comes to understanding why the code looks like it does in a case=20
like this, it is often better to look at the history than the current state=
.

If you go back to when the test was introduced (commit=20
5d5fab77cf9616bf62023c202b38f309f8bbf189 in Poky), you will see that=20
BDIR could be set in a script called poky-autobuild at that time. The=20
poky-autobuild script was removed 12 years ago, but the test in=20
oe-buildenv-internal remained.

//Peter

