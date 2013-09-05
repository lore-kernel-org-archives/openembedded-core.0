Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4496BF48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 14:32:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Sep 2013 07:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="398723874"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Sep 2013 07:32:37 -0700
Date: Thu, 5 Sep 2013 17:32:36 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130905143235.GF17481@lpalcu-linux>
References: <cover.1378371716.git.laurentiu.palcu@intel.com>
	<458079bc072716290bebe261aa1c24d4c40a2b7a.1378371716.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <458079bc072716290bebe261aa1c24d4c40a2b7a.1378371716.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 14:32:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ignore this patch for the moment. I'm investigating another alternative.

Laurentiu

On Thu, Sep 05, 2013 at 12:03:49PM +0300, Laurentiu Palcu wrote:
> If IMAGE_FEATURES does not contain 'package-management' but the user
> manually installs a package manager (opkg/dpkg/rpm) using
> CORE_IMAGE_EXTRA_INSTALL (for example), then do not remove update-rc.d,
> base-passwd and package metadata because these will be needed by the
> package manager to function correcly.
> 
> [YOCTO #4484]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/image.bbclass |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 84f638c..b748397 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -498,7 +498,11 @@ rootfs_install_complementary() {
>  }
>  
>  rootfs_uninstall_unneeded () {
> -	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
> +	rpm_installed=${@base_contains("PACKAGE_INSTALL", "rpm",  "true", "false", d)}
> +	opkg_installed=${@base_contains("PACKAGE_INSTALL", "opkg", "true", "false", d)}
> +	dpkg_installed=${@base_contains("PACKAGE_INSTALL", "dpkg", "true", "false", d)}
> +
> +	if ! $rpm_installed && ! $opkg_installed && ! $dpkg_installed; then
>  		if [ -z "$(delayed_postinsts)" ]; then
>  			# All packages were successfully configured.
>  			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
> -- 
> 1.7.9.5
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

