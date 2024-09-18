Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F112ECDD55D
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 21:38:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5416.1726695479719044249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 14:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L6I9mkc7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb2191107so813955e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726695478; x=1727300278; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+jm4tXTei6G39n9ZFiKi26JWSgdVtf8Jm4wG39JY8Yg=;
        b=L6I9mkc7Q4E0JnBmN/zrNeyUlxP75h8cf+pQZon1EUVtwNcPDPbFN8ykcozqKNiip/
         P4jV82BW4jZDvT8LW9N4YlJYvgcjO9OTFDqh5SqiPA7/XPjj13KX+3tnTlY1CD7JRuI1
         THfL7y1rcEA7gLTOEo2kub3EUW7uNd9rjcEV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726695478; x=1727300278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jm4tXTei6G39n9ZFiKi26JWSgdVtf8Jm4wG39JY8Yg=;
        b=bmuR3CUazIjXHHh0asbbZh1Ae6R3Spb6uO8fgkBOc3wSdVk/1YNRtXth2ZLwSQy3E2
         X4e3F0BNfUipVAzG2p9rgoaDXI6gdyhxUQ4M0vznBn4hm+YeDkT5ZM7SUFqhGQZ9qOnF
         0nPQbjmK7n5U5OxUR0w+vYpfI93c7DADtWl5GHvNLmvgyxcejw/yd4KZhc+b7Ym1xHOL
         Q1vCu6XljCZSwumm9biD7nLH/xlCxovP8SdxXaetaHWx4HjwCE79T3S1YiVA4xCLguQd
         BwuS/tANpGsiwl21abMvAwiLj8okBPabrVQeBpvHSOI6FkNbGQ5Y4R/nE2i46k0ZLO95
         xhoA==
X-Forwarded-Encrypted: i=1; AJvYcCVc7nVPX8aFpJZM5ysXz01P3cFgzktC/aNuSz7aClecLymEXZzFiQI7GS662gWEVh4LPmTY3Li4GjcRFw5kEWg0rQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzG9R5VnYTYnz+AqOYxmsMJvxotBwFQyoLJ5m5+dgV5TAthJ76M
	4/uoRXdhFO8IIdegehlQIA6ALWie2Trk3Gz5n1AWww5rRg6cBya21FxlPNFSdbg=
X-Google-Smtp-Source: AGHT+IGYDOHeMzOP3hPvUAaiOBkhfGt8Szur8cFoVK9XuOSClFsvSyoVi2+YWQLPNC2IIQnnPIAwtQ==
X-Received: by 2002:a05:600c:4695:b0:425:7bbf:fd07 with SMTP id 5b1f17b1804b1-42cdb4fb710mr180039655e9.5.1726695477899;
        Wed, 18 Sep 2024 14:37:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2611:1b35:d82b:530d? ([2001:8b0:aba:5f3c:2611:1b35:d82b:530d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e4e1sm3770035e9.10.2024.09.18.14.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 14:37:57 -0700 (PDT)
Message-ID: <d86507587d62b184c1b111cd64519bae6dd375bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 0/7] Add barebox bootloader support (and
 testing)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Sep 2024 22:37:56 +0100
In-Reply-To: <fd3fff67a52a117485497a3e4ca6f098c298dfc3.camel@pengutronix.de>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
	 <fe63f607a4f3f521e51c6ff2724bbd537977a5b1.camel@linuxfoundation.org>
	 <b7e336daaa8aeeec62bf43da2ce4abccea3e15cd.camel@pengutronix.de>
	 <1729b516f6afc04a83158f59f473a668860137b4.camel@linuxfoundation.org>
	 <fd3fff67a52a117485497a3e4ca6f098c298dfc3.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 21:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204655

On Wed, 2024-09-18 at 13:45 +0200, Enrico J=C3=B6rns wrote:
> Am Mittwoch, dem 18.09.2024 um 12:21 +0100 schrieb Richard Purdie:
> > On Wed, 2024-09-18 at 12:39 +0200, Enrico J=C3=B6rns wrote:
> > > Hi Richard,
> > >=20
> > > Am Mittwoch, dem 18.09.2024 um 11:11 +0100 schrieb Richard
> > > Purdie:
> > > > On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via
> > > > lists.openembedded.org wrote:
> > > > > This adds support for the barebox bootloader (and tools) to
> > > > > oe-
> > > > > core.
> > > > >=20
> > > > > In order to have proper testing, this extends oe-selftest to
> > > > > allow
> > > > > basic testing of bootloaders. While at it, cover both u-boot
> > > > > and
> > > > > barebox.
> > > > >=20
> > > > > v6:
> > > > > * replace barebox.inc by barebox.bbclass (move content of
> > > > > =C2=A0 barebox-common.inc into .bbclass and .bb files)
> > > > > * support for UNPACKDIR
> > > > >=20
> > > > > Enrico Jorns (5):
> > > > > =C2=A0 barebox: set default BAREBOX_CONFIG for qemu machines
> > > > > =C2=A0 oeqa/utils/qemurunner: support ignoring vt100 escape
> > > > > sequences
> > > > > =C2=A0 oeqa: support passing custom boot patterns to runqemu
> > > > > =C2=A0 oeqa/selftest/cases: add basic u-boot test
> > > > > =C2=A0 oeqa/selftest/cases: add basic barebox tests
> > > > >=20
> > > > > Marco Felsch (2):
> > > > > =C2=A0 barebox: add initial support
> > > > > =C2=A0 barebox-tools: add initial barebox tools support
> > > >=20
> > > > We had some testing capacity so I ran this through automated
> > > > testing.
> > > > The one issue that showed up so far was:
> > > >=20
> > > > https://valkyrie.yoctoproject.org/#/builders/29/builds/174/steps/13=
/logs/warnings
> > > >=20
> > > > which is at least easily fixed! The rest of the build is still
> > > > going.
> > >=20
> > > thanks for the test run and the first result.
> > >=20
> > > Indeed, looks easily fixable =F0=9F=98=89
> > > Is it worth a v7 or should I wait for other results to show up?
> >=20
> > Most of the tests have run and there were other issues in the build
> > but
> > there was one other issue I noticed:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/54/builds/149/steps/14/log=
s/stdio
> >=20
> > which is a missing maintainers entry. Probably worth a v7 with
> > those
> > two things fixed.
>=20
> The test output says
>=20
> > Unable to find recipes for the following entries in
> > maintainers.inc:
> > barebox
>=20
> Could you give me a hint what that means? The barebox_2024.08.0.bb
> and the change in maintainers.inc
> are in the same commit. So I am unsure why it does not find the
> recipe.

It means the recipe is being skipped in the context of the QA test.
This means there is a maintainers entry but the test can't see any
recipe to match against it due to the skip.

The test is there to ensure when we delete recipes, we don't have stale
entries in the file.

Can we provide a config that makes sense for qemux86-64?

Cheers,

Richard



