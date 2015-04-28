Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDB372491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:16:20 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3lbwkq0sG5z3hk4Z;
	Tue, 28 Apr 2015 23:16:19 +0200 (CEST)
X-Auth-Info: 4T3B3nUXQC/iezw+28hk4GCcyWSgAliUxvyfcdh4yaw=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3lbwkp6WgyzvhTZ; 
	Tue, 28 Apr 2015 23:16:18 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 28 Apr 2015 23:16:17 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1430239116-7671-1-git-send-email-marex@denx.de>
	<1430239116-7671-5-git-send-email-marex@denx.de>
	<553FD526.2020708@windriver.com>
In-Reply-To: <553FD526.2020708@windriver.com>
MIME-Version: 1.0
Message-Id: <201504282316.17774.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Tue, 28 Apr 2015 21:16:23 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, April 28, 2015 at 08:44:54 PM, Bruce Ashfield wrote:
> On 2015-04-28 12:38 PM, Marek Vasut wrote:
> > Pull the uImage image format generation from kernel.bbclass into
> > a separate kernel-uimage.bbclass. The recipes which now need to
> > generate an uImage will have to inherit kernel-uimage instead of
> > kernel class.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Koen Kooi <koen@dominion.thruhere.net>
> > Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> > 
> >   meta/classes/kernel-uimage.bbclass | 48
> >   +++++++++++++++++++++++++++++++++ meta/classes/kernel.bbclass        |
> >   55 +++++++------------------------------- 2 files changed, 58
> >   insertions(+), 45 deletions(-)
> >   create mode 100644 meta/classes/kernel-uimage.bbclass
> > 
> > NOTE: The "inherit kernel-uimage" in kernel.bbclass should be changed to
> > 
> >        something like "inherit kernel-${@d.getVar("KERNEL_IMAGETYPE",
> >        True).lower()}" but the problem is that I only want to perform
> >        the inheritance for uimage and fitimage, the other image types
> >        don't need to inherit any additional special stuff.
> >        Paul suggested I can do "inherit <empty here>". This would at
> >        least let me implement a python function which returns either
> >        "kernel-uimage", "kernel-fitimage" or "" and based on that, I
> >        could inherit the particular image type specifics into
> >        kernel.bbclass.
> >        What I don't know how to implement well is this function which
> >        returns those three strings based on the KERNEL_IMAGETYPE. What I
> >        would like to avoid is encoding those strings explicitly into the
> >        function, since that would force each new kernel image format to
> >        also edit this function in kernel.bbclass . Apparently, checking
> >        whether class exists and inheriting it only if it does is also
> >        not a simple task.
> 
> Agreed that this would be better. It would remove a lot of the checks
> in the other tasks for the image type.

Hi!

Yes, that's indeed true. All the image type checks would disappear from
kernel-uimage and kernel-fitimage bbclasses.

> I'm not aware of the exact details on how to make this work, but
> hopefully others have the foo.

Thank you!

