Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 18B066FF24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:00:07 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id em051o0051mTNtu01m05oY; Thu, 14 Aug 2014 15:00:07 -0700
Message-ID: <53ED3164.2010705@pabigot.com>
Date: Thu, 14 Aug 2014 17:00:04 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <53E9134F.7040108@pabigot.com>	
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>	
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>	
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>	
	<53EBF375.1070701@pabigot.com>	
	<CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>	
	<53EC16FC.8020109@pabigot.com>	
	<CAMKF1srPpoob-sxfv_OF-5po41tAFZNaparZJ2WOrzMTjB=n2g@mail.gmail.com>	
	<53EC7E27.6010507@pabigot.com> <1408052429.21596.2.camel@ted>
In-Reply-To: <1408052429.21596.2.camel@ted>
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
X-List-Received-Date: Thu, 14 Aug 2014 22:00:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2014 04:40 PM, Richard Purdie wrote:
> On Thu, 2014-08-14 at 04:15 -0500, Peter A. Bigot wrote:
>> What this means is that the libraries built by gcc-runtime use
>> TARGET_CC_ARCH settings that don't necessarily match the target
>> compiler's defaults, and that ABI conflicts can result by linking in
>> those libraries when the non-default settings were absent in non-OE
>> application builds.  ABI can only be "guaranteed" if every one of the
>> -mFOO=BAR passed in TARGET_CC_ARCH (*or defaulted by the compiler*) has
>> a corresponding -with-FOO=BAR option passed to (*or inferred by*) gcc's
>> configure.
>>
>> That's a pretty strong assumption to make.
>>
>> It may be that this can be worked around for the specific case I raised
>> by explicitly adding --with-arch=armv7-a to gcc-target's EXTRA_OECONF. I
>> do have to wonder whether the same should be done for any of armv7
>> armv7-m armv7-r armv7e-m armv7ve armv8-a armv8-a+crc which are other
>> -march options that are armv6+, and whether there are other ABI issues
>> that might be hiding now or in the future because TARGET_CC_ARCH makes
>> more assumptions than gcc-target does.
>>
>> The solution I propose is to rework gcc-runtime's override of CC/CXX/CPP
>> so the libraries are built the same way they would be if they had been
>> built during gcc-target.
>>
>>   From initial attempts this won't be easy to do.  I'd be happy to keep
>> trying if this worries other people, but if I'm being too picky I'll
>> just suck it up and move on.
> Its a valid concern, I just don't think anyone else has run into the
> kinds of issues you're seeing :/.

I think it's more that somebody found a workaround and posted it on 
stackoverflow so nobody reported back to OE.  A potential client I 
talked to yesterday mentioned having run into this exact problem a month 
or so ago, and the earliest mention of it I've found was from a year ago 
[1].  As use of threading in C++11 becomes more common I'd expect it to 
have had increased visibility.

I'm content with the solution in my v2 gcc patch series, but I expect 
someday the underlying cause will re-appear as new processors have new 
features with ABI impacts due to gcc target optimization. Hopefully when 
that happens the discussion here will be of some help in identifying the 
problem.

Peter

[1] 
https://groups.google.com/forum/#!msg/automatak-dnp3/Jisp_zGhd5I/ck_Cj6nO8joJ


