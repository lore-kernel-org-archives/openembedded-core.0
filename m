Return-Path: <matt@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A4EC4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 08:54:50 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web10.70482.1669971279697574265
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 00:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=gAfVhYN0;
 spf=pass (domain: codeconstruct.com.au, ip: 203.29.241.158, mailfrom: matt@codeconstruct.com.au)
Received: from [192.168.14.220] (unknown [159.196.94.94])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2F06120037;
	Fri,  2 Dec 2022 16:54:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1669971277;
	bh=FGwg1bsqbmPd0sCOnSN7+tih1Tn3cSJ+O7b1UFZ1qIY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gAfVhYN0+OByJc4GTDyBPNeb0fxqwS62/hja4KI2QsxcmrzJDr0gNvMP/GWQGMbfF
	 Kz4vNFMc1OIFoJmwpOCUX7Pzi8tch7I8QTxW2nl3M/Wt+ZHMavZbSS/piWfs77lo7K
	 VcWX/jXB2wuxl+ccUhPvmdl+pEfRCwA3rXenxklwOmeDfjvBYov48yNiFSuWieXhsn
	 qUUyiD/9dDlgGzBl0dISkbEbL9KXtHbWOM9EehPpDPqTR3q8zmoy/g7UWHvm/zD5cr
	 UrIfDRnfV7i9Yil0kW9LRx3t/ANVL5c907xhC70xurbpzIUKzq+AZsoUVe1D9WDeRq
	 cVmhRMs0DZYVg==
Message-ID: <52fce46ab9bb0f8e298e9ac92a90fd06d46bd35a.camel@codeconstruct.com.au>
Subject: Re: [OE-core] Y2038 proposal
From: Matt Johnston <matt@codeconstruct.com.au>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Dec 2022 16:54:35 +0800
In-Reply-To: <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174229

On Wed, 2022-11-30 at 09:07 +0100, Alexander Kanavin wrote:
> > > > On Tue, 29 Nov 2022 at 16:45, Stephen Jolley
> > > > <sjolley.yp.pm@gmail.com> wrote:
> > > > > > > > We=E2=80=99d welcome a proposal/series on how to move forwa=
rd with
> > > > > > > > the Y2038 work for 32 bit platforms.
> > > >=20
> > > > I have the following proposal:
> > > >=20
> > > > 1. A branch is made where:
> > > > a. "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" is enabled globally=
.
> > > > b. qemu is always started with "-rtc base=3D2040-01-01", simulating
> > > > Y2038 actually occurring.
> > > > c. an additional runtime test verifies that both RTC clock and syst=
em
> > > > clock report 2040.
> > > >=20
> > > > 2. This branch is run through a-full on the autobuilder. Any
> > > > uncovered
> > > > issues are filed as bugs.

Your email prompted me to check my own software (Dropbear) and it showed a
few y2038 issues to fix. Those bugs wouldn't be noticed from a quick test -
it "only" prevented auth and idle timeouts from occurring.

gcc and clang are able to flag truncated conversions for 64-bit time_t with=
=C2=A0
-Wconversion, but that's very noisy. Comparing that against a 32-bit time_t
build, however, gives a pretty clean list of code that needs attention.

As an experiment I've built OpenBMC with and without 64-bit time_t,
https://github.com/mkj/yocto-y2038 has the results and a description. There
are a mix of false positives (particularly tv_usec/tv_nsec), but also some
real-looking things. As an example, busybox using a uint32_t to copy a dhcp=
d
lease expiry.

I'm not sure the best way to use these logs - they need manual review.
Expanding the list of packages should be easy, but there will be more that
need manual intervention to get rid of -Werror.

Cheers,
Matt





