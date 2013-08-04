Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 670B5605F3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 05:30:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2013 22:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,811,1367996400"; d="scan'208";a="380901222"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2013 22:30:48 -0700
Message-ID: <51FDE708.2080005@linux.intel.com>
Date: Sat, 03 Aug 2013 22:30:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130731055134.2BD98504B3@opal> <20130803232303.GA3280@jama>
In-Reply-To: <20130803232303.GA3280@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Muhammad Shakeel : systemd: Remove init. d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Sun, 04 Aug 2013 05:30:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2013 04:23 PM, Martin Jansa wrote:
> On Wed, Jul 31, 2013 at 05:51:34AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 823c90ad344ca2205f3055e2dcae08c6616f29b7
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=823c90ad344ca2205f3055e2dcae08c6616f29b7
>>
>> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>> Date:   Mon Jul 29 13:09:51 2013 +0500
>>
>> systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
>>
>> If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
>> systemd_unitdir contains anything then no need to keep init.d scripts
>> for sysvinit compatibility.
>>
>> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> There is small issue with this patch applied:
>
> do_rootfs failing:
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for packagegroup-core-boot:
> |  *    busybox-hwclock *
> |  * opkg_install_cmd: Cannot install package packagegroup-core-boot.
>
> Systemd images with packagegroup-core-boot RDEPEND on busybox-hwclock:
> meta/recipes-core/packagegroups/packagegroup-core-boot.bb:
> ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d)} \
>
> Which is created only when there is /etc/init.d/hwclock.sh file:
> FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
>
> There are at least 3 options
> 1) ALLOW_EMPTY_${PN}-hwclock = "1"
> in busybox.inc
> 2) add hwclock.service to the same package
> 3) change packagegroup-core-boot to depend on busybox-hwclock only with
> sysvinit enabled
>
> I think the best way to resolve this is 2), any volunteer?
>
I think my patch from Friday, which I needed to correct the commit 
message should address this in packagegroup-boot-core, which is #3 on 
your list.

This was discussed in Bug # 4969 
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=4969) and systemd 
uses timedatectl.

If you have more details or other thoughts, please comment here or on 
that bug.

Thanks
	Sau!



>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

