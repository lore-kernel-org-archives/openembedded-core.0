Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QbyPM-0007Ya-76
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 19:18:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Jun 2011 10:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,444,1304319600"; d="scan'208";a="20414955"
Received: from unknown (HELO [10.255.13.252]) ([10.255.13.252])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2011 10:03:29 -0700
Message-ID: <4E0B5AE1.6030006@intel.com>
Date: Wed, 29 Jun 2011 10:03:29 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
	<7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
In-Reply-To: <7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
Subject: Re: Conflicting providers for ssh/sshd (dropbear and	openssh)
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
X-List-Received-Date: Wed, 29 Jun 2011 17:18:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2011 01:56 AM, Koen Kooi wrote:
>
> Op 29 jun 2011, om 10:50 heeft Anders Darander het volgende
> geschreven:
>
>> On Wed, Jun 29, 2011 at 10:24, Koen
>> Kooi<koen@dominion.thruhere.net>  wrote:
>>> Op 29 jun 2011, om 00:41 heeft Khem Raj het volgende geschreven:
>>>> If they are independent then may be the openssh recipe should
>>>> be divided into openssh-ssh and openssh-rest so one can use
>>>> openssh provided daemon or dropbear provided as they wish
>>>
>>> Dividing the openssl recipe would gain us little and the gains
>>> would be only for the power companies since you'd have to build
>>> openssh twice to get both sftp and ssh. The decrease in build
>>> time for only sftp is neglible.
>>
>> Hm, speaking against what I've often been advocating (reducing
>> build time by factoring out dependenies etc)...
>>
>> I think the simplest and most straightforward solution is to just
>> split the packaging into openssh-ssh and openssh-sftp, where
>> openssh-sftp packages just what is needed for handling the
>> sftp-server in cooperation with dropbear. It could possibly also
>> include the sftp-client if desired/needed.
>
> That's already the case now. The problem is the PROVIDES overlap
> since the Poky people decided a distro could only have one true ssh
> implementation instead of choosing it per image. So if your distro
> doesn't set the PREFERRED_PROVIDER_sshd you get those nagging
> messages during parsing that scare users and make consultants rich.
>
> OE .dev isn't a lot better with the misguided DISTRO_SSH_DAEMON, but
> at least it doesn't show those nag messages.

It's worth noting that one of the things I got into master just after 
Yocto 1.0 shipped was a refactoring of how ssh servers were specified. 
It no longer is a distro choice - we have task-core-ssh-openssh and 
task-core-ssh-dropbear that you add to IMAGE_FEATURES for your desired 
image.

Which makes me wonder what the consequences would be to simply remove 
the PROVIDES from the dropbear and openssh recipes?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


