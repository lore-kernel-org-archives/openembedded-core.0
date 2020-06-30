Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4290.1593542372821624553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 11:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DXnoNpLv;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3214; q=dns/txt; s=axis-central1;
  t=1593542373; x=1625078373;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OxkrefMkuLVrXBolynR44lhMwcgacEeDl+uu+FzfEOE=;
  b=DXnoNpLv9tbpMFCojcuG3KcKoKfoDcQUk1dswE7foEsTpxtXS1HCfGTW
   uXg/bt3+tsiQGTMqRKAl9JbN82+2QC1xjCZSLXUUP27mUjd8WwvW3iGNg
   oLdkyloY0998x5cS1yiPSYMUb6Qk7SK4iOvB5wFFdNaiClDeEUEvz1yuT
   gApNul0F241iHNua+2z8pJ5iNV3Uk86IkNm1ZnD70w3ZzpKceRr2/H8oG
   K2a6rs/Gk7oYsXn7YuFEPxxobt/MZvOeXfECFoizNgvaYjREe+ED2o1uk
   lQT9odF5M1vi7JkW6r7A3ziAJX2tHVg+lRWZS0I+g3gq3ImNIWPq+zCWF
   Q==;
IronPort-SDR: bgr0r/A+XdFzPF/MCAoO6+sDs8Cae35Cw38XzU3zHASFmt/10GFdqJszCgrYO0opCLx7k2Suoh
 aE8nxFgk0lCdWd7qKmdY9YaxpwA+v+Q2Kj2hSp/RdXFDmZuOavUR3mZH9PXNePn+G8WoRvaVtq
 5RfPZ9Qm+MlwlIJ3hd4z/Scq2kBJDBfKeaKm/XIQcaYgMJg++yEnVzS/CuOmJnQ5Y03fcwqgsL
 X6sIIaoQ6iKrMZguAFtTPH9l8QK51UcW1houeLNRgdhImAAYfmubi5F5Mfpeg2CI4GlSprHnRX
 7g0=
X-IronPort-AV: E=Sophos;i="5.75,298,1589234400"; 
   d="scan'208";a="10060370"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] Add package managers as a plugin
Thread-Topic: [OE-core] Add package managers as a plugin
Thread-Index: AQHWStpuTqDTBDEjLUOnXPK3LZicWqjpAtsAgAiCzYc=
Date: Tue, 30 Jun 2020 18:39:31 +0000
Message-ID: <1593542371018.70508@axis.com>
References: <20200625102145.7139-1-fredrigu@axis.com>,<CAM9ZRVu8BD9QuDh-RM_HxJQujQk9Qg4g+ENg2KFBvoYoMeJoQA@mail.gmail.com>
In-Reply-To: <CAM9ZRVu8BD9QuDh-RM_HxJQujQk9Qg4g+ENg2KFBvoYoMeJoQA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.15]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Paul,=0A=
thank you for your effort on this. It's appreciated! I'll go through =FDour=
 advice=0A=
and see if I can improve this series.=0A=
=0A=
BR=0A=
Fredrik=0A=
________________________________________=0A=
From: Paul Barker <pbarker@konsulko.com>=0A=
Sent: Thursday, June 25, 2020 12:40 PM=0A=
To: Fredrik Gustafsson=0A=
Cc: openembedded-core; tools-cfpbuild-internal; Hugo Cedervall=0A=
Subject: Re: [OE-core] Add package managers as a plugin=0A=
=0A=
On Thu, 25 Jun 2020 at 11:21, Fredrik Gustafsson=0A=
<fredrik.gustafsson@axis.com> wrote:=0A=
>=0A=
> Poky today has three different package managers, the well-known formats d=
eb=0A=
> and rpm is supported as well as ipkg that is good for embedded devices.=
=0A=
>=0A=
> When building and having a good cache hit, a significant amount of time i=
s=0A=
> spent in the phase of generating a rootfs, which is really about the=0A=
> performance of the package manager. ipkg is way slower than deb or rpm. T=
o=0A=
> save build time and also get a package manager that is suitanle for use o=
n=0A=
> targets where flash memory is a concern, support for apk is suggested.=0A=
>=0A=
> However, it might or might not be what's wanted for Poky since it increas=
es=0A=
> the test matrix. Therefore this patch series refactors the package=0A=
> management code so that it's possible to add more package managers in oth=
er=0A=
> own layer. I will send another patch serie that will add apk.=0A=
>=0A=
> Perfomance metrics below, (note that this includes build times).=0A=
>=0A=
> APK=0A=
> =3D=3D=3D=0A=
> bitbake core-image-minimal=0A=
> 15.84s user 2.60s system 0% cpu 1:26:19.21 total=0A=
> 16.01s user 2.58s system 0% cpu 1:26:03.72 total=0A=
> 15.69s user 2.61s system 0% cpu 1:26:45.45 total=0A=
>=0A=
> bitbake core-image-minimal -c cleansstate=0A=
> bitbake core-image-minimal -c clean=0A=
> bitbake core-image-minimal -f -c do_rootfs=0A=
> 0.55s user 0.06s system 4% cpu 14.236 total=0A=
> 0.54s user 0.08s system 4% cpu 15.247 total=0A=
> 0.52s user 0.15s system 4% cpu 15.143 total=0A=
>=0A=
> RPM=0A=
> =3D=3D=3D=0A=
> bitbake core-image-minimal=0A=
> 18.57s user 3.09s system 0% cpu 1:31:29.09 total=0A=
> 18.58s user 3.08s system 0% cpu 1:30:53.80 total=0A=
> 18.20s user 3.31s system 0% cpu 1:31:06.69 total=0A=
>=0A=
> bitbake core-image-minimal -c cleansstate=0A=
> bitbake core-image-minimal -c clean=0A=
> bitbake core-image-minimal -c do_rootfs -f=0A=
> 0.58s user 0.10s system 3% cpu 19.470 total=0A=
> 0.57s user 0.09s system 3% cpu 19.480 total=0A=
> 0.60s user 0.07s system 3% cpu 20.381 total=0A=
=0A=
Some initial review comments incoming on all these patches. I've just=0A=
done a surface level reading, I think the way you're submitting this=0A=
still needs some work before it's in a state where we can properly=0A=
review the changes in detail. Right now it's too big and too easy to=0A=
get confused when looking through 26 large patches.=0A=
=0A=
I'm very supportive of tidying this up and making it more dynamic, we=0A=
just need to make sure we don't break things along the way.=0A=
=0A=
Thanks,=0A=
=0A=
--=0A=
Paul Barker=0A=
Konsulko Group=0A=
