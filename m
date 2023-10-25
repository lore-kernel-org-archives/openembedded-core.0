Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E88C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 15:48:29 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.176944.1698248901191920608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 08:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wpPWYScq;
 spf=pass (domain: baylibre.com, ip: 209.85.208.50, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso8825745a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698248899; x=1698853699; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkF3yBIa3h7dX3ZvL2AQhyHQUTcgQRX9jdVZkk+xKMw=;
        b=wpPWYScqCMqZXVbcT63XZx8VFmcQoajgdxhBcafoXANPJgmYq2fgdZtCro1/Il/QYq
         0vX1Y8/4aZo6w5A76aIuM7D70+4zDiXvecN18BhPNPgGmFIcrd8ZQWbOGGUG0R/Py0oR
         8bSsj3633F1febfuUtfMmCM85G337fozo8BLrt7wfuks0MXFDm4OeWyGyWMqhnr+Tn3s
         AcXpY88e3gb3M53TgSZC3927ndCzWA10IcJfxRxGyWITBZKjgAjdaVeogsPH6RzK5j21
         aiOZp0h9ozFjilonVPb3IH4E1iGnxxzXs1ZoKu7f7k4q3PQFqHp61VBQjtsIAjjFnBYb
         wRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698248899; x=1698853699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkF3yBIa3h7dX3ZvL2AQhyHQUTcgQRX9jdVZkk+xKMw=;
        b=w3A40yGhWwJdFvsQ2sT2VU6H/q8GU8QYUtRg5/ZZsgiAVRuJbK2ojUAKp9RwRcn14f
         XdLxnI6cDEDrvudvkAEo0dsCET5nMEbqqbIvJaPH3/fMs3Kl3YsnhwFlgxF9U+WT6adI
         UwrY6jv7anE+wDSAmhPxv3zW6y055tn+4Lq7r3mH9OkjeGbUpEAa/Prznq0rTccvICI3
         Zu96U2FjJmiOWsuJSb5MZ4POIXzvr8Ll4PK+MbTBj/askKv3P4OOi57KW6dUC2wmbdpt
         mPwXflPT6osWwiWMSQ5fd/tAcH1WRkl+URad3HMrvz5+J1pb/klPqnWObV7KJurKDtKD
         OIhw==
X-Gm-Message-State: AOJu0YxL2kT7/l2Wf4kIryUGSSCoo7nXOZ9hY3xY5sDqpZHUdXbTHUPj
	565QizKPVp3MmtbrU57Zx/YhuxpRqvg/rZSFnNaCSg==
X-Google-Smtp-Source: AGHT+IGbwW0USK4dz7hrRNBsOVWJ9atOggno0rCuBA/6M0f6xujiwyfDcXBZsHI8WobNNuH/WBS260eVtrBkTs28jPw=
X-Received: by 2002:a05:6402:1d48:b0:540:cabb:de70 with SMTP id
 dz8-20020a0564021d4800b00540cabbde70mr2130317edb.38.1698248899608; Wed, 25
 Oct 2023 08:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231024144022.1532605-1-jstephan@baylibre.com> <19b88e474d716513f4ed23327f1eb6004241d7ee.camel@linuxfoundation.org>
In-Reply-To: <19b88e474d716513f4ed23327f1eb6004241d7ee.camel@linuxfoundation.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 25 Oct 2023 17:48:06 +0200
Message-ID: <CAEHHSvbKG19=aajPV2dd7CHLC0gJzK-Qb5b9gbd34GG773egmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 0/4] devtool/recipetool: add support of PEP-517
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 15:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189688

Le mer. 25 oct. 2023 =C3=A0 16:11, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Tue, 2023-10-24 at 16:40 +0200, Julien Stephan wrote:
> > Hello all,
> >
> > This series adds basic support for PEP-517 in recipetool/devtool, plus =
somes
> > others fixes.
> >
> > Recipetool/devtool selftest passed locally
> >
> > Missing features:
> > - extra or optionnal dependencies are not handled
> > - version number for dependencies are not handled (issue already presen=
t
> >   for the legacy setuptool)
> > - some projects can declare a minimal pyproject.toml file, and put all
> >   the metadata in setup.py/setup.cfg/requirements.txt .. theses cases
> >   are not handled. If a pyproject.toml file is found, assumes it has al=
l
> >   necessary metadata.
> >
> > Changes from v2:
> > - try to use tomllib from python core (since 3.11) and if not available=
,
> >   try to import tomli (instead of toml, as tomllib and tomli have both =
the
> >   same api)
> > - improve support for poetry: poetry looks for metadata into the
> >   "tools.poetry" section instead of the "project" section
> > - add the selftests for the 3 supported backends. Skip the tests if
> >   tomliib (python > 3.11) or tomli is not installed
> > - fix self test failing with the new "python3-" prefix added to
> >   recipetool for python recipes
>
> This patch series still doesn't seem to apply against master. Could you
> check your rebase is ok or if there is a patch missing or something?

Hi Richard,

Yes, I forgot the first patch of the series. Just sent a v4 fixing this.

Thank you
Cheers
Julien


>
> Cheers,
>
> Richard

