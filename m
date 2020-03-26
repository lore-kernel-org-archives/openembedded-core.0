Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.3277.1585249452848854690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IuoIlPUA;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1588; q=dns/txt; s=axis-central1;
  t=1585249453; x=1616785453;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=AyfUGNv0guGbUUayz5oSCI/la/Z2Nvjghj53L7Z0fVE=;
  b=IuoIlPUAri9/pHTCSfBIxTy/vtF+FubkdGMrECJ0vzGj6kvZhCV0FvUG
   SuTfec7yiEeYV3tUTe++wnasqmGP/SC1GKIpgUk7ekwuMurtw426/DxcR
   1hiqg6HBH9VjWTvquUcTc14pIqUjqMWBr1/blaiSN0XD7Vr/b54qJh+DE
   LTpUxCHO4ku5Iw0RGnke6FA8U1bmnjfjNk8VeS8xX2ko1XReWKy87J3GE
   Tor2ZTwYkPVVDgsXee0ics66s0Xbf0ad52NfH4HLgb9Mvml7NvfoTjoE5
   Qwih+bSlDRugcMgtIXVjdD2XJz4IfZ/7xmgudPxv1HVL4HPd4i7Ms6aMB
   A==;
IronPort-SDR: 3HY3nZEijv//XzNB6qpvxUhNxISzBb8bvXn4vvK48Gb5bCY/j8DmubI/sBz1i5hPmZJ3E6Nb/u
 wR3QEmZlRxOuMc3qOKBwBp+wmq2hC8tNyJdtkGIAHXAWFPEb3wB5zzoraFkThG2i3F2JSuvEB4
 ZNqIeoosjsSN94CHRDyBQWgTcfa5265F8plUTDgo5x/tQwp249jW4kOJbv7V1EAn/iUjVUCQQO
 0Vn0kLx3Yx8Rb+inhSNKzS98O7uj+CjTwmvXQwlwdwh1vnf4BZIclZbApd3dM9yphoNbdmqhmf
 Uo4=
X-IronPort-AV: E=Sophos;i="5.72,309,1580770800"; 
   d="scan'208";a="6973741"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Charles-Antoine Couret <charles-antoine.couret@mind.be>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] utils: fix gcc 10 version detection
Thread-Topic: [OE-core] [PATCH] utils: fix gcc 10 version detection
Thread-Index: AQHWA52eNp3wp7M1MkWYOatPR1iGtqhbOvKQ
Date: Thu, 26 Mar 2020 19:04:10 +0000
Message-ID: <6b44ccfe71cf498cb2dd1676b8bf1e0e@XBOX03.axis.com>
References: <20200326183716.132772-1-charles-antoine.couret@mind.be>
In-Reply-To: <20200326183716.132772-1-charles-antoine.couret@mind.be>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Charles-Antoine Couret
> Sent: den 26 mars 2020 19:37
> To: openembedded-core@lists.openembedded.org
> Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> Subject: [OE-core] [PATCH] utils: fix gcc 10 version detection
>=20
> Utils can not detect GCC 10 correctly due to wrong regex.
> It generates this error "ERROR: Can't get compiler version from gcc  --
> version output"
>=20
> The major version should be 1 or more digits instead of 1 only.
>=20
> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> ---
>  meta/lib/oe/utils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index aee4336482..a4cdce6ff0 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -391,7 +391,7 @@ def host_gcc_version(d, taskcontextonly=3DFalse):
>      except subprocess.CalledProcessError as e:
>          bb.fatal("Error running %s --version: %s" % (compiler, e.output.=
decode("utf-8")))
>=20
> -    match =3D re.match(r".* (\d\.\d)\.\d.*", output.split('\n')[0])
> +    match =3D re.match(r".* (\d+\.\d)\.\d.*", output.split('\n')[0])

Might as well correct that to:

    match =3D re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])

so any of the components may contain more than one digit.

>      if not match:
>          bb.fatal("Can't get compiler version from %s --version output" %=
 compiler)
>=20
> --
> 2.26.0

//Peter

