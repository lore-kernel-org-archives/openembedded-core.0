Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPxAn-0006Hi-VW for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 16:38:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43ESexM001262
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 15:28:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00637-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 15:28:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43ESYkV001256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 15:28:35 +0100
Message-ID: <1336055317.30113.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 15:28:37 +0100
In-Reply-To: <D777AF9B-4859-43C3-946D-EF5172E0806B@dominion.thruhere.net>
References: <1335693807-17609-1-git-send-email-wd@denx.de>
	<1336052928-30764-1-git-send-email-wd@denx.de>
	<D777AF9B-4859-43C3-946D-EF5172E0806B@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Add KERNEL_EXTRA_ARGS parameter
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
X-List-Received-Date: Thu, 03 May 2012 14:38:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-03 at 16:02 +0200, Koen Kooi wrote:
> Op 3 mei 2012, om 15:48 heeft Wolfgang Denk het volgende geschreven:
> 
> > With recent kernel versions, some ARM configurations need may fail to
> > build with errors like this:
> > 
> > 	multiple load addresses: 0x80008000 0x80008000
> > 	This is incompatible with uImages
> > 	Specify LOADADDR on the commandline to build an uImage
> > 
> > We cannot pass this information in EXTRA_OEMAKE, as
> > "meta/classes/kernel.bbclass" explicitly ignores all EXTRA_OEMAKE
> > settings.  So add KERNEL_EXTRA_ARGS parameter so affected boards
> > can add for example
> > 
> > 	KERNEL_EXTRA_ARGS = "LOADADDR=0x80008000"
> 
> Isn't KERNEL_EXTRA_OEMAKE clearer in this case? I see kernel args
> being what ends up in /proc/cmdline.

In many ways I wish we could use EXTRA_OEMAKE and try and keep the API
simpler. Looking at the code, I think it actually can work even with the
existing code in some circumstances.

Whilst kernel.bbclass does zero out the contents, it does this simply to
get rid of the default value (the -e MAKEARGS= bit).

The following recipe will therefore work:

"""
<some recipe code>

inherit kernel

EXTRA_OEMAKE += 'LOADADDR=0x80008000'
"""

but the problem is likely this can't be set from machine.conf.

I was wondering about changing the system so that in bitbake.conf we
set:

OEMAKEDEFAULT = "-e MAKEFLAGS="
EXTRA_OEMAKE = "${OEMAKEDEFAULT}"

and then kernel.bbclass can zero out OEMAKEDEFAULT. The trouble is you
want to set:

EXTRA_OEMAKE_append_xxxx = " LOADADDR=0x80008000"

and I'm not coming up with a good value of xxxx other than
pn-linux-xxxx :/. We could consider an extra override for the kernel
case I guess.

I would prefer not to add mode global variables unless we can possibly
help it...

Cheers,

Richard






