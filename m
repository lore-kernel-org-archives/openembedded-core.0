Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPf0x-0003DX-8A
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 20:10:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2011 11:07:26 -0700
X-ExtLoop1: 1
Received: from doubt.jf.intel.com (HELO [10.24.80.114]) ([10.24.80.114])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 11:07:26 -0700
Message-ID: <4DDE96F0.9030608@linux.intel.com>
Date: Thu, 26 May 2011 11:07:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DDBDE9D.5000709@linux.intel.com>
	<1306338695.27470.41.camel@rex>	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>	<1306360265.27470.71.camel@rex>
	<BANLkTimH3Dp_kec8RdHTzicHS5jn5iGG7w@mail.gmail.com>
In-Reply-To: <BANLkTimH3Dp_kec8RdHTzicHS5jn5iGG7w@mail.gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Thu, 26 May 2011 18:10:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Jason,

On 05/25/2011 04:31 PM, Jason Kridner wrote:
> This thread got pretty long pretty fast, but I am imagining there is some
> place still here for me to chime in and build my own understanding of what
> we are doing...

Of course, thanks for the input...

> 
> On Wed, May 25, 2011 at 5:51 PM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
>> On Wed, 2011-05-25 at 09:36 -0700, Khem Raj wrote:
>>> On Wed, May 25, 2011 at 8:51 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> I did a little research and I'd like to try and help us move forward.
>>>>
>>>> The "problem" at the moment is both oe-core and meta-ti have u-boot
>>>> recipes. If Yocto were to merge in the meta-ti recipe to meta-yocto it
>>>> would overshadow the oe-core recipe. I believe Yocto wants to encourage
>>>> sharing a core on codebases like u-boot which are receptive and working
>>>> to facilitate collaboration (not unlike Yocto itself).
>>
> 
> I like the bootloader living in the BSP layer, but if the mainline recipe is
> something we can all build upon in a reasonable fashion, I can see value in
> having it in oe-core.  It would seem an ugly duplicate to put it in
> meta-yocto and I'm still quite confused on what is meant to live there.
> What is done across the other ISAs?  Are they all living in meta-yocto or do
> they pull in from their own BSP layers?


AFAIK, meta-yocto should only contain support for 4 example hardware
platforms, one for each architecure (arm, mips, ppc, x86). What we're
running into here, I think, is that the board we've selected for arm
also has a mature BSP in meta-ti.


>>>
>>>> Valid questions are therefore:
>>>>
>>>> a) What can we do to the u-boot recipe in core to make it customisable
>>>> from layers like meta-ti
>>
> 
> To confirm, this means that building Yocto for BeagleBoard including meta-ti
> is *not* an issue outside of the conflicting recipes?  This was something
> we'd have needed to resolve anyway, no?


My current thinking on this is that for meta-yocto we want to have a
reasonably functional self-contained example BSP for ARM. Beagleboard
was the board selected for that. meta-yocto should be able to build the
core-image-* images and have them work on Beagleboard without needing to
pull in the meta-ti layer.

For additional Beagleboard support and perhaps more state-of-the-art
features, people looking to develop for the Beagleboard should also
include the meta-ti layer.

Having said this, I'm leaning toward just using the oe-core virgin uboot
recipe in meta-yocto as it is adequate to boot the Beagleboard. Then the
meta-ti layer provides the backports that provide some polish and usability.

Does anyone disagree with my thinking outlined here?


> 
> 
>>>>
>>>> b) Is it possible for the u-boot recipe in meta-ti to be a .bbappend
>>>> rather than a recipe which overwrites the default.
>>
> 
> You said this recipe is an unpatched mainline, correct?  Creating BSPs with
> .bbappend on top of mainline recipes in oe-core seems like a nice approach
> from my perspective.  Is that what is being suggested here?  Will all 4
> non-qemu BSPs in Yocto's core validation take this approach?


Currently Beagleboard is the only one that uses u-boot. The MPC8315E
could use it... but we're "having technical difficulties" with that at
the moment, so we're using the factory u-boot for the time being. Once
that is resolved, my goal would be for both Beagleboard and the MPC8315
to boot using a stock u-boot if at all possible.


