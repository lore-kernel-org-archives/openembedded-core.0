Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6C5C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 11:10:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.182398.1703934638221504619
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 03:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hb5QMu1s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d5b159497so38284115e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 03:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703934636; x=1704539436; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ybz11JPLDVLkSd2emGyeLX5FfFWMR2dMCzO8PXj75TM=;
        b=Hb5QMu1s66PyQETMpIXUuVOAoenPZHxNT2QHpAokuxLDYWhxedz3+EI2iLNew9kmxy
         72t7bvW6fsKxxMzLjRSxpppOYejnjnPRKPMlKEQoS8ZWSKeYaJJzd1QpYKgNauOvEUdK
         d+WQle9RD7P1yo1/zq4QzC0yoiT5M91S3X2Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703934636; x=1704539436;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybz11JPLDVLkSd2emGyeLX5FfFWMR2dMCzO8PXj75TM=;
        b=UCSlJS61uD9BIYPZKOagQ5YSnlerjlDFFFzzruN6GpLc2wjSg3YFGqcN4yuJjAvVaD
         r5kAKIdo7aaWPBPSgjwrAM6ZvopxPBO897vEsWIsLjqeNgOj6Rrr8V270hgd+gz3lvZE
         OtGKcdpwsC89MOpiUSNzZTy5QI0hzo/xoXGMuXH9Y32GkHyAZL81wCj5DU12oA1PNm/X
         IfBWC7XEnw4cEwsMvmWzpMnT7hz0DiGWbSUsaXObascTnDxI2mFKqffoKkCYD3ymbaa3
         wLEYs+21pMs9Cb0sGPnnMI1AVgdRohxVq8NtTuJzmQyqYDVflxPaHxxabe3aQqJ3Wa04
         cKsA==
X-Gm-Message-State: AOJu0YxB9ty0O2aul+abMl5Xn+wa0cBnU8cMcjFEJnculXjDqsiOw5XZ
	0uMnPxG0faCnoEFjZC89a32tXXL4EPvt/g==
X-Google-Smtp-Source: AGHT+IHpPe2L6IUMxMix9kLL/6qDm3pSG2rwgL/N6FWTXeFhgX/6u96kC8d99E8X2WTH0xuoqHVbbA==
X-Received: by 2002:a05:600c:6019:b0:40d:71ba:2e50 with SMTP id az25-20020a05600c601900b0040d71ba2e50mr1217550wmb.49.1703934635765;
        Sat, 30 Dec 2023 03:10:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a152:ea8e:7a3:4258? ([2001:8b0:aba:5f3c:a152:ea8e:7a3:4258])
        by smtp.gmail.com with ESMTPSA id l1-20020a05600c1d0100b0040d5e53d7c3sm11972354wms.23.2023.12.30.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 03:10:35 -0800 (PST)
Message-ID: <8a7cd874913b216399066b9e282bf89fa273cbc9.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 03/10] meta-selftest: hello-rs: Simple rust
 test recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Frederic Martinsons
	 <frederic.martinsons@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 30 Dec 2023 11:10:34 +0000
In-Reply-To: <CAO5Uq5QZd09oJry2k2HQxhrpaBqdX_9G9fc31hJM=8L2=NV5Hw@mail.gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
	 <20231229114435.27810-4-alex.kiernan@gmail.com>
	 <CANNYZj8mZEE=6e4umfXWFKKyMwHfDm9r6wVuFp67qfnm+qZU4A@mail.gmail.com>
	 <8aa0cefc25134f97e7bb0b9af30dc19eb516b74f.camel@linuxfoundation.org>
	 <CAO5Uq5QZd09oJry2k2HQxhrpaBqdX_9G9fc31hJM=8L2=NV5Hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 11:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193069

On Sat, 2023-12-30 at 10:40 +0000, Alex Kiernan wrote:
> On Sat, Dec 30, 2023 at 12:41=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Fri, 2023-12-29 at 14:04 +0200, Alexander Kanavin wrote:
> > > Reproducibility exclusions should be listed in the test itself, so
> > > this continues to be built in regular world builds (otherwise it may
> > > silently regress).
> >=20
> > FWIW this is what the zvariant recipe was doing and the recipe is in
> > meta-selftest...
> >=20
> > I'm torn on it to be honest.
> >=20
>=20
> I'm fine with changing it (and I did basically copy from zvariant
> without really thinking about it), but I do feel that leaking what's a
> pretty poor recipe name (`hello-rs`) outside of meta-selftest into the
> wider ecosystem wouldn't be ideal as the recipe itself is basically
> useless other than for this specific test purpose.
>=20
> Mostly I just want to get the series merged before anything else
> changes and we find yet another thing which needs fixing; also I think
> I've got 1.75.0 building now, which obviously sits on top of this
> series!

I agree, it doesn't really change what we're doing and moves things
forward so I'm considering it as a base to build on if/as/when we can.
As such the series merged, thanks! :).

Cheers,

Richard


