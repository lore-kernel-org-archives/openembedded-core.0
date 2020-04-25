Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.3550.1587806218874473805
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 02:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=E3U7zWHE;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2694; q=dns/txt; s=axis-central1;
  t=1587806219; x=1619342219;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Nm+lwHf5yAUgeHowWno1iUFDbb+FIEj96ZOc4Q8g0Fs=;
  b=E3U7zWHE/R+srDUGkXGKpynjNp3keafCc9SyJ8HukNMVuI2I46PmmQFe
   yJ9e82x07VMFEoY+1/S/N6btrwlf7uZUmGs9bSI0wqaM3woKlURZE2a4t
   tZe4c3IRhwarA5NitlCpQ9WrGuXz7iybOefCQHKAdulU++ej+amPQR4+1
   5BADMNXtFDLwtZzhKhL8RxdGAzDHiZpT35GY3FZPimyO/+jKvBswpnQY3
   hc5jahDWkuIfYGiCCE5E5uqttsPElNhzAWIctJVUiGaOhjQZfS542idw+
   hoXc8dburY52w9LG1j47DZK1z7nvAvP6yTPf48kqO7IxrQj0m6ZSbcr3S
   w==;
IronPort-SDR: nlPWMhU+GWsJ4YsFXu7pQlp65SRH35Hvs0g3mYuPLYOTtjoVuPcNKef+nlM5Wm/js78Qum/4eg
 Fye0/KV301gKslXmUHAaYvWT0O/3Il2QU4teb0FN9R8YK8rlCa6JqUIdnLIx7wA2ZbnE20oBr2
 TwidjP4PbeFjBcHAim820BYZCucFko/U0MaJ1KHf/DsQnseiPCWxoGqtXVBquJS7TpjDfNuaJ9
 zvreTs3A28wKxnRNs1/bYqYLH9Q3Io6a4M/uVgCQ0GJsuKlz3XIhddyy9/fm3WOCMnry+Dby5X
 vaY=
X-IronPort-AV: E=Sophos;i="5.73,315,1583190000"; 
   d="scan'208";a="8080680"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
Thread-Topic: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an
 exception if an empty pkgconfig dir exist
Thread-Index: AQHWCdRlzShdKB7XZ0iWsxM6QnpIZqiJsMGQ
Date: Sat, 25 Apr 2020 09:16:57 +0000
Message-ID: <5cf7c6a42a4a42959a9ee2ce04ab269c@XBOX03.axis.com>
References: <20200320180420.32303-1-pkj@axis.com>
 <16025BE698C394B5.19764@lists.openembedded.org>
In-Reply-To: <16025BE698C394B5.19764@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping again*

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 3 april 2020 18:24
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid
> an exception if an empty pkgconfig dir exist
>=20
> *ping*
>=20
> //Peter
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-
> > bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 20 mars 2020 19:04
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an
> > exception if an empty pkgconfig dir exist
> >
> > Rewrite relocatable_native_pcfiles() so that it can handle that any of
> > the checked pkgconfig directories are empty without causing an
> > exception.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes/relocatable.bbclass | 20 +++++++++++---------
> >  1 file changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/classes/relocatable.bbclass
> b/meta/classes/relocatable.bbclass
> > index 582812c1cf..af04be5cca 100644
> > --- a/meta/classes/relocatable.bbclass
> > +++ b/meta/classes/relocatable.bbclass
> > @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
> >      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
> >  }
> >
> > -relocatable_native_pcfiles () {
> > -	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'),
> d.getVar('libdir') + "/pkgconfig")}
> > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc
> > -	fi
> > -	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> > -		rel=3D${@os.path.relpath(d.getVar('base_prefix'),
> d.getVar('datadir') + "/pkgconfig")}
> > -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g"
> ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc
> > -	fi
> > +relocatable_native_pcfiles() {
> > +	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> > +		files_template=3D${SYSROOT_DESTDIR}$dir/*.pc
> > +		# Expand to any files matching $files_template
> > +		files=3D$(echo $files_template)
> > +		# $files_template and $files will differ if any
> files were found
> > +		if [ "$files_template" !=3D "$files" ]; then
> > +			rel=3D$(realpath -m --relative-to=3D$dir
> ${base_prefix})
> > +			sed -i -e
> "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> > +		fi
> > +	done
> >  }
> > --
> > 2.21.1
>=20
> //Peter

