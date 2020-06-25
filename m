Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.184.1593101091469741074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 09:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XuVNjkO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.68, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f68.google.com with SMTP id h28so4654917edz.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ubYJLUM+g9XNWpViC8MeQqNh9nF+7P9bTKm0npqygAw=;
        b=XuVNjkO9eTLnMwoVtcy1kBIqQ58myeenX1i6CP2BzGkzBEUlyiTTpmDay12zaxdvwj
         1xU0lxcj0C6XnT8BQvqjwRGtWbeKx3YTMre9ptJnR+d3fMWAWN9rPjcSeMjA+f4Z/z4k
         E7hp127Sf4BQu/hkOmeU0WAJhXH0js3foBAbuGcK48Se35kG+G0igVaGX+HZQnMp6ZeP
         SVCDjide12de7mP7gMUWKjfOYjiLtB8dLPZimuCQd73ZhmFWyr+ZZobHKWYvN68xh01I
         btoohPbR/o+L+vvY3Ajq7Ys/oRSCFWQr4ZU+itC3ey3TLYAwaz+YtJjfoFxK9wWelufk
         10gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ubYJLUM+g9XNWpViC8MeQqNh9nF+7P9bTKm0npqygAw=;
        b=sWZsrxa0TqKmsbLDOc8yCVcuLS5ViOmptXbdjFZvmKjf7B9qojHZQLItIBaAbAarR/
         o8Na8zbFs8kVH3E9RnngnkY0EZo3suBUy/1WK0/1gQZaKi8Syq1+C/oVsi3jtb36aTRT
         yFUdk0SCFrQeiKZlNHLiBNmP1iW/t+8T7LWfd1i83PoleTf8pMWyJSxcMGQ7M0X+zvBM
         YzgdAjrLOiCJOy+lEGrgma0YRjbsmWYHZkEGfDdiMwxAQBa9l9CXweuqi6Y52K7V6wsg
         c80e2OZalowhLWmm0YPLpEdtIYST2hDy0yJyzoD3uHtXlzZDt3ycker72/bQd4uVW8xp
         H1AQ==
X-Gm-Message-State: AOAM531YSQpC1wG8eg1FmAXGpj7sKtepW94aEtvet1XIA72AaEJXakkT
	q0NwMUUOP1lXFV06DhpVlGPrLkBT/pTIWoPy7j/J3w==
X-Google-Smtp-Source: ABdhPJzE8z2oAwF/rqrOeEXVijClWzlRpxr326rgk/stdUXjqTRn7yPQPtUERqqcJATCJ0xqajFUpypMXB55rZczIig=
X-Received: by 2002:a50:9dc8:: with SMTP id l8mr9117600edk.248.1593101089662;
 Thu, 25 Jun 2020 09:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200623210837.26222-1-alex.kanavin@gmail.com>
In-Reply-To: <20200623210837.26222-1-alex.kanavin@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 25 Jun 2020 06:04:37 -1000
Message-ID: <CAOSpxdYUPQwNmZNP8FF7M=M2a95Wfvth0xpcO+C3G7bGKiJXCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] icu: merge .inc into main recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this patch series suitable for dunfell as-is (the concern being the
contents of the version bump) or would a backport to 66.1 be
necessary?

Steve

