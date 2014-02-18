Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE6A6D14A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 00:39:00 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id to1so1541889ieb.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D/GX8mte2pI63zkMGTG2mIL969pRgutzihhem/cSpxE=;
	b=Ed93+1bj+tOy+2NdBw0YSOCF1fC6p0oYge6NwSpwDkRbWqKIOPYfFSMX5oZygocoDt
	LJZkU4oHquTa6MyVkU6UoCm/3t7b54hTcOsgQNa7wlOl/fnoy3t4miIyBUKqQwtdLxLV
	WGb2hJYmDg9n3qn7VajtNPEC950t1nYwDWkUozhbcWMpf+oHbfO7vt+xQR8ljk8novHI
	zd9bZvHeBvyT1ImlHprHKvWe1s4elFDTQPV8xGxcMeK0T4miBlATA+Ue4R2VZUI3lsgb
	sm3LeEW6kYt/IazAZjF+oIM0Mcef/PmWl5elwaD21+ENyyPNG5rYG4789izo+4CTjzue
	+5ww==
X-Received: by 10.43.65.145 with SMTP id xm17mr19645246icb.35.1392683941454;
	Mon, 17 Feb 2014 16:39:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 17 Feb 2014 16:38:31 -0800 (PST)
In-Reply-To: <cover.1392665521.git.raj.khem@gmail.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2014 16:38:31 -0800
Message-ID: <CAMKF1srgvRkaJejybGLp9o64GYVobzGXs7QoAcb6tQenBUoFWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] eglibc upgrade 2.19, uclibc upgrade and fixes
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
X-List-Received-Date: Tue, 18 Feb 2014 00:39:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 17, 2014 at 11:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This is consolidated patchsets that I have sent over past couple of weeks
> Upgrades eglibc to 2.19
> Upgrades uclibc to latest git
> Fix for building uclibc images
> binutils is fixed to accomodate gold linker and sstate
> icu is fixed for QT5 runtime-issue reported by many developers over mailing list
>
> I have built and booted systemd-image for eglibc/uclibc on all qemu machines, beaglebone, overo
> and build only tested for  p1020ds
>

Updated the pull tree.
I have addressed RPs feedback into icu patch and additionally added a
fix that surfaced after 9d9bca8785911e8ae06d507bbfb99d6a811f072e
when generating .tar.gz or tar.bz2 images

> The following changes since commit 9d9bca8785911e8ae06d507bbfb99d6a811f072e:
>
>   lib/oe/image.py: fix working directory (2014-02-17 15:37:13 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib misc
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc
>
> Khem Raj (6):
>   eglibc: Upgrade from 2.18 -> 2.19
>   valgrind: Add glibc 2.19 awareness
>   rootfs.py: Check for LDCONFIGDEPEND being empty string
>   icu: Disable the default LDFLAGSICUDT for target compile
>   binutils: ld-is-gold should not affect native and crosssdk recipes
>   uclibc: Update to git tip
>
>  meta/classes/libc-common.bbclass                   |    2 +-
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  meta/lib/oe/rootfs.py                              |    2 +-
>  ...tive_2.18.bb => cross-localedef-native_2.19.bb} |   10 +-
>  .../0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch |   43 ------
>  meta/recipes-core/eglibc/eglibc-2.18/make-4.patch  |   31 ----
>  .../eglibc/eglibc-2.18/tzselect-awk.patch          |   42 ------
>  .../eglibc/eglibc-2.18/tzselect-sh.patch           |  156 --------------------
>  .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
>  .../0001-eglibc-menuconfig-support.patch           |  122 +++++++--------
>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
>  ...0002-eglibc-menuconfig-hex-string-options.patch |    0
>  ...0003-eglibc-menuconfig-build-instructions.patch |    0
>  .../GLRO_dl_debug_mask.patch                       |    0
>  .../IO-acquire-lock-fix.patch                      |    0
>  .../add_resource_h_to_wait_h.patch                 |    0
>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
>  .../eglibc_fix_findidx_parameters.patch            |    0
>  .../{eglibc-2.18 => eglibc-2.19}/etc/ld.so.conf    |    0
>  .../fileops-without-wchar-io.patch                 |    0
>  .../fix-tibetian-locales.patch                     |    0
>  .../fix_for_centos_5.8.patch                       |    0
>  .../fsl-ppc-no-fsqrt.patch                         |    0
>  .../generate-supported.mk                          |    0
>  .../glibc.fix_sqrt2.patch                          |    0
>  .../initgroups_keys.patch                          |    0
>  .../ld-search-order.patch                          |    0
>  .../mips-rld-map-check.patch                       |    0
>  .../multilib_readlib.patch                         |    0
>  .../ppc-sqrt_finite.patch                          |    0
>  .../ppc_slow_ieee754_sqrt.patch                    |    0
>  .../relocatable_sdk.patch                          |    0
>  .../relocatable_sdk_fix_openpath.patch             |    0
>  ...libc-initial_2.18.bb => eglibc-initial_2.19.bb} |    0
>  ...eglibc-locale_2.18.bb => eglibc-locale_2.19.bb} |    0
>  ...eglibc-mtrace_2.18.bb => eglibc-mtrace_2.19.bb} |    0
>  ...libc-scripts_2.18.bb => eglibc-scripts_2.19.bb} |    0
>  .../eglibc/{eglibc_2.18.bb => eglibc_2.19.bb}      |   14 +-
>  meta/recipes-core/uclibc/uclibc-git.inc            |    3 +-
>  .../0001-add-posix_fadvise-for-arm.patch           |   68 ---------
>  meta/recipes-devtools/binutils/binutils.inc        |    8 +-
>  .../valgrind/valgrind/glibc-2.19.patch             |   23 +++
>  meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |    1 +
>  .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |   28 ++++
>  meta/recipes-support/icu/icu_51.2.bb               |    3 +
>  45 files changed, 136 insertions(+), 422 deletions(-)
>  rename meta/recipes-core/eglibc/{cross-localedef-native_2.18.bb => cross-localedef-native_2.19.bb} (73%)
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/tzselect-awk.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.18/tzselect-sh.patch
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0001-R_ARM_TLS_DTPOFF32.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0001-eglibc-menuconfig-support.patch (93%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0002-eglibc-menuconfig-hex-string-options.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/0003-eglibc-menuconfig-build-instructions.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/GLRO_dl_debug_mask.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/IO-acquire-lock-fix.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/add_resource_h_to_wait_h.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/eglibc_fix_findidx_parameters.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/etc/ld.so.conf (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fileops-without-wchar-io.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fix-tibetian-locales.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fix_for_centos_5.8.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/fsl-ppc-no-fsqrt.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/generate-supported.mk (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/glibc.fix_sqrt2.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/initgroups_keys.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/ld-search-order.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/mips-rld-map-check.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/multilib_readlib.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/ppc-sqrt_finite.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/ppc_slow_ieee754_sqrt.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/relocatable_sdk.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-2.18 => eglibc-2.19}/relocatable_sdk_fix_openpath.patch (100%)
>  rename meta/recipes-core/eglibc/{eglibc-initial_2.18.bb => eglibc-initial_2.19.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc-locale_2.18.bb => eglibc-locale_2.19.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc-mtrace_2.18.bb => eglibc-mtrace_2.19.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc-scripts_2.18.bb => eglibc-scripts_2.19.bb} (100%)
>  rename meta/recipes-core/eglibc/{eglibc_2.18.bb => eglibc_2.19.bb} (90%)
>  delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch
>  create mode 100644 meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
>
> --
> 1.7.10.4
>

