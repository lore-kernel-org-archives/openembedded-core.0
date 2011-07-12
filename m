Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qgb9S-0005ID-AX for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 13:29:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CBPJ64019586
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 12:25:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18595-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 12:25:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CBPBWk019580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 12:25:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <E040CBE3-4C88-4768-B056-0588A5566BDA@dominion.thruhere.net>
References: <1310399860.20015.980.camel@rex>
	<164DA52B-98AF-47AA-A42D-1DE7FA9A1200@dominion.thruhere.net>
	<1310402833.20015.986.camel@rex>
	<839342D0-8691-4528-8B7A-9515ED47B6C2@dominion.thruhere.net>
	<1310460068.20015.1021.camel@rex>
	<E040CBE3-4C88-4768-B056-0588A5566BDA@dominion.thruhere.net>
Date: Tue, 12 Jul 2011 12:25:10 +0100
Message-ID: <1310469910.20015.1039.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH 2/3] conf/machine: Overhaul tune include files
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
X-List-Received-Date: Tue, 12 Jul 2011 11:29:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 11:30 +0200, Koen Kooi wrote:
> Op 12 jul 2011, om 10:41 heeft Richard Purdie het volgende geschreven:
> > An updated version of this with a few more pieces filled out is
> > available at:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/temp4&id=d2a0bf99fd573221f230bb5253b85166997fac69
> 
> If I understand it correctly
> 
> 	TARGET_FPU_armv7a = "hard"
> 	TARGET_FPU ?= "soft"

These actually become the defaults for armv7 since:

meta/conf/machine/include/tune-armv7.inc:

TUNE_FEATURES_tune-armv7 ??= "fpu-hard"

> becomes
> 
> 	TUNE_FEATURES_append_armv7a = " hard"

but the distro can override TUNE_FEATURES_tune-armv7 as required. The
value in question would be "" or "fpu-hard". You'd actually want:

TUNE_FEATURES_tune-armv7_append = "xxx"

or just set it to what you want:

TUNE_FEATURES_tune-armv7 = "fpu-hard neon"

> And
> 
> 	ARM_FP_ABI = "hardfp"
> 
> becomes
> 
> 	TUNE_FEATURES += "callconvention-hard"

Correct.

> And to maintain the status quo for beagleboard/angstrom:
> 
> 	TUNE_FEATURES_append_omap3 = " neon"

There isn't an omap3 tune in there at present but:

meta/conf/machine/include/tune-cortexa8.inc:

TUNE_FEATURES_tune-cortexa8 ??= "hard-fpu neon"

so neon is the default for that platform. I'm imagining that for omap3
we can do something similar.

> I would also add something like the following:
> 
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -166,7 +166,7 @@ python base_eventhandler() {
>          if name.startswith("BuildStarted"):
>                 bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
> -               statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TARGET_FPU']
> +               statusvars = ['BB_VERSION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', 'DISTRO_VERSION','TUNE_FEATURES']
>                 statuslines = ["%-17s = \"%s\"" % (i, bb.data.getVar(i, e.data, 1) or '') for i in statusvars]

Agreed, that is a useful touch and makes that line in the status way
more useful for other architectures too.

> Finally a small nitpick: debian uses 'hf' as hardfloat suffix and I prefer that over '-hfp'.

Easy to change, I have no real preference.

>  Meego calls it armv8, but let's not go there.

Agreed ;-).

Cheers,

Richard



