Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PzwOK-00025V-6I
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 20:28:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2011 12:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,195,1299484800"; d="scan'208";a="897985281"
Received: from unknown (HELO [10.255.12.146]) ([10.255.12.146])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2011 12:26:35 -0700
Message-ID: <4D810ED4.6020107@linux.intel.com>
Date: Wed, 16 Mar 2011 12:26:12 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Koen Kooi <koen@beagleboard.org>
References: <bf5f59e00a2ee59636426fabe2d4ae935fe2c4a5.1300295087.git.dvhart@linux.intel.com>
	<13FB91B0-A9A3-41A8-BD13-7F9FB8B2F2CD@beagleboard.org>
In-Reply-To: <13FB91B0-A9A3-41A8-BD13-7F9FB8B2F2CD@beagleboard.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Wed, 16 Mar 2011 19:28:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2011 10:54 AM, Koen Kooi wrote:
>
> Op 16 mrt 2011, om 18:04 heeft Darren Hart het volgende geschreven:
>
>> NOT FOR INCLUSION
>>
>> Before we include something like this, it needs review from folks like Koen and
>> Gary to confirm it works in their environment as well.
>>
>> The existing infrastructure uses an external build tree which references the
>> kernel source in the work dir. If run with rm work, building external modules
>> will fail.
>>
>> This patch places a configured source tree in sysroots. Striking a balance
>> between minimal size and minimal maintenance is difficult. A fully configured
>> tree is about 500MB after a clean. This version leans on the side of caution and
>> removes only the obviously unecessary parts of the source tree to conserve
>> space, resulting in about 170MB. The arch directories would be some additional
>> pruning we could do. Given examples from the devel package from distributions, I
>> suspect this size could be reduced to 75MB or so, but at the cost of a much more
>> complex recipe which is likely to require a great deal more maintenance to keep
>> current with kernel releases.
>>
>> Care is also taken to clean the hostprogs in scripts, and the modules are
>> responsible for building them as needed. Although it is unclear to me if this is
>> really necessary, especially considering that modules put these bits back as
>> soon as they compile. If we are not generating an sstate package, I suspect we
>> can ignore these.
>>
>> Please try this with your modules and let me know how it does. I tried to take
>> non linux-yocto kernel recipes into account, but I have only tested with
>> linux-yocto and the hello-mod recipe so far.
>>
>> V2: o Address 000 perm quilt files (don't copy .pc dir)
>>     o Clear linux-yocto meta dir from sysroots
>>
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>
> This one works beautifully, so:
>
> Acked-by: Koen Kooi<koen@dominion.thruhere.net>

Thanks Koen.

Gary, can you give this version a spin?

If it works, I'm going to suggest we take this as is and carefully prune 
away bits we don't need over time so we can get adequate testing across 
multiple archs, platforms, and modules. Same for the hostprogs cleaning 
bits.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


