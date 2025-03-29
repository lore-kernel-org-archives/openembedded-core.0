Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ED7C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 14:26:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.11704.1743258374566726877
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 07:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ma4wHKY8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913958ebf2so2480414f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743258373; x=1743863173; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ncPIBfCr+84/OpUaRidYCzSz22Mqf09fHfF9nq3EJtg=;
        b=Ma4wHKY8YfKELDgrVckMT0rxF/8tJoBBuHR+/RrG2kAQ1E7eoJgqc2nDMs6+vRGb+N
         b9VAqi3P+1olWQrbDfyXaWj1cVj5q9lavd5PEUc6d9oI40N5klYIxkrb7Z5k6hP+DWFt
         bMdmHMJxOYEE70GLQjepGWUtxv7HaFYSoJ7AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743258373; x=1743863173;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncPIBfCr+84/OpUaRidYCzSz22Mqf09fHfF9nq3EJtg=;
        b=T35fypdTVh1vM3tiQp/eqTIIOhQvnKVnnBPgtNztWKHvRMRbTyocyqEOtX9LlOmFZP
         DTei+iLdio9Uu7IL24kpPru1dvx6+RBfNLsh+bJZJVmwIIIJQMzq9p4bjqeLddyjk+A2
         kR1/KkA1yRutGy9lqRzxDYloKdQ7wdgtNxCYmz8CvRjDlhNAF5FSOXXTcuTLI1omJapz
         BzVsgJ1eoynOCutIygt2SkW4PsExdTy2sw4Qw1LZueayE52+GJBAK8x6P/ZWdW9++cPa
         ASxqx4z+QTKtbrtOwn0OAKk6ERL0kLcHGF0QxrZLYJGa1q0JwIkxLA85q7HN8YuXq/Ik
         kW1w==
X-Forwarded-Encrypted: i=1; AJvYcCUynC+m6Ghc0OtAf4T9nCJQfwHlqVtjj7OMvZn0gkkbkNk0ya8hSAArRkD7PfUmU8r38QA2ucSFtxB3fZeZZw8WKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxP4U1WCrcswKqaYgJmKiw9naWJaZJEX+iy/KHdfSKwf9LoUsnG
	EdytG+z8pnUeHDVK0mwnckVgMe75Qi7DVEGOmq6JGTaAP5k6K2mX2kZ120ToHjk=
X-Gm-Gg: ASbGncu1z0i/2NuOStnuEoaOCkyWR+k8JawZJJBn9FoF9BjrnatiCpbYciD6kvV+fqR
	3wiUUaSeCdBL9HxbzMpKNTYHIeRMKYb2fEb12Eh63hhgMUh6vSAZ7l46kQZue7eD/DYFR7i1KL9
	pogYfx0+veTc95594Jw+CaJi+2zLGPoMTxSazcymkpDxLFbhFeByyNHhk216xWc/MzRltRPfBh/
	008CdmGayWrpKUKTv1ipQDih0Rha/aK2YBJEGbfbgt9jPZcj3sUPsrt8mS4ZQTU7JapaWcT698F
	EqqjNu1MQ1LIdMloAe9t16lvSPERutO2H8iiMDvg5rQPhCYuArQuUcTVdzJUZViUnb6d0floAAc
	gsIOSkRDlL1DeFD7BgwurhNBdqPSNkjW6BYJfSqI=
X-Google-Smtp-Source: AGHT+IGtu+PMJF5tjOaylx3Z+smpNdK9jbQU4abD2mZkDr2lc24hmLMf01vgU8rbuclPuU7NP8oc3g==
X-Received: by 2002:a05:6000:2a5:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-39c120ccb86mr2305524f8f.6.1743258373013;
        Sat, 29 Mar 2025 07:26:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa52:226c:d1da:79? ([2001:8b0:aba:5f3c:aa52:226c:d1da:79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663564sm5945880f8f.32.2025.03.29.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 07:26:12 -0700 (PDT)
Message-ID: <02ed3be215555452cabd3f02473d7d6abee5343f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/6] default-providers: Add
 VIRTUAL-RUNTIME_dbus variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, niko.mauno@vaisala.com, 
	openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Date: Sat, 29 Mar 2025 14:26:11 +0000
In-Reply-To: <bd99e47f7600f91dd2eca63437fe0b03b7c385a2.camel@gmail.com>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
	 <bd99e47f7600f91dd2eca63437fe0b03b7c385a2.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 14:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213879

On Sat, 2025-03-29 at 15:02 +0100, Adrian Freihofer via lists.openembedded.=
org wrote:
> Hi Niko
>=20
> Thank you for the patch. It would be nice to have an easy way to switch
> to dbus-broker.
>=20
> On Fri, 2025-03-28 at 15:01 +0000, Niko Mauno via
> lists.openembedded.org wrote:
> > The purpose of the new variable is to facilitate oe-core users who
> > wish
> > to use an alternative runtime D-Bus implementation instead of the
> > default Freedesktop.org's dbus, such as dbus-broker, a recipe for
> > which
> > is currently available under
> > meta-openembedded/meta-oe/recipes-core/dbus/
> >=20
> > While introducing this facilitation the intent is to preserve the
> > existing functionality, while allowing the user to optionally select
> > an
> > alternative runtime D-Bus implementation by adding the following line
> > e.g. to local.conf file:
> >=20
> > =C2=A0 VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
>=20
> Introducing a VIRTUAL-RUNTIME_dbus variable would work. But it requires
> to change all dbus related recipes which are not only in oe-core.
>=20
> I'm wondering if using a PREFERRED_RPROVIDER would simplify this.
> https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-PREFERRE=
D_RPROVIDER
>=20
> This would probably allow a back and forward compatible implementation
> with changing only the dbus-broker and maybe the dbus recipes plus
> adding something like
> =C2=A0 PREFERRED_RPROVIDER_dbus ?=3D "dbus"
> or
> =C2=A0 PREFERRED_RPROVIDER_virtual-dbus ?=3D "dbus"
> to OE-core.

Sadly it doesn't work like that. I regret adding PREFERRED_RPROVIDER as
it doesn't work as people think and only helps under very very rare
circumstances.

Runtime issues are a package manager level problem, not a bitbake one,
unless bitbake is doing variable substitution beforehand, which it only
does with the normal rules.

Cheers,

Richard

