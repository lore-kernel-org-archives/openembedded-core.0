Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-06.prod.phx3.secureserver.net
	(p3plsmtpa09-06.prod.phx3.secureserver.net [173.201.193.235])
	by mail.openembedded.org (Postfix) with ESMTP id 48D5D70EE2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 16:54:24 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-06.prod.phx3.secureserver.net with 
	id l4uL1o00p1mTNtu014uMk4; Sat, 30 Aug 2014 09:54:22 -0700
Message-ID: <540201BC.6070702@pabigot.com>
Date: Sat, 30 Aug 2014 11:54:20 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <540148D5.2040808@pabigot.com> <1409384965.29296.214.camel@ted>
In-Reply-To: <1409384965.29296.214.camel@ted>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: armv6k support in OE for raspberrypi and s3c6410
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
X-List-Received-Date: Sat, 30 Aug 2014 16:54:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2014 02:49 AM, Richard Purdie wrote:
> On target is harder however the on target gcc is compiled to a specific
> PACKAGE_ARCH so we should be able to put specific tuning into that gcc.
> It does sound like the changes to gcc-configure-common.inc were not the
> way to resolve this though, I'd misunderstood what the patches were
> doing.

Sorry; I misunderstood what -mtune was meant to do and made it sound 
worse than it is.  -mtune must be used in conjunction with -march and 
does not provide a default architecture as I had expected.  It's -mcpu 
that defaults -march.

--with-arch=foo in gcc's configuration switches is doing exactly what it 
should and I believe it's the best approach with minimal impact on how 
OE toolchains have historically been built and invoked.  I have no 
concerns about this resolution.

(If others are less trusting, I have patches to revert the --with-arch 
change and remove the TARGET_CC_ARCH stuff from gcc-runtime, which is an 
alternative approach that also meets my requirement.  But that has a 
much wider impact than what we're doing now and I don't think it's a 
good approach.)

On full investigation, the Boost issue is completely unrelated. Boost 
1.56 simply will not work with any platform that explicitly uses 
-march=armv6.  That needs to be fixed in Boost; reverting gcc won't help.

Alternatively meta-raspberrypi could set -march=armv6k and deal with the 
ramifications of doing that (viz making PACKAGE_ARCH reflect the 
difference from armv6).  There's nothing at all wrong about it being 
armv6 as it is now: it just wouldn't be the best choice for atomic 
operations if armv6k were a supported option.

Peter