On Tue, Jun 23, 2020 at 11:09 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Both parts are rather convoluted, so it is better to have them in a single file.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/icu/icu.inc     | 84 ---------------------------
>  meta/recipes-support/icu/icu_67.1.bb | 85 +++++++++++++++++++++++++++-
>  2 files changed, 84 insertions(+), 85 deletions(-)
>  delete mode 100644 meta/recipes-support/icu/icu.inc
>
> diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
> deleted file mode 100644
> index 6d9728903d..0000000000
> --- a/meta/recipes-support/icu/icu.inc
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -SUMMARY = "International Component for Unicode libraries"
> -DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> -portable set of C/C++ and Java libraries for Unicode support, software \
> -internationalization (I18N) and globalization (G11N), giving applications the \
> -same results on all platforms."
> -HOMEPAGE = "http://site.icu-project.org/"
> -
> -LICENSE = "ICU"
> -DEPENDS = "icu-native"
> -DEPENDS_class-native = ""
> -
> -CVE_PRODUCT = "international_components_for_unicode"
> -
> -S = "${WORKDIR}/icu/source"
> -SPDX_S = "${WORKDIR}/icu"
> -STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> -
> -BINCONFIG = "${bindir}/icu-config"
> -
> -ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> -
> -inherit autotools pkgconfig binconfig multilib_script
> -
> -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> -
> -# ICU needs the native build directory as an argument to its --with-cross-build option when
> -# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> -# into consideration, the native build directory needs to be staged.
> -EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> -EXTRA_OECONF_class-native = ""
> -EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> -
> -EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> -TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> -
> -ASNEEDED = ""
> -
> -do_compile_prepend_class-target () {
> -       # Make sure certain build host references do not end up being compiled
> -       # in the image. This only affects libicutu and icu-dbg
> -       sed  \
> -           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> -           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> -           -i ${B}/tools/toolutil/Makefile
> -}
> -
> -PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> -do_install_append_class-native() {
> -       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> -       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> -       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> -       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> -       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> -       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> -}
> -
> -do_install_append_class-target() {
> -    # The native pkgdata can not generate the correct data file.
> -    # Use icupkg to re-generate it.
> -    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> -        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> -        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> -    fi
> -
> -       # Remove build host references...
> -       sed -i  \
> -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> -           -e 's:${HOSTTOOLS_DIR}/::g' \
> -           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> -           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> -}
> -
> -PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> -
> -FILES_${PN}-dev += "${libdir}/${BPN}/"
> -
> -FILES_libicudata = "${libdir}/libicudata.so.*"
> -FILES_libicuuc = "${libdir}/libicuuc.so.*"
> -FILES_libicui18n = "${libdir}/libicui18n.so.*"
> -FILES_libicutu = "${libdir}/libicutu.so.*"
> -FILES_libicuio = "${libdir}/libicuio.so.*"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_67.1.bb
> index 58638507c9..5814fa41bd 100644
> --- a/meta/recipes-support/icu/icu_67.1.bb
> +++ b/meta/recipes-support/icu/icu_67.1.bb
> @@ -1,4 +1,87 @@
> -require icu.inc
> +SUMMARY = "International Component for Unicode libraries"
> +DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
> +portable set of C/C++ and Java libraries for Unicode support, software \
> +internationalization (I18N) and globalization (G11N), giving applications the \
> +same results on all platforms."
> +HOMEPAGE = "http://site.icu-project.org/"
> +
> +LICENSE = "ICU"
> +DEPENDS = "icu-native"
> +DEPENDS_class-native = ""
> +
> +CVE_PRODUCT = "international_components_for_unicode"
> +
> +S = "${WORKDIR}/icu/source"
> +SPDX_S = "${WORKDIR}/icu"
> +STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
> +
> +BINCONFIG = "${bindir}/icu-config"
> +
> +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
> +
> +inherit autotools pkgconfig binconfig multilib_script
> +
> +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
> +
> +# ICU needs the native build directory as an argument to its --with-cross-build option when
> +# cross-compiling. Taken the situation that different builds may share a common sstate-cache
> +# into consideration, the native build directory needs to be staged.
> +EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> +EXTRA_OECONF_class-native = ""
> +EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
> +
> +EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
> +TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
> +
> +ASNEEDED = ""
> +
> +do_compile_prepend_class-target () {
> +       # Make sure certain build host references do not end up being compiled
> +       # in the image. This only affects libicutu and icu-dbg
> +       sed  \
> +           -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
> +           -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
> +           -i ${B}/tools/toolutil/Makefile
> +}
> +
> +PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
> +do_install_append_class-native() {
> +       mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +       cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +       cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
> +       cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
> +       cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
> +       cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
> +}
> +
> +do_install_append_class-target() {
> +    # The native pkgdata can not generate the correct data file.
> +    # Use icupkg to re-generate it.
> +    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
> +        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> +        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
> +    fi
> +
> +       # Remove build host references...
> +       sed -i  \
> +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> +           -e 's:${HOSTTOOLS_DIR}/::g' \
> +           ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
> +           ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
> +}
> +
> +PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
> +
> +FILES_${PN}-dev += "${libdir}/${BPN}/"
> +
> +FILES_libicudata = "${libdir}/libicudata.so.*"
> +FILES_libicuuc = "${libdir}/libicuuc.so.*"
> +FILES_libicui18n = "${libdir}/libicui18n.so.*"
> +FILES_libicutu = "${libdir}/libicutu.so.*"
> +FILES_libicuio = "${libdir}/libicuio.so.*"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
>  LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
>
> --
> 2.27.0
>
> 
