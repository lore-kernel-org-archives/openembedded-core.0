Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 082A16010D;
	Mon, 23 Nov 2015 21:41:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 23 Nov 2015 13:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,338,1444719600"; d="scan'208";a="858215563"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.157])
	([10.219.16.157])
	by fmsmga002.fm.intel.com with ESMTP; 23 Nov 2015 13:41:11 -0800
Message-ID: <56538808.5050606@linux.intel.com>
Date: Mon, 23 Nov 2015 15:41:28 -0600
From: Mariano Lopez <mariano.lopez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	OE-core <openembedded-core@lists.openembedded.org>, yocto@yoctoproject.org
Subject: RFC: Reference updater filesystem
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
X-List-Received-Date: Mon, 23 Nov 2015 21:41:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

There has been interest in an image based software updater in Yocto 
Project. The proposed solution for a image based updater is to use 
Stefano Babic's software updater (http://sbabic.github.io/swupdate). 
This software do a binary copy, so it is needed to have at least two 
partitions, these partitions would be the rootfs and the maintenance 
partition. The rootfs it's the main partition used to boot during the 
normal device operation, on the other hand, the maintenance will be used 
to update the main partition.

To update the system, the user has to connect to device and boot in the 
maintenance partition; once in the maintenance partition the software 
updater will copy the new image in the rootfs partition. A final reboot 
into the rootfs it is necessary to complete the upgrade.

As mentioned before the the software will copy an image to the 
partition, so everything in that partition will be wiped out, including 
custom configurations. To avoid the loss of configuration I explore 
three different solutions:
1. Use a separate partition for the configuration.
   a. The pro of this method is the partition is not touched during the 
update.
   b. The con of this method is the configuration is not directly in 
rootfs (example: /etc).

2. Do the backup during the update.
   a. The pro is the configuration is directly in rootfs.
   b. The con is If the update fail most likely the configuration would 
be lost.

3. Have an OverlayFS for the rootfs or the partition that have the 
configuration.
   a. The pro is the configuration is  "directly" in rootfs.
   b. The con is there is need to provide a custom init to guarantee the 
Overlay is mounted before the boot process.

With the above information I'm proposing to use a separate partition for 
the configuration; this is because is more reliable and doesn't require 
big changes in the current architecture.

So, the idea is to have 4 partitions in the media:
1. boot. This is the usual boot partition
2. data. This will hold the configuration files. Not modified by updates.
3. maintenance. This partition will be used to update rootfs.
4. rootfs. Partition used for normal operation.

Mariano

