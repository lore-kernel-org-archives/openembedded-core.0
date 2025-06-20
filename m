Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338FCC71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 08:50:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3388.1750409426746317179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 01:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DJ20l0xN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54700a463so893309f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 01:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750409425; x=1751014225; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ymOdN8wTv8XOpc8ANdlExKeBfz7WlOQzeiJo3cu/Ads=;
        b=DJ20l0xNUOFDkvt1teIeojfUsNij1DTcRb396pzaDH0+UKHBr9QRLNmJwzI5MQ9qNY
         KffPDkMrnrdNHGSGfr6JET/sEVEyUT7esarrs/zlDyo09rCFkmGLA1dlgw+WoLEW3b8/
         IWonh41BdzYP8ZBv3hZpuNPqJmy6J0YLq0+gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750409425; x=1751014225;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ymOdN8wTv8XOpc8ANdlExKeBfz7WlOQzeiJo3cu/Ads=;
        b=v6b3mXQjyCmUa3I2Ug7Yk5wu4SRYcOfscTQLeKX2E9tOy7yquOTLTV/KieA2zOHyBD
         RhDHpFEUMW15iu4pOPr+mURXPVphwi3wlh2LZ7/F9xRanM/HEzn/5ik/xmonLn1a8MEv
         micZNkc5HYSmMzhKsTTvEgWiJvAGlgx0zqOSg1dcBU1PX/jKTeopAvhIaquhZ/LTDniq
         idZfoGyQzAjxrRrM0fA1mX255CFZLeJuEBzi/cq4SEFc4fc3CgBvMQ8/4O9LRhmcvA5D
         269PMTOJdj2LwpuKf237hAukE3IK1Sq+DdYp0sDe4/RoPb4qd4npB6zA9dX1M4iAaM0N
         /cCA==
X-Gm-Message-State: AOJu0Yy6rydjbWiFgmvj1y/vLyq+aOAN1+S/wcBdQBb/8aZcSXLjBWed
	sXWMBwjJrz3IyTSx6Y2a/7yAO+q/I5u7Wdp6PlDoZXprEI6azCHaDrJcM9Vex2Uw5eI=
X-Gm-Gg: ASbGncs8nKGyqoBrXbWRc1k5fHkaKwFx2BNv6VbEzr/YG4SEkxrdOAvjeaSAnn2NfYG
	q9jx95rzBgDKmp1OXHY9xcrfM3RZRmx0B90BznWz4CUZKy/Y7UEfl/TXqqpNIsvWb+8z1Ep8wFs
	79C+3u/p0YYrVgCnYRC7ypr/bHfdjBY9XC6eYsTUQrU4AyHk9rd9t0+6hakxzryeiakaqs4TvEl
	wXzZHHFDPrdRqUL4Oi2q9tP0z1fHpx/JA6TySzMgHfVNUgZLQ7YHVFT/bVfrCXgJvUggMnUtYi/
	zx28VHOPm+Jhe4D3677bV2Qnxfpx97i18IlUVhtO2YOJw9Oa8IyApq01S58SWEmaEMsVcGftAk1
	SB4Y8Yfxr0gofq2YdQJIC31rlgvyJSioRapBzQbw3pmgPNkUlmqk=
X-Google-Smtp-Source: AGHT+IGZY46nWX7k34dQrpJOeSm6Fp/gRbXv+stjsPE6PtFxz+vIBtYKDJSUFp5V64akgpGk5sGTJQ==
X-Received: by 2002:adf:e19d:0:b0:3a4:e624:4ec9 with SMTP id ffacd0b85a97d-3a6d27798aamr988448f8f.3.1750409424877;
        Fri, 20 Jun 2025 01:50:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b606:370e:6752:7b3d? ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1188804sm1431232f8f.79.2025.06.20.01.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:50:24 -0700 (PDT)
Message-ID: <850a68b08e1cdd1b65e251adf83a62ff928ad070.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] scripts/wic: fix calling wic ls|cp|rm|write
 hung in bitbake task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jun 2025 09:50:23 +0100
In-Reply-To: <43ccd2fd-7861-4966-8931-6a08e8544993@windriver.com>
References: <20250616081245.1565935-1-hongxu.jia@windriver.com>
	 <A2AB1D35-6090-4E27-A00F-5A69851CCE72@arm.com>
	 <43ccd2fd-7861-4966-8931-6a08e8544993@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 08:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219118

On Fri, 2025-06-20 at 10:46 +0800, hongxu via lists.openembedded.org
wrote:
> =C2=A0
> On 6/19/25 21:30, Ross Burton wrote:
> =C2=A0
> =C2=A0
> > =C2=A0
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the
> > sender and know the content is safe.
> >=20
> > On 16 Jun 2025, at 09:12, hongxu via lists.openembedded.org
> > <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> > =C2=A0
> > > =C2=A0
> > > While calling wic ls/cp/rm/write in bitbake task along with
> > > do_image_wic,
> > > it hung without return.
> > >=20
> > > Due to commit [2255f28b57 wic: add WIC_SECTOR_SIZE variable][1]
> > > applied,
> > > It calls get_bitbake_var in `wic ls|cp|rm|write' to define sector
> > > size.
> > > By default, get_bitbake_var starts a `bitbake -e' to get
> > > variables which
> > > triggers nested bitbake in this situation
> > >=20
> > > Refer `wic create', adds option --vars and --image-name to
> > > support to
> > > read bitbake variables from <image>.env files
> > > =C2=A0
> > =C2=A0
> > Does anything in core replicate this, or is this only a problem in
> > your custom tasks?
> >=20
> > The commit message is confusing as this doesn=E2=80=99t fix wic hanging=
 in
> > bitbake tasks, my understanding is that it gives you a way to avoid
> > the deadlock instead.
> > =C2=A0
> =C2=A0
> The hanging was caused by nested bitbake, while calling=C2=A0 wic
> ls/cp/rm/write in bitbake task,
> =C2=A0
> and wic ls/cp/rm/write start a `bitbake -e', there are two bitbake
> actually.
> =C2=A0
> The `wic create' use option --vars and --image-name to read bitbake
> variables from <image>.env files
> =C2=A0
> other than start a `bitbake -e' to avoid nested bitbake in this
> situation, this commit just refer what `wic create'  did
>=20

I think what Ross is asking/getting at is why aren't we seeing this in
our automated tests? What scenario causes the problem to occur since
this is the first time we've seen this reported but plenty of people
use wic including our tests?

Cheers,

Richard





