Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TgTvh-0001lt-5S
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 06:23:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 21:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,228,1355126400"; d="scan'208";a="259740710"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2012 21:08:59 -0800
Message-ID: <50C0286B.60406@linux.intel.com>
Date: Wed, 05 Dec 2012 21:08:59 -0800
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
X-List-Received-Date: Thu, 06 Dec 2012 05:23:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

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
Did you try with the DISTRO = poky-lsb when doing the lsb build?  There 
are failures across the board with the LSB builds, see this example:

http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64-lsb/builds/146/steps/shell_29/logs/stdio


The failure seems to be on psplash:
| Error: psplash not found in the base feeds (qemux86_64 x86_64 noarch 
any all).
| ERROR: Function failed: do_rootfs (see 
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64-lsb/build/build/tmp/work/qemux86_64-poky-linux/core-image-lsb-dev/1.0-r0/temp/log.do_rootfs.10377 
for further information)
NOTE: recipe core-image-lsb-dev-1.0-r0: task do_rootfs: Failed

Can you look into this before we integrate into master

Thanks
	Sau!



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


