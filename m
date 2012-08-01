Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SwcIl-0000CM-T1
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 19:01:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2012 09:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129290838"
Received: from unknown (HELO envy.home) ([10.255.13.51])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2012 09:50:00 -0700
Message-ID: <50195DCC.1080801@linux.intel.com>
Date: Wed, 01 Aug 2012 09:48:12 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<CAEsOVNeJxw0VbwPX+90riJeVzTQYLdR7dCp==TiCj+eCe=eExw@mail.gmail.com>
	<50183986.1030203@windriver.com>
In-Reply-To: <50183986.1030203@windriver.com>
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
X-List-Received-Date: Wed, 01 Aug 2012 17:01:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/31/2012 01:01 PM, Mark Hatle wrote:
> On 7/31/12 2:36 PM, McClintock Matthew-B29882 wrote:
>> On Tue, Jul 31, 2012 at 1:14 PM, Stuart Yoder <b08248@gmail.com> wrote:
>>> We are doing some work with LXC (containers) and one of the templates
>>> is for busybox.  For LXC, the busybox package needs to be built statically and
>>> there is a config option for this.
>>>
>>> A couple possible approaches:
>>>
>>>     -create a new 'busybox_static' recipe that the lxc package
>>>      depends on that turns on the needed build options.   Pretty
>>>      straightforward, but now there are 2 variants of the busybox
>>>      package.
>>
>> This would seem to work OK with RDEPENDS += "busybox-static" and just
>> adding the extra static bits for for the static version. It seems OK
>> except we would/could start to get lots of recipes like this.
>>
>>>     -somehow propagate some configuration options through to
>>>      the standard busybox recipe so it turns on the config
>>>      option to build things statically.   Not sure how to
>>>      do this, and seems like it could get pretty messy.
>>
>> Are there any mechanism that currently exist for this? We could turn
>> on a DISTRO_FEATURE if we knew we were going use lxc, but that's more
>> involved than just adding the lxc recipe and getting the right stuff
>> in the root file system.
> 
> Kernel config fragment mechanism is there and IMHO works well for something like 
> this, assuming configuration is using standard
> 
> FOO = value
> 
> # FOO is not set
> 
> kernel semantics....

I've been wanting to get the kernel merge-config mechanism available for
busybox for a while. It definitely seems like the right way to go here.
It could also really simplify some of the logic in the busybox recipe.

--
Darren

> 
>> Does anyone else have any thoughts on the best approach here?
> 
> In this case, I don't think it's a distro feature, it's really a package 
> configuration option -- the assumption is the rest of the system isn't 
> statically linked.  (Our case was that we wanted a static busybox for an initrd...)
> 
>> -M
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


