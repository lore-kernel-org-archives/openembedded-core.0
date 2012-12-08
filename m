Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ThEGE-00026X-Do
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 07:51:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Dec 2012 22:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,243,1355126400"; d="scan'208";a="228320271"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.161])
	by azsmga001.ch.intel.com with ESMTP; 07 Dec 2012 22:37:12 -0800
Message-ID: <50C2E018.6000408@linux.intel.com>
Date: Fri, 07 Dec 2012 22:37:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1354650148.git.mark.hatle@windriver.com>
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
X-List-Received-Date: Sat, 08 Dec 2012 06:51:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


There still seems to be a problem with the multilib build that I believe 
comes from this set of changes.

> | Running intercept scripts:
> | WARNING: The license listed MIT was not in the licenses collected for lib32-packagegroup-core-boot
> | ls: cannot access /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/pkgdata/*/runtime-reverse/udev-extraconf: No such file or directory
> | readlink: missing operand
> | Try `readlink --help' for more information.
> | basename: missing operand
> | Try `basename --help' for more information.
> | ERROR: Function failed: do_rootfs (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/work/qemux86_64-poky-linux/lib32-core-image-minimal/1.0-r0/temp/log.do_rootfs.14393 for further information)
> NOTE: recipe lib32-core-image-minimal-1.0-r0: task do_rootfs: Failed
> ERROR: Task 7 (virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/meta/recipes-core/images/core-image-minimal.bb, do_rootfs) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1867 tasks of which 425 didn't need to be rerun and 1 failed.

Sau!


On 12/04/2012 11:49 AM, Mark Hatle wrote:
> The following patch set relies on the previous "Misc fixes" sent out earlier
> today.
>
> The set replaces the existing rootfs generation with one based on Smart.
> The work was tested using buildhistory over a wide range of image types:
> core-image-minimal
> core-image-base
> core-image-basic
> core-image-lsb
> core-image-sato
> build-appliance
>
> Each of which contained minor changes from the former version, but the changes
> can all be explained by a different package resolver.
>
> Multilib configurations of each of the above images were also verified on
> qemux86_64 configuration with a few lib32 items added to the mix.  This was
> shown, by buildhistory, to result in a more compact install solution.
>
> "populate_sdk" was also verified after this patch.  Buildhistory does not
> verify SDKs, so these were verified by hand.  The target items all appeared
> to match the expected image components.
>
> The incremental RPM installation code was verified as well.. This code was
> verified in both multilib and non-multilib configurations.
>
> Finally, each of these were verified on: qemux86_64, qemumips, qemuppc, qemuarm,
> and qemuarm configured w/ hardware float API.  This verifies that both the
> ARM specific "gnueabi" issues and the _ to - in the arch names both work
> properly.
>
> The following changes since commit 0c69e555dda2fa412ba12fa90886b0b92dc60e44:
>
>    license.bbclass: Avoid grep error message (2012-12-04 11:10:18 -0600)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/smart
>    http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/smart
>
> Mark Hatle (4):
>    rootfs_rpm.bbclass: Revert to default shell logging behavior
>    package_rpm: Update the way the multilib package names are translated
>    package_rpm.bbclass: Add additional logging
>    package_rpm.bbclass: Add support for incremental installs
>
> Paul Eggleton (2):
>    classes/*_rpm: integrate Smart into RPM filesystem construction
>    classes/rootfs_rpm: install smart instead of zypper in rpm-based
>      images
>
>   meta/classes/package_rpm.bbclass      |  691 +++++++++++++--------------------
>   meta/classes/populate_sdk_rpm.bbclass |   74 ++---
>   meta/classes/rootfs_rpm.bbclass       |   86 ++---
>   3 files changed, 338 insertions(+), 513 deletions(-)
>


