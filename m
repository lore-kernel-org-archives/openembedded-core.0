Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoyO6-0002xG-S2 for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:59:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BEmNVX008590
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 15:48:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02807-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 15:48:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BEmGTO008584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 15:48:17 +0100
Message-ID: <1342018098.11939.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 15:48:18 +0100
In-Reply-To: <CAMKF1sqkxxrxKU-XO4HezbfsapTDXhz-TZNx_tNGq=rsNgB=wQ@mail.gmail.com>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
	<1342002640.7934.5.camel@ted>
	<CAMKF1sqkxxrxKU-XO4HezbfsapTDXhz-TZNx_tNGq=rsNgB=wQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Wed, 11 Jul 2012 14:59:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 07:25 -0700, Khem Raj wrote:
> On Wed, Jul 11, 2012 at 3:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2012-07-10 at 10:07 -0700, Khem Raj wrote:
> >> We shave too much from kernel sources for making it work
> >> for on device external kernel module development that cross
> >> development of external modules wont work from same tree
> >> anymore. This patch makes a copy of tree which will eventually
> >> be staged for building external modules
> >
> > It sounds from the further discussion that there is more to the patch
> > than just this. Firstly, a change like this needs a more precise
> > description.
> >
> > Secondly, we're copying around *way* to much data in this approach. I'd
> > like to suggest an improvement but can't since the description above is
> > lacking, I can't even understand what the problem is you're trying to
> > fix.
> 
> alright. There are tools (especially in scripts/) which are made for
> buildhost when compiling the kernel irrespective of cross
> or native. The tools like fixdep, recordmcount etc. which are needed
> to run when you build kernel itself as well as external
> modules. Now we do 'make _mproper_scripts' which cleans all those
> binaries. We do this because we want to ship kernel-dev
> and packaging binaries for different host wont be allowed in a target
> package. So we chose to delete them and then on device
> regenerate them ( ideally I would have preferred to generate them
> cross candian when making for target)
> 
> Deleting these tools also renders the cross building of modules
> useless. Since I want to ship the sources as reference only
> meaning people may not have write access to the kernel sources they
> can not run make inside the kernel sources to regenerate
> those binaries before they start building their external modules.
> 
> >
> > So more discussion is needed.
> >
> > I have a suspicion that this fix only "happens" to work when SDKMACHINE
> > == NATIVEMACHINE.
> >
> 
> yes, for a full solution we have to generate two versions of
> kernel-tools 1 for target and 1 for SDKMACHINE
> however this at least brings back what we had.

s/full/non-broken/

This patch adds something that is broken in several different cases and
kills off performance as an added bonus. I'd like to get this fixed
properly please rather than perpetuate the problem. We need to either do
something well and correctly, or not do it at all. We could document
"make _mproper_scripts" as a requirement for installing the kernel SDK
in the meantime.

I think we do need to make a kernel-tools package which correctly
generates the tools for a given target, be it nativesdk, or the target
device.

Cheers,

Richard



