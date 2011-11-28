Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVADp-0000O3-Q4 for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 00:02:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pASMuAjM004817;
	Mon, 28 Nov 2011 22:56:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03924-08; Mon, 28 Nov 2011 22:56:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pASMu1hH004811
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Nov 2011 22:56:01 GMT
Message-ID: <1322520968.30225.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2011 22:56:08 +0000
In-Reply-To: <CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
	<1322264404.25382.4.camel@ted>
	<CAEsOVNcAR_N2LszE41fTaA=FGXMgtOdnCTLvdMxyYC5+GkTkKg@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v3] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Mon, 28 Nov 2011 23:02:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-28 at 21:32 +0000, McClintock Matthew-B29882 wrote:
> On Fri, Nov 25, 2011 at 5:40 PM, Richard Purdie
> > What specific problem are you trying to solve?
> 
> The specific issue I'm having is for our 64-bit part that still uses a
> 32-bit u-boot. Not sure the best approach really is...

Hmm, does it really need libgcc?

> I've tried utilizing multilib by adding the following to my u-boot
> recipe, but it's just hacky...
> 
> DEPENDS_e5500-64b_append = " lib32-gcc"
> CC_e5500-64b = "powerpc-poky-linux-gcc -m32"
> 
> I'd rather NOT recompile gcc/eglibc/etc just for this 32-bit build of
> u-boot where we don't need libc. I'd rather just have a functional
> 32bit/64bit compiler for our 64-bit target.

The trouble is that you need glibc-intermediate to build gcc-cross
(which builds a functional libgcc). You therefore can't short circuit
this as much as you think :/.

> Looking forward farther, I would like to have one toolchain
> ("meta-toolchain") that can produce target code for multiple targets
> also.

This is easier since we would just add lib32-gcc and lib-gcc to the
sysroot. It then becomes a case of just ensuring gcc is configured
correctly.

Cheers,

Richard



