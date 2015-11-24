Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 81D496011C;
	Tue, 24 Nov 2015 17:19:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Nov 2015 09:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,339,1444719600"; d="scan'208";a="828127184"
Received: from jwbarz-mobl2.amr.corp.intel.com (HELO [10.254.191.22])
	([10.254.191.22])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2015 09:19:46 -0800
To: Randy Witt <rewitt@declaratino.com>
References: <56538808.5050606@linux.intel.com>
	<CAP5N7XH-wVfyyCeBK7gdYXtoDLQuXPKkXV=CRNowmbPUGvxb8Q@mail.gmail.com>
From: "Lopez, Mariano" <mariano.lopez@linux.intel.com>
Message-ID: <56549C31.8010604@linux.intel.com>
Date: Tue, 24 Nov 2015 11:19:45 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP5N7XH-wVfyyCeBK7gdYXtoDLQuXPKkXV=CRNowmbPUGvxb8Q@mail.gmail.com>
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Reference updater filesystem
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
X-List-Received-Date: Tue, 24 Nov 2015 17:19:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2015 1:32 AM, Randy Witt wrote:
>
>
> On Mon, Nov 23, 2015 at 1:41 PM, Mariano Lopez 
> <mariano.lopez@linux.intel.com <mailto:mariano.lopez@linux.intel.com>> 
> wrote:
>
>     There has been interest in an image based software updater in
>     Yocto Project. The proposed solution for a image based updater is
>     to use Stefano Babic's software updater
>     (http://sbabic.github.io/swupdate). This software do a binary
>     copy, so it is needed to have at least two partitions, these
>     partitions would be the rootfs and the maintenance partition. The
>     rootfs it's the main partition used to boot during the normal
>     device operation, on the other hand, the maintenance will be used
>     to update the main partition.
>
>     To update the system, the user has to connect to device and boot
>     in the maintenance partition; once in the maintenance partition
>     the software updater will copy the new image in the rootfs
>     partition. A final reboot into the rootfs it is necessary to
>     complete the upgrade.
>
>     As mentioned before the the software will copy an image to the
>     partition, so everything in that partition will be wiped out,
>     including custom configurations. To avoid the loss of
>     configuration I explore three different solutions:
>     1. Use a separate partition for the configuration.
>       a. The pro of this method is the partition is not touched during
>     the update.
>       b. The con of this method is the configuration is not directly
>     in rootfs (example: /etc).
>
> Configuration files can be anywhere a package decides to install them. 
> So having a single partition would be difficult. If you could, you 
> would most likely be forced to have an initramfs to make sure /etc was 
> mounted before init runs.

/etc was an example, the image should have the required files to make 
the target boot and the get the application configuration from this 
other partition. This is like openwrt does, it has a read-only rootfs 
and small read-write partition where the user can write its 
configuration and restore it at boot time.

>     2. Do the backup during the update.
>       a. The pro is the configuration is directly in rootfs.
>       b. The con is If the update fail most likely the configuration
>     would be lost.
>
> Why would the configuration be lost if the update fails? Couldn't it 
> just be stored on the thumbdrive?

If there is a power loss while the configuration is copied, the 
partition could go corrupt and would be difficult to recover. And as you 
mentioned  before the configuration files could be anywhere, so the 
script must be customized to get all those files and once the update is 
complete another script must restore those files, these could be 
cumbersome instead of the application have the config in another partition.

>     3. Have an OverlayFS for the rootfs or the partition that have the
>     configuration.
>       a. The pro is the configuration is  "directly" in rootfs.
>       b. The con is there is need to provide a custom init to
>     guarantee the Overlay is mounted before the boot process.
>
>     With the above information I'm proposing to use a separate
>     partition for the configuration; this is because is more reliable
>     and doesn't require big changes in the current architecture.
>
>     So, the idea is to have 4 partitions in the media:
>     1. boot. This is the usual boot partition
>     2. data. This will hold the configuration files. Not modified by
>     updates.
>     3. maintenance. This partition will be used to update rootfs.
>     4. rootfs. Partition used for normal operation.
>
>     Mariano
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


