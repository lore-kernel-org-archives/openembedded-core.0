Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F30D729E3
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:52:15 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.116501.1732891926732211841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 0561FF4A
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 15:51:52 +0100 (CET)
Received: from [192.168.178.67] ([84.154.172.109]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tH2LW-1lqDEu0; Fri, 29 Nov 2024 15:51:50 +0100
Date: Fri, 29 Nov 2024 15:51:46 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [oe-ore][PATCHv3] libsecret: add pam support depending
 on DISTRO_FEATURES
To: openembedded-core@lists.openembedded.org
Message-Id: <AYVPNS.S5P74F36CIYF2@t-online.de>
In-Reply-To: <180C77EEA4613EA4.18476@lists.openembedded.org>
References: <180C77EEA4613EA4.18476@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zoQsLD+qA9ieb0qEIama"
X-TOI-EXPURGATEID: 150726::1732891910-41FF8F73-04975CF8/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d62d1c1-9cff-4a68-8128-cf0cb6f9420a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 14:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208020

--=-zoQsLD+qA9ieb0qEIama
Content-Type: text/plain; charset=us-ascii; format=flowed

v3: move pam-wrapper dependency to 'pam' PACKAGECONFIG

On Fri, Nov 29 2024 at 03:50:12 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> pam module has been ported from gnome-keyring to libsecret
> [<https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893>]
> 
> Add a PACKAGECONFIG for pam and enable it if pam is in DISTRO_FEATURES
> 
> Add a recipe for pam_wrapper, needed to build the tests
> 
> [<https://gitlab.com/cwrap/pam_wrapper>]
> 
> Import cmocka recipe from meta-oe
> [<https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb>]
> 
> (From OE-Core rev: 3ef7f9650df0d99cd3a25ad470ac67aed1351d11)
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/conf/distro/include/maintainers.inc      |  2 +
>  meta/recipes-devtools/cmocka/cmocka_1.1.7.bb  | 43 ++++++++++++++++
>  ...or-previous-declaration-of-uintptr_t.patch | 43 ++++++++++++++++
>  meta/recipes-devtools/cmocka/files/run-ptest  | 10 ++++
>  ...rapper-add-pc_sysrootdir-to-pc-files.patch | 49 
> +++++++++++++++++++
>  .../pam-wrapper/pam-wrapper_1.1.7.bb          | 23 +++++++++
>  .../libsecret/libsecret_0.21.4.bb             |  3 +-
>  7 files changed, 172 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
>  create mode 100644 
> meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
>  create mode 100644 meta/recipes-devtools/cmocka/files/run-ptest
>  create mode 100644 
> meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch
>  create mode 100644 
> meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc 
> b/meta/conf/distro/include/maintainers.inc
> index d61b88f7de..e6675fce36 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -98,6 +98,7 @@ RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao 
> <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>>"
>  RECIPE_MAINTAINER:pn-cmake = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
>  RECIPE_MAINTAINER:pn-cmake-native = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
> +RECIPE_MAINTAINER:pn-cmocka = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
>  RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae 
> <changhyeok.bae@gmail.com <mailto:changhyeok.bae@gmail.com>>"
>  RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton 
> <ross.burton@arm.com <mailto:ross.burton@arm.com>>"
>  RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton 
> <ross.burton@arm.com <mailto:ross.burton@arm.com>>"
> @@ -569,6 +570,7 @@ RECIPE_MAINTAINER:pn-ovmf = "Unassigned 
> <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-ovmf-shell-image = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
>  RECIPE_MAINTAINER:pn-p11-kit = "Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>  RECIPE_MAINTAINER:pn-package-index = "Ross Burton 
> <ross.burton@arm.com <mailto:ross.burton@arm.com>>"
> +RECIPE_MAINTAINER:pn-pam-wrapper = "Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>"
>  RECIPE_MAINTAINER:pn-pango = "Ross Burton <ross.burton@arm.com 
> <mailto:ross.burton@arm.com>>"
>  RECIPE_MAINTAINER:pn-parted = "Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>>"
>  RECIPE_MAINTAINER:pn-patch = "Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>>"
> diff --git a/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb 
> b/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
> new file mode 100644
> index 0000000000..6c94e9e275
> --- /dev/null
> +++ b/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION = "cmocka is an elegant unit testing framework for C 
> with support for mock \
> +objects. It only requires the standard C library, works on a range 
> of computing \
> +platforms (including embedded) and with different compilers."
> +HOMEPAGE = "<https://cmocka.org/>"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57" 
> <file://copying;md5=3b83ef96387f14655fc854ddc3c6bd57/>
> +
> +SRCREV = "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
> +PV .= "+git"
> +SRC_URI = 
> "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1 
> \
> +           
> file://0001-include-Check-for-previous-declaration-of-uintptr_t.patch 
> <file://0001-include-check-for-previous-declaration-of-uintptr_t.patch/> 
> \
> +           file://run-ptest <file://run-ptest/> \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE += "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PTEST_ENABLED', '1', 
> '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
> +# Use -Wl,wrap linker flag, which does not work with LTO
> +LTO = ""
> +
> +do_install:append () {
> +    install -d ${D}${libdir}/${BPN}/example
> +    install -d ${D}${libdir}/${BPN}/example/mock/chef_wrap
> +    install -d ${D}${libdir}/${BPN}/example/mock/uptime
> +
> +    install -m 0755 ${B}/example/*_test ${D}/${libdir}/${BPN}/example
> +    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap 
> ${D}/${libdir}/${BPN}/example/mock/chef_wrap
> +    install -m 0755 ${B}/example/mock/uptime/uptime 
> ${D}/${libdir}/${BPN}/example/mock/uptime
> +    install -m 0755 ${B}/example/mock/uptime/test_uptime 
> ${D}/${libdir}/${BPN}/example/mock/uptime
> +    install -m 0644 ${B}/example/mock/uptime/libproc_uptime.so 
> ${D}/${libdir}/${BPN}/example/mock/libproc_uptime.so
> +}
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> +
> +PACKAGE_BEFORE_PN += "${PN}-examples"
> +
> +FILES:${PN}-examples = "${libdir}/${BPN}/example"
> diff --git 
> a/meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch 
> b/meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
> new file mode 100644
> index 0000000000..65d30ea993
> --- /dev/null
> +++ 
> b/meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
> @@ -0,0 +1,43 @@
> +From a54e035f802e79e3292d8ad39a14bd7c060eb7b1 Mon Sep 17 00:00:00 
> 2001
> +From: Breno Leitao <breno.leitao@gmail.com 
> <mailto:breno.leitao@gmail.com>>
> +Date: Tue, 21 Mar 2023 21:58:28 -0700
> +Subject: [PATCH] include: Check for previous declaration of uintptr_t
> +
> +Adding a extra check before declaring uintptr_t. Currently musl uses
> +macro __DEFINED_uintptr_t once it defines uintptr_t type. Checking
> +this macro before defining it, and, defining it when uintptr_t is
> +defined.
> +
> +Taken from Alpine
> +
> +Upstream-Status: Pending
> +Signed-off-by: Breno Leitao <breno.leitao@gmail.com 
> <mailto:breno.leitao@gmail.com>>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> +---
> + include/cmocka.h | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/cmocka.h b/include/cmocka.h
> +index a21d965..f540793 100644
> +--- a/include/cmocka.h
> ++++ b/include/cmocka.h
> +@@ -121,7 +121,7 @@ typedef uintmax_t LargestIntegralType;
> +     ((LargestIntegralType)(value))
> +
> + /* Smallest integral type capable of holding a pointer. */
> +-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && 
> !defined(HAVE_UINTPTR_T)
> ++#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && 
> !defined(HAVE_UINTPTR_T) && !defined(__DEFINED_uintptr_t)
> + # if defined(_WIN32)
> +     /* WIN32 is an ILP32 platform */
> +     typedef unsigned int uintptr_t;
> +@@ -147,6 +147,7 @@ typedef uintmax_t LargestIntegralType;
> +
> + # define _UINTPTR_T
> + # define _UINTPTR_T_DEFINED
> ++# define __DEFINED_uintptr_t
> + #endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
> +
> + /* Perform an unsigned cast to uintptr_t. */
> +--
> +2.40.0
> +
> diff --git a/meta/recipes-devtools/cmocka/files/run-ptest 
> b/meta/recipes-devtools/cmocka/files/run-ptest
> new file mode 100644
> index 0000000000..48b9cd9fc5
> --- /dev/null
> +++ b/meta/recipes-devtools/cmocka/files/run-ptest
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +
> +cd tests
> +for i in `ls *`; do
> +   if [ ./$i ] ; then
> +       echo "PASS: $i"
> +   else
> +       echo "FAIL: $i"
> +   fi
> +done
> diff --git 
> a/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch 
> b/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch
> new file mode 100644
> index 0000000000..03c4141aa2
> --- /dev/null
> +++ 
> b/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch
> @@ -0,0 +1,49 @@
> +From 15733e45935dbef71b6c4547cd3a905014793aed Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Fri, 29 Nov 2024 13:49:16 +0100
> +Subject: [PATCH] pamwrapper: add ${pc_sysrootdir} to pc files
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + libpamtest.pc.cmake         | 2 +-
> + pam_wrapper-config.cmake.in | 4 ++--
> + pam_wrapper.pc.cmake        | 4 ++--
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/libpamtest.pc.cmake b/libpamtest.pc.cmake
> +index 6726d76..9cee8bf 100644
> +--- a/libpamtest.pc.cmake
> ++++ b/libpamtest.pc.cmake
> +@@ -1,4 +1,4 @@
> + Name: libpamtest
> + Description: A helper library for PAM testing
> + Version: @APPLICATION_VERSION@
> +-Libs: @CMAKE_INSTALL_FULL_LIBDIR@/libpamtest.so
> ++Libs: ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/libpamtest.so
> +diff --git a/pam_wrapper-config.cmake.in 
> b/pam_wrapper-config.cmake.in
> +index d89e9a4..6ff00d7 100644
> +--- a/pam_wrapper-config.cmake.in
> ++++ b/pam_wrapper-config.cmake.in
> +@@ -1,2 +1,2 @@
> +-set(PAM_WRAPPER_LIBRARY 
> @CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@)
> +-set(PAM_WRAPPER_MODULE_DIR 
> @CMAKE_INSTALL_FULL_LIBDIR@/@PROJECT_NAME@)
> ++set(PAM_WRAPPER_LIBRARY 
> ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@)
> ++set(PAM_WRAPPER_MODULE_DIR 
> ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PROJECT_NAME@)
> +diff --git a/pam_wrapper.pc.cmake b/pam_wrapper.pc.cmake
> +index 7ebe607..f722781 100644
> +--- a/pam_wrapper.pc.cmake
> ++++ b/pam_wrapper.pc.cmake
> +@@ -1,6 +1,6 @@
> +-modules=@CMAKE_INSTALL_FULL_LIBDIR@/pam_wrapper
> ++modules=${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/pam_wrapper
> +
> + Name: @PROJECT_NAME@
> + Description: The pam_wrapper library
> + Version: @PROJECT_VERSION@
> +-Libs: @CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@
> ++Libs: ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@
> +--
> +2.47.0
> +
> diff --git a/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb 
> b/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb
> new file mode 100644
> index 0000000000..8df3295eb6
> --- /dev/null
> +++ b/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "A tool to test PAM applications and PAM modules"
> +HOMEPAGE = "<https://gitlab.com/cwrap/pam_wrapper>"
> +LICENSE = "GPL-3.0-only"
> +
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504" 
> <file://license;md5=d32239bcb673463ab874e80d47fae504/>
> +
> +SRCREV = "f140952e99bb0682bc6da7858f6ca25b70fab86c"
> +SRC_URI = " \
> +	git://gitlab.com/cwrap/pam_wrapper.git;protocol=https;branch=master 
> \
> +	file://0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch 
> <file://0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch/> \
> +"
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig python3targetconfig
> +
> +EXTRA_OECMAKE += "-DPAM_LIBRARY=${libdir}/libpam.so.0"
> +
> +DEPENDS += "cmocka libpam"
> +
> +FILES:${PN} += "${libdir}"
> +
> +RDEPENDS:${PN} += "python3-core libpython3"
> +
> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb 
> b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
> index 88c3c73510..dfda1554cd 100644
> --- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
> @@ -8,7 +8,6 @@ HOMEPAGE = "https://github.com/GNOME/libsecret"
>  BUGTRACKER = "<https://gitlab.gnome.org/GNOME/libsecret/issues>"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6" 
> <file://copying;md5=23c2a5e0106b99d75238986559bb5fc6/>
> 
> -
>  inherit gnomebase gi-docgen vala gobject-introspection manpages
> 
>  DEPENDS += "glib-2.0 libgcrypt gettext-native"
> @@ -17,7 +16,9 @@ SRC_URI[archive.sha256sum] = 
> "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d3c34168c58
> 
>  GTKDOC_MESON_OPTION = 'gtk_doc'
> 
> +PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'pam', d)}"
>  PACKAGECONFIG[manpages] = 
> "-Dmanpage=true,-Dmanpage=false,libxslt-native xmlto-native"
> +PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam pam-wrapper"
> 
>  # <http://errors.yoctoproject.org/Errors/Details/20228/>
>  ARM_INSTRUCTION_SET:armv4 = "arm"
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208019): 
> <https://lists.openembedded.org/g/openembedded-core/message/208019>
> Mute This Topic: <https://lists.openembedded.org/mt/109834763/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-zoQsLD+qA9ieb0qEIama
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v3: move pam-wrapper dependency to 'pam' PACKAGECONFIG</div></div><div id="geary-quote" dir="auto"><br>On Fri, Nov 29 2024 at 03:50:12 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">pam module has been ported from gnome-keyring to libsecret
[<a href="https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893">https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb647d9f82b6ef1cd0893</a>]

Add a PACKAGECONFIG for pam and enable it if pam is in DISTRO_FEATURES

Add a recipe for pam_wrapper, needed to build the tests

[<a href="https://gitlab.com/cwrap/pam_wrapper">https://gitlab.com/cwrap/pam_wrapper</a>]

Import cmocka recipe from meta-oe
[<a href="https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb">https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb</a>]

(From OE-Core rev: 3ef7f9650df0d99cd3a25ad470ac67aed1351d11)

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-devtools/cmocka/cmocka_1.1.7.bb  | 43 ++++++++++++++++
 ...or-previous-declaration-of-uintptr_t.patch | 43 ++++++++++++++++
 meta/recipes-devtools/cmocka/files/run-ptest  | 10 ++++
 ...rapper-add-pc_sysrootdir-to-pc-files.patch | 49 +++++++++++++++++++
 .../pam-wrapper/pam-wrapper_1.1.7.bb          | 23 +++++++++
 .../libsecret/libsecret_0.21.4.bb             |  3 +-
 7 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
 create mode 100644 meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
 create mode 100644 meta/recipes-devtools/cmocka/files/run-ptest
 create mode 100644 meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch
 create mode 100644 meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d61b88f7de..e6675fce36 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -98,6 +98,7 @@ RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao &lt;yi.zhao@windriver.com&gt;"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao &lt;<a href="mailto:yi.zhao@windriver.com">yi.zhao@windriver.com</a>&gt;"
 RECIPE_MAINTAINER:pn-cmake = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
 RECIPE_MAINTAINER:pn-cmake-native = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
+RECIPE_MAINTAINER:pn-cmocka = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae &lt;<a href="mailto:changhyeok.bae@gmail.com">changhyeok.bae@gmail.com</a>&gt;"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton &lt;<a href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton &lt;<a href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;"
@@ -569,6 +570,7 @@ RECIPE_MAINTAINER:pn-ovmf = "Unassigned &lt;unassigned@yoctoproject.org&gt;"
 RECIPE_MAINTAINER:pn-ovmf-shell-image = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
 RECIPE_MAINTAINER:pn-p11-kit = "Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;"
 RECIPE_MAINTAINER:pn-package-index = "Ross Burton &lt;<a href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;"
+RECIPE_MAINTAINER:pn-pam-wrapper = "Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;"
 RECIPE_MAINTAINER:pn-pango = "Ross Burton &lt;<a href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;"
 RECIPE_MAINTAINER:pn-parted = "Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;"
 RECIPE_MAINTAINER:pn-patch = "Hongxu Jia &lt;<a href="mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;"
diff --git a/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb b/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
new file mode 100644
index 0000000000..6c94e9e275
--- /dev/null
+++ b/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "cmocka is an elegant unit testing framework for C with support for mock \
+objects. It only requires the standard C library, works on a range of computing \
+platforms (including embedded) and with different compilers."
+HOMEPAGE = "<a href="https://cmocka.org/">https://cmocka.org/</a>"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57" "="">file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"</a>
+
+SRCREV = "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
+PV .= "+git"
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1 \
+           <a href="file://0001-include-Check-for-previous-declaration-of-uintptr_t.patch">file://0001-include-Check-for-previous-declaration-of-uintptr_t.patch</a> \
+           <a href="file://run-ptest">file://run-ptest</a> \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit cmake ptest
+
+EXTRA_OECMAKE += "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
+# Use -Wl,wrap linker flag, which does not work with LTO
+LTO = ""
+
+do_install:append () {
+    install -d ${D}${libdir}/${BPN}/example
+    install -d ${D}${libdir}/${BPN}/example/mock/chef_wrap
+    install -d ${D}${libdir}/${BPN}/example/mock/uptime
+
+    install -m 0755 ${B}/example/*_test ${D}/${libdir}/${BPN}/example
+    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${libdir}/${BPN}/example/mock/chef_wrap
+    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${libdir}/${BPN}/example/mock/uptime
+    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${libdir}/${BPN}/example/mock/uptime
+    install -m 0644 ${B}/example/mock/uptime/libproc_uptime.so ${D}/${libdir}/${BPN}/example/mock/libproc_uptime.so
+}
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
+}
+
+PACKAGE_BEFORE_PN += "${PN}-examples"
+
+FILES:${PN}-examples = "${libdir}/${BPN}/example"
diff --git a/meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch b/meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
new file mode 100644
index 0000000000..65d30ea993
--- /dev/null
+++ b/meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
@@ -0,0 +1,43 @@
+From a54e035f802e79e3292d8ad39a14bd7c060eb7b1 Mon Sep 17 00:00:00 2001
+From: Breno Leitao &lt;<a href="mailto:breno.leitao@gmail.com">breno.leitao@gmail.com</a>&gt;
+Date: Tue, 21 Mar 2023 21:58:28 -0700
+Subject: [PATCH] include: Check for previous declaration of uintptr_t
+
+Adding a extra check before declaring uintptr_t. Currently musl uses
+macro __DEFINED_uintptr_t once it defines uintptr_t type. Checking
+this macro before defining it, and, defining it when uintptr_t is
+defined.
+
+Taken from Alpine
+
+Upstream-Status: Pending
+Signed-off-by: Breno Leitao &lt;<a href="mailto:breno.leitao@gmail.com">breno.leitao@gmail.com</a>&gt;
+Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
+---
+ include/cmocka.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/cmocka.h b/include/cmocka.h
+index a21d965..f540793 100644
+--- a/include/cmocka.h
++++ b/include/cmocka.h
+@@ -121,7 +121,7 @@ typedef uintmax_t LargestIntegralType;
+     ((LargestIntegralType)(value))
+ 
+ /* Smallest integral type capable of holding a pointer. */
+-#if !defined(_UINTPTR_T) &amp;&amp; !defined(_UINTPTR_T_DEFINED) &amp;&amp; !defined(HAVE_UINTPTR_T)
++#if !defined(_UINTPTR_T) &amp;&amp; !defined(_UINTPTR_T_DEFINED) &amp;&amp; !defined(HAVE_UINTPTR_T) &amp;&amp; !defined(__DEFINED_uintptr_t)
+ # if defined(_WIN32)
+     /* WIN32 is an ILP32 platform */
+     typedef unsigned int uintptr_t;
+@@ -147,6 +147,7 @@ typedef uintmax_t LargestIntegralType;
+ 
+ # define _UINTPTR_T
+ # define _UINTPTR_T_DEFINED
++# define __DEFINED_uintptr_t
+ #endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
+ 
+ /* Perform an unsigned cast to uintptr_t. */
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/cmocka/files/run-ptest b/meta/recipes-devtools/cmocka/files/run-ptest
new file mode 100644
index 0000000000..48b9cd9fc5
--- /dev/null
+++ b/meta/recipes-devtools/cmocka/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests
+for i in `ls *`; do
+   if [ ./$i ] ; then
+       echo "PASS: $i"
+   else
+       echo "FAIL: $i"
+   fi
+done
diff --git a/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch b/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch
new file mode 100644
index 0000000000..03c4141aa2
--- /dev/null
+++ b/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch
@@ -0,0 +1,49 @@
+From 15733e45935dbef71b6c4547cd3a905014793aed Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Fri, 29 Nov 2024 13:49:16 +0100
+Subject: [PATCH] pamwrapper: add ${pc_sysrootdir} to pc files
+
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ libpamtest.pc.cmake         | 2 +-
+ pam_wrapper-config.cmake.in | 4 ++--
+ pam_wrapper.pc.cmake        | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libpamtest.pc.cmake b/libpamtest.pc.cmake
+index 6726d76..9cee8bf 100644
+--- a/libpamtest.pc.cmake
++++ b/libpamtest.pc.cmake
+@@ -1,4 +1,4 @@
+ Name: libpamtest
+ Description: A helper library for PAM testing
+ Version: @APPLICATION_VERSION@
+-Libs: @CMAKE_INSTALL_FULL_LIBDIR@/libpamtest.so
++Libs: ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/libpamtest.so
+diff --git a/pam_wrapper-config.cmake.in b/pam_wrapper-config.cmake.in
+index d89e9a4..6ff00d7 100644
+--- a/pam_wrapper-config.cmake.in
++++ b/pam_wrapper-config.cmake.in
+@@ -1,2 +1,2 @@
+-set(PAM_WRAPPER_LIBRARY @CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@)
+-set(PAM_WRAPPER_MODULE_DIR @CMAKE_INSTALL_FULL_LIBDIR@/@PROJECT_NAME@)
++set(PAM_WRAPPER_LIBRARY ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@)
++set(PAM_WRAPPER_MODULE_DIR ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PROJECT_NAME@)
+diff --git a/pam_wrapper.pc.cmake b/pam_wrapper.pc.cmake
+index 7ebe607..f722781 100644
+--- a/pam_wrapper.pc.cmake
++++ b/pam_wrapper.pc.cmake
+@@ -1,6 +1,6 @@
+-modules=@CMAKE_INSTALL_FULL_LIBDIR@/pam_wrapper
++modules=${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/pam_wrapper
+ 
+ Name: @PROJECT_NAME@
+ Description: The pam_wrapper library
+ Version: @PROJECT_VERSION@
+-Libs: @CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@
++Libs: ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@
+-- 
+2.47.0
+
diff --git a/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb b/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb
new file mode 100644
index 0000000000..8df3295eb6
--- /dev/null
+++ b/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb
@@ -0,0 +1,23 @@
+SUMMARY = "A tool to test PAM applications and PAM modules"
+HOMEPAGE = "<a href="https://gitlab.com/cwrap/pam_wrapper">https://gitlab.com/cwrap/pam_wrapper</a>"
+LICENSE = "GPL-3.0-only"
+
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=d32239bcb673463ab874e80d47fae504" "="">file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"</a>
+
+SRCREV = "f140952e99bb0682bc6da7858f6ca25b70fab86c"
+SRC_URI = " \
+	git://gitlab.com/cwrap/pam_wrapper.git;protocol=https;branch=master \
+	<a href="file://0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch">file://0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch</a> \
+"
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig python3targetconfig
+
+EXTRA_OECMAKE += "-DPAM_LIBRARY=${libdir}/libpam.so.0"
+
+DEPENDS += "cmocka libpam"
+
+FILES:${PN} += "${libdir}"
+
+RDEPENDS:${PN} += "python3-core libpython3"
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
index 88c3c73510..dfda1554cd 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
@@ -8,7 +8,6 @@ HOMEPAGE = "https://github.com/GNOME/libsecret"
 BUGTRACKER = "<a href="https://gitlab.gnome.org/GNOME/libsecret/issues">https://gitlab.gnome.org/GNOME/libsecret/issues</a>"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6" "="">file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"</a>
 
-
 inherit gnomebase gi-docgen vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
@@ -17,7 +16,9 @@ SRC_URI[archive.sha256sum] = "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d3c34168c58
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
+PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[manpages] = "-Dmanpage=true,-Dmanpage=false,libxslt-native xmlto-native"
+PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam pam-wrapper"
 
 # <a href="http://errors.yoctoproject.org/Errors/Details/20228/">http://errors.yoctoproject.org/Errors/Details/20228/</a>
 ARM_INSTRUCTION_SET:armv4 = "arm"
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#208019): <a href="https://lists.openembedded.org/g/openembedded-core/message/208019">https://lists.openembedded.org/g/openembedded-core/message/208019</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109834763/3618223">https://lists.openembedded.org/mt/109834763/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-zoQsLD+qA9ieb0qEIama--


