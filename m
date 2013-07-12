Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 015F06A467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 08:34:48 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UxYoR-0003jm-3N; Fri, 12 Jul 2013 10:34:47 +0200
Message-ID: <1373618076.21102.48.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: jackie.huang@windriver.com
Date: Fri, 12 Jul 2013 09:34:36 +0100
In-Reply-To: <3393c80c31d82ac23afcddd39b1b24a9b5c1e696.1373607104.git.jackie.huang@windriver.com>
References: <cover.1373607104.git.jackie.huang@windriver.com>
	<3393c80c31d82ac23afcddd39b1b24a9b5c1e696.1373607104.git.jackie.huang@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1 v2] kbd: Limit the kbdrate application to x86, mips and sparc
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
X-List-Received-Date: Fri, 12 Jul 2013 08:34:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-07-12 at 13:42 +0800, jackie.huang@windriver.com wrote:
> The code relies on hardware specific memory locations to access
> and modify the keyboard repeat rate.  It also requires read/write
> access to /dev/port which doesn't exist on every architecture's
> root fs. The defect was raised for Qemu PowerPC but it also fails on
> ARM.  The keyboard emulation in qemuppc is for an ADB (Apple Desktop
> Bus) device and not compatible with an Intel driver.  There's also no
> indication in the documentation that the code should work on anything
> other than Intel architecture but it also works on MIPS.

This reasoning seems slightly spurious.  There do exist ARM and PPC
machines where kbdrate works, it's just that the hardware emulated by
qemuarm and qemuppc doesn't happen to fall into that category.  Equally,
there are certainly mips machines (and might conceivably be some
x86/sparc ones) where it doesn't work.  So I don't think you can make
any sensible determination about the supportedness or not of kbdrate
based on TARGET_ARCH alone.  

Of course, the right answer really is for rate setting to go through the
kernel driver (which knows what sort of hardware it is using) rather
than for kbdrate to go poking at random I/O ports.

p.



