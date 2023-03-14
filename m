Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E216C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:09:32 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.11421.1678806567617416259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RwimweUR;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id cy23so63234103edb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678806566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pucQvAw9+MzLzwWCMLzJd4plj1bLopyumULaT5Llang=;
        b=RwimweURhAFLNYACfYDM99qUpmm4YApG2C5vBkfPLNxen1Y8h0Xd3FT389cxkJYDsg
         OswK47GxINVhSOt8IyL8rNjzLRlbBVdjG1NLxyMUpJ7vDdWD99LVa6YBHRV0SE4vZlWH
         R2vqhQdV1oWQTBNHRfeBNphUQSv2OgGlS+V6X6oWypFnqrMtqq2LS4RgS92eh0AF7MTu
         rK7y/+hnu9tMujN1MYFGzE6B6s1SfRsQsQLfCNbP2Uy2+l3grgBwZ3Rsx3LCIP9zUT8F
         /8rkTMebggk8M+xQjF3JXtRnic86rhfNG+0hMNuMIJIiO+OWpW0fxjesC4su7zTjhQqC
         lkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678806566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pucQvAw9+MzLzwWCMLzJd4plj1bLopyumULaT5Llang=;
        b=7uJJ7qKlZSDaT8PAhml0CDLYM3KqYqYnI/uFEU4EpoVnDRhzNawgXoQVOABxoCrlSt
         8zNtmcrwsbMu9MDcYCVEcWIO/hPwrRuUH32+tuV/MnDJJ+FG9I3y9T8daxlsUgQ/epJQ
         tTDBqbfMHhpCOTKRTHAnVASbIYyzgYM2aZOhVKffXOG0vV8q+obAEmBqsoC6emiwBvfG
         bFLUbmG7OsLGhIE/JJG5KV6ouWsOo85W8iY77I4b4vpnYeBhDnHZO9c4W29nQREY/FJZ
         qmcKw/dEOL8OKq+mtgX9VGIlEIeOTT3aeTLfAZSM02FMk1OfqCISMGIDFXC/q9ywUO9g
         XxEQ==
X-Gm-Message-State: AO0yUKXIF/C+675erDqKdnQMdMIQyoZrspZD0Ry9eVoJbzY7ZC0zQPFR
	6I11S1aPE69UQmp7H4wRgzs4xsyyRlNd5C9QuQ6IyA==
X-Google-Smtp-Source: AK7set+lOWp3HcGktBJhvRlus5D4LV40nKnVdbNEYGDQ/r0fMq4jb+/Z3F16N6gUenYf+Z7xswbfIw9+LFPTSt21zUo=
X-Received: by 2002:a17:906:fca9:b0:8d7:edbc:a7b6 with SMTP id
 qw9-20020a170906fca900b008d7edbca7b6mr1617974ejb.2.1678806566001; Tue, 14 Mar
 2023 08:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
 <20230310095402.85948-1-andrej.valek@siemens.com> <20230310095402.85948-2-andrej.valek@siemens.com>
 <174C4F5C0F6A96A7.18998@lists.openembedded.org> <CAOSpxdb1J=XFjJ+1oxysiGSxMC7ec5TSuHqnokSotQGPZyVftA@mail.gmail.com>
 <5a02a7cfc6b0cf6beb22eaf0e4f4f0e67bbb4458.camel@siemens.com>
In-Reply-To: <5a02a7cfc6b0cf6beb22eaf0e4f4f0e67bbb4458.camel@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Mar 2023 05:09:15 -1000
Message-ID: <CAOSpxdaFt1b5JQV+whoQibhT5MCndx9_EBxYhtehB2UGNQfGhQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915,
 CVE-2022-42916 and CVE-2022-43551
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178499

On Tue, Mar 14, 2023 at 5:07=E2=80=AFAM Valek, Andrej <andrej.valek@siemens=
.com> wrote:
>
> Hello Steve,
>
> Ok, looks like I received a wrong notification, sorry. So you can keep
> there only the 42916.
> Basically all the HSTS check features are not implemented in the 7.69.1
> version.

I still have the same comment on how we should handle this issue:

> > > Is this due to an error in the CPE database?  If so, perhaps the
> > > better approach would be to send a version correction request to
> > > cpe_dictionary@nist.gov

Steve

> > > > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > > > ---
> > > >  meta/recipes-support/curl/curl_7.69.1.bb | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb
> > > > b/meta/recipes-support/curl/curl_7.69.1.bb
> > > > index 899daf8eac..ea36c0bd3d 100644
> > > > --- a/meta/recipes-support/curl/curl_7.69.1.bb
> > > > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> > > > @@ -56,6 +56,9 @@ CVE_CHECK_WHITELIST =3D "CVE-2021-22922 CVE-2021-
> > > > 22923 CVE-2021-22926 CVE-2021-229
> > > >  # This CVE issue affects Windows only Hence whitelisting this
> > > > CVE
> > > >  CVE_CHECK_WHITELIST +=3D "CVE-2021-22897"
> > > >
> > > > +# HSTS check feature is not implemented
> > > > +CVE_CHECK_WHITELIST +=3D "CVE-2022-42915 CVE-2022-42916 CVE-2022-
> > > > 43551"
> > > > +
> > > >  inherit autotools pkgconfig binconfig multilib_header
> > > >
> > > >  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6',
> > > > d)} gnutls libidn proxy threaded-resolver verbose zlib"
> > > > --
> > > > 2.39.2
> > > >
> > > >
> > > >
> > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#178493):
> > > https://lists.openembedded.org/g/openembedded-core/message/178493
> > > Mute This Topic: https://lists.openembedded.org/mt/97516349/3620601
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub [
> > > steve@sakoman.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

