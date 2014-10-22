Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9857A65C66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 21:50:19 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jNQNf6HTvz3hjSQ;
	Wed, 22 Oct 2014 23:50:10 +0200 (CEST)
X-Auth-Info: Fno1di777i+D1SkyQ9rT7zugwOowevGPnAii45UuCUE=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3jNQNf4BrLzvhTZ; 
	Wed, 22 Oct 2014 23:50:10 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Oct 2014 23:45:59 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410220128.44782.marex@denx.de>
	<DBEF9196-DDEF-4862-87CD-24DA0577C08F@dominion.thruhere.net>
In-Reply-To: <DBEF9196-DDEF-4862-87CD-24DA0577C08F@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201410222345.59522.marex@denx.de>
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
X-List-Received-Date: Wed, 22 Oct 2014 21:50:21 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, October 22, 2014 at 10:42:09 AM, Koen Kooi wrote:
> > Op 22 okt. 2014, om 01:28 heeft Marek Vasut <marex@denx.de> het volgende
> > geschreven:
> > 
> > On Monday, October 20, 2014 at 12:26:04 PM, Koen Kooi wrote:
> >>> Op 19 okt. 2014, om 21:15 heeft Marek Vasut <marex@denx.de> het
> >>> volgende geschreven:
> >>> 
> >>> Pull the uImage image format generation from kernel.bbclass into
> >>> a separate kernel-uimage.bbclass. The recipes which now need to
> >>> generate an uImage will have to inherit kernel-uimage instead of
> >>> kernel class.
> >> 
> >> To keep backward compatibility, could you rework this into something
> >> like:
> >> 
> >> kernel.bbclass:
> >> 	inherit kernel-${KERNEL_IMAGETYPE}
> >> 
> >> kernel-${KERNEL_IMAGETYPE}:
> >> 	inherit kernel-base
> >> 	imagetype stuff
> >> 
> >> kernel-base:
> >> 	old kernel.bbclass stuff
> >> 
> >> That would keep existing BSPs working *and* split out the image types.
> > 
> > Yes, this makes sense. Are there any traps inside kernel.bbclass I should
> > be careful about? Like for example ${PN} or other possible variables
> > which are set based on the name of the file?
> 
> You should be safe, PN is supposed to be completely ignored since the
> output packages will all be 'kernel-<foo>' instead of
> 'linux-myfirstbsp-<foo>'

The kernel_do_configure() and do_configure stuff in kernel.bbclass now bit me.
I'm not even sure I can explain the problem well, so please bear with me.

The build system now cannot find do_configure() when building kernel recipe, 
since by moving kernel.bbclass contents into kernel-base.bbclass, the 
expectations of prefix of functions passed to 'addtask ... do_configure' and 
'EXPORT_FUNCTIONS ... do_configure' are no longer met. Before, the functions
in kernel.bbclass, namely kernel_do_configure() , kernel_do_compile() and 
kernel_do_install() had prefix matching the name of the bbclass (kernel_) and 
were used by the addtask...do_configure() and EXPORT_FUNCTIONS...do_configure() 
without the kernel_ prefix.

Now that I moved the contents of kernel.bbclass into kernel-base.bbclass, the 
name of the kernel_do_*() functions no longer matches the bbclass name and so
I presume the addtask... and EXPORT_FUNCTIONS... things are confused. 
Furthermore, I presume we want to keep the name of those kernel_do_*() functions
in case some recipes wanted to override those functions.

Do you happen to have any suggestion please ?

Best regards,
Marek Vasut

