Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id EB2C27E539
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 11:31:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 04:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; d="scan'208";a="218595617"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2019 04:31:31 -0700
To: openembedded-core@lists.openembedded.org
References: <1569304805-85150-1-git-send-email-changqing.li@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <47a252da-39c7-d402-52c7-9b17258cade1@intel.com>
Date: Tue, 24 Sep 2019 12:31:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569304805-85150-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH V2] mdadm: fix do_package failed when changed local.conf but not cleaned
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
X-List-Received-Date: Tue, 24 Sep 2019 11:31:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 24/09/2019 07:00, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> reproduce steps:
> 1. add DISTRO_FEATURE_append = 'usrmerge' in local.conf
> 2. bitbake mdadm --success
> 3. remove DISTRO_FEATURE_append = 'usrmerge' from local.conf
> 4. bitbake mdadm  -- failed when do_package
> 
> it is not proper to change source Makefile during do_install by sed,
> change to add patch for it.
> 
> [YOCTO #13493]
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../mdadm/files/0001-mdadm-support-usrmerge.patch  | 46 ++++++++++++++++++++++
>   meta/recipes-extended/mdadm/mdadm_4.1.bb           |  7 ++--
>   2 files changed, 50 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-support-usrmerge.patch
> 
> diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-support-usrmerge.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-support-usrmerge.patch
> new file mode 100644
> index 0000000..f1aa119
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-mdadm-support-usrmerge.patch
> @@ -0,0 +1,46 @@
> +From 2c7ccea05d7cf9dde48d735faa511d1b06c14878 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 5 Sep 2019 18:03:11 +0800
> +Subject: [PATCH] mdadm: support usrmerge
> +
> +Upstream-Status: Inappropriate[oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Makefile | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 4839001..466e960 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -88,7 +88,7 @@ MAP_PATH = $(MAP_DIR)/$(MAP_FILE)
> + MDMON_DIR = $(RUN_DIR)
> + # place for autoreplace cookies
> + FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
> +-SYSTEMD_DIR=/lib/systemd/system
> ++SYSTEMD_DIR=${SYSTEMD_UNITDIR}/system
> + LIB_DIR=/usr/libexec/mdadm
> +
> + COROSYNC:=$(shell [ -f $(SYSROOT)/usr/include/corosync/cmap.h ] || echo -DNO_COROSYNC)
> +@@ -120,7 +120,7 @@ LDLIBS=-ldl
> +
> + INSTALL = /usr/bin/install
> + DESTDIR =
> +-BINDIR  = /sbin
> ++BINDIR  = ${BASE_SBINDIR}
> + MANDIR  = /usr/share/man
> + MAN4DIR = $(MANDIR)/man4
> + MAN5DIR = $(MANDIR)/man5
> +@@ -128,7 +128,7 @@ MAN8DIR = $(MANDIR)/man8
> +
> + UDEVDIR := $(shell $(PKG_CONFIG) --variable=udevdir udev 2>/dev/null)
> + ifndef UDEVDIR
> +- UDEVDIR = /lib/udev
> ++ UDEVDIR = ${NONARCH_BASE_LIBDIR}/udev
> + endif
> +
> + ifeq (,$(findstring s,$(MAKEFLAGS)))
> +--
> +2.7.4
> +
> @@ -43,13 +44,13 @@ CFLAGS_append_powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
>   CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
>   CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
>   
> -EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
> +EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" BASE_SBINDIR="${base_sbindir}" \
> +                NONARCH_BASE_LIBDIR="${nonarch_base_libdir}" \
> +                SYSTEMD_UNITDIR="${systemd_unitdir}"'

Can't you just pass BINDIR=${base_sbindir} MANDIR=${docdir}/man 
UDEVDIR=${nonarch_base_libdir}/udev etc, instead of patching the makefile?

Ross

