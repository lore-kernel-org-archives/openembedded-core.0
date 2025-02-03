Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5204C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 22:29:23 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.101800.1738621755641215984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 14:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cS/jcwrl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38632b8ae71so4153869f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 14:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738621754; x=1739226554; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKjcV/On3ZUKKkSi70Kt+ipPvdaFuhUye2oj980Yun8=;
        b=cS/jcwrlxPzo+AXoiUDauBXi9yVmHLpW0LujcPET1mKg6KTBGdeL9Cx0fmnrsqrv5R
         33uJLC6jr+SKeErLlpoEti6ZXBW6/XCnpVdTATtURK8LvMvyV07CTU2tp3PVHs5XEeIo
         thkgXfRmXKn8gT1VFSqQVToxEW101pIPMAgu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738621754; x=1739226554;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TKjcV/On3ZUKKkSi70Kt+ipPvdaFuhUye2oj980Yun8=;
        b=E1rvc1LNb1LY2poKEmuvo9Kbo1gRCvn35JLPN49zpN7vGDN6Y92h2hhBOL4WhwcmQp
         3iwO/f/IROuaBmtXzghOI4dlkR+Wd0JflSgJh6xS0WxVinFeqoN9sobD2vG81Zc1xZp9
         eIi3AyKBVsqgXLNGcuhm/biQsTbx6yVHD/SLtsWhb9U1EdNiVu+MiB9bjUt1ZuJkUpmv
         hrQNAYlZY4ZRYeUBghAsCEijMM1x7UPxvlaBMorz7hupQrg33L3voHafZT44GhmbVZWF
         SRlCHdps1TB1FmuGzmMkgTR/QtSVcScrmdMAAbIyCmqIUUFAgvGM+3AzvY88HIuhFrGk
         op3A==
X-Forwarded-Encrypted: i=1; AJvYcCXDGTjHSdOJo9iAQTFW7/L9E+mJapQ8fZtocVDwUg6FVD44wxQVOWkg3HHPelyjpWDMEJiOn8Cli0qye8HOc0hqDg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrGtBaq7O2aupqevRWLjD7jnqUXufLkv+ptWDT/gk3p+r1jtCy
	EKC1sw5At/3JQ8zjSDTPgQhwyWnkV/SC0pZISIrI9JUiS3IQWMEKo934Ktks4oA=
X-Gm-Gg: ASbGncusxz6Yr1YspDWcHgOEG3b0McsKxMG+zh9LprfYkkJ0LQYweJcT615Hl55Uvy/
	YcjdjfVmzKYVj9VTKB86S6lT8Dpi/IIzdEpTZRN131i+M5b/FjRxz5DGnNyAvOdwfadve5H92Ox
	TP+AZN+golTbAGYGezQtXfZ+rVFq8uqxdjg0yWlQcOV4+Yh9GuMkTnUY/Ybzfh5Epm7H9IWD824
	W0SjZrcPJHkUyxuojHxVWIiVRWb2VSxQeTgmdYyCaB707n36YFggZK7kxa7JkzpnetmjYeOsovc
	MIpP6m3KEXwCDwRJZasJ95dQxMjbcZdQyQIJXUWrEbsaTWmmWoO0VRpUkcA/oe+fAZtl9WW0Wwy
	rI7pY
X-Google-Smtp-Source: AGHT+IEzNYmCOlh7bLJ9owrug4YynwAPcTZsnf8S3CwY1Eg7SrT9BNQ40/W3jQ8O/A2B8bktQ3Zxvg==
X-Received: by 2002:a05:6000:1f85:b0:385:f1d9:4b90 with SMTP id ffacd0b85a97d-38c51966addmr19793188f8f.13.1738621753990;
        Mon, 03 Feb 2025 14:29:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bde2:1fee:ad0d:b0b6? ([2001:8b0:aba:5f3c:bde2:1fee:ad0d:b0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c125f77sm14097869f8f.56.2025.02.03.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:29:13 -0800 (PST)
Message-ID: <5908461b69f26ee1598359ddadc15e58a9049ccb.camel@linuxfoundation.org>
Subject: Re: [OE-core] Strange behavior in sstate-diff-machines.sh
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
 "Openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 03 Feb 2025 22:29:10 +0000
In-Reply-To: <DM8PR12MB54300A067D077BCEED12ADF58BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
References: 
	<DM8PR12MB543086C50EF71EBADF83E63D8BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
	 <9c3a268725aa40db3cab0578208017733bd24f57.camel@linuxfoundation.org>
	 <DM8PR12MB54300A067D077BCEED12ADF58BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 22:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210739

On Mon, 2025-02-03 at 22:19 +0000, chris.laplante@agilent.com wrote:
> > I've never liked that script and personally, I've always wanted to
> > make bitbake's
> > owm signature "diff" as helpful as we can. There are ton of
> > different things
> > that conspire against us in doing that and whilst we've improved,
> > it still isn't
> > ideal.
> >=20
> > I'd note that the script predates hash equivalence and that can be
> > a big factor
> > in things things like this. We've struggled to reconcile some of
> > the tools with
> > changes like hash equivalence :(
> >=20
> > So yes, I can imagine do_package matching between the two machines,
> > then
> > hashequiv would reuse the later tasks like do_package_write_rpm
> > from sstate.
>=20
> Thanks for the info.=20
>=20
> Would this be the kind of thing that is best ported to bitbake-
> diffsigs, maybe as some kind of recursive mode? (Just asking out of
> curiosity - I don't yet have a strong enough grasp of all the
> caching/signature stuff)
>=20
> For posterity, I hacked up the script with this patch and it fixed my
> issue (whilst probably introducing other, subtler issues).

I'm not sure what the best thing to do is. The script can make some
assumptions that bitbake can't and does in some ways have more data so
it may not be possible but I've not looked at this area in a while...

Cheers,

Richard

