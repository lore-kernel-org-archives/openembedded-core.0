Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1709C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 22:10:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.101563.1738620637077877820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 14:10:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uh2evpK8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso3895394f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 14:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738620635; x=1739225435; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TNBlyOcZTB0DD0tkvJntYSRRubuaPtZTJfBeZAbKxc=;
        b=Uh2evpK8P7GOa9xLmX810oJJ9d9OT2LrjmYaZoA9IGIwv/ljWM4Xmv8cOMTgSuMUkP
         KJMYbaQQ19zhnLjtuV5ECXcgFyx02kP7TdYBxa2NqRjG2+Y8+5MnHDBC3D6HPEdpWfxK
         eSFtuZKUk32pfHjbj6qNJaMFRBKcmONs49JNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738620635; x=1739225435;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TNBlyOcZTB0DD0tkvJntYSRRubuaPtZTJfBeZAbKxc=;
        b=GxZ7W2z/+QKqJBBXxt4wbbm6o8/EY8zszOn3YquZrtmwtgo9nUX5ZDAF1Qs+0Pbhy4
         Iv7W1FpyfkMFTW3dftaFUJXQpRgdQh1y8WV8Re3xZcDwQakea1KX6DahVXBIJ5ATWs9V
         sW/OnzdbbCrozthzLL08vbnfKMIy5xvGUGKg4CvEc5JasN5rsT0jm2MmrBnw3UaXPhtw
         NgoMmlgFA3cg9aekRdLSC7Ubi81YXK9lgJrTrRO4VMY6avdXCyGRUYxMgGhBXj/3shh7
         uMGeAOtRS+0mpq4xxX5rn+SB1fOAAE5L49VZPUJY6ghOVOuZzp40OdDuTFJi85J+swWH
         ZjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkE8v55MHmI6p/K8R1S257O+BgeP7UP3TU44co2dWYcyxGcNv+EjpPWojcNVYeuej2K/LiXsjk/Er72NL7wYRNDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YypGXbGhYKI8tTnDxuKRP/YKYfsgSFrysEC9RRknP1bTAs5zzjd
	jmCw9XZdNHSdNOhuSLgO3cD1OC2B/8fdq4kbSFKB7NOsSJIFdsIrH8nJoha6u1Y=
X-Gm-Gg: ASbGncsYxhnm0FjSJCDoO4MP92fmt7YheuR6WKQMHcz1HLuEMa7M1Bca2x3qm6e4F5/
	RTN1QXVQK+g6OQQngLDNZ5jFGaWaR1UaOrHaZHfgRg+0RhhMgDTaQ1EEMFmJ9ZqbmMbxm78AHGw
	wKoKlS4br+Ev1mNgpC9oIT9z/h6LHfwIYTOXc8hO6kutNSw62oTYpRFEkzcfsSrJrKQ5StAuedV
	cv1JjIpirQo1cC6z2YQJyKjCSPgAXGbi4XPlUMNYTL8exBTJCaaqLuNBUZMwrtj3l1cyqmDO2+d
	q2a4eskv2wVpMWEXWCLmuuZCCE/J4KWVdbkvjJR8wxd8+BFNfANEyFfH8lEgdnon/+4X0ooMZXp
	8hHuC
X-Google-Smtp-Source: AGHT+IHrCVyTEteQouXuRF7QYhqnotKQiRs38MWLZueciUEwUjTd9nm/Fj1eBwC1Ho7Bk08YIE5T2w==
X-Received: by 2002:a5d:6d06:0:b0:385:dffb:4d56 with SMTP id ffacd0b85a97d-38c520b00afmr20592363f8f.53.1738620635444;
        Mon, 03 Feb 2025 14:10:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bde2:1fee:ad0d:b0b6? ([2001:8b0:aba:5f3c:bde2:1fee:ad0d:b0b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f49dsm167731625e9.35.2025.02.03.14.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:10:34 -0800 (PST)
Message-ID: <9c3a268725aa40db3cab0578208017733bd24f57.camel@linuxfoundation.org>
Subject: Re: [OE-core] Strange behavior in sstate-diff-machines.sh
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, "Openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 03 Feb 2025 22:10:31 +0000
In-Reply-To: <DM8PR12MB543086C50EF71EBADF83E63D8BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
	<DM8PR12MB543086C50EF71EBADF83E63D8BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 22:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210737

On Mon, 2025-02-03 at 21:34 +0000, Chris Laplante via lists.openembedded.or=
g wrote:
> We are on Scarthgap, and I am seeing an issue with sstate-diff-
> machines.sh wherein the script claims to see task signature
> differences, but then doesn't report any. For example, I get:
>=20
> ERROR: base-files different signature for task
> do_package_write_rpm.sigdata between my-machine-1 and my-machine-2
> NOTE: Starting bitbake server...
>=20
> There should be output from bitbake-diffsigs after the 'Note:' lines.
>=20
> I did some poking around in tmp/sstate-diff. The 'list.M' file for
> my-machine-1 has:
>=20
> MACHINEpoky-linux/base-
> files/3.0.14.do_package_write_rpm.sigdata.af0c3fb3b1b8494fcd7a31ba513
> 495df384fdf25a8eced584e7c71d722b26683
>=20
> But the list.M for my-machine-2 has:
>=20
> my-machine-1-poky-linux/base-
> files/3.0.14.do_package_write_rpm.sigdata.af0c3fb3b1b8494fcd7a31ba513
> 495df384fdf25a8eced584e7c71d722b26683=20
>=20
> So interestingly, the hash is the same
> (af0c3fb3b1b8494fcd7a31ba513495df384fdf25a8eced584e7c71d722b26683),
> but in the case of 'base-files' for my-machine-2, it ended up using
> the sstate (I guess?) from my-machine-1. Maybe this has something to
> do with hash equiv? (I have BB_HASHSERVE set to 'auto')
>=20
> Can anyone please help explain?

I've never liked that script and personally, I've always wanted to make
bitbake's owm signature "diff" as helpful as we can. There are ton of
different things that conspire against us in doing that and whilst
we've improved, it still isn't ideal.

I'd note that the script predates hash equivalence and that can be a
big factor in things things like this. We've struggled to reconcile
some of the tools with changes like hash equivalence :(

So yes, I can imagine do_package matching between the two machines,
then hashequiv would reuse the later tasks like do_package_write_rpm
from sstate.

Cheers,

Richard




