Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE8ACD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 09:51:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72020.1778579500510263679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 02:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aA9L6anQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe608cb92so3335967f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 02:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778579499; x=1779184299; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBr7RJSB8Bc9JLwfJsHPd8dlzGleC5XI3vcatnpPqoM=;
        b=aA9L6anQR1LHllNYezU7qp4mmJvT63yYt/IMH30gssFRd+V5nx07f49glyugxmxkq3
         W9H+rbF2Jg0DclOlMuIwMbbie03ErEx3YS+MqyMUt1Z5f9ERYmUL9wCd1gD/wi4v+iRb
         FPhIbCxa41eXCwGe2FqSZar/JTEWoRsDymK5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579499; x=1779184299;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBr7RJSB8Bc9JLwfJsHPd8dlzGleC5XI3vcatnpPqoM=;
        b=gmUca9I/LxgmE75y6ITKIAMlyize3YAg6X1aWXxNWyUFmbnrMZnqgz5bUiQ3j9I+CO
         u6mD03e2nBRM1AXUVAP2AP1cuI5y0v5PgCynB4iBWumbset6AVTjoLN8ffz2sUuOEYIM
         omChoQS9vr43U1tZ7SJD47smlH6AwVG/YFMxyhqLPBUWTPmXdd7m1JXLIT7srOxoUqTH
         4QHKhgMVr1YBLL2gaSr5zvCQIOLK0Pmu/A1g0qfg2NrCvrlpcQsQee3Mcj7sNPPak82H
         PxL++Ua6oDNxfopNT8FTa5CUAxfHZel2k+GdqDGoYAEjZe6xCVzGAdVNdyP41SIgarJM
         f1Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/A6AOWStdZ/TvnSY1qF4gHchUIb7GkiJj0bemgHD3MFGJXYqiNOhlTZmwTnrq2Vg1NMHyBwrKDd54Lv+5d4Z6hPw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYLC2LorMUsmtb8MCWkiLsiNnvc0oUjO+t4yVKHfioHQcz2ySX
	1k0HhmLCyb0fPJgL36tHoMLW5fT3+l2k423y3rhU0jRzRz67G/6WUV5i0xlB2RYasmk=
X-Gm-Gg: Acq92OGdnL9oSpTHZ1v3P3RiX5Jt4WPRlZqk9S1LVMXa14eIvGuqk8zY/VJ8lzCc0Nn
	ZDvxsu/wcnrBir1AbHctiJ7j80R2zBtr9hMqc81QhHtXd6w+F6EYl/u9ZaV9jWdATIzUeMa94AQ
	ES3t5whTp4gOnx/rAGa3JP05pxsxnfW9gm9vT8+/p5peaLzvsfA6+RCFGEc5JvFuIl29ahepaQ4
	lQXhDE888sZ4yitTBhMSsHuGe2tNpf6jjUPUfzEUu9s232U3l26wdOSJF9wuGb8p6AYPC073xLI
	1GvfSXxfw0inlG/kOyVaAe5ghMfIVnT94alQ7sfbId2N9h0AZVnI6CTZyjqc5Rj1MDG4HXrcjm6
	Xnsn4uARnwrHLug6FT7DDcxwL5xXO3xy12U1sBPg96mvGcr4kkFxrjoXfsfrj2jpo4w48rC3csw
	mgCbxQej9M0QlprUtUFD224jLjpY7DAKoTPQrSseApmtfhfIG0vt205ErVfhZaTxMNyNAbXoZih
	9KhBLTSoLJPMKE0
