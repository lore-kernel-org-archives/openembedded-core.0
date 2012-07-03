Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmCzf-0000oj-OD
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 01:58:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2012 16:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188168516"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2012 16:47:51 -0700
Message-ID: <4FF384A7.5020606@linux.intel.com>
Date: Tue, 03 Jul 2012 16:47:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341032578.git.mark.hatle@windriver.com>
	<28adf5fdb58c3409ec2dcc1a8dfffaaf2a8eab2b.1341032578.git.mark.hatle@windriver.com>
In-Reply-To: <28adf5fdb58c3409ec2dcc1a8dfffaaf2a8eab2b.1341032578.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 6/6] image.bbclass: Add support to build the SDK in parallel with the image
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
X-List-Received-Date: Tue, 03 Jul 2012 23:58:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2012 10:07 PM, Mark Hatle wrote:
> When building an image recipe, you can now build a companion SDK by
> calling the populate_sdk task:
>    bitbake -c populate_sdk core-image-minimal
>
> Note: there are still issues w/ the SDK not working completely with
> multilibs.

So this does break the default multi-lib build also, I thought it was a 
transient problem at first, but it's very reproducible.

Add these to your local.conf
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

bitbake lib32-core-image-minimal

Then wait and:

> ERROR: Logfile of failure stored in: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/work/qemux86_64-poky-linux/lib32-core-image-minimal-1.0-r0/temp/log.do_rootfs.39788
> Log data follows:
> | DEBUG: Executing shell function do_rootfs
> | Generating solve db for /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/deploy/rpm/qemux86_64...
> | Generating solve db for /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/deploy/rpm/x86_64...
> | Generating solve db for /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/deploy/rpm/all...
> | Generating solve db for /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/deploy/rpm/qemux86_64...
> | Generating solve db for /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/deploy/rpm/all...
> | Generating solve db for /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/deploy/rpm/all...
> | Processing lib32-task-core-boot...
> | Unable to find package lib32-task-core-boot (task-core-boot)!
> | ERROR: Function failed: do_rootfs (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/work/qemux86_64-poky-linux/lib32-core-image-minimal-1.0-r0/temp/log.do_rootfs.39788 for further information)
> NOTE: package lib32-core-image-minimal-1.0-r0: task do_rootfs: Failed

The rpm seem to exist, but not getting mapped properly??

ls tmp/deploy/rpm/*/*task-core*
tmp/deploy/rpm/lib32_qemux86_64/task-core-boot-1.0-r9.lib32_qemux86_64.rpm

> rpm -q -p tmp/deploy/rpm/lib32_qemux86_64/task-core-boot-1.0-r9.lib32_qemux86_64.rpm --info
> warning: tmp/deploy/rpm/lib32_qemux86_64/task-core-boot-1.0-r9.lib32_qemux86_64.rpm: Header V4 DSA/SHA1 Signature, key ID f72af359: NOKEY
> Name        : task-core-boot               Relocations: (not relocatable)
> Version     : 1.0                               Vendor: (none)
> Release     : r9                            Build Date: Tue 03 Jul 2012 04:03:16 PM PDT
> Install Date: (not installed)               Build Host: yocto-hm1.jf.intel.com
> Group       : base                          Source RPM: task-core-boot-1.0-r9.src.rpm
> Size        : 0                                License: MIT
> Signature   : DSA/SHA1, Tue 03 Jul 2012 04:03:16 PM PDT, Key ID 6a15ede1f72af359
> Packager    : Poky <poky@yoctoproject.org>
> URL         : unknown
> Summary     : lib32-task-core-boot version 1.0-r9
> Description :
> Task for OpenedHand Poky - minimal bootable image
> Distribution: (none)

Other RPM queries yielded nothing or (contains no files)
   -c, --dump, --list, --provides

I hope you are able to look into this a little deeper on Thursday

Thanks
	Sau!

>
> A lock is required between rootfs and populate_sdk activities to prevent
> configuration file clashes and similar package management problems in ipk
> and deb based systems.  (RPM already had a lock for a different reason.)
>
> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
> ---
>   meta/classes/image.bbclass             |    5 +++++
>   meta/classes/populate_sdk_base.bbclass |    1 +
>   meta/classes/populate_sdk_deb.bbclass  |    2 ++
>   meta/classes/populate_sdk_ipk.bbclass  |    2 ++
>   meta/classes/rootfs_deb.bbclass        |    2 ++
>   meta/classes/rootfs_ipk.bbclass        |    2 ++
>   6 files changed, 14 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 4f50376..7e41982 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -3,6 +3,11 @@ inherit rootfs_${IMAGE_PKGTYPE}
>   IMAGETEST ?= "dummy"
>   inherit imagetest-${IMAGETEST}
>
> +inherit populate_sdk_base
> +
> +TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
> +TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY} ${PACKAGE_GROUP_dev-pkgs} ${PACKAGE_GROUP_dbg-pkgs}"
> +
>   inherit gzipnative
>
>   LICENSE = "MIT"
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 6dc66fb..ed2dca0 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -120,6 +120,7 @@ populate_sdk_log_check() {
>   	done
>   }
>
> +do_populate_sdk[dirs] = "${TOPDIR}"
>   do_populate_sdk[nostamp] = "1"
>   do_populate_sdk[depends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS', True).split()])}"
>   do_populate_sdk[rdepends] = "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_RDEPENDS', True).split()])}"
> diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
> index c3b3e0c..9e9e1e1 100644
> --- a/meta/classes/populate_sdk_deb.bbclass
> +++ b/meta/classes/populate_sdk_deb.bbclass
> @@ -6,6 +6,8 @@ DEB_SDK_ARCH = "${@[d.getVar('SDK_ARCH', True), "i386"]\
>                   [d.getVar('SDK_ARCH', True) in \
>                   ["x86", "i486", "i586", "i686", "pentium"]]}"
>
> +do_populate_sdk[lockfiles] += "${WORKDIR}/deb.lock"
> +
>   populate_sdk_post_deb () {
>
>   	local target_rootfs=$1
> diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
> index aa3efde..4321afb 100644
> --- a/meta/classes/populate_sdk_ipk.bbclass
> +++ b/meta/classes/populate_sdk_ipk.bbclass
> @@ -1,6 +1,8 @@
>   do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
>   do_populate_sdk[recrdeptask] += "do_package_write_ipk"
>
> +do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
> +
>   populate_sdk_ipk() {
>
>   	rm -f ${IPKGCONF_TARGET}
> diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
> index 6c9767f..4ea71da 100644
> --- a/meta/classes/rootfs_deb.bbclass
> +++ b/meta/classes/rootfs_deb.bbclass
> @@ -8,6 +8,8 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
>   do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
>   do_rootfs[recrdeptask] += "do_package_write_deb"
>
> +do_rootfs[lockfiles] += "${WORKDIR}/deb.lock"
> +
>   DEB_POSTPROCESS_COMMANDS = "rootfs_install_all_locales; "
>
>   opkglibdir = "${localstatedir}/lib/opkg"
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index 1580086..9732385 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -12,6 +12,8 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
>   do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
>   do_rootfs[recrdeptask] += "do_package_write_ipk"
>
> +do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
> +
>   IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
>
>   OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"


