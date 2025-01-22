Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390F4C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 17:19:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.49535.1737566345306783394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 09:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D3tJkU/3;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so67459691fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 09:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737566343; x=1738171143; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf3a7NxVI/k7GihVlx9HYFGGYzOqBvQAXUl4hzuQ9vI=;
        b=D3tJkU/3tBbyZTbGjTHemiwVfrkgEf7Q4W+rQGiH6wLHnFgusdkgZrpZ+4QK+2yXBS
         XSv5ofWvqeAwa2luhAqu/MnHCqIv/SsLZnjpPHj/ggeEf3bjaesGmpQ1pTmeXZiyNxNF
         nZYuOFdIeN0G+RCTtvQDiO4t4fCc9D7Nm8tCLjR16Re1f5uqWKme+neqMUUDZOZBYgqG
         L2eC0PsJW7FMVcQNXTqJarvr8IzF57qWj8mCO/oqBzmpzcSZo3uYrKHBXp8XodifQjfq
         coFOlTjeitqBcaS9bisJLU4SuPc0mIZ4RkuGJdDKArOiGRZJYg+H3CPO0yf8jwSSBzDM
         +5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737566343; x=1738171143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rf3a7NxVI/k7GihVlx9HYFGGYzOqBvQAXUl4hzuQ9vI=;
        b=ULed2Ursw06pmttQYzP/WdqY0rJtt/kiKqN8qOnxHHIA70GjWO9Ai8qnXaUdOFnkQs
         LRpsXwiBkuxUVudObQ5qoVzmT+6j32Be5VSmf6+2e1j1bs1PVyXiicRAYMYaRmUpoh9F
         weyBZXORU+nFNTEbTFQ/pEnj2TG6HGYZiLKsquXYu/uvz2G2IFxCznVYpwmfCMBGySQn
         WavHKAjidVTF2kja6dSZJ6NdzBY/oonQ5qQq2HT8mp2o9E5O+SbwG344luXUhiLZ4wn+
         jND1DdWTSKg5TuFy3fTy4UpcuCW+WJzITSfoSOj0uGwmPU3WtMNUu3aoTXDHbcfuSu2U
         aqjg==
X-Gm-Message-State: AOJu0YyXmVtkDhPZRKDWww4xXplGnsYV+KRre/I+z462sNeYf3MKy3KI
	I2+SPsgPfEKebJXuiz6G2JHBn57V88yDsBxV8wk+Y3hhMGysbMvqcjpT3QOeu+g/ch83Eqo9Awh
	QDkCK61b89NUwju7enN9X+N64vFQ=
X-Gm-Gg: ASbGnctJpFwITeVHdPUIaAHU8WnvRssKaD2j//AFpTtVgrF051KvY+XJVmfWarxfe4m
	aUQhBa7y/LhWq6h/0g7Gvx09l8jjp/PvcP1sMVeDyE/CshNbfd//lXA==
X-Google-Smtp-Source: AGHT+IHbGi4ZZi29hqVraBOlA6o5bSn3DJ729yn4rFBPD/NMXj+I0XF/Oxpyzt7hmQpBslXlVCvUBMO5wQhYGTSONm0=
X-Received: by 2002:a05:651c:896:b0:300:1947:a28c with SMTP id
 38308e7fff4ca-3072cb66472mr95915291fa.26.1737566343101; Wed, 22 Jan 2025
 09:19:03 -0800 (PST)
MIME-Version: 1.0
References: <18171087FD41F9DB.21892@lists.openembedded.org> <PH8PR11MB692814CBFE4AA3DA53E554A4B81F2@PH8PR11MB6928.namprd11.prod.outlook.com>
In-Reply-To: <PH8PR11MB692814CBFE4AA3DA53E554A4B81F2@PH8PR11MB6928.namprd11.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Jan 2025 18:18:50 +0100
X-Gm-Features: AWEUYZlqkcUM0Bib-8M9lAPbIwzPhZL1NWz7lJWPK1Ebuzg2nls9WaxRs0GoHUY
Message-ID: <CA+chaQerqQ1tszNDTDGJ4T5qR4cDDw46evFhPYawWpYggPq1aw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2] boost: fix do_fetch error
To: Jiaying.Song.CN@windriver.com, Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Li, Changqing" <Changqing.Li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210159

On Mon, Jan 13, 2025 at 4:36=E2=80=AFAM Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Kindly ping for scarthgap branch

It would be useful to explicitly CC Steve Sakoman, I've added him now
(and pinged him on IRC).

Your "Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>" from SOB is not
accessible for us, can you please use accessible e-mail.

I've send a version of this change for styhead and just got:
DNS Error: DNS type 'mx' lookup of ala-lpggp7.wrs.com responded with
code NXDOMAIN Domain name not found: ala-lpggp7.wrs.com For more
information, go to https://support.google.com/mail/?p=3DBadRcptDomain

Regards,

>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
> Sent: Friday, January 3, 2025 11:19 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Li, Changqing <Changqing.Li@windriver.com>
> Subject: [OE-core] [scarthgap][PATCH v2] boost: fix do_fetch error
>
> From: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
>
> Change the SRC_URI to the correct value due to the following error:
> WARNING: boost-native-1.84.0-r0 do_fetch: Checksum failure encountered wi=
th download of https://boostorg.jfrog.io/artifactory/main/release/1.84.0/so=
urce/boost_1_84_0.tar.bz2 - will attempt other sources if available
>
> Signed-off-by: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
> ---
>  meta/recipes-support/boost/boost-1.84.0.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/boost/boost-1.84.0.inc b/meta/recipes-s=
upport/boost/boost-1.84.0.inc
> index 5bbea2ba5b..be1ad20f47 100644
> --- a/meta/recipes-support/boost/boost-1.84.0.inc
> +++ b/meta/recipes-support/boost/boost-1.84.0.inc
> @@ -11,7 +11,7 @@ BOOST_VER =3D "${@"_".join(d.getVar("PV").split("."))}"
>  BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"
>  BOOST_P =3D "boost_${BOOST_VER}"
>
> -SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}/so=
urce/${BOOST_P}.tar.bz2"
> +SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.t=
ar.bz2"
>  SRC_URI[sha256sum] =3D "cc4b893acf645c9d4b698e9a0f08ca8846aa5d6c68275c14=
c3e7949c24109454"
>
>  UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209700): https://lists.openembedded.org/g/openembedde=
d-core/message/209700
> Mute This Topic: https://lists.openembedded.org/mt/110401268/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

