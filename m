Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 88A1160825
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 03:38:25 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2013 20:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,731,1363158000"; d="scan'208";a="245970228"
Received: from unknown (HELO [10.255.12.172]) ([10.255.12.172])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2013 20:38:25 -0700
Message-ID: <519EE0B1.6090702@linux.intel.com>
Date: Thu, 23 May 2013 20:38:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] run-postinsts refactoring
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
X-List-Received-Date: Fri, 24 May 2013 03:38:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2013 06:15 AM, Laurentiu Palcu wrote:
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
This seems to have a problem building on the auto builder, most of the 
failures are due to the following:

/usr/sbin/update-rc.d: /bin/sh: bad interpreter: No such file or directory

Details here:

> | log_check: Using /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-ppc/build/build/tmp/work/qemuppc-poky-linux/core-image-minimal-dev/1.0-r0/temp/log.do_rootfs.32640 as logfile
> | Logfile is clean
> | rpm -e --nodeps --root=/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-ppc/build/build/tmp/work/qemuppc-poky-linux/core-image-minimal-dev/1.0-r0/rootfs --dbpath=/var/lib/rpm update-rc.d base-passwd run-postinsts
> | /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-ppc/build/build/tmp/sysroots/x86_64-linux/var/tmp/rpm-tmp.67450: /usr/sbin/update-rc.d: /bin/sh: bad interpreter: No such file or directory
> | error: %postun(run-postinsts-1.0-r9.ppc603e) scriptlet failed, exit status 126
> | ERROR: Function failed: do_rootfs (see /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-ppc/build/build/tmp/work/qemuppc-poky-linux/core-image-minimal-dev/1.0-r0/temp/log.do_rootfs.32640 for further information)
> NOTE: recipe core-image-minimal-dev-1.0-r0: task do_rootfs: Failed
> ERROR: Task 71 (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-ppc/bu

Sau!



> Thanks,
> Laurentiu
>
> The following changes since commit f7b639e527a65f9ce77aef07651ac5ec1e094e52:
>
>    rpm-postinsts.bb: enable postinst logging (2013-05-23 10:28:05 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib lpalcu/run_postinsts_refactor
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/run_postinsts_refactor
>
> Laurentiu Palcu (7):
>    systemd: add udev-utils dependency for udev-hwdb
>    rootfs_*.bbclass: add some helper functions
>    image.bbclass: remove unneeded files from the image
>    core-image-minimal: do not remove packaging files in the rootfs
>      postprocess
>    run-postinsts: make it generic
>    rootfs_rpm.bbclas: switch to using run-postinsts
>    rpm: replace rpm-postinsts dependency with run-postinsts
>
>   meta/classes/image.bbclass                         |   33 +++++++++++
>   meta/classes/rootfs_deb.bbclass                    |   23 +++++++-
>   meta/classes/rootfs_ipk.bbclass                    |   39 ++++++-------
>   meta/classes/rootfs_rpm.bbclass                    |   25 ++++++++-
>   meta/recipes-core/images/core-image-minimal.bb     |    2 -
>   meta/recipes-core/systemd/systemd_199.bb           |    2 +
>   .../dpkg/run-postinsts/run-postinsts               |   59 ++++++++++++--------
>   .../dpkg/run-postinsts/run-postinsts.awk           |   30 ----------
>   meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    7 +--
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    2 +-
>   10 files changed, 135 insertions(+), 87 deletions(-)
>   delete mode 100644 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
>

