Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9712CD3A668
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 14:56:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.21802.1730213795948190548
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 07:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K+FjR58j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE43960008;
	Tue, 29 Oct 2024 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730213794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5m9JFR43YZsYRyngFhoovFgCfsh2NdBNw9XYw/Jfjcc=;
	b=K+FjR58jKu/EMfbv9F8j512zJtYI5qZHrJQ8Iju0iUI14Oe6QhmXwoqtmwo9eLpsTHnE6E
	DAVPKfAjgEU/zsrMASptB819Ba6IRVevLrZ7373GZF3Nqj+HDVL+YdGaiCs6cIM5K/M0Iq
	9aoNdlUDoRzOQbyjLhq6XkcRdX31bIiUeouM8iVNru1xicoUjYwoTyZTS2/9P7V1lrLyRj
	spuSD7lO3K/bAHa5g6gatQGpsRDfEJi+AayaxrUKYVq8UNrwcNqV1Qnt6WyNNhRyvOTYw0
	8nR13eYW0oJLPrkSvvaklE0aUAMBfIETPVadvYlQrNLDQTqW1LawrveLP0nSNg==
Date: Tue, 29 Oct 2024 15:56:32 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] tcl8: re-add tcl 8 to support building
 expect
Message-ID: <ZyD3oKw_ifaM0cDh@bootlin-mathieu>
Mail-Followup-To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
References: <20241029102033.737934-1-alex.kanavin@gmail.com>
 <20241029102033.737934-2-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029102033.737934-2-alex.kanavin@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 14:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206502

On Tue, Oct 29, 2024 at 11:20:33AM +0100, Alexander Kanavin wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> I'd be happy to remove expect from core as it has been unmaintained for years,
> but sadly gcc/binutils test suites are basically written in it (via dejagnu),
> and ltp makes use of it as well.
> 
> I attempted porting expect to tcl 9, but it's a tcl extension and makes
> extensive use of features that have been deprecated in tcl 8 and removed
> in tcl 9, and even pokes into tcl internals.
> 
> At some point hopefully the GNU toolchain upstreams are going to notice;
> for now we'll carry tcl (latest) and tcl8 recipes.
> 
> tcl and tcl8 packages can be co-installed, the latter is adjusted
> to contain tclsh8.
> 
> tcl-dev and tcl8-dev packages cannot be co-installed, and tcl
> in this situation supersedes tcl8.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> v2: add missing s-o-b to patches
> ---

Hi Alexander,

It looks like this is causing an issue on the autobuilder:

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Unable to install packages.
Command [...] returned 100:
Reading package lists...
Building dependency tree...
Reading state information...
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:
The following packages have unmet dependencies:
 tcl-dev : Conflicts: tcl8-dev
 E: Unable to correct problems, you have held broken packages.

https://valkyrie.yoctoproject.org/#/builders/67/builds/342/steps/14/logs/stdio

Can you have a look please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

