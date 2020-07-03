Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.8557.1593776715054361688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=BgSnJkYh;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1982; q=dns/txt; s=axis-central1;
  t=1593776715; x=1625312715;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gBCmyGuvItvI84QpGRjhANv7JkInmcQF7GAgB+NRUHA=;
  b=BgSnJkYhxH2gqzGsJvBPdXZkJ/Fqi+gkvUJSLUSyfjdg3LszV1SP2vjM
   YU4kAHwmc9NA5krg/w7ZZBQs4VaRZVTKuFzhdg5RyWq+HiyMeRgauiuq2
   zEnWAQts/WH2ip5rCqMet62q/WElYKuoXbdtlJRf2AzlDgoCu+WO6oz1j
   8oBNBP5k1oFoGc4EX54zPIG1I7U62pdo/JSilRA1xbL2AXpBjEWTvsbQ4
   4iCYbFMB4v3sbQuaN+6izmKXzGc4ig4/UKTzL7x3+i1YAb6tlkvfGmI55
   46jgczvNhKen2xi03CfaDjdPG+vKHJ5Dfk0rgO/DoYCs3KHkdYZwsm7cX
   Q==;
IronPort-SDR: ORjrZumZzOizkL05SLRoYza53LdQbq73XnK+oxaHDKCSXbKyP1ISx8ub0JBpPiN48AKtBxqgD3
 Zj8dMEpbn2Wnb2zxrABzgmIJgYndIp25XZcFnjCCpUogKCHfQhAl256jwG18xmV6z1voBN4/5K
 G9heWbzzy/eKPCIBsDz7o05MUbfNvo+imL+SVnTx/eQzjmfhd/H225Ssa2HbAv3kvJExkvtiml
 k2UyUmmNYPRZChw6RRV2nvegTD/xkVL6lbKnF7o6y4tMGe6vBWiXo+ijE9I5JO2ElkSjpoWxW8
 nEI=
X-IronPort-AV: E=Sophos;i="5.75,308,1589234400"; 
   d="scan'208";a="10463206"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] Add package managers as a plugin
Thread-Topic: [OE-core] Add package managers as a plugin
Thread-Index: AQHWUKcOqzGy9MdUcUaPmbF7vBgXvqj0m/iAgAEhY28=
Date: Fri, 3 Jul 2020 11:45:13 +0000
Message-ID: <1593776713224.44705@axis.com>
References: <20200702192906.6301-1-fredrigu@axis.com>,<CAM9ZRVtfoy12++04DPYrOk_89n8FsmwRuGWkWFa2O6q4a9Zjnw@mail.gmail.com>
In-Reply-To: <CAM9ZRVtfoy12++04DPYrOk_89n8FsmwRuGWkWFa2O6q4a9Zjnw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
________________________________________=0A=
From: Paul Barker <pbarker@konsulko.com>=0A=
Sent: Thursday, July 2, 2020 10:28 PM=0A=
To: Fredrik Gustafsson=0A=
Cc: openembedded-core; tools-cfpbuild-internal=0A=
Subject: Re: [OE-core] Add package managers as a plugin=0A=
=0A=
On Thu, 2 Jul 2020 at 20:29, Fredrik Gustafsson=0A=
<fredrik.gustafsson@axis.com> wrote:=0A=
>=0A=
> OE-core today has three different package managers, the well-known format=
s deb=0A=
> and rpm is supported as well as ipkg that is good for embedded devices.=
=0A=
>=0A=
> When building and having a good cache hit, a significant amount of time i=
s=0A=
> spent in the phase of generating a rootfs, which is really about the=0A=
> performance of the package manager. To save build time and also get a=0A=
> package manager that is suitanle for use on targets where flash memory is=
 a=0A=
> concern, support for apk is suggested.=0A=
>=0A=
> However, it might or might not be what's wanted for OE-core since it incr=
eases=0A=
> the test matrix. Therefore I will refactor the package management code to=
=0A=
> allow a layer to add a new package manager without editing the meta layer=
.=0A=
>=0A=
> This refactor will be divided into multiple patch series to be easier to =
review,=0A=
> this is the second patch series.=0A=
=0A=
Sorry to be a pain but I think this series suffers from the opposite=0A=
problem to the previous version - it's only a partial move of some of=0A=
the code. I'd much rather review a series which does the complete=0A=
refactor of the existing code into separate modules without making any=0A=
functional changes. I'll let others give their opinions as well, I'm=0A=
happy to review this one if we do want to look at this piecemeal.=0A=
=0A=
--=0A=
Paul Barker=0A=
Konsulko Group=0A=
=0A=
No problems, as said before I will do my best to make this easier to review=
.=0A=
I've sent a new patch series.=0A=
=0A=
/Fredrik=
