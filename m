Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058F4105F79B
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 11:23:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13591.1773400997300364488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 04:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hf1TGCBU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so5103415e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773400996; x=1774005796; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eN8qXNIn0kBdV+2rv8OK7FGhzK78LhUFsf4YPTs2Jfo=;
        b=Hf1TGCBUDzf9Jx+SZ/iCaKMX0OgTvJFv/4/PReK/kW/AmI/n+rwZv8wMLJvoAbmUs4
         8CyfKC636rht65zGZvhkvcr0BGcp6d6RJlhxSrsJdBuaxhFx33auMZaMOmglsAXWTS7n
         LXkgQQ/fxhezkeP30ndCJ8KdnY4yTbv0jo0Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400996; x=1774005796;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eN8qXNIn0kBdV+2rv8OK7FGhzK78LhUFsf4YPTs2Jfo=;
        b=CIsayvuX16pqEugjsRrT9gecZwP06LiZSTsSAGblOClw0tEfEpsCtUHRdGL70/wM9I
         jBnVSV5VzjTt6TWUzqMoSm8ZlMZaJ8rVV7mU/V8MA3h4RI6rIXURw52OqKubcYasYCu/
         Ci0MRKKTWYTUnmvyVVwBrgmBiFrFmI4DEwpYaaY5bCBGZWqzEdQJohrd1iVa/oh6nTOj
         UAmQ2gGu+YXX6TWsFHDzK+7VcX3rgwZlsrNsBYWwNlPPkLV2cL5vcrYEsLL92Gzf3e7y
         U9VBIbEvZRbTe2bApKeCbjpkEwHL9Nrsxt/xXOAJZgi/+gfCmHVAybkty/TKG880Z1U4
         ptdg==
X-Forwarded-Encrypted: i=1; AJvYcCXRbLIIeCq2PyNih7jtlgJr7EM648wluk/HWN86YB4KLYeJ3wEijBJjHYJMAmY4UDRIp07w/1gSdYvmgSU67aNg1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+xP0jMWdolVkTr7jaBMdvY8Q/p7frptex4UBunLH9yb8ua4y2
	cCW0HN1lf/RAZJx0IouMtCuejC8q4Hlch+EfM3Kw3KfKMuRb8c+OUH6T9Zf0N6uLv3A=
X-Gm-Gg: ATEYQzwRGp4gwf0LFGo/mTQJ/+sFCxdXkVqaXrO5VWDfgpUwIhuLvnGkKxjbROKlIuh
	AiBIrqqscfETZKYY+yZmoJ0Vs27TRdqlJdkl7SERN0oAN0z8BUuasXlUx7oxOV1FqjU1W2rmac7
	gLu4RURpg99a/fzgeurqxe0V9gstEjSeRB+fAj3YmwGvF2xcgZPteSrQ4Obwtqd112g+cLQGAjP
	p53O+sEUnKRb2OZVYfpEqPERgyT28lOgfXWXVLu26faZ2XfwIE43guR4wAcZNHX3Bjq+0mu9ulj
	kWw2DmdYPzlQfSrLEUO9zByClLQudFuHZ4n+BDNep+UicANqwaE48oshPszCedb5KzGi2BGLd0D
	dLZKaWYxxc2+KPqQezv4a4ideNcScjh3b9Wz89NKFWF7ETbhFgnK+ayMKZQ6Ea6M803ih09Vq4r
	fDetH5hpWKJ+Qi2xAEP/fvlx3r1pnXx6xJGWsbXr95CDAIjW/yaNVKENTnfD/CPyKZWESRvkuTv
	hV3c+BV+T3+oI8=
X-Received: by 2002:a05:600c:4e16:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-4855670cd92mr42293105e9.30.1773400995560;
        Fri, 13 Mar 2026 04:23:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8f77:c880:e027:e164? ([2001:8b0:aba:5f3c:8f77:c880:e027:e164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6e2b1sm17298705e9.28.2026.03.13.04.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:23:14 -0700 (PDT)
Message-ID: <40ebc4d041650d232f7ebd9c95d9fbe9d202437a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] Rework WIC sector size
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.hatle@kernel.crashing.org,
 openembedded-core@lists.openembedded.org, 	twoerner@gmail.com
Cc: mark.hatle@amd.com
Date: Fri, 13 Mar 2026 11:23:12 +0000
In-Reply-To: <1773361726-30192-1-git-send-email-mark.hatle@kernel.crashing.org>
References: 
	<1773361726-30192-1-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 11:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233041

On Thu, 2026-03-12 at 19:28 -0500, Mark Hatle via lists.openembedded.org wr=
ote:
> This work is effectively based on the 'v7' of the 'standalone wic'
> submission.=C2=A0 It was requested that the submission be broken into
> individual parts so we can review and get merge things individually.
>=20
> Changes from v7:
>=20
> Introduction of additional (previous implementation) vfat 4k tests.
>=20
> Update the test suite to add a new cmdline argument test in addition
> to (not replacing) the previous variable version of the test.
>=20
> Update the test case to include fat partition tests.
>=20
> Cleanup Deprecation message so it only displays once, if the older
> style is used.=C2=A0 In v7 the message may have been displayed twice.
>=20
> Mark Hatle (1):
> =C2=A0 oeqa/selftest: wic: Add vfat to test_wic_sector_size
>=20
> Trevor Woerner (1):
> =C2=A0 wic: re-implement sector-size support

Something in here failed in testing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3519
wic.Wic2.test_mkfs_extraopts
ERROR: A sector/block size is specified in both the mkfs-extraopts argument=
 (-S 1024) and the wic arguments (512) and they do not match.
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3401
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3292

Cheers,

Richard

