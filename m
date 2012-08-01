Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SwcKL-0000Eo-QK
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 19:03:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Aug 2012 09:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129291468"
Received: from unknown (HELO envy.home) ([10.255.13.51])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2012 09:51:36 -0700
Message-ID: <50195E2C.1090706@linux.intel.com>
Date: Wed, 01 Aug 2012 09:49:48 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
	<CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
	<CALRxmdDzaizHQ8m1NFRp2-Ucn9Pm6vZJX=pTTdZ5aLx-61OUzw@mail.gmail.com>
	<50195AFF.1070507@windriver.com>
In-Reply-To: <50195AFF.1070507@windriver.com>
X-Enigmail-Version: 1.4.3
Subject: Re: static busybox?
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
X-List-Received-Date: Wed, 01 Aug 2012 17:03:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/01/2012 09:36 AM, Mark Hatle wrote:
> On 8/1/12 11:21 AM, Stuart Yoder wrote:
>> On Tue, Jul 31, 2012 at 3:07 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> On Tue, Jul 31, 2012 at 3:59 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> On 7/31/12 1:14 PM, Stuart Yoder wrote:
>>>>>
>>>>> We are doing some work with LXC (containers) and one of the templates
>>>>> is for busybox.  For LXC, the busybox package needs to be built statically
>>>>> and
>>>>> there is a config option for this.
>>>>>
>>>>> A couple possible approaches:
>>>>>
>>>>>      -create a new 'busybox_static' recipe that the lxc package
>>>>>       depends on that turns on the needed build options.   Pretty
>>>>>       straightforward, but now there are 2 variants of the busybox
>>>>>       package.
>>>>>
>>>>>      -somehow propagate some configuration options through to
>>>>>       the standard busybox recipe so it turns on the config
>>>>>       option to build things statically.   Not sure how to
>>>>>       do this, and seems like it could get pretty messy.
>>>>>
>>>>> Any thoughts?
>>>>
>>>>
>>>> We've been talking about this as well..  I'm currently of the opinion that
>>>> the kernel's config fragement processing be added to busybox.  This way
>>>> someone can simply add a configuration fragment via a bbappend, or other
>>>> approach and it'll pick it up.   That same can be used to specify how to
>>>> enable other optional pieces of busybox.
>>>
>>> merge_config.pl can be yanked out of the kernel source tree (it's upstream) and
>>> packaged as something for use by busy box.
>>>
>>> I wouldn't recommend all the scaffolding that the kernel has (it's
>>> overkill, since
>>> there are more configs, patches and git manipulations in play for the
>>> kernel), but a\
>>> simple scheme to collect the fragments from the SRC_URI and fire them through
>>> merge_config.pl would be a pretty simple python routine.
>>
>> So how would this work from the user's point of view?   I somehow
>> need to get busybox's CONFIG_STATIC config option set.   Does the lxc
>> recipe somehow
>> specify this?   Or does the lxc recipe reference a busybox-static
>> dependency that sets the option?
> 
> You would be able to add a .bbappend that would have a configuration fragment in 
> it.  This fragment would be added to the busybox configuration to override any 
> built in items.
> 
> So you'd need to simply have a file that says:
> 
> CONFIG_STATIC = y

Exactly.

And merge_config is a .sh, no perl required :-)

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


