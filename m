Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0E47D58A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 03:16:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x983GJTX007865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Oct 2019 20:16:19 -0700
Received: from [128.224.158.194] (128.224.158.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 7 Oct 2019 20:16:18 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1569304805-85150-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <98ff244f-3fbb-ae80-788a-11b894eb18c7@windriver.com>
Date: Tue, 8 Oct 2019 11:16:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1569304805-85150-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.158.194]
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
X-List-Received-Date: Tue, 08 Oct 2019 03:16:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping

On 9/24/19 2:00 PM, changqing.li@windriver.com wrote:
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
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> index 639382e..18cc87b 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> @@ -23,6 +23,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>   	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
>              file://include_sysmacros.patch \
>              file://0001-mdadm-skip-test-11spare-migration.patch \
> +           file://0001-mdadm-support-usrmerge.patch \
>              "
>   
>   SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
> @@ -43,13 +44,13 @@ CFLAGS_append_powerpc64 = ' -D__SANE_USERSPACE_TYPES__'
>   CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
>   CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
>   
> -EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
> +EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" BASE_SBINDIR="${base_sbindir}" \
> +                NONARCH_BASE_LIBDIR="${nonarch_base_libdir}" \
> +                SYSTEMD_UNITDIR="${systemd_unitdir}"'
>   
>   DEBUG_OPTIMIZATION_append = " -Wno-error"
>   
>   do_compile() {
> -	# Point to right sbindir
> -	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" -e "s;UDEVDIR = /lib;UDEVDIR = $nonarch_base_libdir;" -e "s;SYSTEMD_DIR=/lib/systemd/system;SYSTEMD_DIR=${systemd_unitdir}/system;" ${S}/Makefile
>   	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
>   }
>   

