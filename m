Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A209C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:51:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7395.1750769461562189739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CfH9WSaq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so253662f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750769460; x=1751374260; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JnYIkg1kJLzfW7fu2LZbwC83xCIJo5gmfV/U8uNW2O0=;
        b=CfH9WSaqqmYElynT5kUnUbdGHAH+bery56hCcm66IGoWgDPlc2X4Ta54iQ1fZ0IbcJ
         xSRnDJ/FHfe8js4+iuc7FTV3K3k6kSupIOnZI3Epdlxdgw0TaA0/ma39+Wv24zFc0GJq
         U/XcoLWKWmakAphlkD3KiSL0LciCzzqt2OacQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769460; x=1751374260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnYIkg1kJLzfW7fu2LZbwC83xCIJo5gmfV/U8uNW2O0=;
        b=RhjJ9A6Mjz+eNpgNk7B9jaGnJkQHUfknspiLIHctoNRBaUG4OagE4iqYltqUaBkrDv
         FORGO+0KrqBub+xDwasCw86Y2h50XxBhrhnIZ5R8xKjafvVtOi341kGYGHgyJ8S68J6s
         JruF+QyYgAu7hFfDgH96AnO+mcltg4eD8e3wytf4kU2N++HbfsCO3qXKqIfsphrVuN/E
         HfHmLFIlwJmrBxYuMCZC3ZMNY98YbVZLmXvc8Yu1vACx2tDxVVrDFVfCRiYLdjxhVMMI
         0hFPiQv+qg03ZvVp3vtzkDqRusWsjGfC1DTR39ttgAZPaRpQxjFJzqbPLbmMEd20JAmR
         K65Q==
X-Gm-Message-State: AOJu0YzfA+EnV2QLHaT8REN4ZqFj6v5doYXHtRdjUHf4Inuyy182XUN6
	BhFq5GaL9HQksdyOOAZrSSl0x/trh70VQwXr+d7Ew8XvFLNMFFxoh9tDlpvLegxviaM=
X-Gm-Gg: ASbGnctypzRFhItmPPk21KpQMFK3di46IegoQEL+5XiJcH2tdglKwDyo7vhrs98JvHF
	PZpqjeVuSig2KoZAtD2vLVautF1tOzl0bmgcINpitvODYEwJbTr11Mnx9X7xqD/D8jBsgolHYi7
	HKStxf1twmazfW/CvNQdoU8vpm9F1zgpoa7HsFzQT4kNuwWB4hW9wD4KCaqMluGhjqSO0zZFUty
	yKGtheiWhb588XSTjsy19gbDobCV8x70IFe0qwTNTpXpjnqvx8q0pFXOFZjSJ9N+XqgOspgCHM5
	EA0vi3vKzwpID4A5xpGgEWRGMF9PLReVBHivoZaiPzcG5fca0epxqKbooEv4Oc7HXr/+OD4zCsB
	epnulw5JQoTUHXLuSXW7zUvuuAu3KZ2990NiOvxkUPt8tL1F5+gQ=
X-Google-Smtp-Source: AGHT+IHjZOboznNrWbsWc5o96n24hFngrX4/iqfuJeHyJ6oWdVio+dmYVcaGvUUnxALDO7dTKAA7sw==
X-Received: by 2002:a05:6000:2486:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a6d1193de5mr11975786f8f.6.1750769459925;
        Tue, 24 Jun 2025 05:50:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:341b:1360:3bd8:8ecc? ([2001:8b0:aba:5f3c:341b:1360:3bd8:8ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2977sm1920092f8f.63.2025.06.24.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:50:59 -0700 (PDT)
Message-ID: <9f403e68b52b3d00ea2e4420cdb3a2b764847b9c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] oeqa/sdk: Simplify test specification and
 discovery
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, "thune.a.tran@boeing.com" <thune.a.tran@boeing.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Chuck Wolber
	 <chuck.wolber@boeing.com>
Date: Tue, 24 Jun 2025 13:50:58 +0100
In-Reply-To: <758CF101-6F42-470E-A68B-CD0F48F2702E@arm.com>
References: <20250605221301.890797-1-thune.a.tran@boeing.com>
	 <758CF101-6F42-470E-A68B-CD0F48F2702E@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219266

On Tue, 2025-06-24 at 11:59 +0000, Ross Burton via
lists.openembedded.org wrote:
> On 5 Jun 2025, at 23:13, Thune Tran via lists.openembedded.org
> <thune.a.tran=3Dboeing.com@lists.openembedded.org> wrote:
> > Simplify how tests are specified and discovered for different SDK
> > configurations
> > to allow per-layer customization.
>=20
> Nice!
>=20
> > * Introduce `TESTSDK_CASE_DIRS` variable to specify test directory
> > types,
> > =C2=A0replacing the need to modify the default_cases class member
>=20
> Is there a need for this to be _DIRS and not _DIR?
>=20
> Is this just being generalised because you can, or do you have
> internal uses where there are multiple case directory names?
>=20
> > =C2=A0meta/lib/oeqa/
> > =C2=A0=E2=94=9C=E2=94=80=E2=94=80 sdk/cases/=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # (de=
fault) Standard SDK:
> > dirname=3D"sdk"
> > =C2=A0=E2=94=9C=E2=94=80=E2=94=80 sdkbuildtools/cases/=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # Buildtools:
> > dirname=3D"sdkbuildtools"
> > =C2=A0=E2=94=94=E2=94=80=E2=94=80 sdkbuildtools-docs/cases/=C2=A0 # Bui=
ldtools-docs:
> > dirname=3D"sdkbuildtools-docs"
>=20
> Can you drop the sdk prefix from sdkbuildtools and sdkbuildtools-
> docs?
>=20
> > * Add mingw sdk compatibility until meta-mingw migrates to
> > TESTSDK_CASE_DIRS
>=20
> I=E2=80=99m tempted to say don=E2=80=99t bother having mingw compatibilit=
y, but if
> you can send a patch to migrate meta-mingw then we can just merge
> them both at the same time.

Personally, I don't mind the multiple test case dirs but just wanted to
say I agree with the rest of the feedback and it matches what I'd
mentioned on the review call. The patch in general is great to see, we
just need to tweak the details slightly, thanks!

I'm happy to merge a tweak to mingw at the same time.

Cheers,

Richard

