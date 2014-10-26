Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id B4BB265CAC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 22:52:37 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jQvZr4Wnkz3hj9s;
	Sun, 26 Oct 2014 23:52:36 +0100 (CET)
X-Auth-Info: mzeL8VxearkgDLGfulzlFzxT48bhcx11ayeltpou8cY=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3jQvZr0S2WzvdWR; 
	Sun, 26 Oct 2014 23:52:35 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 26 Oct 2014 23:52:34 +0100
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410222345.59522.marex@denx.de>
	<6D269671-AC3E-4044-8E86-2BB0BABF4B38@dominion.thruhere.net>
In-Reply-To: <6D269671-AC3E-4044-8E86-2BB0BABF4B38@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201410262352.34958.marex@denx.de>
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
X-List-Received-Date: Sun, 26 Oct 2014 22:52:46 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sunday, October 26, 2014 at 12:29:18 PM, Koen Kooi wrote:
[...]
> >>>> To keep backward compatibility, could you rework this into something
> >>>> like:
> >>>> 
> >>>> kernel.bbclass:
> >>>> 	inherit kernel-${KERNEL_IMAGETYPE}
> >>>> 
> >>>> kernel-${KERNEL_IMAGETYPE}:
> >>>> 	inherit kernel-base
> >>>> 	imagetype stuff
> >>>> 
> >>>> kernel-base:
> >>>> 	old kernel.bbclass stuff
> >>>> 
> >>>> That would keep existing BSPs working *and* split out the image types.
> >>> 
> >>> Yes, this makes sense. Are there any traps inside kernel.bbclass I
> >>> should be careful about? Like for example ${PN} or other possible
> >>> variables which are set based on the name of the file?
> >> 
> >> You should be safe, PN is supposed to be completely ignored since the
> >> output packages will all be 'kernel-<foo>' instead of
> >> 'linux-myfirstbsp-<foo>'
> > 
> > The kernel_do_configure() and do_configure stuff in kernel.bbclass now
> > bit me. I'm not even sure I can explain the problem well, so please bear
> > with me.
> > 
> > The build system now cannot find do_configure() when building kernel
> > recipe, since by moving kernel.bbclass contents into
> > kernel-base.bbclass, the expectations of prefix of functions passed to
> > 'addtask ... do_configure' and 'EXPORT_FUNCTIONS ... do_configure' are
> > no longer met. Before, the functions in kernel.bbclass, namely
> > kernel_do_configure() , kernel_do_compile() and kernel_do_install() had
> > prefix matching the name of the bbclass (kernel_) and were used by the
> > addtask...do_configure() and EXPORT_FUNCTIONS...do_configure() without
> > the kernel_ prefix.
> > 
> > Now that I moved the contents of kernel.bbclass into kernel-base.bbclass,
> > the name of the kernel_do_*() functions no longer matches the bbclass
> > name and so I presume the addtask... and EXPORT_FUNCTIONS... things are
> > confused. Furthermore, I presume we want to keep the name of those
> > kernel_do_*() functions in case some recipes wanted to override those
> > functions.
> > 
> > Do you happen to have any suggestion please ?
> 
> Hmmm, it looks like there isn't a way to make this "just work" for 'old'
> BSPs :(

So uh, what exactly would you propose then? Ask the BSPs to cater for the
change ? I don't quite like that option, since it's like breaking an API
(or similar interface, I'm not sure what the local equivalent of that would
be).

Thanks!

Best regards,
Marek Vasut

