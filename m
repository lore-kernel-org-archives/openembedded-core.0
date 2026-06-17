Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDC3CD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:06:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9944.1781680006637597598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T2anmJdh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-462bb734793so185622f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781680005; x=1782284805; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48OBZ6wpOXmSTxwgQevOUp1kHOzDKn1FeaXiocIxG14=;
        b=T2anmJdhGVRxKNRkmXVVY7sbkVg46iOmEG9ZRBweC8MKbkhumFpiZzccn1a+aNKeUK
         VwoQ71NH5n9Yb3g45Jy+C7Qp6UFUbHwsJHsThyG0JKdMY32Z0WSwp6VgA7kD5zwUdwkW
         IjRpWBtkZCwGYL1ZtkwzSOOVOBkwCdjoskpk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680005; x=1782284805;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48OBZ6wpOXmSTxwgQevOUp1kHOzDKn1FeaXiocIxG14=;
        b=nnVnMHSM7Sg54oY9TtPP8vQylVaqu9Sr2qe/+1yQRzB2llriUU0izBNOoqsZjPPP66
         Y/jdDGysN9nxbgS9pcvZgYdEBDEkTE5MJmR1NzEHaQryUmWppwq7n6Tj4X/W6swnxdiR
         v6ydLECgI+ujfmcpdAnhAefhR5PZdkmKYGOkZwpjIhULaI80xjexFr9XPz2Wamdn9rBI
         hB20k+Hx47mWrxHqhbwk6AylgjuvZ6bz94V3w89xu5tHZSPe+w99tzeFgdNrGZfpcmub
         9fFiVm0ffk2zvBYOzjZB18IHWI2X5iCCvM2/XCCgkgrRfv8v2ugw70e77z3jrlEFapc1
         IBkA==
X-Forwarded-Encrypted: i=1; AFNElJ+hoMDrsrh7kK2uJuau4kvJADlVk5NNR3rSViocU1zklWpyYzT91oZ3Gw/FEov/SupLXucx8Osk8bxlXBj67bfWBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsDDcAg/JYPkMaQQ9ln8NSVQDiRqiP8tbit3EbN6v3UKjgcJ3z
	N3PNjwgv6jn5lqtfXiHk3hVOSQbqyr1qML7G4XDCeqsdj4In4mTVo65xXIjh5uzM/6s=
X-Gm-Gg: AfdE7cmYZAWdAQUe00rkC0bf65Sqtmy0YRAHO+MmvsdHZAiikvhrIKmgbQCa5+9PCIa
	B4PLL1XI6WYNzuDsKt6KXYLb4iwlQL34a5m50oYIaIsSKHiH+Pf5fgfoPEnjrK0tZFpzh8+H2zW
	A8NNjzqf6J+S2AyQjxujjAhppO2R7cIwXiOn2iF2xSBpBjxyrOiHZ12PvsNi42LB+iys9/ML9iW
	H0WzBylVmtMQLfqWOEYkHcxcvgdCZNmgg718B4WnU9jM9J92+NjMoEqK/GKMSPVSfomTkj8y603
	ckN7tHb5k6+bJeFhs0BxJlPKf46lUG9f0bs8v3w7D6E/OTv56Kel0QWotDNEEU/cSUsHgeFDsS9
	lATP9tNLp0atfNHKa2qS22Nw0Uue8l9z21vhwkgPTYZC2Lwpbp6dIyAGDHR7gP+Mn2BlOVTWeeP
	42nLT6rEcNVol0fcnG3qj6A4ebUIlKO0m659z8pfnr5U8ixOVKQq04lr5IBS3PUQNBLVqXTRJxA
	6EOpQ==
X-Received: by 2002:a5d:5d81:0:b0:460:3233:beef with SMTP id ffacd0b85a97d-4623936ca7bmr4168825f8f.43.1781680004637;
        Wed, 17 Jun 2026 00:06:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1e34:81e7:2ec0:d3d5? ([2001:8b0:aba:5f3c:1e34:81e7:2ec0:d3d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c473bsm55539737f8f.28.2026.06.17.00.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:06:44 -0700 (PDT)
Message-ID: <adc319e66320caeb6bed61ed0c57a6e404af50d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] wget: remove pcre packageconfig option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2026 08:06:43 +0100
In-Reply-To: <20260616194959.3748347-1-peter.marko@siemens.com>
References: <20260616194959.3748347-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238980

On Tue, 2026-06-16 at 21:49 +0200, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> libpcre is obsolete project replaced by libpcre2.
> Also libpcre2 is the current default packageconfig option.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/recipes-extended/wget/wget_1.25.0.bb | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
> index f0d3458462..28e27396a4 100644
> --- a/meta/recipes-extended/wget/wget_1.25.0.bb
> +++ b/meta/recipes-extended/wget/wget_1.25.0.bb
> @@ -34,7 +34,6 @@ PACKAGECONFIG[iri] =3D "--enable-iri,--disable-iri,libi=
dn2"
> =C2=A0PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libpsl,libpsl"
> =C2=A0PACKAGECONFIG[libuuid] =3D "--with-libuuid,--without-libuuid,util-l=
inux"
> =C2=A0PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
> -PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
> =C2=A0PACKAGECONFIG[pcre2] =3D "--enable-pcre2,--disable-pcre2,libpcre2"
> =C2=A0PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"

Either this should be left, or it should be turned into a --disable-
pcre in EXTRA_OECONF. Removing it entirely risks determinism issues,
even if it is unlikely in this specific case due to pcre2.

Thanks for spotting the removal though!

Cheers,

Richard

