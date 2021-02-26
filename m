Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.14229.1614366205958988215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 11:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bi1EXeLA;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id f17so10186933qkl.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 11:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tge/1NM3xaJakjB4dNEDqvyDF/6Rrhz6H3ntScy8SZM=;
        b=Bi1EXeLAXDssMgBSgeCMdDNmuILelvD8VSag9hVS/+ngSZAKkzT0VDIva6tjGG6bWs
         QbBtoTEJGV1qFzwNkucuDmxsN2gXafpnvrLfdKBvMC1GvjVxW6nB/LdjzuUI91ShIpPw
         ZC1JViIulRuSaxUqJYGlKcKjwaCGrcxMqFw+/cnnUt1FjzjEy3UbM869z+kEpXqy5lD+
         tp12q0nszDZf1jxlt7WlBlt4IuMwJ3LWdxs+mgrCiZOEK+hmJSIz0DXwy1l9trWF4Qtk
         e7H2awqjv7hOvumUvdVfLwmIbJMSOWooe86WLarUKwQqcV735wSfnbRU8WxXR10lN+qY
         yjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tge/1NM3xaJakjB4dNEDqvyDF/6Rrhz6H3ntScy8SZM=;
        b=qNZAgx8mRg3i1m9e/cT4SwF0d9Py9nFPXiQGdpbYblz7y3Haa6XQD77F0iJohOtDnD
         Hh26Fl0dQd2pHShUWQ9Xt0Fo+s39JJFv3/MOH9JfXGU26ZtW/U7sGisMTRDQuqGTr6Wc
         1OPBY6hbRFroWYF+tcDmcA1QusOCBwTy1FiZQ8TzfahDCSExZp2y/TBlasKWIJAcCLdM
         i+Nt80wctiaKyHtJRdlMxsaZpYaO9EE6aWG4zV9w84SDaoUw5a0mHRw0YUF9c9bt+MAl
         zCxSIfSyuuEuiUS9GcrV4fLEI/+OH7qJQ7kgegSP53uj+rZElcLGXnuyknV0qWZWdlQx
         M/pw==
X-Gm-Message-State: AOAM532itIG1ylShnpGzBvDnm+f9NdvX3vGd1rK/onFrdXxNKJNiaQ4L
	ZzS7knA3Knr8AtJY/nFeMc8Y5m1TxXHmHg0OM61mCmbKRgjhiQ==
X-Google-Smtp-Source: ABdhPJxw7zgsvnvLYBByEDlDixh1Q1rDXqXde4uAf3FTFOQQkoh0sip6tYS9yYZi9Z6PuaEmico/GkRAGoP1RSuZnLc=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr4254277qki.25.1614366204661;
 Fri, 26 Feb 2021 11:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20201210184632.3448265-1-luca.boccassi@gmail.com> <20210225153035.1239276-1-luca.boccassi@gmail.com>
In-Reply-To: <20210225153035.1239276-1-luca.boccassi@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 26 Feb 2021 11:02:58 -0800
Message-ID: <CAMKF1sog1N1hWtSMTZtg4my86ZtPC_g=SVsD-c8MX5MKhcEwag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] util-linux: split uuid in separate recipe to allow bootstrapping
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Paul Eggleton <bluelightning@bluelightning.org>
Content-Type: text/plain; charset="UTF-8"

seeing dependency loops
http://sprunge.us/E5c3NC

