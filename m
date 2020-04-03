Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.15122.1585931063942950138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 09:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=k3Y6UcYO;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2187; q=dns/txt; s=axis-central1;
  t=1585931064; x=1617467064;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7bQJ80fXhpsFXCilocbENaE12EIZqEE3CdVs5jSaY/E=;
  b=k3Y6UcYOJs2s+QyD8ZhzON/stFw5jLytr3toKUuQP/iJrFiMAfHxTXkh
   3UnsGjpkiKrHAFNcmb90pvei7773/aKRbicLNbInUwOnpXgcSYwaPcrSa
   AAra0+jMtFwMRuJs0T/mMantmiaU0gAU1uEzzHPUFw/kaG5miFq0ux7LG
   jTUvZY/7CrjI5DE6ldbU7D3OjSxpDHk1NlEiOv8FlECeFXyt3GUpqGlZM
   YxZVtp+0+ni/dB7vOGivHpEW97cGl3+yh9W/mcj+lqjqJ1NrI/10L3zg9
   CCyf3IJq+s4DZZ32H2a+5vlYJYhn17s1ABFWv8neGI4vTXwNfO4XjY1p5
   g==;
IronPort-SDR: 2zG/UMBdeQ+cJ0SZbHCiMTb+S8kfNFeaR96I7VXo8D55bpeJWtQJr3goTuZ8DdYMSyqXZCdRvQ
 ClDUt1L11poP+A15plIsWobmGbqYe3GgpLfRXcVE9eXsPQ5NwvZkhkEV3Jj939TdhYW8BER/KQ
 cF7DvtIQZzZKkbhL3CVXGmrh9P7oBkmiKsuGmM1XwChl60/u8pI6DsMZYW7NNQvDPri2P0waQ1
 1cj7aF75Copar4nMK37bEecizFhXLdAgW/qcYVZ5LyqXJ9zxgvns/IRa2Xc+kUw2fwXwCdjH+C
 cvY=
X-IronPort-AV: E=Sophos;i="5.72,340,1580770800"; 
   d="scan'208";a="7097213"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an exception if an empty pkgconfig dir exist
Thread-Topic: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an
	exception if an empty pkgconfig dir exist
Thread-Index: AQHV/uIEb7867P3pQ06RTDWlJqY9JahnqoNA
Date: Fri, 3 Apr 2020 16:24:21 +0000
Message-ID: <6953e7ec71b64cf1b9a636b41b553b2b@XBOX03.axis.com>
References: <20200320180420.32303-1-pkj@axis.com>
In-Reply-To: <20200320180420.32303-1-pkj@axis.com>
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

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 20 mars 2020 19:04
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [master][zeus][PATCH] relocatable.bbclass: Avoid an
> exception if an empty pkgconfig dir exist
>=20
> Rewrite relocatable_native_pcfiles() so that it can handle that any of
> the checked pkgconfig directories are empty without causing an
> exception.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/relocatable.bbclass | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes/relocatable.bbclass b/meta/classes/relocatable.=
bbclass
> index 582812c1cf..af04be5cca 100644
> --- a/meta/classes/relocatable.bbclass
> +++ b/meta/classes/relocatable.bbclass
> @@ -6,13 +6,15 @@ python relocatable_binaries_preprocess() {
>      rpath_replace(d.expand('${SYSROOT_DESTDIR}'), d)
>  }
>=20
> -relocatable_native_pcfiles () {
> -	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> -		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') +=
 "/pkgconfig")}
> -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${=
libdir}/pkgconfig/*.pc
> -	fi
> -	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> -		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') =
+ "/pkgconfig")}
> -		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${=
datadir}/pkgconfig/*.pc
> -	fi
> +relocatable_native_pcfiles() {
> +	for dir in ${libdir}/pkgconfig ${datadir}/pkgconfig; do
> +		files_template=3D${SYSROOT_DESTDIR}$dir/*.pc
> +		# Expand to any files matching $files_template
> +		files=3D$(echo $files_template)
> +		# $files_template and $files will differ if any files were found
> +		if [ "$files_template" !=3D "$files" ]; then
> +			rel=3D$(realpath -m --relative-to=3D$dir ${base_prefix})
> +			sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
> +		fi
> +	done
>  }
> --
> 2.21.1

//Peter

