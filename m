Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1101F73BB9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 02:48:05 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbRzf3vzNz3hht4;
	Tue, 28 Apr 2015 04:40:46 +0200 (CEST)
X-Auth-Info: MzgCQzRKQyqGtcIMpI1SgyHfi/8LmAPIj0AcWx4h9TQ=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3lbRzf2cHMzvhTg; 
	Tue, 28 Apr 2015 04:40:46 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Apr 2015 04:39:32 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410262352.34958.marex@denx.de>
	<E8543342-2D6B-4707-810A-E88564881F20@dominion.thruhere.net>
In-Reply-To: <E8543342-2D6B-4707-810A-E88564881F20@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201504280439.32255.marex@denx.de>
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
X-List-Received-Date: Tue, 28 Apr 2015 02:48:07 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, October 27, 2014 at 07:59:42 AM, Koen Kooi wrote:

Hi!

sorry for the very late reply.

> > So uh, what exactly would you propose then? Ask the BSPs to cater for the
> > change ? I don't quite like that option, since it's like breaking an API
> > (or similar interface, I'm not sure what the local equivalent of that
> > would be).
> 
> Personally, I'd try to keep the kernel_foo() methods the same since those
> are very popular, a lot of BSPs append the configure one. So maybe
> something like:
> 
> kernel.bbclass:
> 	do_configure
> 	do_install
> 	addtask
> 	etc
> 	inherit kernel-${KERNEL_IMAGETYPE.bbclass}
> 
> kernel-${KERNEL_IMAGETYPE.bbclass}
> 	do_install (overrides the one in kernel.bbclass)
> 
> Someone more familiar with bbclass method (re)naming and scoping should
> weigh in on the method override above, but I think it should work.

I wonder, is it possible to inherit bbclass if it exists as a file and inherit
nothing otherwise ?

In case I do:
inherit kernel-${@d.getVar("KERNEL_IMAGETYPE", True).lower()}
I get a nasty spit from bitbake in case I'm building with zImage 
KERNEL_IMAGETYPE . The reason is obvious, the file kernel-zimage.bbclass
doesn't exist. So I wonder if there's some easy way to check if the class
actually exists.

Best regards,
Marek Vasut

