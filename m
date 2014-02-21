Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A116E6F170
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 03:48:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Feb 2014 19:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,516,1389772800"; d="scan'208";a="486973276"
Received: from unknown (HELO [10.255.14.1]) ([10.255.14.1])
	by orsmga002.jf.intel.com with ESMTP; 20 Feb 2014 19:48:12 -0800
Message-ID: <5306CC7C.1010606@linux.intel.com>
Date: Thu, 20 Feb 2014 19:48:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <cover.1392891203.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392891203.git.raj.khem@gmail.com>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Fri, 21 Feb 2014 03:48:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/20/2014 02:18 AM, Khem Raj wrote:
> This patchset upgrades systemd to 209 as can be seen some enahancements
> to uclibc were neeed. As of now. It builds for me on both uclibc/eglibc
> Please test it out in your setups and report back any issues
>
> The following changes since commit 9a98b8bfe13b94d89a9e39cca821f26fdeaeffc3:
>
>    image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:37:03 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib kraj/systemd-209
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-209
>
> Khem Raj (2):
>    uclibc: Add new functionality needed for systemd 209
>    systemd: Upgrade 208 -> 209
>
>   ...-Use-bin-mkdir-instead-of-host-mkdir-path.patch |  31 --
>   ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  15 +-
>   ...ournal-Add-missing-byte-order-conversions.patch |  60 ----
>   .../journal-file-protect-against-alloca-0.patch    |  23 --
>   ...n-appending-to-journal-file-allocate-larg.patch |  83 -----
>   .../systemd/journald-add-missing-error-check.patch |  16 -
>   .../systemd/systemd/systemd-pam-fix-execvpe.patch  |  22 +-
>   .../systemd/systemd-pam-fix-fallocate.patch        |  24 +-
>   .../systemd/systemd-pam-fix-getty-unit.patch       |  20 +-
>   .../systemd/systemd/systemd-pam-fix-mkostemp.patch | 166 +--------
>   .../systemd/systemd/systemd-pam-fix-msformat.patch | 115 ++++---
>   .../systemd/systemd/uclibc-sysinfo_h.patch         |  19 ++
>   .../systemd/{systemd_208.bb => systemd_209.bb}     |  14 +-
>   meta/recipes-core/uclibc/uclibc-git.inc            |   3 +
>   .../0001-Add-eventfd_read-and-eventfd_write.patch  | 120 +++++++
>   .../uclibc-git/0002-wire-setns-syscall.patch       |  68 ++++
>   ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch | 377 +++++++++++++++++++++
>   17 files changed, 702 insertions(+), 474 deletions(-)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/uclibc-sysinfo_h.patch
>   rename meta/recipes-core/systemd/{systemd_208.bb => systemd_209.bb} (96%)
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Add-eventfd_read-and-eventfd_write.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/0002-wire-setns-syscall.patch
>   create mode 100644 meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
>

Seems like there might be an issue with ptest when I built this on the 
AB, it might be build vs src dir split?


> NOTE: Running task 5039 of 5679 (ID: 3843, /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/meta/recipes-support/libcroco/libcroco_0.6.8.bb, do_package_write_ipk)
> ERROR: Function failed: do_install_ptest_base (log file is located at /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/build/tmp/work/core2-64-poky-linux/systemd/1_209-r0/temp/log.do_install_ptest_base.24377)
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/build/tmp/work/core2-64-poky-linux/systemd/1_209-r0/temp/log.do_install_ptest_base.24377
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
> | DEBUG: Executing shell function do_install_ptest_base
> | cp: cannot stat '/home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/build/tmp/work/core2-64-poky-linux/systemd/1_209-r0/build/rules': No such file or directory
> | WARNING: /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/build/tmp/work/core2-64-poky-linux/systemd/1_209-r0/temp/run.do_install_ptest_base.24377:1 exit 1 from
> |   cp -rf /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/build/tmp/work/core2-64-poky-linux/systemd/1_209-r0/build/rules /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/build/tmp/work/core2-64-poky-linux/systemd/1_209-r0/image/usr/lib/systemd/ptest/
> | ERROR: Function failed: do_install_ptest_base (log file is located at /home/pokybuild/yocto-autobuilder-dev/yocto-slave/nightly-qa-systemd/build/build/tmp/work/core2-64-poky-linux/systemd/1_209-r0/temp/log.do_install_ptest_base.24377)
> NOTE: recipe systemd-1_209-r0: task do_install_ptest_base: Failed

Sau!


