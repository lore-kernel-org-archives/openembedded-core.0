Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2F5C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 22:47:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.3606.1637621249129545139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b1b2JJ2V;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id r8so35401495wra.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=RbJQDaWEL+vdHd/n9HRbIQfN4Fu70jQI/pBILzHj7x8=;
        b=b1b2JJ2VB+TAUra6tEl/R7VUDNSr35pQhy4l3KR62GhQJN1pHsyyHVwECvnKEDZn6B
         sKyyjl8dyLdbEGGcszCt69AAYsOvfcc2dNAxvRCBijGLKPEnwBV1Edit3O2M+C7Ny92m
         2Ym72DHot2Exo27By47LxtpJb6R2BRZhtaUJ1FP5ZGl1ZU0F4JAUeBOSye8c18RzCtqv
         rK7mtGcgBoqnLHb+2hUTdzKvn8M4xGwXV4SNJksP9DPjoMH/B2HqdEeqjAzxCQ7g+IYD
         R6Qsha8NA2tUyjKBGFWWX0QeAFNmO+WryOOngG6FKqOEbS9wS3iCGE5/ZAya4wu95pJg
         CTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=RbJQDaWEL+vdHd/n9HRbIQfN4Fu70jQI/pBILzHj7x8=;
        b=4h7t1sUpvYAUuL+axMjz5psD4D1AXcy++VwdwpfGWyblkssdy7TWrNgS5r2LjPiTGk
         qzlFo5lTjwtaUVl292DinrQddhLjdsUCEvyYsqUCUvyi6LqnGXdvLu/leDgvJHd34cUM
         5K+sM44XcG73wW5gxIglirbo8tJXRLloutsBivWUwlKA+iCCbXwi76rMjwzKf70ueSRI
         CrH86UaIyU8axkg8OMZvSl+zUVHuxmmKM796n6JyU06EkbvDqqaojJf9wFl6Pocf9SJ1
         xabVnt3aDPCI5TYB3VuuGWWeA1ZqfLQFm3+izKDioIHkTbgc6dm9+6iO3nSGW5BPazY0
         UFng==
X-Gm-Message-State: AOAM532+FnBY9ZdSyrAI88ZP/S7GxSCDMltq8/w8B/gz+g+LjnyitJS8
	mVlduFDOwT26SgtzZ054bk8=
X-Google-Smtp-Source: 
 ABdhPJxEtxKoX5ss1tVQwGhERslu/kd46ZTu0bj+9Et/0Ty7sRLHo1Ytj0jR+3VpkP8b/zxAADuNSg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr1147597wru.380.1637621247500;
        Mon, 22 Nov 2021 14:47:27 -0800 (PST)
Received: from ?IPv6:2a01:4b00:f41a:3600:df86:cebc:8870:2184?
 ([2a01:4b00:f41a:3600:df86:cebc:8870:2184])
        by smtp.googlemail.com with ESMTPSA id
 g6sm13907459wmq.36.2021.11.22.14.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 14:47:26 -0800 (PST)
Message-ID: <b0ab6dd09c793181318adc5cc99127bd936b48e1.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/7] systemd: skip chown when building for
 nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Mon, 22 Nov 2021 22:47:22 +0000
In-Reply-To: 
 <AM9PR09MB4642F4FE2BBA8DF859A98BE1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-1-luca.boccassi@gmail.com>
	 <AM9PR09MB4642F4FE2BBA8DF859A98BE1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-znOlOdHme2BcGsfkOqHa"
User-Agent: Evolution 3.42.1-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 22:47:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158592


--=-znOlOdHme2BcGsfkOqHa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-11-22 at 14:57 +0100, Konrad Weihmann wrote:
> I have sort of a general question regarding this patch series.
>=20
> Last time I checked (and yeah it's been a while back) systemd-analyze
> wasn't self-containing, meaning it would have to have a running
> systemd=20
> process and at least a running dbus iirc.
>=20
> Is that still the case?

That was the case only for some verbs - 'verify' does not need a
running instance. From v250 (next release) it will also be able to
operate on images/root directories.
The 'security' verb did need a running instance, but there's a new --
offline switch in v250.

--=20
Kind regards,
Luca Boccassi

--=-znOlOdHme2BcGsfkOqHa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmGcHfoACgkQSylmgFB4
UWIfYAf/R9/AkfB+PsXkSUND5AZzWzOw5abxqSG9OWzRc2HIP+kNK0IfHQ4uh3s8
aNSlT6l6ah6mNZPKb+9Bn303MGJ1FRvwWSOxQV4vAKV6LS4SxPX4Jlkr9N3ph6gu
BMQIkep2SN/sZxPFG4yP+6qS/MBYCSxBWICpf3vpmTOmWrrgOEOkfPP5B07Xk+4I
idJ4OzF5ksngvWsq3At46cIN9EeDIbUIP8CgSgjBt4J/+97jUM/mJ4FHpwChHhVw
VdvNMiDTn/afwrQd6P0mxDTXj1BohmBLEeiAkJ1sgYtWrIRTwJuLzc21n9AVqNuz
p9b6//lsRGZMxYDD2lDQ80c0uL9d2g==
=eb3K
-----END PGP SIGNATURE-----

--=-znOlOdHme2BcGsfkOqHa--

