Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FE3C4708E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 23:24:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.32365.1670282679278849650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 15:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ULRsoeHP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id q7so21159573wrr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 15:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JTG5tJ9fwDxEIZ0dspEg/aiozcSZRSsNFwm1Kg6zbOA=;
        b=ULRsoeHPZZdsG36uT1QEJiGAOdLmrrEh6HeYYyqJGI6KBwRyPjl52dSj3rv7NBPsH6
         uwwAr/1VIp1HuyYJGUDmf9q5cfBPy+kQdllV5bB/9hDO23w1+fNnvmGb9bXcDIbGJWDg
         gLmyzKlqFtE+0zjFVfpxrPTB/q1aAjs4sse/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTG5tJ9fwDxEIZ0dspEg/aiozcSZRSsNFwm1Kg6zbOA=;
        b=E/8YhCrgsE+lVncPUZHmPvc3OH01foPdIrs3WfVLN+DozCeX+STXWFTPlzct/sbBX4
         uiJWTnBukTJ9KhlTr8yHANYbIavCAXRXAWVgT5knrT5u6HWomnsoSOYtVFz+ibpPzkow
         4v4t1ysyXp1z561L+xEr2hheuFpzTnn4QFUubi4ul6cSaFPqexlArBOSfDlNissMSKUJ
         Mwx9iYd8fWSuNdi1F0I5Dl/dPvbiEaDwuI37UpKVXeYlnH6h3BKtZD86mJi1qzVbR6kH
         Om8M8sfMWftnD0IYN1zn8CdkoTtscAOBoOJpw3if+wA8oP+g0bc8cFCghBNK5HLUKq7w
         TD6Q==
X-Gm-Message-State: ANoB5pnCw51ZWn4r2HNFmTjY9DByES7IgS299+Pa9laJTrENzL8bAniE
	OQANnxerPvAHWUhB3rJ+2zFmrQ==
X-Google-Smtp-Source: AA0mqf4eQ4zl+sjp2IWwZSGVS1ig/+o58cfE8reV9OIMPZU00SQqC8RcC05JiW/saZpbiPrJIZ9wBQ==
X-Received: by 2002:adf:ffd2:0:b0:236:59ab:cf33 with SMTP id x18-20020adfffd2000000b0023659abcf33mr51089693wrs.568.1670282677457;
        Mon, 05 Dec 2022 15:24:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d6:2c80:98d5:dc63? ([2001:8b0:aba:5f3c:d6:2c80:98d5:dc63])
        by smtp.gmail.com with ESMTPSA id c124-20020a1c3582000000b003cf894dbc4fsm18819514wma.25.2022.12.05.15.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:24:36 -0800 (PST)
Message-ID: <ff74b5cf9d31add4acf119c985aa1914ea71169b.camel@linuxfoundation.org>
Subject: Re: [OE-core] Y2038 proposal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Johnston <matt@codeconstruct.com.au>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 05 Dec 2022 23:24:34 +0000
In-Reply-To: <52fce46ab9bb0f8e298e9ac92a90fd06d46bd35a.camel@codeconstruct.com.au>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	 <52fce46ab9bb0f8e298e9ac92a90fd06d46bd35a.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 23:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174311

On Fri, 2022-12-02 at 16:54 +0800, Matt Johnston wrote:
> Your email prompted me to check my own software (Dropbear) and it showed =
a
> few y2038 issues to fix. Those bugs wouldn't be noticed from a quick test=
 -
> it "only" prevented auth and idle timeouts from occurring.
>=20
> gcc and clang are able to flag truncated conversions for 64-bit time_t wi=
th=C2=A0
> -Wconversion, but that's very noisy. Comparing that against a 32-bit time=
_t
> build, however, gives a pretty clean list of code that needs attention.
>=20
> As an experiment I've built OpenBMC with and without 64-bit time_t,
> https://github.com/mkj/yocto-y2038 has the results and a description. The=
re
> are a mix of false positives (particularly tv_usec/tv_nsec), but also som=
e
> real-looking things. As an example, busybox using a uint32_t to copy a dh=
cpd
> lease expiry.
>=20
> I'm not sure the best way to use these logs - they need manual review.
> Expanding the list of packages should be easy, but there will be more tha=
t
> need manual intervention to get rid of -Werror.

That is really interesting data as it confirmed there are real world
issues which changing the compiler flags is going to break. Thanks for
sharing.

What you describe is relatively easy for a maintainer to do as a one
off check but not really something we can do at scale for all the
software we build. It worries me :/. I guess the one upside is that
whilst it did break some functionality, it didn't actually crash the
runtime if I understand what happened correctly.

I'm not sure this should stop our plan to switch the flags but it is
certainly something to think about and be aware of.

Cheers,

Richard





