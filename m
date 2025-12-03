Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27442D12D68
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:04:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15970.1764770672007806505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 06:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=iV9LX514;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=liMTdvyrESwWs56yJCi4ZhOadZggnJyNQQ9VEYk6F8g=; b=iV9LX514VxBao9a7LCfGRenupA
	f3ZTDsvDqLmxEgozy6DR9WITe0UuccB/vJtqxUEzhNTFeQzfvNaCpCE8qFB2BDzQXA/f2HJIY0gJv
	5+BGf0huup80BVOCRVK1hc6ODfTVw6sybE37Kdqs1T3EcyQEVJ1WBn1uMyIjTWO32vfpOwYXIZxTW
	Mc6PDvFySdKzMXfUGs1QoWbWVg1lDaMfgUivcc/hp7LM3VhM/h+fjtHxEOXCkA3+OSg9t6g2/8KHJ
	nLPOOBs10miti4GmLxV6UdytzAph8n1swApzmu0j7UxbAApX8BuNlLAFbwbX1NaMV8FKCDaQBKjlI
	93TVPx3w==;
Received: from [147.129.179.166] (port=48790 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vQnT3-0000000Cz0I-37Si;
	Wed, 03 Dec 2025 09:04:31 -0500
Date: Wed, 3 Dec 2025 09:05:47 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why would a ptest-enabled recipe have RDEPENDS include
 "ptest-runner"?
In-Reply-To: <CANNYZj_ThkGTvg2=Q80bvvDgHL8kLTa3VHaaGdUTc-3ZS0tOLg@mail.gmail.com>
Message-ID: <759d190f-a60e-6235-5787-cc4ecf41cd97@crashcourse.ca>
References: <10f454b1-e85a-81e9-d5e9-9720cdc3d427@crashcourse.ca> <CANNYZj_ThkGTvg2=Q80bvvDgHL8kLTa3VHaaGdUTc-3ZS0tOLg@mail.gmail.com>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 14:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227227

On Wed, 3 Dec 2025, Alexander Kanavin wrote:

> On Wed, 3 Dec 2025 at 14:54, Robert P. J. Day via
> lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
> wrote:
> >   currently writing a ptest tutorial/presentation (maybe i'll offer to
> > give a tutorial at next year's virtual summit), and ran across this
> > oddity in OE's cpio recipe:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/cpio/cpio_2.15.bb#n72
> >
> >   RDEPENDS:${PN}-ptest += "ptest-runner coreutils"
> >
> > why would that variable for *any* recipe specify a run-time dependency
> > on ptest-runner? that seems odd.
>
> The first explanation you should consider: recipes accumulate a lot of
> obsolete or redundant cruft over time that no one has time to research
> and clean up, and this is one such. 'git blame' might reveal why it
> was added in the fist place.
>
> ptest.bbclass has:
> RRECOMMENDS:${PN}-ptest += "ptest-runner"
> which supersedes this.

  i'll submit a patch to clean this up. one of my weaknesses is that
whenever i see something odd or unusual, i immediately assume it's
because it's so clever that i don't understand it. i need to get over
that.

rday