> 
> 
>>>>
>>>> For a), I know Darren has some patches which drop the
>> COMPATIBLE_MACHINE
>>>> usage for example and instead raise the skip parsing exception when
>>>> UBOOT_MACHINE isn't set which is a step in the right direction. If we
>>>> find other issues, lets fix them.
>>>>
>>>> For b), I talked to Koen and he's going to see how feasible this is
>>>> although as always with this kind of issue there are various
>>>> complicating factors.
>>
>>>
>>>> Hopefully if we work both sides of the problem we can get this
>> resolved.
>>>> Darren, if you could send out some of your patches so far (e.g. for
>>>> COMPATIBLE_MACHINE) that might be helpful.
>>>>
>>>> If the ultimate answer is that no, meta-ti has so many changes or
>>>> specific requirements that mean it needs to stay a .bb file then lets
>>>> cross that bridge if we come to it but I think this discussion makes
>>>> sense before reaching that conclusion. Its possible the last release of
>>>> u-boot has sufficient beagle support for yocto's needs and we could use
>>>> that instead.
>>
> 
> The mainline u-boot works pretty well for Beagle, as Darren has confirmed,
> but I think there are a few useful patches as part of the validation image
> for BeagleBoard that have yet to make it upstream due to their platform
> specificity.  I am working those as I have time, but I think it is
> reasonable to have an approach BSP-specific patches temporarily, no?


Agreed.


>  I'd
> hate to get in a situation where we cannot produce the BeagleBoard
> experience that we want.


I think this is consistent with my approach outlined above, meta-yocto
uses oe-core's recipe for a functional bootloader and meta-ti improves
upon that experience via a bbappend.


>>>>
>>>> Just on a more general note, the agreement on resolving the beagleboard
>>>> issue stands as is. The plan is to make beagleboard support in
>>>> meta-yocto as near a copy of the meta-ti pieces as possible with the
>>>> exception of the kernel where linux-yocto will import the needed
>> patches
>>>> to demo the kernel tooling functionality. The layer tooling under
>>>> development will automate the process of syncing those pieces. I think
>>>> everyone is happy with the agreement and we just need to address some
>>>> corner cases like u-boot.
>>>>
>>>
>>> so is it just a question of beagleboard support or a broader support
>>> for all machines ?
>>
>> I'm hoping there are some machines out there which have merged support
>> into the upstream so simply setting UBOOT_MACHINE = "xxx" in the machine
>> config file is enough to get them working.
>>
> 
> I've used mainline with the BeagleBoard, but I'd prefer if we kept control
> over the experience on our platforms and welcome regular encouragement to
> eliminate patches.


nod


>>
>> Basing the system on the premise that every bootloader needs to be
>> custom isn't really where we want to be :/.
>>
> 
> Agreed, but what is "the system" in this respect?  I believe "the system" is
> meant to simplify creation of BSPs for every new platform under the sun, so
> having a way to work with these customizations seems to be a critical part
> of what the system should be.  That said, I take it seriously that after all
> this time there are still out-of-tree patches to u-boot that we are using to
> support the BeagleBoard and that needs to be resolved ASAP.
> 
> 
>>
>>> I know various boards use very different versions
>>> of u-boot so is oe-core going to bring that support
>>> to u-boot in oe-core and maintain that ?
>>
>> No, the idea would be to make it easy to add missing pieces in
>> a .bbappend though.
>>
>>> IMO keeping oe-core relatively free of machine dependent stuff would be
>> better.
>>
>> I'm still in agreement with this.
>>
> 
> What confuses me is that this seemed more directed at using meta-yocto or
> meta-ti for support of the BeagleBoard, not if we wanted to put
> board-dependent stuff in oe-core where I think we all agreed we want to keep
> it clean of machine dependent stuff, unless I missed something.  I still
> wonder if BeagleBoard doesn't belong in a less vendor-specific repository to
> make sure that community developers can adjust it as necessary outside of
> TI.  Though, as long as Koen is happy with it living in meta-ti for
> Angstrom, it seems suitable to me.


I've sent an initial set of u-boot recipe patches that work toward the
approach I've described above. I'll address the points raised and send
out V2 soon.

Thanks!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


