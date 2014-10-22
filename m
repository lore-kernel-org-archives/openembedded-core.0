Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7092465C66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 21:50:19 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jNQNf2GKmz3hjSM;
	Wed, 22 Oct 2014 23:50:10 +0200 (CEST)
X-Auth-Info: Fno1di777i+D1SkyQ9rT7zugwOowevGPnAii45UuCUE=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3jNQNf0jylzvdWV; 
	Wed, 22 Oct 2014 23:50:10 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Oct 2014 22:51:52 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-5-git-send-email-marex@denx.de>
	<84924DE0-BBAC-45C0-B0B3-66A3EB6841CC@dominion.thruhere.net>
In-Reply-To: <84924DE0-BBAC-45C0-B0B3-66A3EB6841CC@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201410222251.52788.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Oct 2014 21:50:20 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, October 20, 2014 at 12:26:04 PM, Koen Kooi wrote:
> > Op 19 okt. 2014, om 21:15 heeft Marek Vasut <marex@denx.de> het volgende
> > geschreven:
> > 
> > Pull the uImage image format generation from kernel.bbclass into
> > a separate kernel-uimage.bbclass. The recipes which now need to
> > generate an uImage will have to inherit kernel-uimage instead of
> > kernel class.
> 
> To keep backward compatibility, could you rework this into something like:
> 
> kernel.bbclass:
> 	inherit kernel-${KERNEL_IMAGETYPE}
> 
> kernel-${KERNEL_IMAGETYPE}:
> 	inherit kernel-base
> 	imagetype stuff
> 
> kernel-base:
> 	old kernel.bbclass stuff
> 
> That would keep existing BSPs working *and* split out the image types.

There are multiple KERNEL_IMAGETYPE options than just uImage, so I will change
the kernel.bbclass like so instead:

kernel.bbclass:
	inherit kernel-base
	inherit kernel-uimage

This will keep the BSPs working and then the new imagetypes (not fitImage,
since fitImage will inherit kernel-uimage) will do this:

kernel-${KERNEL_IMAGETYPE).bbclass:
	inherit kernel-base
	imagetype stuff

Does this make sense please ?

[...]

Best regards,
Marek Vasut

