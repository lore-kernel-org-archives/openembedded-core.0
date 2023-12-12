Return-Path: <seebs@seebs.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8586FC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 18:51:45 +0000 (UTC)
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.4549.1702407097939058585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 10:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=DqWK0u2P;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [216.82.44.17])
	by mail.seebs.net (Postfix) with ESMTPSA id 637062E8962;
	Tue, 12 Dec 2023 12:51:37 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1702407097; bh=IiOL1rDXLCxurOvOG9bbe1Xwgs6owpammfFqqr0qGl8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DqWK0u2P8Qjx56BZwdOZiacvXOPYNNwmu0KNsFavihgAg92//2umtlmwh99b94oFF
	 D2i16nm1vfEGrf6xBkR1SNcfFSX/dzaQSWLS45I6tgpwopIIGBxNpQzPVJRnOYFMhK
	 ntUYRpyvQnP+ZOW9lh3zCkJRGnI1xHRexQBOfuqGbmVrZ2Nok0idn1Y5+j4IK8JPlR
	 BEXo5p5kNwHhe5eplM9jHILVc9MjObuC3xsxD/LU17/gMizc3z/NE2qSQmyAw+rEU3
	 aqDVzHtOXryn2DE/keBlTUDyKvDttkbkW1VaeqCvRxLf66WbQI3ytI+zwSdonGVSTD
	 yNr2N/TBEsIVQ==
Date: Tue, 12 Dec 2023 12:51:33 -0600
From: Seebs <seebs@seebs.net>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH RFC] bitbake.conf/pseudo: Switch from
 exclusion list to inclusion list
Message-ID: <20231212125133.28ea65f7@seebsdell>
In-Reply-To: <450aaabe-db45-4b84-9759-aa4a2709028f@kernel.crashing.org>
References: <20231211173553.2421931-1-richard.purdie@linuxfoundation.org>
	<EB76304D-B0BE-46D9-83D7-A627844088DC@arm.com>
	<450aaabe-db45-4b84-9759-aa4a2709028f@kernel.crashing.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 18:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192244

On Tue, 12 Dec 2023 12:44:47 -0600
"Mark Hatle" <mark.hatle@kernel.crashing.org> wrote:

> /tmp - used by the compiler (and tons of other tooling) for temporary
> files, we need this for sure.

If memory serves, this is basically why it was an IGNORE path list
originally. If we ever accessed anything outside of pseudo, we'd get
leakage. The basic pattern looks like:

* file gets created outside of our workspace
* we then copy it in using something that tries to preserve ownership
* since file wasn't being tracked through pseudo, it has real UID on it
* now we've copied something into our workspace using that UID

The very early design, back in our pre-Yocto build system, imagined a
single unified database being used for the entire build process,
persistently. That was maybe not the best design idea, but it was
how we'd been using fakeroot and I didn't really revisit it at the
time. Also, we had a *lot* of cross-pollination between components, so
things would end up copying in or referring to files that were part
of another package, without using the intermediate archived form, so...

Wild times. Definitely one of those things where, with the wisdom of
hindsight, I know enough about the problem that if you asked me to do
it today I'd probably confidently tell you that it's not possible. :)

-s

