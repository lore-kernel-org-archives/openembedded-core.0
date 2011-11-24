Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RTc9z-0002jf-CR
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 17:28:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Nov 2011 08:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="79669457"
Received: from unknown (HELO envy.home) ([10.255.15.250])
	by orsmga002.jf.intel.com with ESMTP; 24 Nov 2011 08:21:52 -0800
Message-ID: <4ECE6F24.2060600@linux.intel.com>
Date: Thu, 24 Nov 2011 08:21:56 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
	<B17E0298-4C9C-461A-A713-ADEE9771F8F0@dominion.thruhere.net>
	<1322133994.24143.15.camel@ted>
In-Reply-To: <1322133994.24143.15.camel@ted>
X-Enigmail-Version: 1.3.3
Cc: Josef Ahmad <josef.ahmad@intel.com>, Koen Kooi <koen@dominion.thruhere.net>,
	Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/5] grub-efi-native: New recipe to build GRUB EFI images
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
X-List-Received-Date: Thu, 24 Nov 2011 16:28:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/2011 03:26 AM, Richard Purdie wrote:
> On Thu, 2011-11-24 at 09:59 +0100, Koen Kooi wrote:
>> Op 24 nov. 2011, om 09:05 heeft Darren Hart het volgende geschreven:
>>
>>> Add a recipe to build the GRUB efi images. This recipe is written as
>>> a native recipe as the resulting GRUB utils are required to assemble
>>> the final image. Rather than build a native and a target recipe (and
>>> increase build times), 
>>
>> That's a false dilemma. If you write it as a regular recipe with
>> BBCLASSEXTEND=native your buildtime doesn't increase
> 
> That isn't true, if you build a target and a native version your build
> time does increase. Using BBCLASSEXTEND does improve parsing time over
> having two separate recipes though.

Right, while it isn't a huge project to build, I didn't want to
contribute to the expanding build time unnecessarily.

> 
>>  and you leave open the option of adding more BBCLASSEXTENDS if
>> someone wants to ship it in an SDK.

I think the right thing to do here is to modify the origin grub recipe
to build with the efi platform enabled if we want to ship the binaries
on the TARGET. This recipe doesn't build the grub tools for deployment,
it builds the target bootloader binary image for the boot media. That's
the distinction I'm going with anyway.

> 
> I did talk with Darren about why the recipe is the way it is and there
> are some pretty nasty issues with the way grub builds itself. I'm
> therefore ok with this as a version 1 and we can see whether there are
> any issues that result which need us to rethink the way the recipe is
> constructed. 
> 
> Its currently behaving very like the way the binutils/gcc cross recipes
> will end up (see the separate thread with Matthew) Perhaps it should be
> called grub-efi-cross even if it uses native.bbclass.

If you prefer I can change it, I don't have a strong preference for the
name. That would end up as "grub-efi-${TRANSLATED_TARGET_ARCH}-cross"
after the PN adjustment then?


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


