Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.5487.1592914340204000658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 05:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WrwCA4Ou;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3455; q=dns/txt; s=axis-central1;
  t=1592914340; x=1624450340;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y6B8oAGjthfPaKBGvgM6QpqR7hm3WkCCOhXihnVYcrg=;
  b=WrwCA4OuD72uuEZaodPbki7WxAvNicluAtDhaF+d3IVZwO8qejbbz+bv
   fGjlqyWo3Xul9p3hnHLjTcUYl1rawFpFeihyMh+89bZ/Ik9YVFLdmlKcf
   OQoLzTHKfw3RPNLC60pEmNobu7R+mt7n9YCQcNfZujHWpqbE99tk1rUQP
   pOpsFkuPVtIPpZFR21+QmwfQx81ggXEZIksCR7tW1h4LL4SbA8zFxLiqf
   0jGjWiOM42MlTjO02DtObDZGC9zoSP7EVVUuX6eOgYHwd9VNE58usWuI/
   Wp92lC3pfC3igJO/Ko+QaFbeXyNvqTa7ACLikolAG3MntKznFfnJMTSVA
   A==;
IronPort-SDR: VSRVqpS+9JuBzdTduXYEkByr5O4IAhwiNV95RDL0QBfNUbh8ojtEC6tg/zzozc4bEws6KXQr6h
 8zCAPBTYIRFVHadMHr8nZ42P4OCfn0J6CS6XqO7fsJHbPwmD3pHKigK+xkl3m+3US3VkOco4f1
 vlITdat7vb0ucMZOb8yoldnzgHYjx4T4/y06wK3NzyijAp18A5/oeQs5NfoCaJfaIPbBpep22y
 wi12NAVQJ/WBNiFRn0o74T5T2uXRuKTzTbEb1Zv6PLqcV6UKvX+9r8eJzk5bRb5pDy0X8DEsVS
 4No=
X-IronPort-AV: E=Sophos;i="5.75,271,1589234400"; 
   d="scan'208";a="9818165"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, Hugo Cedervall
	<Hugo.Cedervall@axis.com>
Subject: Re: [OE-core] [PATCH 2/2] lib/oe: Split package manager code to multiple files
Thread-Topic: [OE-core] [PATCH 2/2] lib/oe: Split package manager code to
 multiple files
Thread-Index: AQHWSU9UqGdP3n60jEGj+cFSBAvIhajl+EEAgAAjcR8=
Date: Tue, 23 Jun 2020 12:12:17 +0000
Message-ID: <1592914337760.75731@axis.com>
References: <20200623111328.5838-1-fredrigu@axis.com>
	 <20200623111328.5838-3-fredrigu@axis.com>,<b42a94227a052cb6344788925c7e26566e2a191c.camel@linuxfoundation.org>
In-Reply-To: <b42a94227a052cb6344788925c7e26566e2a191c.camel@linuxfoundation.org>
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
From: Richard Purdie <richard.purdie@linuxfoundation.org>=0A=
Sent: Tuesday, June 23, 2020 2:02 PM=0A=
To: Fredrik Gustafsson; openembedded-core@lists.openembedded.org=0A=
Cc: tools-cfpbuild-internal; Hugo Cedervall; Fredrik Gustafsson=0A=
Subject: Re: [OE-core] [PATCH 2/2] lib/oe: Split package manager code to mu=
ltiple files=0A=
=0A=
On Tue, 2020-06-23 at 13:13 +0200, Fredrik Gustafsson wrote:=0A=
> Today OE-Core has support for three package managers, even if there=0A=
> are many more package managers that could be interesting to use.=0A=
> Adding a new package manager to OE-Core would increase the test matrix=0A=
> significantly. In order to let users use their favorite package manager=
=0A=
> without need for it to have support from upstream, this patch refactors=
=0A=
> the package manager code so that it's easy to add a new package=0A=
> manager in another layer.=0A=
>=0A=
> This patch is mostly moving code and duplicating some code (because of=0A=
> the hard coupling between deb and ipk).=0A=
>=0A=
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>=0A=
> ---=0A=
>  meta/classes/populate_sdk_base.bbclass        |   11 +-=0A=
>  meta/lib/oe/manifest.py                       |  149 +-=0A=
>  meta/lib/oe/package_manager.py                | 1402 +----------------=
=0A=
>  meta/lib/oe/package_managers/deb/manifest.py  |   31 +=0A=
>  .../package_managers/deb/package_manager.py   |  719 +++++++++=0A=
>  meta/lib/oe/package_managers/deb/rootfs.py    |  213 +++=0A=
>  meta/lib/oe/package_managers/deb/sdk.py       |   97 ++=0A=
>  .../ipk/.package_manager.py.swo               |  Bin 0 -> 45056 bytes=0A=
>  meta/lib/oe/package_managers/ipk/manifest.py  |   79 +=0A=
>  .../package_managers/ipk/package_manager.py   |  588 +++++++=0A=
>  meta/lib/oe/package_managers/ipk/rootfs.py    |  395 +++++=0A=
>  meta/lib/oe/package_managers/ipk/sdk.py       |  104 ++=0A=
>  meta/lib/oe/package_managers/rpm/manifest.py  |   62 +=0A=
>  .../package_managers/rpm/package_manager.py   |  423 +++++=0A=
>  meta/lib/oe/package_managers/rpm/rootfs.py    |  154 ++=0A=
>  meta/lib/oe/package_managers/rpm/sdk.py       |  104 ++=0A=
>  meta/lib/oe/rootfs.py                         |  631 +-------=0A=
>  meta/lib/oe/sdk.py                            |  311 +---=0A=
>  meta/lib/oeqa/utils/package_manager.py        |   29 +-=0A=
>  meta/recipes-core/meta/package-index.bb       |    2 +-=0A=
>  20 files changed, 3014 insertions(+), 2490 deletions(-)=0A=
=0A=
I'm afraid this patch is basically impossible to review. There are=0A=
warning signs like the inclusion of the binary swo file. The hint that=0A=
code gets duplicated also worries me, even if you abstract this, there=0A=
shouldn't be reason to do that.=0A=
=0A=
If we do this its going to have to be a more granular series where the=0A=
patches *just* move code to new locations so we can see/understand what=0A=
other changes are being made as I simply don't trust this patch, sorry=0A=
:(.=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=
=0A=
Hi,=0A=
sorry about the swo file that's a mistake on my side. The duplicated code i=
s simply so that deb and ipk shares a class. So my choice was to either dup=
licate that class (and let them diverge which is fine) or in the core packa=
ge_manager.py file have a class that is not used by all package managers (r=
pm doesn't use it).=0A=
=0A=
This patch is only code moves and class renames. I know it's very hard to r=
eview, that's a real problem. Let me see if I can split it up some more.=0A=
=0A=
BR=0A=
Fredrik=
