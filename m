Received: from mail.fim.uni-passau.de ([132.231.1.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leitl@fim.uni-passau.de>) id 1QJVNj-0003kx-RQ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:40:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.fim.uni-passau.de (Postfix) with ESMTP id 8F2949223D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 20:37:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.fim.uni-passau.de
Received: from mail.fim.uni-passau.de ([127.0.0.1])
	by localhost (mail.fim.uni-passau.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id oEfbzLc6jALW
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 20:37:50 +0200 (CEST)
Received: from darkx.localnet (p5DC74A89.dip.t-dialin.net [93.199.74.137])
	by mail.fim.uni-passau.de (Postfix) with ESMTPSA id 4345C92239
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2011 20:37:50 +0200 (CEST)
From: Franz Leitl <leitl@fim.uni-passau.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 9 May 2011 20:38:15 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38.4-23-default; KDE/4.6.1; x86_64; ; )
References: <201105090016.46391.leitl@fim.uni-passau.de>
	<69719FEB-AD08-4D01-B1B0-D8291AD1DEFC@dominion.thruhere.net>
	<4DC83117.8000205@linux.intel.com>
In-Reply-To: <4DC83117.8000205@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201105092038.15641.leitl@fim.uni-passau.de>
Subject: Re: Patch for fixing build issues with external kernel modules.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2011 18:40:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Montag 09 Mai 2011, 20:23:19 schrieb Darren Hart:
> On 05/09/2011 10:53 AM, Koen Kooi wrote:
> > Op 9 mei 2011, om 19:32 heeft Franz Leitl het volgende geschreven:
> >> Hi,
> >> 
> >> Am Montag 09 Mai 2011, 18:28:06 schrieben Sie:
> >>>> I've tried to get compcache kernel module building against 2.6.34 from
> >>>> shr- core but found some issues with kernel.bbclass and
> >>>> module.bbclass.
> >>>> 
> >>>> The kernel.bbclass deletes the .c files from scripts directory which
> >>>> are later needed by make prepare to recreate bound.h and other files.
> >>>> Compcache kernel module, for example, depends on bounds.h.
> >>> 
> >>> The bounds.h should not need to be recreated. It is created during the
> >>> build of the kernel, and since 2.6.26, the makefile knows not to remove
> >>> it.
> >> 
> >> Compache does not build without bounds.h and this file is missing in the
> >> staging directory for what ever reason.
> > 
> > I ran into the same and I did the following:
> > 
> > http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrumen
> > ts/commit/?id=7bcba149f05cc9c5d8ce956ee40e2c6849601470
> 
> Thanks Koen, I knew we had discussed this once before. In your case,
> IIRC, you found that the "make clean" deleted bounds.h, even with the
> fix from 2.6.26 applied.
> 
> At the time we agreed that patching the kernel bbclasses for a bug in a
> particular kernel version wasn't a good plan. I'm concerned that Franz
> is hitting this with 2.6.34.
> 
> Franz, can you confirm that bounds.h exists before the clean and does
> not exist after the clean? Some simple instrumentation to kernel.bbclass
> should be able to do this.
I'll try to find out.

> If so, we need to look into why that is happening. Simply not deleting
> the C files from the source isn't an acceptable fix to save 1 file.
The c files are deleted by the kernel.bbclass not by "make clean" while make 
clean deletes the bounds.h... Who is doing the wrong thing now? kernel.bbclass 
removing the bounds.c, kernel's make clean removing the bounds.h or the module 
author relying on modules.h?

I don't know if/what the problem is with regenerating some things in 
module.bbclass. It is already done with "make scripts". Cleaning up 
things to save diskspace and recreating if needed does not seem to 
bad to me. Am I missing something?


Regards,
Franz


