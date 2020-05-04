Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.9398.1588608242325188490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 09:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=O8nmoJ04;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1703; q=dns/txt; s=axis-central1;
  t=1588608242; x=1620144242;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=sGCsFpi1TolHyJhUppfruk7swhMxbP4aYLCt6mWDLAk=;
  b=O8nmoJ04Rk4Fz/bLJy3p049Xq0q3kmjhe1/CSboVyXJs8lpV75W5/3KZ
   kpQXLh6Bacqt9Io2ymGANwrXV2ohi+WF+ZvdXRDNJHBiLEEai0R/gDQEH
   m6hlbn1C6hIo+LG2tHxjq7GtVm4obu3g5IN3ZD7juIVEla4IzzYy11m97
   2d5lTrbpDd6cHGVeJnHTfEvWPzp61GXLaMZw4Ud8XPRpzcuL+Ij5Hd9vh
   dAQ5tqUMhHr2BKF4Mr/n0IsbAYNHJFhM+lsy3wDybLB6DC74uG8zKy1eS
   /6/iQ7ZZrxxITFyElXfVMhW5gjxTmOaruSrZO2mETnKmJ/WhNbJpApWsu
   w==;
IronPort-SDR: nHOXwnO4pK1h8UDsdTNGdYwspjY019zUIzJW+qwRmHgzIAwoQ+XD4NnPiKt7yqNP7gPizOIFYU
 WtvyZ1fxjh+Kwl9cPJXH7RSCTnGoHvzo/TkhjgIOxODEJSB2h7LcT745F4lZi6IEQ+5549Mu97
 pUFi3Evu4UDdWYEcK2lKy+flnwfoWPOQqm0Y7tp6jEvnmmR83HiLgqH0nztJsSgclVLUB+rWck
 wYNr48f3AlM51+WxelloBhRcAlWg9IEbGwJmwl2DmO3+ySM7OXEBARBz7CRZ3JUU+S3pvUtlXX
 +DY=
X-IronPort-AV: E=Sophos;i="5.73,352,1583190000"; 
   d="scan'208";a="8132821"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] utils: Drop is_machine_specific()/machine_path()
Thread-Topic: [OE-core] [PATCH] utils: Drop
 is_machine_specific()/machine_path()
Thread-Index: AQHWIiwcOdRA/7Qu9Ey3uJFKVq61bqiYFfog
Date: Mon, 4 May 2020 16:03:45 +0000
Message-ID: <c2c7a009fcbf4e92bdd93d1b700d934f@XBOX03.axis.com>
References: <20200504155258.3231675-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200504155258.3231675-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.13]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 4 maj 2020 17:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] utils: Drop is_machine_specific()/machine_path=
()

machine_paths()

> There appear to be no users of these in OE-Core and their functionality
> is questionable at best too. Probably safest to remove that entirely

that -> them

> at this point.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

//Peter

> ---
>  meta/classes/utils.bbclass | 17 -----------------
>  1 file changed, 17 deletions(-)
>=20
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index c32b868aa88..120bcc64a64 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -1,20 +1,3 @@
> -def machine_paths(d):
> -    """List any existing machine specific filespath directories"""
> -    machine =3D d.getVar("MACHINE")
> -    for basepath in d.getVar("FILESPATHBASE").split(":"):
> -        machinepath =3D os.path.join(basepath, machine)
> -        if os.path.isdir(machinepath):
> -            yield machinepath
> -
> -def is_machine_specific(d):
> -    """Determine whether the current recipe is machine specific"""
> -    machinepaths =3D set(machine_paths(d))
> -    srcuri =3D d.getVar("SRC_URI").split()
> -    for url in srcuri:
> -        fetcher =3D bb.fetch2.Fetch([srcuri], d)
> -        if url.startswith("file://"):
> -            if any(fetcher.localpath(url).startswith(mp + "/") for mp in=
 machinepaths):
> -                return True
>=20
>  oe_soinstall() {
>  	# Purpose: Install shared library file and
> --
> 2.25.1

