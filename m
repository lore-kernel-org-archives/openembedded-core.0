Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ThO9G-00088V-Mj
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 18:25:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB8HAeof023876
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Dec 2012 09:10:40 -0800 (PST)
Received: from msp-dhcp51.wrs.com (172.25.34.51) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Sat, 8 Dec 2012 09:10:40 -0800
Message-ID: <50C37491.3030603@windriver.com>
Date: Sat, 8 Dec 2012 11:10:41 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
	<50C2E018.6000408@linux.intel.com>
In-Reply-To: <50C2E018.6000408@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Integrate Smart for RPM image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Dec 2012 17:25:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

What is the build configuration for this chunk?

Also this looks like it might be something within the license class, not the 
rootfs, but I'm not sure.

--Mark

On 12/8/12 12:37 AM, Saul Wold wrote:
>
> There still seems to be a problem with the multilib build that I believe
> comes from this set of changes.
>
>> | Running intercept scripts:
>> | WARNING: The license listed MIT was not in the licenses collected for lib32-packagegroup-core-boot
>> | ls: cannot access /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/pkgdata/*/runtime-reverse/udev-extraconf: No such file or directory
>> | readlink: missing operand
>> | Try `readlink --help' for more information.
>> | basename: missing operand
>> | Try `basename --help' for more information.
>> | ERROR: Function failed: do_rootfs (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/work/qemux86_64-poky-linux/lib32-core-image-minimal/1.0-r0/temp/log.do_rootfs.14393 for further information)
>> NOTE: recipe lib32-core-image-minimal-1.0-r0: task do_rootfs: Failed
>> ERROR: Task 7 (virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/meta/recipes-core/images/core-image-minimal.bb, do_rootfs) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 1867 tasks of which 425 didn't need to be rerun and 1 failed.
>
> Sau!
>
>
> On 12/04/2012 11:49 AM, Mark Hatle wrote:
>> The following patch set relies on the previous "Misc fixes" sent out earlier
>> today.
>>
>> The set replaces the existing rootfs generation with one based on Smart.
>> The work was tested using buildhistory over a wide range of image types:
>> core-image-minimal
>> core-image-base
>> core-image-basic
>> core-image-lsb
>> core-image-sato
>> build-appliance
>>
>> Each of which contained minor changes from the former version, but the changes
>> can all be explained by a different package resolver.
>>
>> Multilib configurations of each of the above images were also verified on
>> qemux86_64 configuration with a few lib32 items added to the mix.  This was
>> shown, by buildhistory, to result in a more compact install solution.
>>
>> "populate_sdk" was also verified after this patch.  Buildhistory does not
>> verify SDKs, so these were verified by hand.  The target items all appeared
>> to match the expected image components.
>>
>> The incremental RPM installation code was verified as well.. This code was
>> verified in both multilib and non-multilib configurations.
>>
>> Finally, each of these were verified on: qemux86_64, qemumips, qemuppc, qemuarm,
>> and qemuarm configured w/ hardware float API.  This verifies that both the
>> ARM specific "gnueabi" issues and the _ to - in the arch names both work
>> properly.
>>
>> The following changes since commit 0c69e555dda2fa412ba12fa90886b0b92dc60e44:
>>
>>     license.bbclass: Avoid grep error message (2012-12-04 11:10:18 -0600)
>>
>> are available in the git repository at:
>>     git://git.yoctoproject.org/poky-contrib mhatle/smart
>>     http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/smart
>>
>> Mark Hatle (4):
>>     rootfs_rpm.bbclass: Revert to default shell logging behavior
>>     package_rpm: Update the way the multilib package names are translated
>>     package_rpm.bbclass: Add additional logging
>>     package_rpm.bbclass: Add support for incremental installs
>>
>> Paul Eggleton (2):
>>     classes/*_rpm: integrate Smart into RPM filesystem construction
>>     classes/rootfs_rpm: install smart instead of zypper in rpm-based
>>       images
>>
>>    meta/classes/package_rpm.bbclass      |  691 +++++++++++++--------------------
>>    meta/classes/populate_sdk_rpm.bbclass |   74 ++---
>>    meta/classes/rootfs_rpm.bbclass       |   86 ++---
>>    3 files changed, 338 insertions(+), 513 deletions(-)
>>



