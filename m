Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B54A106B52C
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:53:35 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21480.1774443211842224469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PB7L6Wrb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-667f8794e97so11120972a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774443210; x=1775048010; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+9zR9tNuQPiUvO4kiLKN0qP/unQJYYOAOaQM6n1ag50=;
        b=PB7L6Wrb/IzFaTuPcdKFW302yc0F/Nszzhyi3o3XMhIgLK+9/DXL3JUvro2XyPnYuw
         9oBvo5lX0scBWPJQUC1mN5n6WUHz58TaC+H12fju8Ky1mqjnX17ub6DSTMhI8TYfD6IF
         UKXTqZTOYcvPxNeNLblNNQKvGa+SI3RQgNB4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443210; x=1775048010;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9zR9tNuQPiUvO4kiLKN0qP/unQJYYOAOaQM6n1ag50=;
        b=mweAdcXJOlVdeGwIAomiuzFCijNf53z9oUk1LvNAocZDIhqDD79IHSl/58gvy/rvTd
         psXo5EuikdwbDtcoh1WoDrUWnE9V7z1d3eCitAe0Dc2xjCwP2AKS9U6pbcdGNO4IXdsI
         7DrXpQC8lmkEIB92K2YEWQ8sriKaEg5s1ggaZwpH9ejMMbHY2JTaXcfhoid2YTccNMY/
         gmwqVo6hEoYQHTSU9r9DBxC/wPyzxAIvtwzTFNmQitoE4EbtwLDYdY6f0aUqt9vcXlgk
         Gx4a/a9dt0FxG/QzDtn1d3azRTqe0IkQvPNaURQpURccwyanlKOfYOoAmSb4qH9t4hIt
         dL1w==
X-Gm-Message-State: AOJu0Yzspp8aaedIQLsQ7OhwpKVH8wOIbIUSctr8wbzG8kbTpJUxQMKv
	MJOi8aorWENLXzCcilc79FtqIOhgL2hDlveAI45LuRpsOoKpdxtnbvvpo1TMOgH7rn8=
X-Gm-Gg: ATEYQzy0nAsQ7ddbkVSsNtEXxU4YnzPY7L0TChSFZCM1ZCZO6KW3oQfcOMNrD2L7bhi
	dkiDbCguQM2THR9j1u7xuzNgXEMNkTRqUMUIxUscbtJ/LPUh5oHSCPo23PfmPfdK1ejrkaM2E7g
	t+R5p+aPcUGz4ddCEXLLueowUQVpLdpT/ZW0uUxpHEh3WArv/uRcGII6lhHVadXpgxeejHRHzBV
	j8hnbxPKdJdYcK+JrJjkY46sUbKJQ5QpNwLl78GtXHPkVZnvyS89Bu04FkR5ysq/ar0+UXDU3t4
	vi5qYn7dkOC26xkPm/S8goTgvMdC4PHY5FUm+V9/zueGMdpxm8BvqjNI68tona7fvx0m7zLgJyX
	V5mLU9l1g1xEKBhU1YYrAXCIiSg+z5JRpZ/j8dphhskIWqJdc9/mVhHwoR+r/0mJmV6lJCZpwAg
	ZbFahNvTF61IMzQKQjNj7cz8mV64I05ulqhFUsn7NBWCrz/GMjKsd0KntXaCU0/v/csKDgS4oc8
	oxCW/VeGJai2sFU18bA/ZFV3Mw=
X-Received: by 2002:a17:906:1708:b0:b98:528b:8462 with SMTP id a640c23a62f3a-b9a65c3b807mr175570566b.55.1774443209968;
        Wed, 25 Mar 2026 05:53:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:74e2:2425:51dc:4aed? ([2001:8b0:aba:5f3c:74e2:2425:51dc:4aed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871003sm795954366b.54.2026.03.25.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:53:29 -0700 (PDT)
Message-ID: <181c419f20d806fea2a81c2b1ee18774fbdd0b2e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: fix buildpaths QA with LTO
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2026 12:53:28 +0000
In-Reply-To: <acPYkLXfOoJmv2lm@heinlein>
References: <20260325113951.1278864-1-patrick@stwcx.xyz>
	 <acPLE7KjSfvxXthX@heinlein>
	 <9a222b692f97515655dd8dad792246068410d660.camel@linuxfoundation.org>
	 <acPYkLXfOoJmv2lm@heinlein>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233903

On Wed, 2026-03-25 at 08:44 -0400, Patrick Williams wrote:
> On Wed, Mar 25, 2026 at 12:34:52PM +0000, Richard Purdie wrote:
> > > > With GCC 15.2 this can be noticed by setting many meson-built packa=
ges,
> > > > such as systemd, with:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 EXTRA_OEMESON:append:class-target =3D " -Db_lto=
=3Dtrue"
> > > >=20
> ...
> >=20
> > We're not seeing the error with OE-Core today in any of our automated
> > testing. Reading the above, it implies that we should see some kind of
> > failure with some components auto-selecting it? Something therefore
> > isn't adding up.
>=20
> I tried to give recreate instructions here.=C2=A0 OE-Core doesn't actuall=
y do
> this so you won't see it unless you enable it.
>=20
> OpenBMC has a large number of meson-built packages which are generally
> safe to enable LTO on (but in the past I've ran into issues with other
> packages not building with LTO; now with lto.inc I should revisit this).
>=20
> We have a global enable for all meson packages:
> =C2=A0=C2=A0=C2=A0 https://github.com/openbmc/openbmc/blob/47d900012a93d7=
9ab536ca172fc01cd89645a0d8/meta-phosphor/conf/distro/include/phosphor-defau=
lts.inc#L153
>=20
> When I upgraded to an OE core that had 1797741aad02b8bf429fac4b81e30cdda6=
4b5448,
> almost all of our packages started failing with buildpaths.=C2=A0 I was a=
ble
> to track it down to this problem.=C2=A0 systemd and libpam are two that a=
re
> OE or meta-openembedded packages that I saw fail this way, so I gave
> systemd as a clear example.=C2=A0 Like I said, we have a lot of packages =
in
> meta-phosphor[1] that we have enabled LTO on and they're all failing
> with buildpaths QA failures without a change to pass along
> DEBUG_PREFIX_MAP.
>=20
> If it helps, I can upload the objdump content.=C2=A0 There was DWARF data
> being inserted by the GIMPLE intermediate which wasn't being stripped by
> the linker that had my build path in it.
>=20
> [1]: https://github.com/openbmc/openbmc/tree/master/meta-phosphor

My question still stands though - why don't we see this with systemd or
libpam in OE-Core?

You're asserting we need to add this to our default config as the
output is broken. We don't see those failures anywhere in our testing
(which definitely includes systemd).

Are you passing specific config to systemd or libpam to enable lto?

I believe that if this breaks when you set certain configs, these
workaround belong with those configs.

Cheers,

Richard





