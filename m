Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D909C5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 08:02:56 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.10837.1748419367820301895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 01:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zxDMZgIz;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e98f73850so5233316e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 01:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419366; x=1749024166; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XXMq2V01078n0brPiNTlbaM19z9ZmdjtA4EDn7bK4rc=;
        b=zxDMZgIzMSxIXSPi86aIDaDmZI+0VdZXLu9yzMZc6lC1UIXFVgoTu1VIND8FDmDw+m
         oAw2iVTMgXM8DH9vIso/zbbfDLrqNKk1NSimpPmHku7DcC/tLNzGahymEASkWbyg0IjL
         1iKv868DgMkJo+qUwWKDZYn0ZVwDBYNyp1NczYyWCBk9FkaMshU2gbDskIQq+PNOQGvQ
         5FsMzTdkZDAf6hFFQVzpgGPQgSxV63YLp0Kj+mBHx+9ZXZ+BnETM3XQDMJCHQELsDeOv
         Wcwdlhx2Nq+QFRY6Zek7eT1osuzI310HUr1ZBnKqQkvVd0XfWQjgvB/eEe1Zmcn8bayr
         qGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419366; x=1749024166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXMq2V01078n0brPiNTlbaM19z9ZmdjtA4EDn7bK4rc=;
        b=iUcJKA0fYej0z9Cy1Z4mjlhpOCNGA8+OPztpFwKYQgTFFSHkqok2CoNLKpqWmgIph+
         im8e0WN6TYxCsMSL7d57P1CfHD74KQmaVvdSf6S2zCPWYJWWgEb9l/2yVm1VSCprA71t
         sbWbUSVCA8vVuHSrJLyXi2Ftjmp6eHbLWHr1/GtsdhwpdNpEcTfJqVH0rPFTQ1qMLOv1
         E7v/yWVQb5LKd92rzw07w3gbxSL/WU8aCY/yh/ocQbF55R8jst1scoK2Ib9XitD4feR0
         j7IkRDU72REVDEB6P9cRbEcyrxsbXtvG8/iIUbmtEeCBxp6wIaKDFnPT64OM6eZD4bw0
         fYAw==
X-Gm-Message-State: AOJu0YwwMP/ru/qE4uVCAXlqHrAYrHuNp0XAlLpISIaCZc2AoxJKhOsd
	pYaYHzb4H0a2LnQX5E0JVnA4HuAoRIK0HdBWTGnEGr2cPjNI8DfSP23aK39z6ZewlEo=
X-Gm-Gg: ASbGncveGVpYu2zeGVyW6UbA1lECv4H4BfWBySA6yN97YpXIe1L714pwVsvNPFN5vF3
	wH88if46CFgphJx5mHWQJAT8M2E/ecKM6E73Rq29x4DTPMfiYSKRlG693euK09DaLgDa9abVdrz
	+u6QMRkD5urMAhNLoIRDDfXujuvy/6o8lxE3p524S53xi7szWuih0wI6rXxj/pTuhnqzYqPg1r3
	vVa+h747SUa44oE/u7fhJFk9oxKr8HfnG6KEGdLqntp5IWLdqFsXicShLlg5pr70gBXKPfppYBe
	CZvdB+8nqEhpDXoMPGNj/9d+PIrgRAhHgPCrp4V/DDX62EmH405RdvrYAeFAdcAMUq97D3pxCFS
	s8Op2rDqY
X-Google-Smtp-Source: AGHT+IHHE4EOL0Zo1juJ6HW82LJSTSZRtGF5YEcg2PUHvzYGKarAwS/Gf4yhkXTmwZqfJdBsD9zjgg==
X-Received: by 2002:a05:6512:4022:b0:553:2767:e398 with SMTP id 2adb3069b0e04-5532767e4bfmr1989182e87.39.1748419365753;
        Wed, 28 May 2025 01:02:45 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f61c919sm170125e87.4.2025.05.28.01.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:02:45 -0700 (PDT)
Date: Wed, 28 May 2025 11:02:44 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH v4 2/4] qemuarm64.conf: allow overriding QB_OPT_APPEND
Message-ID: <aDbDJL1_WqIy8ttT@nuoska>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
 <20250526083548.413834-2-mikko.rapeli@linaro.org>
 <20250528005247.GQ100073@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528005247.GQ100073@bill-the-cat>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217338

Hi,

On Tue, May 27, 2025 at 06:52:47PM -0600, Tom Rini wrote:
> On Mon, May 26, 2025 at 11:35:45AM +0300, Mikko Rapeli wrote:
> 
> > It enables qemu USB support which causes a reset
> > loop currently with u-boot.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/conf/machine/qemuarm64.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This too feel like something that should be brought up on the U-Boot
> side.

We saw these issues in 2023 on qemu but thought they were specific to our
Trusted Substrate config with tf-a, OP-TEE and u-boot. Some public info is
in: https://linaro.atlassian.net/browse/LEDGE-435

I know USB support is really tricky with timings etc so I don't expect
it to work well with bootloaders. Hence did not dig deeper.

Now that I saw this reset loop with KVM I will note the details down
with reproduction steps and send to u-boot list.

But I think overriding QB_OPT_APPEND is handy, wether it has USB setup
or something else. Other layers in yocto ecosystem use qemuarm64 as basis
machine with testing and may want to change this.

Cheers,

-Mikko

