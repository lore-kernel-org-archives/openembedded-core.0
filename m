Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0F7C54E67
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 17:46:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.14088.1711216004768846666
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 10:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=O7Y2XuZh;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gJYbKZI3FPvtjPS0aF5WAUEmd4T+Xpu7H3SOYs8VbFc=; b=O7Y2XuZh2vctdGiWcAYJW0bmdp
	IsZCk9MwjrmisoXP0shkK3dvlu1AEZ1AAUGNO5NycIqXhz5PDbSPU+xlDKTjiTZSvET7oAdRQW8Ck
	jj1oMaEjOtCbwBV9/2XboOpam4SvrvTJOoWzsF8AqP2bLQ32uQyYEzB9Oe3rNV0D9Tt76CESg3BNX
	C7sAef/3r8lXRHmHHSWmXkrQI1ldn2VH42aOJEekmAJR5pGo1L3PcIBnGnRM9yOWPQQyxS9o//fen
	3y+4npBGngDV3CWXYW5OQszcKMAfnoSbHL/e15iof+LD3D0L6sofk5fMAOCqxYnHa2qSWh+5P6xpW
	1KvQHm6g==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:58688 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ro5S6-006dO4-1U;
	Sat, 23 Mar 2024 13:46:43 -0400
Date: Sat, 23 Mar 2024 13:46:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] is there any reason to use .ipk packaging if devs are
 using ubuntu?
In-Reply-To: <CANNYZj_d=gRHYRpT7DM_BRVYyGTnqdvxyAy7YNq7HOC20NacXw@mail.gmail.com>
Message-ID: <319ac080-a71f-f73a-5239-3b4947af15d8@crashcourse.ca>
References: <28d65e80-cba-d930-736a-c55c3b9dc8d@crashcourse.ca> <CANNYZj_U7AXtWd88nqvzr9ABvw2qZWZ5sL1ypXkCA+2faG1RQg@mail.gmail.com> <f4bd7649-611-7223-6e38-1a251691e241@crashcourse.ca> <CANNYZj_d=gRHYRpT7DM_BRVYyGTnqdvxyAy7YNq7HOC20NacXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 17:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197463

On Sat, 23 Mar 2024, Alexander Kanavin wrote:

> On Sat, 23 Mar 2024 at 18:34, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   all of this being accurate, the one advantage i can see is that, if
> > developers are familiar with deb package management on their ubuntu
> > dev systems, then they would be familiar with having package
> > management on their target systems (provided, as you say, they
> > understand that they should work only with YP-generated packages).
>
> Nah, I don't see that familiarity helping anything. Reading output of
> opkg and finding out that you need to issue 'opkg install' takes 10
> seconds. That's such a minor hurdle compared to learning yocto in
> general (especially when to do when bitbake ends with an error) that
> I'd say any time saved there is statistical noise.

  ok, that's reasonable. thanks.

rday

