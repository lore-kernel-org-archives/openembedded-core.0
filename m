Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.3407.1631744779662448377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 15:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OLLn3TS6;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1631744780;
  x=1663280780;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=fE8y587xzipZaWxP79PuX3Y25ExvKmjrmQTIH8vwYFU=;
  b=OLLn3TS6LRmN8W2ksf8cCqHtjJSni1/aJm8+f/z23Jh8sm/GJ4QGELlW
   gsH3PlkeHaes7jsMnsiiPJQTaTe5xOO6t4DOiM6X+tW1KFSO+uKDRCmtF
   BG123IYE6pdRbOips+HivqMIpz2EYSg1yufmxpkDxvdJFi8YLiGdXIKB2
   sI3kA9DBpS4snGbTHojeQahS2codSKmyh/CnZkhFa/tCaZWyYv5Z4BjWy
   6Lc1E1voUx5f0GSiNtK2cVpPBdyWc4ykK45V5EIdkGNejq7RXpNi8W6d1
   VhE5OkICTOiboW/NWtWHG0BkPxBPf47C2zjU+I0A5f5xYML/JtMBJeEZL
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Missing Expat license (was: [PATCH 12/14] ffmpeg: update LICENSE)
Thread-Topic: Missing Expat license (was: [PATCH 12/14] ffmpeg: update
 LICENSE)
Thread-Index: AdeqgLETQ24k3FiXQQufzi72EGQEcQ==
Date: Wed, 15 Sep 2021 22:26:16 +0000
Message-ID: <8bbba4f2242345528f8439794a20058b@axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 9 september 2021 21:54
> To: Ross Burton <ross@burtonini.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Ross Burton
> > Sent: den 3 september 2021 15:25
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
> >
> > "BSD" is ambiguous, ffmpeg comprises of several licenses which are
> > BSD-like.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> b/meta/recipes-
> > multimedia/ffmpeg/ffmpeg_4.4.bb
> > index e19077541ec..f822ba9ab78 100644
> > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > @@ -5,7 +5,7 @@ DESCRIPTION =3D "FFmpeg is the leading multimedia frame=
work,
> > able to decode, encod
> >  HOMEPAGE =3D "https://www.ffmpeg.org/"
> >  SECTION =3D "libs"
> >
> > -LICENSE =3D "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> > +LICENSE =3D "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause & BSD-3-C=
lause & IJG"
>=20
> There is no "Expat" license in neither meta/files/common-licenses nor
> in meta/conf/licenses.conf.

Ross, since you added the reference to the Expat license, did you plan on=20
actually adding it as well? It being missing breaks at least our license=20
handling. After writing this, I went digging in ffmpeg, and it seems that t=
he=20
Expat license (only mentioned by name, there is no actual license text) is=
=20
only used for a test image (reference.pnm), which does not end up in any=20
package. So to me it seems as this does not need to be included in LICENSE.

Also, given the long list of licenses that are now in LICENSE, what package=
s=20
are actually expected to use those licenses? AFAICT, all packages that are=
=20
explicitly listed in the recipe either use GPLv2+ or LGPLv2.1+. The default=
=20
licenses only seem to be used for, e.g., ffmpeg-dev, ffmpeg-dbg and=20
ffmpeg-doc, which seems weird.

More weirdness, LIC_FILES_CHKSUM lists GPLv2, GPLv3, LGPLv2 and LGPLv3, but=
=20
neither GPLv3 nor LGPLv3 are used in LICENSE. And there are no references f=
or=20
any of the newly added licenses.

> >  LICENSE:${PN} =3D "GPLv2+"
> >  LICENSE:libavcodec =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', '=
GPLv2+', 'LGPLv2.1+', d)}"
> >  LICENSE:libavdevice =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', =
'GPLv2+', 'LGPLv2.1+', d)}"
> > --
> > 2.25.1
>=20
> //Peter

//Peter

