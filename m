Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3BCC47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 10:06:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.11522.1670234771194120445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 02:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=a/QCrIEO;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670234771;
  x=1701770771;
  h=references:from:to:cc:subject:date:in-reply-to:
   message-id:mime-version;
  bh=WMyFI5gNhUoF5oLIW6e+zCSxEcJgrCfXHjswxPVxJiM=;
  b=a/QCrIEO/E7bO+zXQED8UM4zp4DD8oRg7J3CcMy1SgTEMQpf43mPsJux
   +ObnN+/r2wBSeWW/7y8GtyghVZNgGZJ1DEKmZKyxsjX3HvrFpRA7aDfNf
   68Kf5xVjO9TPBBkgHcDIBMuIxkK3+UrkIdje2bGVUBpXneiDn+W1hsX58
   i3UpSgdDxUiOQlfKBPjxc1Ob49cdC5fG5f6fBuXov18JdgzWZQWtjBSFk
   hXy0m3eKr/NbCmJMbLABDQMn28+YsNzT6gMgr7Ds0z07GbwIOGOiR7lBQ
   /3jZpVRLanKfYIKU3cbMCro+cU7TbF0Wj79NO5J4MtSAAelfli72SdI/R
   w==;
References: <0b6801d90409$885d6860$99183920$@gmail.com>
 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
 <20221130143604.5a6659dc@wsk>
 <ad2adc6af5026edc201cd3ab3a7b1f129cfdbd57.camel@linuxfoundation.org>
 <D8DC7E4C-58C5-4102-A5B0-20D95FC0C3A9@arm.com>
 <Y4eLLpnUKLz+YiwM@mail.local>
 <f63f222e6c7bd50f1b50ffb198c61864a67f9ef2.camel@linuxfoundation.org>
User-agent: mu4e 1.8.8; emacs 29.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ross Burton
	<ross.burton@arm.com>, Lukasz Majewski <lukma@denx.de>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] [Openembedded-architecture] Y2038 proposal
Date: Mon, 5 Dec 2022 11:00:12 +0100
Organization: Axis Communications AB
In-Reply-To: <f63f222e6c7bd50f1b50ffb198c61864a67f9ef2.camel@linuxfoundation.org>
Message-ID: <jwqcz8y17xr.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 10:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174282


On Wed, Nov 30 2022, Richard Purdie wrote:

> On Wed, 2022-11-30 at 17:56 +0100, Alexandre Belloni wrote:
>> On 30/11/2022 16:46:17+0000, Ross Burton wrote:
>> > On 30 Nov 2022, at 14:20, Richard Purdie via
>> > lists.yoctoproject.org
>> > <richard.purdie=linuxfoundation.org@lists.yoctoproject.org> wrote:
>> > > > > * Could we optionally disable some of the glibc 32 bit function calls
>> > > > > to ensure they're not being used? 
>> > > > 
>> > > > Could you be more specific here? Would you like to disable some
>> > > > syscalls?
>> > > 
>> > > I'm meaning disabling the 32 bit glibc time functions.
>> > 
>> > Some time ago I filed
>> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=6803 as Debian
>> > has a nice sanity check where it warns if non-LFS glibc functions
>> > are used.  I imagine the same logic could be used to check for 32-
>> > bit time_t use.
>
> That sounds interesting and something we should probably look into for
> both issues...

I have a working sanity checker that checks for any glibc functions
affected by -D_FILE_OFFSET_BITS=64 or -D_TIME_BITS=64.
The INSANE_SKIP functionality needs some more polish but I'd be happy to
contribute it.

Some libraries use both 32 and 64 bit APIs to glibc and needs exceptions
in the checker.

I have not run any world builds with this checker, I've focused on the
recipes we actually use so far so we could get to a testable system.  My
biggest worry at the moment is rust, I know to little to know if it is
an actual problem and how to fix it.

I would like to be part of any "y2038 team" for Yocto.

-- 
Ola x Nilsson

