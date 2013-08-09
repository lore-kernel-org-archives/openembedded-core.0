Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC336B55C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 00:44:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2013 17:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,842,1367996400"; d="scan'208";a="378356155"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2013 17:44:15 -0700
Message-ID: <52043B5F.4020401@linux.intel.com>
Date: Thu, 08 Aug 2013 17:44:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Cristiana Voicu <cristiana.voicu@intel.com>
References: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
	<734a8edf2a73e000207f7e11cfb28bb864a12c72.1375969277.git.cristiana.voicu@intel.com>
In-Reply-To: <734a8edf2a73e000207f7e11cfb28bb864a12c72.1375969277.git.cristiana.voicu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] kmod: upgrade to 14
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
X-List-Received-Date: Fri, 09 Aug 2013 00:44:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 06:46 AM, Cristiana Voicu wrote:
> Made some changes on patches to apply correctly.
>

Seems to be an issue with building the kmod-native_git  Autobuilder 
failed to build this, one example:

http://autobuilder.yoctoproject.org:8011/builders/build-appliance/builds/245/steps/Building%20Images_1/logs/stdio

I have removed it for now.

Thanks
	Sau!

> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>   meta/recipes-kernel/kmod/kmod-native_git.bb        |    1 -
>   meta/recipes-kernel/kmod/kmod.inc                  |    5 ++---
>   ...-man-page-generation-because-we-don-t-hav.patch |   21 ++++++++++----------
>   .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        |    5 ++---
>   meta/recipes-kernel/kmod/kmod_git.bb               |    3 +--
>   5 files changed, 16 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
> index 8cbcdf8..afa3ad0 100644
> --- a/meta/recipes-kernel/kmod/kmod-native_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> @@ -4,7 +4,6 @@
>   require kmod.inc
>   inherit native
>
> -PR = "${INC_PR}.1"
>   SRC_URI += "file://fix-undefined-O_CLOEXEC.patch"
>
>   do_install_append (){
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
> index a780b6c..b07fc58 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -7,8 +7,7 @@ HOMEPAGE = "http://packages.profusion.mobi/kmod/"
>   LICENSE = "GPL-2.0+ & LGPL-2.1+"
>   LICENSE_libkmod = "LGPL-2.1+"
>   SECTION = "base"
> -PV = "9"
> -INC_PR = "r0"
> +PV = "14"
>
>   DEPENDS += "pkgconfig-native"
>
> @@ -24,7 +23,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
>              file://ptest.patch \
>             "
>
> -SRCREV = "62081c0f68905b22f375156d4532fd37fa5c8d33"
> +SRCREV = "3b38c7fcb58be4ddc34f90454c5f5dc3693d2d85"
>
>   S = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch b/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
> index 5361b84..b5a8e08 100644
> --- a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
> +++ b/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
> @@ -11,16 +11,17 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>    Makefile.am |    2 +-
>    1 files changed, 1 insertions(+), 1 deletions(-)
>
> -diff --git a/Makefile.am b/Makefile.am
> -index 141c102..a8bdfd1 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1,4 +1,4 @@
> --SUBDIRS = . libkmod/docs man
> -+SUBDIRS = . libkmod/docs
> +Index: git/Makefile.am
> +===================================================================
> +--- git.orig/Makefile.am
> ++++ git/Makefile.am
> +@@ -1,9 +1,5 @@
> + SUBDIRS = . libkmod/docs
>
> +-if BUILD_MANPAGES
> +-SUBDIRS += man
> +-endif
> +-
>    DISTCLEAN_LOCAL_HOOKS =
>    EXTRA_DIST =
> ---
> -1.7.8.4
> -
> + CLEANFILES =
> diff --git a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> index 3177e9a..49728c2 100644
> --- a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> +++ b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
> @@ -4,9 +4,8 @@ Index: git/libkmod/libkmod-private.h
>   ===================================================================
>   --- git.orig/libkmod/libkmod-private.h
>   +++ git/libkmod/libkmod-private.h
> -@@ -1,6 +1,10 @@
> - #ifndef _LIBKMOD_PRIVATE_H_
> - #define _LIBKMOD_PRIVATE_H_
> +@@ -1,5 +1,9 @@
> + #pragma once
>
>   +#ifndef O_CLOEXEC
>   +# define O_CLOEXEC 0
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
> index f92ff72..28ce194 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -3,8 +3,7 @@
>
>   require kmod.inc
>
> -PR = "${INC_PR}.0"
> -PV = "9+git${SRCPV}"
> +PV = "14+git${SRCPV}"
>
>   PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
>   RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
>

