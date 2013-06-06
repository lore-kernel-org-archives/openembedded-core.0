Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD5906A8B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 16:43:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r56GhlRe022981
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Jun 2013 09:43:47 -0700 (PDT)
Received: from msp-dhcp18.wrs.com (172.25.34.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Jun 2013 09:43:46 -0700
Message-ID: <51B0BC46.6030208@windriver.com>
Date: Thu, 6 Jun 2013 11:43:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
	<cover.1370502833.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370502833.git.laurentiu.palcu@intel.com>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/7] run-postinsts refactoring
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
X-List-Received-Date: Thu, 06 Jun 2013 16:43:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Comments below....

On 6/6/13 2:41 AM, Laurentiu Palcu wrote:
> (cover letter only)
>
> Changes in v2:
>   * addressed an RPM issue that happened on AB. Interestingly, it happened only on
>     certain distros. Our internal AB (running on Ubuntu server 12.04), didn't show
>     any issues. So, what was the problem? We use a scriptlet wrapper to run the
>     pre/post install scriptlets. What I missed in the previous patchset was that I
>     didn't use the scriptlet wrapper when running the pre/post remove scriptlets
>     and the context in which they ran was not correct. Hence, the update-rc.d used
>     was the host's...
>   * addresses Ross's request to move run-postinsts recipe out of dpkg directory,
>     since it's generic now;
>
> Paul, Mark would you please review the RPM changes please?
>
> Thanks,
> Laurentiu
>
> Changes in v1:
> Hi all,
>
> My work at #4484 revealed that the package managers deb/ipk/rpm handle removal
> of PM meta-data (when the PM is not deployed) and the delayed postinstalls
> execution in their own way. Currently we have:
>   * run-postinsts (for deb/ipk) and rpm-postinsts (for rpm) for running the delayed
>     postinstalls on target when the PM is not part of the image;
>   * opkg removes the meta-data and some uneeded packages whilst deb/rpm remove
>     only the meta-data;
>   * both opkg and deb have no way of running the delayed postinstalls on target,
>     if package-management is not part of IMAGE_FEATURES, because the meta-data
>     was deleted (and it would have been useless anyway since the PM is not installed);
>
> That being said, this patchset tries to create a more unified solution for all
> PM backends.
>
> rpm-postinsts recipe is replaced by run-postinsts but I'll keep it in oe-core
> for a while (a couple of weeks maybe), just in case the current solution does not
> satisfy the RPM users (I doubt it though).
>
> I did tests with core-image-minimal using sysvinit/systemd and with/without delayed
> postinstalls. The results are as expected.
>
> Thanks,
> Laurentiu
>
> The following changes since commit a62aed41f2d8f874f7ae24d0e5be5dbc66ea2199:
>
>    lrzsz: check locale.h in configure (2013-06-04 15:55:46 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lpalcu/run_postinsts_refactor_v2
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/run_postinsts_refactor_v2
>
> Laurentiu Palcu (7):
>    rootfs_*.bbclass: add some helper functions
>    image.bbclass: remove unneeded files from the image
>    core-image-minimal: do not remove packaging files in the rootfs
>      postprocess
>    run-postinsts: make it generic
>    rootfs_rpm.bbclass: switch to using run-postinsts
>    package_rpm.bbclass: handle pre/post remove scriptlets
>    rpm: replace rpm-postinsts dependency with run-postinsts
>
>   meta/classes/image.bbclass                         |   33 ++++++++++++++
>   meta/classes/package_rpm.bbclass                   |   16 ++++---
>   meta/classes/rootfs_deb.bbclass                    |   23 +++++++++-
>   meta/classes/rootfs_ipk.bbclass                    |   39 ++++++++--------
>   meta/classes/rootfs_rpm.bbclass                    |   29 ++++++++++--
>   meta/recipes-core/images/core-image-minimal.bb     |    2 -
>   .../dpkg/run-postinsts/run-postinsts               |   36 ---------------
>   .../dpkg/run-postinsts/run-postinsts.awk           |   30 -------------
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    2 +-
>   .../run-postinsts/run-postinsts/run-postinsts      |   47 ++++++++++++++++++++
>   .../{dpkg => run-postinsts}/run-postinsts_1.0.bb   |    7 ++-
>   11 files changed, 159 insertions(+), 105 deletions(-)
>   delete mode 100755 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
>   delete mode 100644 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
>   create mode 100755 meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
>   rename meta/recipes-devtools/{dpkg => run-postinsts}/run-postinsts_1.0.bb (68%)
>

> +rootfs_remove_unneeded () {
> +	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
> +		if [ -z "$(delayed_postinsts)" ]; then
> +			# All packages were successfully configured.
> +			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
> +			remove_run_postinsts=false
> +			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
> +				remove_run_postinsts=true
> +			fi
> +			rootfs_remove_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
> +
> +			# Need to remove rc.d files for run-postinsts by hand since opkg won't
> +			# call postrm scripts in offline root mode.
> +			if $remove_run_postinsts; then
> +				update-rc.d -f -r ${IMAGE_ROOTFS} run-postinsts remove
> +			fi

The above runs unconditionally for all package types.  Will this cause an issue 
w/ RPM or deb?  (I don't think it will, but I'm slightly worried about RPM and 
it's removal scripts.)

> +		else
> +			# Some packages were not successfully configured, save them only
> +			# if we have run-postinsts script present. Otherwise, they're
> +			# useless
> +			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
> +				save_postinsts
> +			fi
> +		fi
> +
> +		# Since no package manager is present in the image the metadata is not needed
> +		remove_packaging_data_files
> +	fi
> +}
> +

Everything else looks fine.

Reviewed-by: Mark Hatle <mark.hatle@windriver.com>

