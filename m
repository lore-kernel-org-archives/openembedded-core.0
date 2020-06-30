Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.17632.1593530145722057740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 08:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PzWYeYK+;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3453; q=dns/txt; s=axis-central1;
  t=1593530146; x=1625066146;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5/Zkf7DEEBuuvBDJHK72CxgQKozVkTSmXXkPZzBHvSw=;
  b=PzWYeYK+74DCVEJfY76jD3FOSeqaCYEogqVS/YGgcEy1ACOlfERuGnJo
   cZrP2wI6kJvs0ALWBFdOItYiGAv8WzXVu6Mdn/IE88pm6WzNqhpUA0o7P
   c4jAPrBUfWarFSb0iSGUlHjzL+Z2ILiU5qHBgLTdgTQumGIQKDz19aMba
   A2Ok2treJbcYHF8YrxXyDDilWfYILJ+lDMQZS1Kz/3KBQe7XfahSDh16z
   s1H9wwxW4ga4GuXn08LFY2iqH+tdkzSHc6uC4lzXCHjDpK0rg53kOULk2
   Dy0XFXslPdJYNwTEXmFTZVkeiqanEHQKHBguiF9q95WFPXjqdXpPafFH+
   w==;
IronPort-SDR: senc5PCVKjELXXdNfxghlwglg4EEMF4c/j2fNaok42JnLW2uQ1EEOj05FAxZ1e5cVhYfoC4Wey
 RbJ+stkL5KuPqeK26IjM54tnpJtN1ztExm40kvNtKK3tATZslBNHuq5VV8OcvUEIb12uyNGUyu
 SfzrfPyzmytwzK1dv/JWtk4rL3/CCruLWLpQhfq0tPyCsoZNQs08szUUKEgqvFpamARQl2mnJy
 YBp50dHtIE1HuJXvYxJdq4xmGkP9kF/Lt8ZBQWswFycjQgbNKd8MXkgU0GH8f0x37zSHhr6HES
 pKI=
X-IronPort-AV: E=Sophos;i="5.75,297,1589234400"; 
   d="scan'208";a="10350016"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, tools-cfpbuild-internal
	<tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] Add package managers as a plugin
Thread-Topic: [OE-core] Add package managers as a plugin
Thread-Index: AQHWSU9UjwcJMyAWUU60rRHKoFsdh6jmaiMAgArjiIU=
Date: Tue, 30 Jun 2020 15:15:43 +0000
Message-ID: <1593530143291.53812@axis.com>
References: <20200623111328.5838-1-fredrigu@axis.com>,<20200623185020.GL17660@denix.org>
In-Reply-To: <20200623185020.GL17660@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Denys,
you're right. I was confusing poky and OE-core. I'll change the cover lett=
er. Thanks!

I haven't tested it with other distros but I see no reason that it wouldn'=
t work.

BR
Fredrik
________________________________________
From: Denys Dmytriyenko <denis@denix.org>
Sent: Tuesday, June 23, 2020 8:50 PM
To: Fredrik Gustafsson
Cc: openembedded-core@lists.openembedded.org; tools-cfpbuild-internal; Hug=
o Cedervall
Subject: Re: [OE-core] Add package managers as a plugin

You mentioned Poky few times below - why is it Poky-specific? Since you ar=
e
not submitting this change to Poky, but to OE-Core instead, can this be us=
ed
by other OE distros?

--
Denys


On Tue, Jun 23, 2020 at 01:13:26PM +0200, Fredrik Gustafsson wrote:
> Poky today has three different package managers, the well-known formats =
deb
> and rpm is supported as well as ipkg that is good for embedded devices.
>
> When building and having a good cache hit, a significant amount of time =
is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. ipkg is way slower than deb or rpm. =
To
> save build time and also get a package manager that is suitanle for use =
on
> targets where flash memory is a concern, support for apk is suggested.
>
> However, it might or might not be what's wanted for Poky since it increa=
ses
> the test matrix. Therefore this patch series refactors the package
> management code so that it's possible to add more package managers in ot=
her
> own layer. I will send another patch serie that will add apk.
>
> Perfomance metrics below, (note that this includes build times).
>
> APK
> =3D=3D=3D
> bitbake core-image-minimal
> 15.84s user 2.60s system 0% cpu 1:26:19.21 total
> 16.01s user 2.58s system 0% cpu 1:26:03.72 total
> 15.69s user 2.61s system 0% cpu 1:26:45.45 total
>
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -f -c do_rootfs
> 0.55s user 0.06s system 4% cpu 14.236 total
> 0.54s user 0.08s system 4% cpu 15.247 total
> 0.52s user 0.15s system 4% cpu 15.143 total
>
> RPM
> =3D=3D=3D
> bitbake core-image-minimal
> 18.57s user 3.09s system 0% cpu 1:31:29.09 total
> 18.58s user 3.08s system 0% cpu 1:30:53.80 total
> 18.20s user 3.31s system 0% cpu 1:31:06.69 total
>
> bitbake core-image-minimal -c cleansstate
> bitbake core-image-minimal -c clean
> bitbake core-image-minimal -c do_rootfs -f
> 0.58s user 0.10s system 3% cpu 19.470 total
> 0.57s user 0.09s system 3% cpu 19.480 total
> 0.60s user 0.07s system 3% cpu 20.381 total

>=20

