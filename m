Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8F9C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 09:23:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.5420.1654248184546629964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 02:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e0ekWGEV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5B633FF80D;
	Fri,  3 Jun 2022 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654248182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yIi5scO7vGPbnmd0Gl6abE7n8+iUk+r2z91pfgElXds=;
	b=e0ekWGEVi9tfLBd/8rUcJ+qpnqN6SrHuX6hiRtXCRnB1k3xlBJXYpZynYgv6mJbtcG1WfF
	BIrv72c7sSYOvWTUOQFNUNGFXpKBKR26Bz253dGH6RWp1Dl3pzQENGf9hpmDR5uZ1IcUEP
	JEGmsozSfuLkx9Kw+rbzWHnpu4t4/2qI7IXDubwXrzXrvZvK7sdoMI6DD90Ru0XrDM4rFG
	ux3Nmi2q32CV2jL52TvgtfBrCkPq49pb+en8Tj4ipmfWoPd1T/moDzaP/FEOSkhHhjpb5+
	VgAnmSwZ1YSlGp2xwLtA8HuBtIivAPZI0zcxKW0N96o1apLHrkyw+eXn9AWVTQ==
Date: Fri, 3 Jun 2022 11:22:59 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Sean Anderson via lists.openembedded.org"
 <sean.anderson=seco.com@lists.openembedded.org>
Cc: sean.anderson@seco.com, openembedded-core@lists.openembedded.org,
 Christophe Chapuis <chris.chapuis@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Martin Jansa <Martin.Jansa@gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: find .ko.zst kernel modules
Message-ID: <20220603112259.41ca42e9@booty>
In-Reply-To: <98b3c9ff-790c-8432-59a7-9371312a1901@seco.com>
References: <20220531151052.3667079-1-sean.anderson@seco.com>
	<20220601091310.5c35a235@melee>
	<98b3c9ff-790c-8432-59a7-9371312a1901@seco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 09:23:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166515

Hi Sean,

On Thu, 2 Jun 2022 10:52:59 -0400
"Sean Anderson via lists.openembedded.org"
<sean.anderson=seco.com@lists.openembedded.org> wrote:

> Hi Luca,
> 
> On 6/1/22 3:13 AM, Luca Ceresoli wrote:
> > [You don't often get email from luca.ceresoli@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification.]
> > 
> > Hi Sean,
> > 
> > Il giorno Tue, 31 May 2022 11:10:52 -0400
> > "Sean Anderson via lists.openembedded.org"
> > <sean.anderson=seco.com@lists.openembedded.org> ha scritto:
> > 
> > As you can see from the above line, your e-mails appear as coming from
> > an inappropriate address. This is not your fault, it's a mangling done
> > by mail servers, but it makes applying patches more complex.
> > 
> > It should be easy to fix, at least enough to allow patches to apply
> > properly, by setting the sendemail.from parameter in your git config.
> > This should force outgoing patches to start with a 'From:' line in the
> > body, and that one is used by git am to take the correct commit author
> > e-mail.
> > 
> > Can you please try that before sending another patch?
> > 
> > Thank you!  
> 
> I believe the From header is being modified by the openembedded mailing
> list. On my local email client I see the correct From. Further, git
> send-email reports the correct From as well:

Sure, this is absolutely *not* your fault!

This is done by DMARC (https://en.wikipedia.org/wiki/DMARC) as part of
anti-phishing and the like and it happend on some domains, including
the one I am using as you can see. The issue has already been discussed
but as far as I know if you are hit by it there is currently no better
alternative than using the git sendemail.from field to put an
*additional* From line at the beginning of the body.

When people receive an e-mail from the mailing list, it will look like:

------------------------8<------------------------
From: "Sean Anderson via lists.openembedded.org" <sean.anderson=seco.com@lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] rootfs.py: find .ko.zst kernel modules
Date: Tue, 31 May 2022 11:10:52 -0400
Message-Id: <20220531151052.3667079-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sean Anderson <sean.anderson@seco.com>     <---- THIS ONE

...your original commit message + diff...
------------------------8<------------------------

See the additional 'From:' line in the body. Since it is in the body and
not in the header, DMARC won't mangle it. 'git am' will use it for the
Author: field and remove it from the commit message.

I suggest you (and anybody affected by the issue) to try and see: it's
simpler to do it than to explain it! :-)

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

