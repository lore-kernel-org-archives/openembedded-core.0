Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE61D33985
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 14:01:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.52544.1730124061067920318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 07:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DOug98a5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43159c9f617so42676315e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730124059; x=1730728859; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZpebxnnC/nTRjh2SP5c40WaYuSJMi3T0itJxbxYPVM=;
        b=DOug98a5PE0BjH/3CXvucc7wfbV92bd0qg4IwLiHotrYusNxmIt8cENhIeOz7z6NNp
         i/y/tnIYXcKx93Ebfx3TKZ95El9kn/OPQOF43+6AmmipR06tmGCYjcgr2KUVDfx/tzT9
         +PhZ3MIrZZZdni7htq3BTIbP627e/5CQ3pTG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124059; x=1730728859;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZpebxnnC/nTRjh2SP5c40WaYuSJMi3T0itJxbxYPVM=;
        b=uua9wIKYzxBRBdcvMHaJHoIf9t/whRvhRPeCC7CEND141ee/VasV5aAPjfqC/Zf/Xs
         2L1d1j0aEFENrirz1ArIiSIP6D+68ZHonB+VCz80Rrpq9MnGwaL8h/63q0YDc00HVh5T
         7WoSJv7tEJHefZQyUrTOhWlssJnY7F1DEySIME+1q/n2IviomHSe8fIyMVHhbmiZu1cp
         5yAozR5SZxKvec4BZEIQhFU2lR2Fye7LlfReGv7gf9joLMRhtOxSqScMEeeKifm8OkOu
         JnzGWuxm08yP2UGBnshHswiOdpyN17HtVdXWbKqrobhi9eQMNI+mGh/iGuWPmu2kjneI
         k9gA==
X-Forwarded-Encrypted: i=1; AJvYcCXcuthjuCwds31xtbUO/HwO00ZxsxzY7sKk+h2il6DljCEbBqtCq0rVIkw+TitLT8+ST8/3rWhDCgHip3pTFweMEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywpcukfy1xMJw8jc7CmYT2jU0bxAL/hQUk063iK9fwg1fWwIq3I
	BBveTbGUsRoo9OGHCnMCSzVx4xLLH+OWO7laFK9NxI6XDotP4ijs7m59GwbquBPrY/a9HJhPvbr
	e1hM=
X-Google-Smtp-Source: AGHT+IEFAWyD0rqOZ7Z92CmiBl+CmYya+TaOfrbybgtF3T29mvNCp//SIhyY1CTdHXlcST+jtT/dyA==
X-Received: by 2002:a5d:6192:0:b0:37d:4956:b0b4 with SMTP id ffacd0b85a97d-3806122fc7emr6821945f8f.59.1730124059298;
        Mon, 28 Oct 2024 07:00:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:509d:a248:a274:a307? ([2001:8b0:aba:5f3c:509d:a248:a274:a307])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4319360c10asm110341375e9.43.2024.10.28.07.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:00:58 -0700 (PDT)
Message-ID: <db25f4536fe3873d533615ae67b6076f46c35769.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] rust-cross-canadian: Fix file conflicts
 for arm and aarch64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2024 14:00:57 +0000
In-Reply-To: <27982.1730117097339815527@lists.openembedded.org>
References: 
	<PH7PR11MB6449E0F570031C6CFD50D6A48D4A2@PH7PR11MB6449.namprd11.prod.outlook.com>
	 <27982.1730117097339815527@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 14:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206446

On Mon, 2024-10-28 at 05:04 -0700, Hemraj, Deepthi via
lists.openembedded.org wrote:
> Hi,
>=20
> I have verified that the issue is reproducible with the latest
> sources, and the patch provided above resolves the issue. All
> necessary testing has been done, and the results have been addressed
> on the same thread.=20
> Could someone please review the patch?

I've reviewed it and I believe Ross' feedback stands. I've tried to
explain why.

Cheers,

Richard

