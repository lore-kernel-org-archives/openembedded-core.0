Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25299CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:51:30 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.37373.1759765885036178941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qESht/A4;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.178, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-77f947312a5so40929717b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759765884; x=1760370684; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G/PhzvDbn/RzQWeJC8uu9XOZ86srYjk31oH4c1q7xY=;
        b=qESht/A4jdA97JcRDKNRh91cdexJGYHOtTRiolDHZG+P0y5IKyISAL8aMp6K5iC5ES
         6dvpIUiZIdt++98T4VnLkhFTTbPtRWUC4lhnPP8t+1ucY1DByaMj7MsRBSZf0SHz1X78
         PQdHSbFvFwcUuId1OaMOkFhxN5ItKVKWAhvpq61Ha4ppJoLS4KTuaaRitclqLFwgGcy7
         NIgL3ylVsP6A1gFH8jltulRZuIc8Uw9N7yn6QA9LwAJUxavLp+tKI9MY5PztxM6uCaQm
         JdlWsN3+odUAEiCcteBpgmraTJP36TjzZ7wEgMzhZA/JZc5XTsK1OrJKOKg0VZVhKlFH
         8CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765884; x=1760370684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1G/PhzvDbn/RzQWeJC8uu9XOZ86srYjk31oH4c1q7xY=;
        b=r7e81UXoHRp6tFviUl4Bo4xpY6ITWKcKM7eBIndkuQ4wPhyQ3hNQD9YavHNPaQayy4
         SbWiV1/wKhjsUWJ23bZFcX1A+TLsbHffa0eAGzcaVO6KtQHlbv4k71g2YVKcyw9h/zyG
         kzFPXrFVb1SkfliytRBW4s2loYGNW+7FhvbeIGgUKAGpJTfjmb3AQ7GlckUgfS3MjA5L
         ZdmUy8xWQuCWGtmBZY7uVrPyQvTbBHOKpLa8q7NGl94ju1MJPptfOp6s4vvAkVz/GwMp
         GAs3c2E7r6vVxso1s/mabgoy9uICcv7RlsDB/hK9khqlCksotWBE/7v3FbKR5yqcvWrP
         gJPA==
X-Forwarded-Encrypted: i=1; AJvYcCVu825sk7GH7dpSiPJcMoDEqXTaiN5lr0d9OqtlYfbxerjJViK5k0KzcnMKhzn6g0r+DtvQSbEZrSoGAe8OJbFqsw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyE9gI+Z6IkdyaEh9igl53yjwRQKSJ0aQM3sWC0yQO2elsgOKrh
	V8xhYJqTQJsapCkO1zwY38b505sIf6a3oYdcyNyDDZbe26uYi2bHyH5g+kYCkW02M3D3wsPzshE
	N0VS5ampJASkBJXIkIIXixeqRsFjdSPKtCe6v8PEDF3Q1JEeg9/pvR7E=
X-Gm-Gg: ASbGncsu8Fa2x9TDjiX5Udj3pIDfHnBrLNnLWpHfFnL2Ywc+p03YvWyKsTtQWh1ARj8
	dNP9O3NgqO1SPGFH9BjmrXRTOdF7yBji3jjINsnP2F8SYhOjOD9RtOCmFItTduHxM9U2Mk3hw7o
	pJbJhChjQprkBhRCaHytMrGqwPsu/OhqNgNrL1yoxSNM7jHU65flLOaBp7mloxaRNey/gG7Hx1t
	qNJ9hWpRaNLy15NvDsGruWN2OdHqQmWMp7xINr09Smsbw3vLcH6SA6p78L+nM5TsmyUttpc
X-Google-Smtp-Source: AGHT+IFrVt13SMG8HDHOa74SVgfvKczqp3rpvw+QMevtunBaqn0W16kpnvQWCzCMtCgrFHCVjrmVC32N8u7yXyU2kf4=
X-Received: by 2002:a53:84c3:0:b0:636:1efe:2bb8 with SMTP id
 956f58d0204a3-63b9a055640mr10739574d50.5.1759765884052; Mon, 06 Oct 2025
 08:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251006081341.3653614-1-archana.polampalli@windriver.com> <AS1PR10MB56979D4719B7D45235350DB2FDE3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56979D4719B7D45235350DB2FDE3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 6 Oct 2025 08:51:13 -0700
X-Gm-Features: AS18NWArkSbdHtc7R6nX_HqJvxHySkmJC8VCn4_7y6hJnBxLkGddo3lVzmblWR0
Message-ID: <CAOSpxdYM7wQyvRYrDS7GUq7ZfVGzqb9=t7JhcnZpstA0H204xA@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 -> 3.0.18
To: peter.marko@siemens.com
Cc: "archana.polampalli@windriver.com" <archana.polampalli@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 15:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224494

On Mon, Oct 6, 2025 at 2:52=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> I have sent out another patch which also refreshed patches.
> Here I'd like to ask the maintainers regarding patch refresh policy.
> Should I be doing it also when the do_patch does not report any fuzz, onl=
y when some line numbers moved a bit?

Definitely eliminate fuzz, but if the patches apply I'm not too
concerned about line numbers moving a bit.

However I notice that your version of this patch also changed the
content of one of the patches (CVE-2024-41996.patch).  Was this
intentional?

Steve

>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Polampalli, Archana via
> > lists.openembedded.org
> > Sent: Monday, October 6, 2025 10:14
> > To: openembedded-core@lists.openembedded.org
> > Subject: [oe-core][kirkstone][PATCH 1/1] openssl: upgrade 3.0.17 -> 3.0=
.18
> >
> > From: Archana Polampalli <archana.polampalli@windriver.com>
> >
> > This release incorporates the following bug fixes and mitigations:
> > Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
> > Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232=
)
> >
> > Changelog:
> > https://github.com/openssl/openssl/blob/openssl-3.0.18/NEWS.md#openssl-=
30
> >
> > Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> > ---
> >  .../openssl/{openssl_3.0.17.bb =3D> openssl_3.0.18.bb}            | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-connectivity/openssl/{openssl_3.0.17.bb =3D>
> > openssl_3.0.18.bb} (99%)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb b/meta=
/recipes-
> > connectivity/openssl/openssl_3.0.18.bb
> > similarity index 99%
> > rename from meta/recipes-connectivity/openssl/openssl_3.0.17.bb
> > rename to meta/recipes-connectivity/openssl/openssl_3.0.18.bb
> > index a50bd2edbf..a8dd338327 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
> > @@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk =3D " \
> >             file://environment.d-openssl.sh \
> >             "
> >
> > -SRC_URI[sha256sum] =3D
> > "dfdd77e4ea1b57ff3a6dbde6b0bdc3f31db5ac99e7fdd4eaf9e1fbb6ec2db8ce"
> > +SRC_URI[sha256sum] =3D
> > "d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d73df1b3abae72e4ffe8b"
> >
> >  inherit lib_package multilib_header multilib_script ptest perlnative
> >  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> > --
> > 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224472): https://lists.openembedded.org/g/openembedde=
d-core/message/224472
> Mute This Topic: https://lists.openembedded.org/mt/115613876/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

