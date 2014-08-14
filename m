Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CFB6970CE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7ELeW96003064; Thu, 14 Aug 2014 22:40:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pmL3sRbxUWQh; Thu, 14 Aug 2014 22:40:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7ELeTrX003061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 14 Aug 2014 22:40:31 +0100
Message-ID: <1408052429.21596.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Thu, 14 Aug 2014 22:40:29 +0100
In-Reply-To: <53EC7E27.6010507@pabigot.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
	<53EBF375.1070701@pabigot.com>
	<CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
	<53EC16FC.8020109@pabigot.com>
	<CAMKF1srPpoob-sxfv_OF-5po41tAFZNaparZJ2WOrzMTjB=n2g@mail.gmail.com>
	<53EC7E27.6010507@pabigot.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Thu, 14 Aug 2014 21:40:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-14 at 04:15 -0500, Peter A. Bigot wrote:
> What this means is that the libraries built by gcc-runtime use 
> TARGET_CC_ARCH settings that don't necessarily match the target 
> compiler's defaults, and that ABI conflicts can result by linking in 
> those libraries when the non-default settings were absent in non-OE 
> application builds.  ABI can only be "guaranteed" if every one of the 
> -mFOO=BAR passed in TARGET_CC_ARCH (*or defaulted by the compiler*) has 
> a corresponding -with-FOO=BAR option passed to (*or inferred by*) gcc's 
> configure.
> 
> That's a pretty strong assumption to make.
> 
> It may be that this can be worked around for the specific case I raised 
> by explicitly adding --with-arch=armv7-a to gcc-target's EXTRA_OECONF. I 
> do have to wonder whether the same should be done for any of armv7 
> armv7-m armv7-r armv7e-m armv7ve armv8-a armv8-a+crc which are other 
> -march options that are armv6+, and whether there are other ABI issues 
> that might be hiding now or in the future because TARGET_CC_ARCH makes 
> more assumptions than gcc-target does.
> 
> The solution I propose is to rework gcc-runtime's override of CC/CXX/CPP 
> so the libraries are built the same way they would be if they had been 
> built during gcc-target.
> 
>  From initial attempts this won't be easy to do.  I'd be happy to keep 
> trying if this worries other people, but if I'm being too picky I'll 
> just suck it up and move on.

Its a valid concern, I just don't think anyone else has run into the
kinds of issues you're seeing :/. We don't want to diverge too far from
upstream gcc, equally, we need a working compiler...

Cheers,

Richard


