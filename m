Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8409EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 22:38:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.5445.1686782289578896782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 15:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pGxjgD0M;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686782287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZOQZmbLpPiADWc0kQy8rqtsShSzbBqRGtZaRaE1v5g=;
	b=pGxjgD0MB3wD7cT76VypjLpgG5Pim8cBukXA+Pyb9RhGgri2cDFFH1rwt4lIDMWZkMlEP3
	W67ZCzPHqiuQi0IS+wrzlXCQqieEOm7S04SFU2TWD3j4Y7Q0+SW3tdaOCAYYPWnEXKo4xa
	zWFPME9lUbiTStSU0xjpKQ746R1SOEin73cu2gHvVZl4tAY+696TcuWJBkc1S6cfkPvGIe
	LFg+1VglaYWme12X2FVGDmVSabhybBVMBfxhsLtS0aYxtcRnKBqyYNhnhBzSlZwexodJFy
	ilEIYq08DbTBhaX6kV0PJ5UkhUfLDdbNCkJ/aJtk/iqVOI/019Wz5AuwCLT8QA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFA1EFF803;
	Wed, 14 Jun 2023 22:38:06 +0000 (UTC)
Date: Thu, 15 Jun 2023 00:38:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] libssh2: Upgrade to v1.11.0
Message-ID: <20230614223806a87d7d51@mail.local>
References: <20230613205212.7548-1-sudip.mukherjee@codethink.co.uk>
 <71B74F88-1911-4F00-BD3D-0B4628D9ED99@arm.com>
 <CADVatmN=x=5VAUZUU1if+SrX19dg7h-pBiD-B7u1PrX7wHOnBg@mail.gmail.com>
 <ADAC057F-4754-4451-B00A-FB1090212A72@arm.com>
 <CADVatmP44NPGaUnZRLKu9Z1AmFQ1vtPwv7eKwHFsV7yC1ywcFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADVatmP44NPGaUnZRLKu9Z1AmFQ1vtPwv7eKwHFsV7yC1ywcFg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 22:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182827

On 14/06/2023 21:29:56+0100, Sudip Mukherjee wrote:
> On Wed, 14 Jun 2023 at 16:47, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 14 Jun 2023, at 16:13, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> > >
> > > Hi Ross,
> > >
> > > On Wed, 14 Jun 2023 at 14:53, Ross Burton <ross.burton@arm.com> wrote:
> > >>
> > >> On 13 Jun 2023, at 21:52, Sudip Mukherjee via lists.openembedded.org <sudipm.mukherjee=gmail.com@lists.openembedded.org> wrote:
> > >>> # only one of openssl and gcrypt could be set
> 
> <snip>
> 
> > >>> mkdir -p ${D}${PTEST_PATH}/docs
> > >>> cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
> > >>> }
> > >>
> > >> As you’ve clearly been looking at the tests, why does the ptest support need the documentation?
> > >
> > > There is a test for manpage syntax "mansyntax.sh" which needs the
> > > generated man pages in the docs folder.
> > > compile_ptest_base will not fail, but actual tests will fail.
> >
> > This is where I start to say that we should be trimming the tests and only running useful tests for integration purposes, not the complete upstream test suite.
> 
> Sure, and as confirmed over irc I will send a followup patch removing that test.
> 
> -- 
> Regards
> Sudip

Note that test_sshd.test is failing, full log here:
https://autobuilder.yocto.io/pub/non-release/20230614-11/testresults/qemux86-64-ptest/core-image-ptest-libssh2/log.do_testimage.50695.20230614084246

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

