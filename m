Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.8625.1593555179738042864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 15:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kajLdBU8;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3717; q=dns/txt; s=axis-central1;
  t=1593555180; x=1625091180;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rT2VmmT/fnDRGrTFOgtFtiOld2ZiU4TiwAa6fc9OO8Q=;
  b=kajLdBU8XCRIrXv0PmFaaMNuScHDK6+764wIOAkIH/Cty6es3Ho2+ROR
   mB2Ri7kTjcBElqWvZFad2HRrI7P91ZpYBB/cBOk3JoGuGaxdf7t4QvE+F
   SBRRzBT7V9TscPJt0ihLRbBiJBodgqoX56xaDlpnTLKnR36XjgKhYPMIR
   EH44/08VXgUvMEPgoSdfzaSjDQpADITUMaw3oX8aJjk1ZsfzZzCh+RhE/
   G6JnmJNt8EFICpLmbwWfO7bbYzKazisUfggtez9OOT4kK0bk/sfJVnMYG
   qrLihYZ+4S2Vkbe32UQzteWzT4f22OWVBxzhpXrQadeDmIr5SH/JzKpp1
   w==;
IronPort-SDR: JryG7ljVXSFz7mM/z0fEBmKptLKk2lnaLQ/UTWqdjY4UxXy+rNeL2PMnNRa+eD7DcmyEtcZzSn
 ELq44yVMjViTMMxQDmzBvIuI3Gx9dbuLG0kAT4hKbfL/gEhSMnNmaSBwt7ujBsqSESK/m3lcD+
 i60Ale2C7LaSst4N4yT52/77OtmduKIwSfDAEBaRa1YpgDvgwuYGgSLGyZL67ztG3qUfh/+6Hd
 y48bgjwG4uJMRB0kt601v2pvmbGfTdl7WGBpT/QsyJvcvCEkO9U8/0dZTbiSV2IqlBSiqFHA2N
 TgM=
X-IronPort-AV: E=Sophos;i="5.75,298,1589234400"; 
   d="scan'208";a="10364131"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: Ross Burton <ross@burtonini.com>, OE-core
	<openembedded-core@lists.openembedded.org>, tools-cfpbuild-internal
	<tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] Add package managers as a plugin
Thread-Topic: [OE-core] Add package managers as a plugin
Thread-Index: AQHWStlhmROMe50x8EKtBnMpvXTtHajqmKGAgAbxVuyAABDXAIAAI3Df
Date: Tue, 30 Jun 2020 22:12:54 +0000
Message-ID: <1593555173884.3272@axis.com>
References: <20200625101413.2783-1-fredrigu@axis.com>
 <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
 <1593543683295.70380@axis.com>,<20200630215424.u77jq5frrnpwztfc@jama>
In-Reply-To: <20200630215424.u77jq5frrnpwztfc@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Martin,=0A=
apk is quite different compared to other package managers. A traditional pa=
ckage manager download a package, saves it to a local cache, verifies it an=
d then extract it. That's at least 3 reads and 2 writes of the data. Apk do=
es this on the fly, so 1 read and 1 write of the data. I believe that it's =
a so fundamental design choice that opkg would have it very hard to compete=
 for speed. The speed advantage is even bigger when installing over network=
 since the extraction and verification is done wile the network is waiting =
for data. That means that apk has usually installed the package when an ord=
inary package manager just has downloaded it and should start to verify and=
 install it.=0A=
=0A=
So there's no secret sauce or awesome optimizations, it's "just" an other a=
rchitectural design.=0A=
=0A=
With that said, there's still some low hanging fruit for apk, for example p=
ackage generation (my patch is doing 2 reads and 2 writes of all data) and =
index generation (duplicate reads and one extraction too much) that could h=
ave significant speedup. But let's make it possible to use apk at all befor=
e starting to tune it.=0A=
=0A=
More information:=0A=
https://www.youtube.com/watch?v=3DsIG2P9k6EjA=0A=
=0A=
=0A=
BR=0A=
Fredrik=0A=
________________________________________=0A=
From: Martin Jansa <martin.jansa@gmail.com>=0A=
Sent: Tuesday, June 30, 2020 11:54 PM=0A=
To: Fredrik Gustafsson=0A=
Cc: Ross Burton; OE-core; tools-cfpbuild-internal=0A=
Subject: Re: [OE-core] Add package managers as a plugin=0A=
=0A=
On Tue, Jun 30, 2020 at 07:01:23PM +0000, Fredrik Gustafsson wrote:=0A=
> Hi Ross,=0A=
> those 5 seconds will increase to minutes for my use case and we build a l=
ot=0A=
> hence I hope this will save us a lot of computer power and engineering ti=
me.=0A=
> For example I've sent numbers on building a bigger image (core-image-sato=
-sdk-ptest)=0A=
> to Alex and Alex:=0A=
> out.apk.1: 1:13.35=0A=
> out.apk.2: 1:13.51=0A=
> out.apk.3: 1:13.23=0A=
> out.apk.4: 1:14.07=0A=
> out.apk.5: 1:13.00=0A=
> out.deb.1: 3:49.37=0A=
> out.deb.2: 3:50.77=0A=
> out.deb.3: 3:51.39=0A=
> out.deb.4: 3:53.40=0A=
> out.deb.5: 3:53.99=0A=
> out.ipk.1: 2:38.99=0A=
> out.ipk.2: 2:39.07=0A=
> out.ipk.3: 2:35.34=0A=
> out.ipk.4: 2:36.15=0A=
> out.ipk.5: 2:34.55=0A=
> out.rpm.1: 1:58.61=0A=
> out.rpm.2: 1:59.42=0A=
> out.rpm.3: 1:59.70=0A=
> out.rpm.4: 1:58.96=0A=
> out.rpm.5: 1:58.11=0A=
>=0A=
> Also consider that if we've a target without python with limited space, r=
pm is out=0A=
> of the question. So the real comparison would be between ipk and apk. Let=
's=0A=
> say we can save 80 seconds in each build. Now multiply that with the numb=
er of=0A=
> builds, and we do a lot (I guess we might approach 100 000 builds/week in=
 the=0A=
> next year). Then this will save 92.5 days build time each week.=0A=
=0A=
This is impressive.=0A=
=0A=
Have you tried to profile where opkg spends most of the time compared to=0A=
apk? It would be nice to know if there is something fundamentally=0A=
different in how they handle packages or if apk is just better=0A=
optimized.=0A=
=0A=
Now with opkg better maintained (thanks Alejandro!) there might be some=0A=
relatively low hanging optimalizations which could be implemented there=0A=
as well (for people who didn't implement the rest to switch to apk yet=0A=
:)).=0A=
=0A=
I know at LGE we have some patches (some related to performance as well) wh=
ich=0A=
unfortunately weren't ever upstreamed :/, some are at:=0A=
https://github.com/webosose/meta-webosose/tree/master/meta-webos/recipes-de=
vtools/opkg/opkg=0A=
=0A=
Cheers,=0A=
