Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD781C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:14:11 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.11060.1637172843601096497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=MtMNcoX5;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1637172844;
  x=1668708844;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1doPtY7kdya7tDqP3C1pLNDljhgYR9kLTnE9f5SkccA=;
  b=MtMNcoX5EoUlwNrkOMlVITW2F0LBIHDe8ji8scOuTS/fwarto4LVqUhG
   TfAwtQPX9x6uA3dfhi9SJ1D0drLczwEpe/+wOUWVEkJhg7+skIJO6CmfX
   pKD/GuHl1rIbBV0hii3XtNrO8eLfObT6mHC8RR1Js97vdU2d7g47Nd840
   5lZ0DsKFG2AekbVKxgGUkGOxBk4cEMIMhceURtL0I01virNo5pr5GK+HL
   I5aZKaCw11DKgxFOFRF9IFJv/h7Vjcf0SMyYiofmk6Lh2XqDhdDP7BwHP
   UBKXKthx0HH1dTeXfFdYYYhgDX2hkrRGE+mD8YM5jk1SZ2REcg7I9s8rM
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "paul.eggleton@microsoft.com" <paul.eggleton@microsoft.com>
Subject: RE: [OE-core] [PATCH 1/8] systemd: skip chown when building for
 nativesdk
Thread-Topic: [OE-core] [PATCH 1/8] systemd: skip chown when building for
 nativesdk
Thread-Index: AQHX268s2AL4FkD3202OmUcYTY0JtqwIBNDA
Date: Wed, 17 Nov 2021 18:14:00 +0000
Message-ID: <9151407a13a544628bf14e106277474d@axis.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211117123201.111905-2-luca.boccassi@gmail.com>
In-Reply-To: <20211117123201.111905-2-luca.boccassi@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 18:14:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158452

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Luca Bocassi
> Sent: den 17 november 2021 13:32
> To: openembedded-core@lists.openembedded.org
> Cc: paul.eggleton@microsoft.com
> Subject: [OE-core] [PATCH 1/8] systemd: skip chown when building for nati=
vesdk
>=20
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> The useradd class is a no-op in the nativesdk case, so chown will fail.
> Skip them.
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-co=
re/systemd/systemd_249.5.bb
> index 8bdc0ca028..2f019a4b1f 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> @@ -275,7 +275,10 @@ do_install() {
>  		# which is expected to be empty.
>  		rm -rf ${D}${localstatedir}/log
>  	else
> -		chown root:systemd-journal ${D}${localstatedir}/log/journal
> +		# The useradd class is a no-op in the nativesdk case, so chown will fa=
il
> +		if [ "${PN}" !=3D "nativesdk-systemd" ]; then

If you change that if statement here and below to:

		if [ "${PN}" =3D "${BPN}" ]; then

then it will apply just as well if anyone introduces systemd-native.

> +			chown root:systemd-journal ${D}${localstatedir}/log/journal
> +		fi
>=20
>  		# journal-remote creates this at start
>  		rm -rf ${D}${localstatedir}/log/journal/remote
> @@ -319,7 +322,10 @@ do_install() {
>  	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}=
; then
>  		if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
>  			chmod 700 ${D}${datadir}/polkit-1/rules.d
> -			chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> +			# The useradd class is a no-op in the nativesdk case, so chown will f=
ail
> +			if [ "${PN}" !=3D "nativesdk-systemd" ]; then
> +				chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> +			fi
>  		fi
>  	fi
>=20
> --
> 2.30.2

//Peter


