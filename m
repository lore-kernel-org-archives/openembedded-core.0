Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C27C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 22:54:24 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.4853.1702940061171690804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 14:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bKnDLJXA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c6a71e88cso48292555e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702940059; x=1703544859; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PcwXQZmkZIWiXV9cpWQzNlGgbetwQqhF6iY3oexb/NU=;
        b=bKnDLJXAKV6asZ/ZiLx200FL0x4bUgOSWtoadZIqKv28JFkQ5NNwCel7K2DUKJPFd/
         3suIMqqZ3py7tcVvxC1eClqP77jZ1GPRDIRgS5hpTglGaF2PgEEpHT3+Jy8skefTAoDg
         HL9Au1F6UC4oMENRUW04bdxWp+adVkwm0HZ4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702940059; x=1703544859;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PcwXQZmkZIWiXV9cpWQzNlGgbetwQqhF6iY3oexb/NU=;
        b=H9+rOkvslgN6EAxN97h54N+uW8k9kfiAu3oivFmy2Pi4+zYpTp14UxwTUMw0Ii+8p7
         6Tv3h3PaVjY73L1RLryTSrsAw2cDtKPsuqfzb5s+zGv4aw0uoTbk440f7H43zU46FbK2
         D5608O0ZtiqZe1jmwz7KK55gZBkhyZDTC2LpFjCG5Jgi9x0/bJRRjQ8ImvFbWCvoKial
         5RlBpEk269qo1rwEYLfBePJmq5TTGw6TrVSTNdsEe5kIOWSEErOoRqfjTG3Vg1N766Y2
         rY/ibAyleRjyP2L0W5gEAPwoNm1ikGh2XrCyS3e55+dfsiG7E3UBjrW/n7XVYbCrR70Z
         mx8A==
X-Gm-Message-State: AOJu0YyDj+Fv9jjr3LNnj6LvlBVxd7UnTsDQS6CnUt1oGF2DjdI51O9X
	IMIPNFIvEglzHO6cnROvO/CJYA==
X-Google-Smtp-Source: AGHT+IFuyf84CwP06ThHBMZ1rAQfnQB4b7P36IV/jHYVlhXkVCW3pe+TgiNXlNvYOURuHjmSI7HtYA==
X-Received: by 2002:a05:600c:221a:b0:40c:313a:f7c0 with SMTP id z26-20020a05600c221a00b0040c313af7c0mr10188775wml.7.1702940059603;
        Mon, 18 Dec 2023 14:54:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b0040c46ba7b66sm157490wmq.48.2023.12.18.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 14:54:19 -0800 (PST)
Message-ID: <29ecc13fb1930454f99abe592f2ef74be80ceb2b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2023 22:54:18 +0000
In-Reply-To: <871qbj5epa.fsf@draig.linaro.org>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
	 <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
	 <871qbj5epa.fsf@draig.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 22:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192680

On Mon, 2023-12-18 at 22:27 +0000, Alex Benn=C3=A9e wrote:
> "Richard Purdie" <richard.purdie@linuxfoundation.org> writes:
>=20
> > On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
> > > I tried the two patches in this series. It did improve the situation
> > > but I am still getting SSH timeouts. But this time its 13 tests
> > > earlier it used to be 40+
> > > btw. my images are using systemd. So it might be good to see if we se=
e
> > > this with poky-altcfg as well or not.
> >=20
> > Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?
> >=20
> > Did you still see rcu stalls in the logs?
>=20
> rcu stalls in the kernel is just a sign of QEMU's relative inefficiency
> compared to real HW. However multiple -smp will help alleviate busy
> vCPUs if you can. If you want guest time to be a bit more realistic you
> can use icount but actual wall clock time will be longer as you can only
> have one thread.

We have thought that but I realised rcu stalls in the 8250 serial TX
path could mean something quite different, related to 2/2 in this
series.

Cheers,

Richard