On Thu, Feb 25, 2021 at 7:30 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> Recently util-linux gained an (optional) build dependency on libcryptsetup.
> But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
> and uuid (mandatory).
> Split out util-linux-uuid in a different recipe to break the cycle.
>
> https://github.com/karelzak/util-linux/pull/898
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory work
>     underway as I'm not sure if this is the best approach or if there are
>     alternatives. Suggestions and comments very welcome. Thanks!
> v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-libuuid)
>     and leave uuid build enable in main recipe to allow for uuidgen build to happen,
>     as it does not have its own autoconf switch. Delete the library manualy from
>     the main recipe after build instead, and add dependency.
>     Might help to break loop python3 -> util-linux -> libselinux -> python3, as it's
>     only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto/message/47570
> v3: rebased and refactored to have a common util-linux.inc file
> v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA warnings
> v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-uuid.
>     Removed PACKAGES_remove and instead filter out libuuid via the package generation
>     regex.
>     Rebased on util-linux 2.36.2.
>
>  .../util-linux/util-linux-uuid_2.36.2.bb      | 22 ++++++++
>  meta/recipes-core/util-linux/util-linux.inc   | 41 ++++++++++++++
>  .../util-linux/util-linux_2.36.2.bb           | 53 +++++--------------
>  3 files changed, 75 insertions(+), 41 deletions(-)
>  create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
>  create mode 100644 meta/recipes-core/util-linux/util-linux.inc
>
> diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> new file mode 100644
> index 0000000000..ffb2c87270
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
> @@ -0,0 +1,22 @@
> +# To allow util-linux to optionally build-depend on cryptsetup, libuuid is
> +# split out of the main recipe, as it's needed by cryptsetup
> +
> +require util-linux.inc
> +
> +inherit autotools gettext pkgconfig
> +
> +S = "${WORKDIR}/util-linux-${PV}"
> +EXTRA_OECONF += "--disable-all-programs --enable-libuuid"
> +DEBIAN_NOAUTONAME_util-linux-libuuid = "1"
> +DEBIAN_NOAUTONAME_util-linux-libuuid-dev = "1"
> +DEBIAN_NOAUTONAME_util-linux-libuuid-dbg = "1"
> +PACKAGES = "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-dbg"
> +FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
> +FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${includedir} ${libdir}/pkgconfig"
> +FILES_util-linux-libuuid-dbg = "/usr/src ${libdir}/.debug"
> +
> +do_install_append() {
> +       rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindir} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> new file mode 100644
> index 0000000000..b4f817ed82
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -0,0 +1,41 @@
> +SUMMARY = "A suite of basic system administration utilities"
> +HOMEPAGE = "https://en.wikipedia.org/wiki/Util-linux"
> +DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
> +commonly found on most Linux systems.  Some of the more important utilities include \
> +disk partitioning, kernel message management, filesystem creation, and system login."
> +
> +SECTION = "base"
> +
> +LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> +LICENSE_${PN}-libblkid = "LGPLv2.1+"
> +LICENSE_${PN}-libfdisk = "LGPLv2.1+"
> +LICENSE_${PN}-libmount = "LGPLv2.1+"
> +LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
> +LICENSE_${PN}-libuuid = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
> +                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
> +                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
> +                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
> +                    file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
> +                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
> +                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> +                    file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> +                    file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> +"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/util-linux:"
> +MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> +BPN = "util-linux"
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
> +           file://configure-sbindir.patch \
> +           file://runuser.pamd \
> +           file://runuser-l.pamd \
> +           file://ptest.patch \
> +           file://run-ptest \
> +           file://display_testname_for_subtest.patch \
> +           file://avoid_parallel_tests.patch \
> +           "
> +SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> index 19950a2726..d4406695f6 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
> @@ -1,46 +1,8 @@
> -SUMMARY = "A suite of basic system administration utilities"
> -HOMEPAGE = "https://en.wikipedia.org/wiki/Util-linux"
> -DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
> -commonly found on most Linux systems.  Some of the more important utilities include \
> -disk partitioning, kernel message management, filesystem creation, and system login."
> -
> -SECTION = "base"
> -
> -LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> -LICENSE_${PN}-libblkid = "LGPLv2.1+"
> -LICENSE_${PN}-libfdisk = "LGPLv2.1+"
> -LICENSE_${PN}-libmount = "LGPLv2.1+"
> -LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
> -LICENSE_${PN}-libuuid = "BSD-3-Clause"
> -
> -LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
> -                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
> -                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=58dcd8452651fc8b07d1f65ce07ca8af \
> -                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;md5=263860f8968d8bafa5392cab74285262 \
> -                    file://libuuid/COPYING;md5=6d2cafc999feb2c2de84d4d24b23290c \
> -                    file://libmount/COPYING;md5=7c7e39fb7d70ffe5d693a643e29987c2 \
> -                    file://libblkid/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> -                    file://libfdisk/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> -                    file://libsmartcols/COPYING;md5=693bcbbe16d3a4a4b37bc906bc01cc04 \
> -"
> +require util-linux.inc
>
>  #gtk-doc is not enabled as it requires xmlto which requires util-linux
>  inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
> -DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
> -
> -MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
> -           file://configure-sbindir.patch \
> -           file://runuser.pamd \
> -           file://runuser-l.pamd \
> -           file://ptest.patch \
> -           file://run-ptest \
> -           file://display_testname_for_subtest.patch \
> -           file://avoid_parallel_tests.patch \
> -           "
> -SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
> +DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-uuid"
>
>  PACKAGES =+ "${PN}-swaponoff"
>  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
> @@ -87,8 +49,9 @@ python util_linux_binpackages () {
>  # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
>  PACKAGE_PREPROCESS_FUNCS =+ "util_linux_binpackages "
>
> +# skip libuuid as it will be packaged by the util-linux-uuid recipe
>  python util_linux_libpackages() {
> -    do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(.*)\.so\..*$',
> +    do_split_packages(d, root=d.getVar('UTIL_LINUX_LIBDIR'), file_regex=r'^lib(?!uuid)(.*)\.so\..*$',
>                        output_pattern='${PN}-lib%s',
>                        description='${PN} lib%s',
>                        extra_depends='', prepend=True, allow_links=True)
> @@ -141,6 +104,7 @@ PACKAGECONFIG[pylibmount] = "--with-python=3 --enable-pylibmount,--without-pytho
>  PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>  # PCRE support in hardlink
>  PACKAGECONFIG[pcre2] = ",,libpcre2"
> +PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>
>  EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
>
> @@ -165,6 +129,8 @@ RRECOMMENDS_${PN}_class-nativesdk = ""
>  RDEPENDS_${PN}_class-native = ""
>  RDEPENDS_${PN}_class-nativesdk = ""
>
> +RDEPENDS_${PN}_append += " util-linux-uuid"
> +
>  RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
>
>  RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
> @@ -316,6 +282,11 @@ ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
>  ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
>  ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
>
> +# dm-verity support introduces a circular build dependency, so util-linux-uuid is split out for target builds
> +# Need to build libuuid for uuidgen, but then delete it and let the other recipe ship it
> +do_install_append() {
> +    rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/libuuid* ${D}/lib/libuuid*
> +}
>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.29.2
>
>
> 
>
