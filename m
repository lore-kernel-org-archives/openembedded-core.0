Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE246FCA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:31:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Nov 2014 09:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,308,1413270000"; d="scan'208";a="625610189"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.154])
	([10.219.4.154])
	by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2014 09:26:27 -0800
Message-ID: <5457BAE5.4070608@linux.intel.com>
Date: Mon, 03 Nov 2014 11:27:01 -0600
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1414861027-13914-1-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1414861027-13914-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] package_manager: Fix populate_sdk for dpkg packages
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
X-List-Received-Date: Mon, 03 Nov 2014 17:31:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ricardo,

I think the problem isn't related to this, the all_arch_list is set to 
archs + multilib_archs see the __init__ func.

Best regards.

On 01/11/14 10:57, Ricardo Ribalda Delgado wrote:
> Without this patch:
>
> ERROR: Unable to install packages. Command '/var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/sysroots/x86_64-linux/usr/bin/apt-get  install --force-yes --allow-unauthenticated nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-qt5022' returned 100:
> Reading package lists...
> Building dependency tree...
> Reading state information...
> W: Unable to read /var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/work/bobcat_64-poky-linux/meta-toolchain/1.0-r7/apt-sdk/preferences.d/ - DirectoryExists (2: No such file or directory)
> E: Unable to locate package nativesdk-packagegroup-sdk-host
> E: Unable to locate package packagegroup-cross-canadian-qt5022
>
> ERROR: Function failed: do_populate_sdk
> ERROR: Logfile of failure stored in: /var/lib/jenkins/jobs/qt5022-cesium/workspace/build/tmp/work/bobcat_64-poky-linux/meta-toolchain/1.0-r7/temp/log.do_populate_sdk.4926
> NOTE: recipe meta-toolchain-1.0-r7: task do_populate_sdk: Failed
> ERROR: Task 7 (/var/lib/jenkins/jobs/qt5022-cesium/workspace/repo/yocto/meta/recipes-core/meta/meta-toolchain.bb, do_populate_sdk) failed with exit code '1'
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>
> Tested on yocto 1.7
>
> Only build test, not tested on target.
>
>   meta/lib/oe/package_manager.py | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 27fdf26..8828bce 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -188,7 +188,7 @@ class DpkgIndexer(Indexer):
>                   release.write("Label: %s\n" % arch)
>   
>               cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
> -
> +
>               index_cmds.append(cmd)
>   
>               deb_dirs_found = True
> @@ -1467,6 +1467,7 @@ class DpkgPM(PackageManager):
>       def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None):
>           super(DpkgPM, self).__init__(d)
>           self.target_rootfs = target_rootfs
> +        self.pkg_archs = archs
>           self.deploy_dir = self.d.getVar('DEPLOY_DIR_DEB', True)
>           if apt_conf_dir is None:
>               self.apt_conf_dir = self.d.expand("${APTCONF_TARGET}/apt")
> @@ -1662,7 +1663,7 @@ class DpkgPM(PackageManager):
>           bb.utils.mkdirhier(self.apt_conf_dir + "/apt.conf.d/")
>   
>           arch_list = []
> -        for arch in self.all_arch_list:
> +        for arch in self.pkg_archs.split():
>               if not os.path.exists(os.path.join(self.deploy_dir, arch)):
>                   continue
>               arch_list.append(arch)