X-Received: by 2002:a05:6000:2311:b0:43d:6244:f8b with SMTP id ffacd0b85a97d-4546140ac8bmr27291042f8f.13.1778579498789;
        Tue, 12 May 2026 02:51:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664? ([2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a6a64sm32878535f8f.6.2026.05.12.02.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:51:38 -0700 (PDT)
Message-ID: <1dbb58318bc8b75f49a0eb892d4774bd345f4e50.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	quentin.schulz@cherry.de, openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2026 10:51:37 +0100
In-Reply-To: <fc44ecfe-7502-457b-9dcf-1f63ac4e5fc1@bootlin.com>
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
	 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
	 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
	 <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
	 <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
	 <2558d49d-58e6-4e0b-be28-3d27cf521dc1@bootlin.com>
	 <a74ef617f11ddfc139fb23c7d688118de207712e.camel@linuxfoundation.org>
	 <03127fae-4d0f-46b1-b740-b6020a10a3e8@bootlin.com>
	 <8af0d0102205adfe2e997435e5fae90445c3c88e.camel@linuxfoundation.org>
	 <fc44ecfe-7502-457b-9dcf-1f63ac4e5fc1@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 09:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236874

On Tue, 2026-05-12 at 11:17 +0200, Joao Marcos Costa wrote:
> Hello,
>=20
> On 5/12/26 11:06, Richard Purdie wrote:
> > On Tue, 2026-05-12 at 11:02 +0200, Joao Marcos Costa wrote:
> > > Hello,
> > >=20
> > > On 5/12/26 10:46, Richard Purdie wrote:
> > > > On Mon, 2026-05-11 at 16:00 +0200, Joao Marcos Costa via
> > > > lists.openembedded.org wrote:
> > > > > Hello,
> > > > >=20
> > > > > On 5/11/26 15:52, Quentin Schulz via lists.openembedded.org
> > > > > wrote:
> > > > > (...)
> > > > > >=20
> > > > > > Not necessarily true as I don't think we build GCC for
> > > > > > native recipes
> > > > > > (and ovmf has a native variant), so it depends on the GCC
> > > > > > on the host
> > > > > > (unless you have uninative?). I don't know the autobuilder
> > > > > > infrastructure, e.g. whether we build patches on multiple
> > > > > > workers on
> > > > > > different distros to have a big GCC version test matrix.
> > > > > >=20
> > > > > > But yes, building with a newer GCC will generally not make
> > > > > > warnings from
> > > > > > previous versions disappear and I'm hoping upstream has had
> > > > > > time to fix
> > > > > > warnings returned by GCC12 in the last 4 years :)
> > > > > >=20
> > > > > > Cheers,
> > > > > > Quentin
> > > > >=20
> > > > > Yep, my whole point is based on the the distros in
> > > > > SANITY_TESTED_DISTROS
> > > > > being recent enough to ship GCC > 12 :)
> > > > >=20
> > > > > I should have made it explicit in my commit message.
> > > >=20
> > > > I hate to say this but:
> > > >=20
> > > > Alma/Centos/Rocky 8 have gcc 8
> > > > Debian 11 has gcc 10
> > > >=20
> > > > and we don't use buildtools on debian 11.
> > > >=20
> > > > I'm therefore not sure how you concluded that from
> > > > SANITY_TESTED_DISTROS.
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Richard
> > >=20
> > > Ah, my bad...
> > >=20
> > > =C2=A0=C2=A0From this list here:
> > > https://docs.yoctoproject.org/ref-manual/system-requirements.html#sup=
ported-linux-distributions
> > >=20
> > > Considering the versions of Fedora and Ubuntu, I presumed the
> > > other
> > > distros were at least as recent (in terms of packages versions)
> > > as
> > > Fedora 39 (which ships GCC 13).
> > >=20
> > > I will check the results in SWAT to see if this warnings pops up,
> > > but
> > > the commit message could use a rewording to address this point
> > > and also
> > > some questions raised by Quentin, so a v2 will be sent later in
> > > this week.
> >=20
> > We currently support distros with gcc 10, I think that is clear.
>=20
> It is clear, yes, but my point here is the -Wno-error=3Dstringop-
> overflow=20
> already being available upstream in the version of edk2 we currently=20
> use, and - as per what I understood in their git history - the flag
> was=20
> added for the very same reason we have it in the recipe.

Ok, that makes sense.=20

Cheers,

Richard

