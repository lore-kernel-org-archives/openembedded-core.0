Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Symd8-0007g5-Aj
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 18:27:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2012 09:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="177046150"
Received: from unknown (HELO envy.home) ([10.255.12.197])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2012 09:15:50 -0700
Message-ID: <50213ECA.7020903@linux.intel.com>
Date: Tue, 07 Aug 2012 09:14:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
	<1344182057-15981-18-git-send-email-javier@dowhile0.org>
	<50200899.7000500@linux.intel.com>
	<1344277316.4874.2.camel@x121e.pbcl.net>
In-Reply-To: <1344277316.4874.2.camel@x121e.pbcl.net>
X-Enigmail-Version: 1.4.3
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 17/30] linux-firware: use ${base_libdir} instead of /lib for packaging
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
X-List-Received-Date: Tue, 07 Aug 2012 16:27:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/06/2012 11:21 AM, Phil Blundell wrote:
> On Mon, 2012-08-06 at 11:10 -0700, Darren Hart wrote:
>> On 08/05/2012 08:54 AM, Javier Martinez Canillas wrote:
>>> It is considered good practice to use the build system provided
>>> variables instead of directly specify hardcoded paths.
>>
>> The firmware location is explicitly set because this is where the Linux
>> kernel requires it to be. 
> 
> Is that actually true?  I thought the kernel just supplied the leafname
> that it wanted and the knowledge about what directory to search was
> encoded in the hotplug helper scripts.

I was sure it was true at the time, but trying to get a reference from
the source suggests I was mistaken. According to
Documentation/firmware_class/README, the hotplug script is responsible
for locating the firmware by basename and catting it to a sysfs file for
the kernel to then read.

While there are several hardcoded references to "/lib/firmware"
(comments, installation of in-kernel firmware, etc.), none of these seem
to be related to loading firmware installed via linux-firmware.

So... the question I guess is: does hotplug know to look in
${base_libdir}/firmware.

But the larger concern, is that all these changes appear to have been
done via search/replace without any functional testing of the result.

--
Darren

> 
>> This patch will break firmware loading.
> 
> That might well be the case, though, unless the scripts have also been
> patched to respect ${base_libdir}.  
> 
> And, notwithstanding all the above, it's not entirely obvious that
> ${base_libdir} is semantically the right variable for things that aren't
> libraries.  How does the udev recipe represent the patch to /lib/udev?
> 
> p.
> 
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


