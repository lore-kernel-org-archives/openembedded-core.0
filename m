Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmTAA-0006Tg-5H
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 18:10:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jul 2011 09:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,283,1309762800"; d="scan'208";a="32616539"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2011 09:05:40 -0700
Message-ID: <4E3188D3.8040405@linux.intel.com>
Date: Thu, 28 Jul 2011 09:05:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Kumar Gala <galak@kernel.crashing.org>
References: <1F827C13-EF18-4D1E-AAA1-381361929F39@kernel.crashing.org>	<65A75BC37EC7EE4F88AB5EB98759A97003E6E32F@LONMLVEM04.e2k.ad.ge.com>
	<315B4992-8E1A-4DD3-8D3D-E8FD2436B365@kernel.crashing.org>
In-Reply-To: <315B4992-8E1A-4DD3-8D3D-E8FD2436B365@kernel.crashing.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Crossley,
	Malcolm \(GE Intelligent Platforms\)" <Malcolm.Crossley@ge.com>
Subject: Re: [yocto] mpc8315e-rdb core-image-minimal fails
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
X-List-Received-Date: Thu, 28 Jul 2011 16:10:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 08:45 AM, Kumar Gala wrote:
> I think I know the cause, let me dig up the change that is related.  What bit is looking for just ppc603e?
>
This might also be related to the PACKAGE_EXTRA_ARCHS issue, please try 
the patch that Koen posted.

Thanks
	Sau!

> - k
>
> On Jul 28, 2011, at 10:42 AM, Crossley, Malcolm (GE Intelligent Platforms) wrote:
>
>> Hi Kumar,
>>
>> I'm just debugging the same issue.
>>
>> It's caused by folder for the target specific packages being mis-named
>> "powerpcppc603e" instead of "ppc603e" which the rpm package bbclass is
>> expecting.
>>
>> I haven't figured out why this is happening yet but I have a workaround
>> which is to move ${BUILD_DIR}/deploy/rpm/powerpcppc603e to
>> ${BUILD_DIR}/deploy/rpm/ppc603e.
>>
>> I will let you know as soon as I find the cause.
>>
>> Regards
>>
>> Malcolm
>>
>> -----Original Message-----
>> From: yocto-bounces@yoctoproject.org
>> [mailto:yocto-bounces@yoctoproject.org] On Behalf Of Kumar Gala
>> Sent: 28 July 2011 15:26
>> To: Patches and discussions about the oe-core layer
>> Cc: Yocto discussion list
>> Subject: [yocto] mpc8315e-rdb core-image-minimal fails
>>
>> Anyone got any ideas about the following:
>>
>> | ERROR: Function 'do_rootfs' failed (see
>> /local/home/galak/git/poky/build/tmp/work/mpc8315e_rdb-poky-linux/core-i
>> mage-minimal-1.0-r0/temp/log.do_rootfs.19834 for fu
>> rther information)
>> | Generating solve db for
>> /local/home/galak/git/poky/build/tmp/deploy/rpm/mpc8315e_rdb...
>> |    total:               1      0.000000 MB      1.573137 secs
>> |    fingerprint:       816      0.004148 MB      0.062215 secs
>> |    install:           272      0.000000 MB      0.384963 secs
>> |    dbadd:             272      0.000000 MB      0.375238 secs
>> |    dbget:            1111      0.000000 MB      0.003093 secs
>> |    dbput:             272      1.315744 MB      0.302582 secs
>> |    readhdr:          2721      2.573624 MB      0.178385 secs
>> |    hdrload:          1360      3.828344 MB      0.007262 secs
>> |    hdrget:          49259      0.000000 MB      0.048944 secs
>> | Generating solve db for
>> /local/home/galak/git/poky/build/tmp/deploy/rpm/all...
>> |    total:               1      0.000000 MB      0.111129 secs
>> |    fingerprint:        18      0.000024 MB      0.000280 secs
>> |    install:             6      0.000000 MB      0.044466 secs
>> |    dbadd:               6      0.000000 MB      0.039504 secs
>> |    dbget:              19      0.000000 MB      0.000103 secs
>> |    dbput:               6      0.018916 MB      0.006250 secs
>> |    readhdr:            61      0.038096 MB      0.000212 secs
>> |    hdrload:            33      0.063864 MB      0.000327 secs
>> |    hdrget:            983      0.000000 MB      0.001306 secs
>> | Generating solve db for
>> /local/home/galak/git/poky/build/tmp/deploy/rpm/all...
>> | Processing task-core-boot...
>> | error: Failed dependencies:
>> |       tinylogin is needed by task-core-boot-1.0-r7.mpc8315e_rdb
>> |       busybox is needed by task-core-boot-1.0-r7.mpc8315e_rdb
>> |       modutils-initscripts is needed by
>> task-core-boot-1.0-r7.mpc8315e_rdb
>> |       initscripts is needed by task-core-boot-1.0-r7.mpc8315e_rdb
>> |       update-alternatives-cworth is needed by
>> task-core-boot-1.0-r7.mpc8315e_rdb
>> |       udev is needed by task-core-boot-1.0-r7.mpc8315e_rdb
>> |       sysvinit is needed by task-core-boot-1.0-r7.mpc8315e_rdb
>> |       netbase is needed by task-core-boot-1.0-r7.mpc8315e_rdb
>> |       base-passwd is needed by task-core-boot-1.0-r7.mpc8315e_rdb
>> |       console-tools is needed by keymaps-1.0-r19.mpc8315e_rdb
>> |       initscripts is needed by keymaps-1.0-r19.mpc8315e_rdb
>> |       /bin/sh is needed by keymaps-1.0-r19.mpc8315e_rdb
>> NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Failed
>> ERROR: Task 8
>> (/local/home/galak/git/poky/meta/recipes-core/images/core-image-minimal.
>> bb, do_rootfs) failed with exit code '1'
>> ERROR:
>> '/local/home/galak/git/poky/meta/recipes-core/images/core-image-minimal.
>> bb' failed
>>
>> - k
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto
>
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>


