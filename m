Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EC8306011C;
	Tue, 24 Nov 2015 18:40:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 24 Nov 2015 10:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,339,1444719600"; d="scan'208";a="858909550"
Received: from jwbarz-mobl2.amr.corp.intel.com (HELO [10.254.191.22])
	([10.254.191.22])
	by fmsmga002.fm.intel.com with ESMTP; 24 Nov 2015 10:39:59 -0800
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
References: <56538808.5050606@linux.intel.com>
	<20151124060620.GA10937@ad.chargestorm.se>
From: "Lopez, Mariano" <mariano.lopez@linux.intel.com>
Message-ID: <5654AEFD.4090802@linux.intel.com>
Date: Tue, 24 Nov 2015 12:39:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151124060620.GA10937@ad.chargestorm.se>
Subject: Re: [yocto] RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 18:40:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/24/2015 12:06 AM, Anders Darander wrote:
> * Mariano Lopez <mariano.lopez@linux.intel.com> [151123 22:41]:
>
>> There has been interest in an image based software updater in Yocto Project.
> Ok. Sure, it might be nice with something that can be shared, instead
> off everyone's building our own solutions.

The idea is to integrate one, not build one from the scratch.

>
>> The proposed solution for a image based updater is to use Stefano Babic's
>> software updater (http://sbabic.github.io/swupdate). This software do a
>> binary copy, so it is needed to have at least two partitions, these
>> partitions would be the rootfs and the maintenance partition. The rootfs
>> it's the main partition used to boot during the normal device operation, on
>> the other hand, the maintenance will be used to update the main partition.
> I haven't checked the swupdate tool, though I'd suspect that it also
> supports the alternating rootfs use case? (I.e. run system1 update
> system2; reboot to system2. Next update is system1). This is a rather
> common setup, not least when you need a remote upgrade facility.
>
> Would your proposed inclusion to the Yocto Project support that case
> too?

Yeah, it would be possible to have two "rootfs" and do the update and 
the just reboot one time.

>
>> To update the system, the user has to connect to device and boot in the
>> maintenance partition; once in the maintenance partition the software
>> updater will copy the new image in the rootfs partition. A final reboot into
>> the rootfs it is necessary to complete the upgrade.
> Like said above, not all system can be reached manually (at least not in
> cost efficient way). Sure, the mainenance partition scheme can be made
> to work anyway...

I plan to release this in phases, in the first one it will be manually 
do the update. The idea is implement tools to automate the process of 
the update (where it can be automated).

>
>> As mentioned before the the software will copy an image to the partition, so
>> everything in that partition will be wiped out, including custom
>> configurations. To avoid the loss of configuration I explore three different
>> solutions:
>> 1. Use a separate partition for the configuration.
>>    a. The pro of this method is the partition is not touched during the
>> update.
>>    b. The con of this method is the configuration is not directly in rootfs
>> (example: /etc).
> I'd vote for that as well. Though, I only keep the re-writable
> configurations here. The one that are constant between all systems are
> shipped in /etc in the read-only-rootfs.
>
>> With the above information I'm proposing to use a separate partition for the
>> configuration; this is because is more reliable and doesn't require big
>> changes in the current architecture.
>> So, the idea is to have 4 partitions in the media:
>> 1. boot. This is the usual boot partition
>> 2. data. This will hold the configuration files. Not modified by updates.
>> 3. maintenance. This partition will be used to update rootfs.
>> 4. rootfs. Partition used for normal operation.
> How flexible to you intend to make this system? Allow everything that
> swupdate supports? Or a specific subset?

If you are referring to the filesystem creation I would say very 
flexible. It will be implemented using wic instead of a class, so just 
needs to change a file to suit your needs. If you refer to the swupdate 
features, I plan to have a generic use case; as an example I won't use 
the MTD capabilities of the software.

>
> Cheers,
> Anders
>


