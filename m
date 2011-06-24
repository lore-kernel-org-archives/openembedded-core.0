Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qa708-0007oL-GL for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 16:04:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5OE1Fnb031370
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 15:01:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30880-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 15:01:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5OE14nA031364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 15:01:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
References: <B4FCA010-6920-4DD6-B471-4B2D9E38DFD7@dominion.thruhere.net>
Date: Fri, 24 Jun 2011 15:01:00 +0100
Message-ID: <1308924060.20015.173.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Tune files and knobs to turn
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
X-List-Received-Date: Fri, 24 Jun 2011 14:04:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-24 at 13:54 +0200, Koen Kooi wrote:
> We discussed tune files a bit during last nights TSC meeting and Khem
> had expressed the need before, so I'd like to get this discussion
> started by using armv7a as an example.
> 
> For armv7a capable cores we have the following hardware features:
> 
> * armv7a instruction set
> * thumb1 instruction set
> * thumb2 instruction set
> * VFP coprocessor
> * optional NEON coprocessor
> 
> For the ABI we can choose the following:
> 
> * softtp without hw support (e.g. no VFP instructions emitted, slow)
> * softfp with hw support (e.g. VFP and/or NEON instructions emitted, fast)
> * hardfp, emits VFP and/or NEON instructions, slightly faster than softfp/hw, incompatible with everything else
> 
> And the extra knobs:
> 
> * pure thumb1, no arm instructions (limited use)
> * thumb1/arm interworking
> * pure thumb2,  no arm instructions
> * thumb2 interworking (not sure if that's actually usefull, thumb2 has complete coverage)
> 
> In OE .dev we have the following vars:
> 
> TARGET_FPU: switches between hw float and sw float, no reflection in package arch
> ARM_FP_ABI: switches between softfp and hardfp, will create 'armv7a' or 'armv7a-hardfp' as package arch
> ARM_INSTRUCTION_SET: switches between arm and thumb1, no reflection in package arch
> THUMB_INTERWORK: turns on interworking, no reflection in package arch

I suspect having a variable per tune feature is going to be a recipe for
disaster. Selecting the tune options is something a machine is likely
going to want a good default of but some distros are going to want to
take control over in some cases too.

Given the n^2 problem we have with scale it starts to look like we'd
need something like TUNE_FEATURES which I don't feel brilliant about but
it likely could work well.

I'd also like to look at this from the other direction. What information
do we need from the tune config? Its one thing to set the controls but
we also need to consider what uses the end result and how. Currently the
tune files should really be responsible for:

TARGET_ARCH
TARGET_FPU
TARGET_CC_ARCH
PACKAGE_ARCH
BASE_PACKAGE_ARCH
PACKAGE_EXTRA_ARCHS
FEED_ARCH

of which there is some duplication of data. Also, the distro config
typically sets some of this. What we really need is the following:

* Overall compiler architecture
* Extra libc config data (softfloat?)
* Compiler optimisation flags
* Name of the package "architecture" to use for the config
* List of compatible package "architectures"

These map to:

* TARGET_ARCH
* TARGET_FPU
* TARGET_CC_ARCH
* BASE_PACKAGE_ARCH
* PACKAGE_EXTRA_ARCHS

but we do have issues of these names needing to be overridden so putting
then in some TUNE* namespace variables initially would help clean up the
core significantly.

Adding multlilib into the mix doesn't actually make the problem that
much more complex if we followed the simple rule of making the tune
config name an override. This would make the tune files follow the form:

TARGET_CC_ARCH_tune-armv7a = "xxx"
BASE_PACKAGE_ARCH_tune-armv7a = "xxx"

and then we'd add tune-xxx to OVERRIDES to select a given tuning for a
given multlilib.

I'm continuing to give this some thought but those are the ideas off the
top of my head...

Cheers,

Richard



