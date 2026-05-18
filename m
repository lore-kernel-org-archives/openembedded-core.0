Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF37FCD4F49
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 16:22:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1143.1779121357347806826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 09:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aQ2gfTeq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44e5624c053so1471006f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 09:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779121355; x=1779726155; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1F6PXpZbECP9zgFDEOPZCrrPLmOTZyk65Emx/2blKgc=;
        b=aQ2gfTeqd8g0hTF2U/K1PwaThQF/nuZWdA8UOopioHRDBuc9ezcfn9PWLMarRbg65S
         mmv+D48BayB8RIqn9U1UNH+3a08n5moZxZf09EWnUHGHG3Q6AJMHGAgaRJM1I3st4zXb
         CXsSr8RdqTWp81nEs1jExKDQlbnPo6T/7JSks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121355; x=1779726155;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1F6PXpZbECP9zgFDEOPZCrrPLmOTZyk65Emx/2blKgc=;
        b=QKk63q+cs5E4w3ZT9iRg5OLFHgqkb3WBtliD+sTn90kgq8wTece/w0qgYv6AxXQe9f
         1Uoc38XbZYiA2khEgP/b0QEEvmBPhUqUiFg39VEE2mOe3wwOkB9HoLpD7Hp17UBx4z5Q
         wWE2MxuJD+czD/9W8YNXYKI5JkpCG64xv9LvFKrzmG7uhqiFl/C5Av++zk1BCi0e5nA6
         HlHNiwcD9kWuJrlHr2oAdH4jupU6hijVCnb7D7KcONf4kS9h5KadD6VW1YzwOTohJzLQ
         w0DyXaZoVeYsVK6g0r5i7/sle3XhlnNNgijSayfcoTvgI3lF6ehPkGSN/LXjUgpZKm1S
         VOfw==
X-Forwarded-Encrypted: i=1; AFNElJ/U4dNtPKAEiiYgd7sdzgA+NHPnjPojx6xFLofRIbpU51piJJjRWMHBUQT7ueaimnV+0aWJ6iVdhdIvbbkvlyv8Hw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwG4S2amp1XzRLoRplTwShFeXMtBnrVix2fF7cBGVzuQuccSaq6
	e/wcT02ArkvD5eSe2nqszvrMjxoNrNvcu/41bFXvTp0z+rV4HguYZ7fu+6OM4lTF9gY=
X-Gm-Gg: Acq92OGG/XTOgPRuHCn6S6QvEswjUfSZgzu81OPvNMmFwiTY/ljl9pm7lv78ofnCYFj
	/syJF/2skTsBwFq1xAplrk6+ncCYWywpapDtDa8VQFFoAgwNjIN6cMRDsIQfPbeclIIP7sUJrFm
	U4pfdoIRdNORRtMnBD2qqbvLsHW0CGq9MAbFomqTFzy120FZFXvpQsqUcmBKltKlPD2BAfyeCZC
	j2ivMAYfu1CbUUKSu1OBBESzkCTFF2e77E+GIF4NiNbOrqvFB5fyoLHJEXy6ZZtsNglcU+X5QSx
	0lp7eHqB5RhFVdyd9cuirkqwe4tBPWeP5ndzytAifZtT2CaRvc2zihjeaHgnhqZPs+O5fgcMsBm
	Y7Oka53KopXMjryx5Fcx77lzYxCYBL+H3ZcCabTfXQGK5VTwem3FGxJhn1VVOIbhYpnDwct0Unq
	Q5UVV0NPvtR8phifubTeV3JhEplEaf9Vg092sh0S3cKIOrK8+7o61Ih2qW/JIg64g+Lqvj2jwWE
	VG7Y7h69VrxBg==
X-Received: by 2002:a05:600c:4692:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-48fe63253e0mr248766285e9.20.1779121355412;
        Mon, 18 May 2026 09:22:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0c5:308:9c51:e911? ([2001:8b0:aba:5f3c:c0c5:308:9c51:e911])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm288250175e9.7.2026.05.18.09.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:22:34 -0700 (PDT)
Message-ID: <0d9172f08910760f6ff0866997a4723699f96ec5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] curl: Remove absolute paths when mbedtls is
 enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.jonas@de.bosch.com, openembedded-core@lists.openembedded.org
Cc: robert.joslyn@redrectangle.org, paul@pbarker.dev,
 peter.marko@siemens.com, 	pkj@axis.com, Moritz.Haase@bmw.de,
 changqing.li@windriver.com, Ricardo Simoes	 <ricardo.simoes@pt.bosch.com>
Date: Mon, 18 May 2026 17:22:33 +0100
In-Reply-To: <20260513160218.11997-1-mark.jonas@de.bosch.com>
References: <20260513160218.11997-1-mark.jonas@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 16:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237250

On Wed, 2026-05-13 at 18:02 +0200, Mark Jonas via lists.openembedded.org wr=
ote:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>=20
> When enabling mbedtls PACKAGECONFIG option, the curl-config and
> libcurl.pc are generated with paths to STAGE_DIR_TARGET, causing the
> QA check buildpaths to fail. This is due to the fact that the mbedtls
> option uses the path to STAGING_DIR_TARGET to find the mbedtls library.
>=20
> When installed, the curl-config and libcurl.pc will still need the
> the flag '--with-mbedtls', but not with the path. Same is true for the
> library path flag. Thus drop the absolute paths from both files when
> mbedtls is enabled, and add the flag '--with-mbedtls' to the curl-config
> and libcurl.pc.
>=20
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
> =C2=A0meta/recipes-support/curl/curl_8.19.0.bb | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index b9251336b8..cc37cc934b 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -93,13 +93,15 @@ EXTRA_OECONF =3D " \
> =C2=A0"
> =C2=A0
> =C2=A0fix_absolute_paths () {
> -	# cleanup buildpaths from curl-config
> +	# cleanup buildpaths from curl-config and libcurl.pc
> =C2=A0	sed -i \
> =C2=A0	=C2=A0=C2=A0=C2=A0 -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
> =C2=A0	=C2=A0=C2=A0=C2=A0 -e 's,--with-libtool-sysroot=3D${STAGING_DIR_TA=
RGET},,g' \
> +	=C2=A0=C2=A0=C2=A0 -e 's,--with-mbedtls=3D${STAGING_DIR_TARGET},--with-=
mbedtls,g' \
> +	=C2=A0=C2=A0=C2=A0 -e 's,-L${STAGING_DIR_TARGET},,g' \
> =C2=A0	=C2=A0=C2=A0=C2=A0 -e 's|${DEBUG_PREFIX_MAP}||g' \
> =C2=A0	=C2=A0=C2=A0=C2=A0 -e 's|${@" ".join(d.getVar("DEBUG_PREFIX_MAP").=
split())}||g' \
> -	=C2=A0=C2=A0=C2=A0 ${D}${bindir}/curl-config
> +	=C2=A0=C2=A0=C2=A0 ${D}${bindir}/curl-config ${D}${libdir}/pkgconfig/li=
bcurl.pc
> =C2=A0}
> =C2=A0
> =C2=A0do_install:append:class-target() {

In most cases we don't need to edit .pc files. I'm concerned about
seeing this being added to the sed, we should fix the data coming into
.pc files in the first place. I'm really happy we don't need to change
many .pc files and I don't want to see us regress like this.

curl-config is a different story unfortunately but can you see if the
.pc can be fixed at source please?

Thanks,

Richard



