Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FFCD7830E
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 11:06:38 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.171757.1733137589286457214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 03:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6j31ioD;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d8843c44cfso26893836d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733137588; x=1733742388; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tAQvuDs5nWeJFjzuu+LJXc8rIhmdVfeLywlfPJ2Xrnc=;
        b=j6j31ioDnOtz0mceRHxjISxMKlh+qmgKcNKS6tVtp7qTJ4elUxlyF/k1gKwFjWZTDh
         +Rv47pGWyb+od0VXmpPUU2rImnIgW3Dmr0PGa+/uySSVATyUXIzxPEbxTWylsXEbQGOw
         7DfGscNmPDiMva5W8zR/Up/omY4Y4EZw17JvuykU9vWBRoFs+jZ4+urMFo61pLhTNIAU
         eY6OLDgM4Byf6Ueuve9M+2C7LRh8st16OpTTQV5d09RFTLrNNqrnU/WSpDsDgq1oI0Oz
         kJasjKoqHsQ//R54cGEKTdJJJ2TwVXPVBDgzTZ8XGZbUmwDlCtpFQfeIUKSdAirvmj9v
         ccQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137588; x=1733742388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAQvuDs5nWeJFjzuu+LJXc8rIhmdVfeLywlfPJ2Xrnc=;
        b=mlbZ8iiB2YVzdFvj4HKlO6YaJkG+wDUHQcmQedr9jLtWG+i8oZBTtDq00xa/cFQaPq
         PVSNQGVR+jvBMXZsjAMuY0DuxKvhFCAPdGsGkywCkm5uCktjPH2ptDaYGqyrmL9cH3H8
         aCCqq/0yDZ0n5yV3MoxvgqxjZVwqVySr7E+ExK3r59VPXIEopgyRpdttyBS1XnItJlpL
         hPXAGtIzRvp7BZgTHSdqHUs8xCIcSt0q9LyBzLrlkXqNKTZzuV3duzIhJJfCNwhaP3N7
         hClyybVautqpEZR+BEqQ03Auh8llMW+VYGqhTVonf/5PSd8OELKAo6Gv87EChFQDPGDk
         xNPQ==
X-Gm-Message-State: AOJu0YxElT1fnf2GH6DC7qZX6JXxp/nGW/QWXlGwXNAxhL/q8zCszrQm
	FJIdmljjApZ9Emm1Z+tpXJ5xV9mhuIiKb0Ni+wV9SbIv+2fu4fFbds/tffDrDhCulHYxXrmkpAh
	IkirNK4NVvjcnoBwiLb8vmA6yeJ8=
X-Gm-Gg: ASbGncuUJedNf5KqdZXoullvWEwrWc6nPEfa1priJdO05bB+eYw1YgesvgrCzXvApDI
	AO9zOxRzJ97NJy7sOoaN+qoAor7/uNboQYV1TlLMMq1nty/bxRcWzxmSr+85vPs/Y1g==
X-Google-Smtp-Source: AGHT+IG3j+ZkW2XNyMT8lpbE0PkG4jtwvuQu/EhLl1ZoYeOfskUKo2rne0qfJ5lYW1uqde9Adjycgec/T33ZuluXQ2c=
X-Received: by 2002:a05:6214:caa:b0:6d8:a64d:da51 with SMTP id
 6a1803df08f44-6d8a64ddbe4mr68018226d6.8.1733137587982; Mon, 02 Dec 2024
 03:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20241202105339.58026-1-f_l_k@t-online.de>
In-Reply-To: <20241202105339.58026-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 2 Dec 2024 12:06:17 +0100
Message-ID: <CANNYZj9jpLRJyrE8LUbRv7LwmyFA6BgwqbDvPumR=Zvv5oUohQ@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] pam: update 1.6.1 -> 1.7.0
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 11:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208138

Please see my comment elsewhere, it's better to split this into
several patches, each dealing with a particular issue (in particular
the version update shouldn't be bundled with all the other changes).

Alex

On Mon, 2 Dec 2024 at 11:53, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> - switch to meson build system
>
> I've been testing this patch for a few days now. In libpam the autotools
> buildsystem was removed. This patch switches to meson.
>
> The libpam recipe was split into two parts and now compiles twice. First only the
> libs are packaged and afterwards the libpam modules. This breaks a dependency loop
> and makes it possible to link against systemd to enable 'logind' support for
> the modules.
>
> The patch is invasive, but my tests so far are promising. It compiles for x86-64/arm/arm64
> and mutlilib and it seems to fix the build for libpam-native (and a missing DISTRO_FEATURES issue).
> Although not yet compilable, it also reduces the dependency loops between systemd<->shadow
> and should allow to build pam without systemd in DISTRO_FEATURES
>
> One file is still packed into libpam-modules. This should be moved to the appropriate module,
> but I'm not sure what the /run/sepermit directory is needed for.
> There is also a patch added that fixes a problem in meson when checking for keyring. But when
> I wanted to send it upstream, I saw that the problem was already solved and submitted nicer by
> Alexander Kanavin
>
> The ptest part is also still missing. When xtests is enabled, the tests compile without errors,
> but by default they are neither built nor installed. So I wanted to ask first, what of this is
> still needed?
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  .../0001-meson.build-fix-keyring-check.patch  |  39 ++++
>  .../pam/{libpam => files}/99_pam              |   0
>  .../pam/{libpam => files}/libpam-xtests.patch |   0
>  .../pam/{libpam => files}/pam-volatiles.conf  |   0
>  .../{libpam => files}/pam.d/common-account    |   0
>  .../pam/{libpam => files}/pam.d/common-auth   |   0
>  .../{libpam => files}/pam.d/common-password   |   0
>  .../{libpam => files}/pam.d/common-session    |   0
>  .../pam.d/common-session-noninteractive       |   0
>  .../pam/{libpam => files}/pam.d/other         |   0
>  .../pam/{libpam => files}/run-ptest           |   0
>  meta/recipes-extended/pam/libpam-modules.bb   | 110 ++++++++++
>  meta/recipes-extended/pam/libpam.bb           |  16 ++
>  meta/recipes-extended/pam/libpam.inc          |  56 ++++++
>  meta/recipes-extended/pam/libpam_1.6.1.bb     | 190 ------------------
>  16 files changed, 222 insertions(+), 190 deletions(-)
>  create mode 100644 meta/recipes-extended/pam/files/0001-meson.build-fix-keyring-check.patch
>  rename meta/recipes-extended/pam/{libpam => files}/99_pam (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/libpam-xtests.patch (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/pam-volatiles.conf (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/pam.d/common-account (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/pam.d/common-auth (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/pam.d/common-password (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/pam.d/common-session (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/pam.d/common-session-noninteractive (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/pam.d/other (100%)
>  rename meta/recipes-extended/pam/{libpam => files}/run-ptest (100%)
>  create mode 100644 meta/recipes-extended/pam/libpam-modules.bb
>  create mode 100644 meta/recipes-extended/pam/libpam.bb
>  create mode 100644 meta/recipes-extended/pam/libpam.inc
>  delete mode 100644 meta/recipes-extended/pam/libpam_1.6.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 9151a348ee..0f375c146e 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -370,6 +370,7 @@ RECIPE_MAINTAINER:pn-libnss-mdns = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-libnss-nis = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-libogg = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libpam = "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER:pn-libpam-modules = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libpcap = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libpciaccess = "Wang Mingyu <wangmy@fujitsu.com>"
>  RECIPE_MAINTAINER:pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
> diff --git a/meta/recipes-extended/pam/files/0001-meson.build-fix-keyring-check.patch b/meta/recipes-extended/pam/files/0001-meson.build-fix-keyring-check.patch
> new file mode 100644
> index 0000000000..6cd3ab4724
> --- /dev/null
> +++ b/meta/recipes-extended/pam/files/0001-meson.build-fix-keyring-check.patch
> @@ -0,0 +1,39 @@
> +From 5dbe719b22e9e779ef44cbe5b01a4235eaf02132 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sat, 30 Nov 2024 13:53:49 +0100
> +Subject: [PATCH] meson.build: fix keyring check
> +
> +The check for enable_pam_keyinit fails with -1
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Pending []
> +---
> + meson.build | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 2be21282..444e626c 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -198,7 +198,16 @@ foreach ident: check_functions
> +   endif
> + endforeach
> +
> +-enable_pam_keyinit = cc.sizeof('__NR_keyctl', prefix: '#include <sys/syscall.h>') > 0
> ++enable_pam_keyinit = \
> ++    cc.compiles('''
> ++    #include <errno.h>
> ++    #include <asm/unistd.h>
> ++    #include <linux/keyctl.h>
> ++    #include <sys/syscall.h>
> ++    #include <unistd.h>
> ++    int main(void) {
> ++        return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
> ++    }''')
> +
> + if get_option('mailspool') != ''
> +   cdata.set_quoted('PAM_PATH_MAILDIR', get_option('mailspool'))
> +--
> +2.47.0
> +
> diff --git a/meta/recipes-extended/pam/libpam/99_pam b/meta/recipes-extended/pam/files/99_pam
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/99_pam
> rename to meta/recipes-extended/pam/files/99_pam
> diff --git a/meta/recipes-extended/pam/libpam/libpam-xtests.patch b/meta/recipes-extended/pam/files/libpam-xtests.patch
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/libpam-xtests.patch
> rename to meta/recipes-extended/pam/files/libpam-xtests.patch
> diff --git a/meta/recipes-extended/pam/libpam/pam-volatiles.conf b/meta/recipes-extended/pam/files/pam-volatiles.conf
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/pam-volatiles.conf
> rename to meta/recipes-extended/pam/files/pam-volatiles.conf
> diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-account b/meta/recipes-extended/pam/files/pam.d/common-account
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/pam.d/common-account
> rename to meta/recipes-extended/pam/files/pam.d/common-account
> diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-auth b/meta/recipes-extended/pam/files/pam.d/common-auth
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/pam.d/common-auth
> rename to meta/recipes-extended/pam/files/pam.d/common-auth
> diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-password b/meta/recipes-extended/pam/files/pam.d/common-password
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/pam.d/common-password
> rename to meta/recipes-extended/pam/files/pam.d/common-password
> diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-session b/meta/recipes-extended/pam/files/pam.d/common-session
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/pam.d/common-session
> rename to meta/recipes-extended/pam/files/pam.d/common-session
> diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-session-noninteractive b/meta/recipes-extended/pam/files/pam.d/common-session-noninteractive
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/pam.d/common-session-noninteractive
> rename to meta/recipes-extended/pam/files/pam.d/common-session-noninteractive
> diff --git a/meta/recipes-extended/pam/libpam/pam.d/other b/meta/recipes-extended/pam/files/pam.d/other
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/pam.d/other
> rename to meta/recipes-extended/pam/files/pam.d/other
> diff --git a/meta/recipes-extended/pam/libpam/run-ptest b/meta/recipes-extended/pam/files/run-ptest
> similarity index 100%
> rename from meta/recipes-extended/pam/libpam/run-ptest
> rename to meta/recipes-extended/pam/files/run-ptest
> diff --git a/meta/recipes-extended/pam/libpam-modules.bb b/meta/recipes-extended/pam/libpam-modules.bb
> new file mode 100644
> index 0000000000..7903c6d6f8
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam-modules.bb
> @@ -0,0 +1,110 @@
> +require libpam.inc
> +
> +PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +
> +PACKAGES += "libpam-runtime"
> +
> +FILES:${PN} = " \
> +    ${nonarch_libdir}/tmpfiles.d/*.conf \
> +"
> +FILES:${PN}-dev += "${nonarch_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
> +FILES:libpam-runtime = "${sysconfdir} ${sbindir} ${systemd_system_unitdir}"
> +
> +# libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
> +# packaged with the pam-plugin-env package to avoid breaking installations which
> +# install that file via other packages
> +FILES:pam-plugin-env = "${sysconfdir}/environment"
> +
> +PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
> +
> +def get_multilib_bit(d):
> +    baselib = d.getVar('baselib') or ''
> +    return baselib.replace('lib', '')
> +
> +libpam_suffix = "suffix${@get_multilib_bit(d)}"
> +
> +RPROVIDES:${PN} += "libpam-modules-${libpam_suffix} libpam-runtime"
> +RPROVIDES:libpam-runtime += "libpam-runtime-${libpam_suffix}"
> +
> +RDEPENDS:libpam-runtime = "${MLPREFIX}libpam libpam-modules-${libpam_suffix} \
> +    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
> +    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
> +    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
> +    ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
> +    "
> +
> +# FIXME: Native suffix breaks here, disable it for now
> +RDEPENDS:${MLPREFIX}${PN} += "${MLPREFIX}libpam libpam-runtime-${libpam_suffix}"
> +RDEPENDS:${MLPREFIX}pam-filter-upperlower += "${MLPREFIX}libpam"
> +RRECOMMENDS:${PN}:class-native += ""
> +
> +python populate_packages:prepend () {
> +    def pam_plugin_hook(file, pkg, pattern, format, basename):
> +        pn = d.getVar('PN')
> +        libpam_suffix = d.getVar('libpam_suffix')
> +
> +        rdeps = "${MLPREFIX}libpam"
> +        if rdeps:
> +            rdeps = rdeps + " " + pn + "-" + libpam_suffix
> +        else:
> +            rdeps = pn + "-" + libpam_suffix
> +        d.setVar('RDEPENDS:' + pkg, rdeps)
> +
> +        provides = d.getVar('RPROVIDES:' + pkg)
> +        if provides:
> +            provides = provides + " " + pkg + "-" + libpam_suffix
> +        else:
> +            provides = pkg + "-" + libpam_suffix
> +        d.setVar('RPROVIDES:' + pkg, provides)
> +
> +    mlprefix = d.getVar('MLPREFIX') or ''
> +    dvar = d.expand('${WORKDIR}/package')
> +    pam_libdir = d.expand('${nonarch_libdir}/security')
> +    pam_sbindir = d.expand('${sbindir}')
> +    pam_filterdir = d.expand('${nonarch_libdir}/security/pam_filter')
> +    pam_pkgname = mlprefix + 'pam-plugin%s'
> +
> +    do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
> +                      'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='', prepend=True)
> +    do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
> +}
> +
> +do_install:append() {
> +
> +       rm -rf ${D}${includedir}/security ${D}${libdir}/pkgconfig ${D}${libdir}/*.so*
> +
> +        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)}; then
> +            install -d ${D}${nonarch_libdir}/tmpfiles.d
> +            install -m 0644 ${UNPACKDIR}/pam-volatiles.conf \
> +                    ${D}${nonarch_libdir}/tmpfiles.d/pam.conf
> +        else
> +            install -d ${D}${sysconfdir}/default/volatiles
> +            install -m 0644 ${UNPACKDIR}/99_pam \
> +                    ${D}${sysconfdir}/default/volatiles/
> +        fi
> +
> +       install -d ${D}${sysconfdir}/pam.d/
> +       install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
> +
> +       # The lsb requires unix_chkpwd has setuid permission
> +       chmod 4755 ${D}${sbindir}/unix_chkpwd
> +
> +       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +               echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
> +       fi
> +}
> +
> +pkg_postinst:${PN}() {
> +         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> +                 /etc/init.d/populate-volatile.sh update
> +         fi
> +}
> +
> +BBCLASSEXTEND = "nativesdk native"
> +
> +CONFFILES:libpam-runtime += "${sysconfdir}/pam.d/common-session"
> +CONFFILES:libpam-runtime += "${sysconfdir}/pam.d/common-auth"
> +CONFFILES:libpam-runtime += "${sysconfdir}/pam.d/common-password"
> +CONFFILES:libpam-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
> +CONFFILES:libpam-runtime += "${sysconfdir}/pam.d/common-account"
> +CONFFILES:libpam-runtime += "${sysconfdir}/security/limits.conf"
> diff --git a/meta/recipes-extended/pam/libpam.bb b/meta/recipes-extended/pam/libpam.bb
> new file mode 100644
> index 0000000000..781595ac72
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam.bb
> @@ -0,0 +1,16 @@
> +require libpam.inc
> +
> +do_install() {
> +       install -d ${D}${libdir}/pkgconfig ${D}${includedir}/security
> +       for file in ${B}/libpam/libpam.so* ${B}/libpamc/libpamc.so* ${B}/libpam_misc/libpam_misc.so*; do
> +               if ! [ -d "$file" ]; then
> +                       cp -fd "$file" ${D}${libdir}
> +               fi
> +       done
> +       for file in ${S}/libpam/include/security/*.h ${S}/libpamc/include/security/*.h ${S}/libpam_misc/include/security/*.h; do
> +               install -m644 "$file" ${D}${includedir}/security
> +       done
> +       cp ${B}/meson-private/*.pc ${D}${nonarch_libdir}/pkgconfig
> +}
> +
> +BBCLASSEXTEND += "native nativesdk"
> diff --git a/meta/recipes-extended/pam/libpam.inc b/meta/recipes-extended/pam/libpam.inc
> new file mode 100644
> index 0000000000..bb6776dcca
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam.inc
> @@ -0,0 +1,56 @@
> +DISABLE_STATIC = ""
> +SUMMARY = "Linux-PAM (Pluggable Authentication Modules)"
> +DESCRIPTION = "Linux-PAM (Pluggable Authentication Modules for Linux), a flexible mechanism for authenticating users"
> +HOMEPAGE = "https://fedorahosted.org/linux-pam/"
> +BUGTRACKER = "https://fedorahosted.org/linux-pam/newticket"
> +SECTION = "base"
> +# PAM is dual licensed under GPL and BSD.
> +# /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
> +# libpam-runtime-1.0.1 is GPL-2.0-or-later), by openembedded
> +LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
> +                    file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
> +                    "
> +
> +SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
> +           file://99_pam \
> +           file://pam.d/common-account \
> +           file://pam.d/common-auth \
> +           file://pam.d/common-password \
> +           file://pam.d/common-session \
> +           file://pam.d/common-session-noninteractive \
> +           file://pam.d/other \
> +           file://libpam-xtests.patch;apply=no \
> +           file://run-ptest \
> +           file://pam-volatiles.conf \
> +           file://0001-meson.build-fix-keyring-check.patch \
> +           "
> +
> +SRC_URI[sha256sum] = "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59661cdae9b13b1697"
> +PV = "1.7.0"
> +
> +DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
> +
> +EXTRA_OEMESON = " \
> +                -Dsystemdunitdir=${systemd_system_unitdir} \
> +                -Dnis=disabled \
> +                -Ddocs=disabled \
> +"
> +
> +S = "${WORKDIR}/Linux-PAM-${PV}"
> +
> +inherit meson gettext pkgconfig github-releases features_check
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[systemd] = "-Dlogind=enabled,-Dlogind=disabled,systemd"
> +PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit"
> +PACKAGECONFIG[userdb] = "-Ddb=db,-Dpam_userdb=disabled,db"
> +PACKAGECONFIG[xtests] = "-Dxtests=true,-Dxtests=false"
> +PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
> +PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
> +
> +REQUIRED_DISTRO_FEATURES:class-target = "pam"
> +
> +GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
> +
> +CVE_PRODUCT = "linux-pam"
> diff --git a/meta/recipes-extended/pam/libpam_1.6.1.bb b/meta/recipes-extended/pam/libpam_1.6.1.bb
> deleted file mode 100644
> index a48f78187b..0000000000
> --- a/meta/recipes-extended/pam/libpam_1.6.1.bb
> +++ /dev/null
> @@ -1,190 +0,0 @@
> -DISABLE_STATIC = ""
> -SUMMARY = "Linux-PAM (Pluggable Authentication Modules)"
> -DESCRIPTION = "Linux-PAM (Pluggable Authentication Modules for Linux), a flexible mechanism for authenticating users"
> -HOMEPAGE = "https://fedorahosted.org/linux-pam/"
> -BUGTRACKER = "https://fedorahosted.org/linux-pam/newticket"
> -SECTION = "base"
> -# PAM is dual licensed under GPL and BSD.
> -# /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time
> -# libpam-runtime-1.0.1 is GPL-2.0-or-later), by openembedded
> -LICENSE = "GPL-2.0-or-later | BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3 \
> -                    file://libpamc/License;md5=a4da476a14c093fdc73be3c3c9ba8fb3 \
> -                    "
> -
> -SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
> -           file://99_pam \
> -           file://pam.d/common-account \
> -           file://pam.d/common-auth \
> -           file://pam.d/common-password \
> -           file://pam.d/common-session \
> -           file://pam.d/common-session-noninteractive \
> -           file://pam.d/other \
> -           file://libpam-xtests.patch \
> -           file://run-ptest \
> -           file://pam-volatiles.conf \
> -           "
> -
> -SRC_URI[sha256sum] = "f8923c740159052d719dbfc2a2f81942d68dd34fcaf61c706a02c9b80feeef8e"
> -
> -DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
> -
> -EXTRA_OECONF = "--includedir=${includedir}/security \
> -                --libdir=${base_libdir} \
> -                --with-systemdunitdir=${systemd_system_unitdir} \
> -                --disable-nis \
> -                --disable-regenerate-docu \
> -                --disable-doc \
> -               --disable-prelude"
> -
> -CFLAGS += "-fPIC "
> -
> -S = "${WORKDIR}/Linux-PAM-${PV}"
> -
> -inherit autotools gettext pkgconfig systemd ptest github-releases
> -
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
> -PACKAGECONFIG[userdb] = "--enable-db=db,--enable-db=no,db,"
> -
> -PACKAGES += "${PN}-runtime ${PN}-xtests"
> -FILES:${PN} = " \
> -    ${base_libdir}/lib*${SOLIBS} \
> -    ${nonarch_libdir}/tmpfiles.d/*.conf \
> -"
> -FILES:${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
> -FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${systemd_system_unitdir}"
> -FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
> -
> -# libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
> -# packaged with the pam-plugin-env package to avoid breaking installations which
> -# install that file via other packages
> -FILES:pam-plugin-env = "${sysconfdir}/environment"
> -
> -PACKAGES_DYNAMIC += "^${MLPREFIX}pam-plugin-.*"
> -
> -def get_multilib_bit(d):
> -    baselib = d.getVar('baselib') or ''
> -    return baselib.replace('lib', '')
> -
> -libpam_suffix = "suffix${@get_multilib_bit(d)}"
> -
> -RPROVIDES:${PN} += "${PN}-${libpam_suffix}"
> -RPROVIDES:${PN}-runtime += "${PN}-runtime-${libpam_suffix}"
> -
> -RDEPENDS:${PN}-runtime = "${PN}-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
> -    "
> -RDEPENDS:${PN}-xtests = "${PN}-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-access-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-debug-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-pwhistory-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-succeed-if-${libpam_suffix} \
> -    ${MLPREFIX}pam-plugin-time-${libpam_suffix} \
> -    bash coreutils"
> -
> -# FIXME: Native suffix breaks here, disable it for now
> -RRECOMMENDS:${PN} = "${PN}-runtime-${libpam_suffix}"
> -RRECOMMENDS:${PN}:class-native = ""
> -
> -python populate_packages:prepend () {
> -    def pam_plugin_hook(file, pkg, pattern, format, basename):
> -        pn = d.getVar('PN')
> -        libpam_suffix = d.getVar('libpam_suffix')
> -
> -        rdeps = d.getVar('RDEPENDS:' + pkg)
> -        if rdeps:
> -            rdeps = rdeps + " " + pn + "-" + libpam_suffix
> -        else:
> -            rdeps = pn + "-" + libpam_suffix
> -        d.setVar('RDEPENDS:' + pkg, rdeps)
> -
> -        provides = d.getVar('RPROVIDES:' + pkg)
> -        if provides:
> -            provides = provides + " " + pkg + "-" + libpam_suffix
> -        else:
> -            provides = pkg + "-" + libpam_suffix
> -        d.setVar('RPROVIDES:' + pkg, provides)
> -
> -    mlprefix = d.getVar('MLPREFIX') or ''
> -    dvar = d.expand('${WORKDIR}/package')
> -    pam_libdir = d.expand('${base_libdir}/security')
> -    pam_sbindir = d.expand('${sbindir}')
> -    pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
> -    pam_pkgname = mlprefix + 'pam-plugin%s'
> -
> -    do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
> -                      'PAM plugin for %s', hook=pam_plugin_hook, extra_depends='', prepend=True)
> -    do_split_packages(d, pam_filterdir, r'^(.*)$', 'pam-filter-%s', 'PAM filter for %s', extra_depends='')
> -}
> -
> -do_compile_ptest() {
> -        cd tests
> -        sed -i -e 's/$(MAKE) $(AM_MAKEFLAGS) check-TESTS//' Makefile
> -        oe_runmake check-am
> -        cd -
> -}
> -
> -do_install() {
> -       autotools_do_install
> -
> -       # don't install /var/run when populating rootfs. Do it through volatile
> -       rm -rf ${D}${localstatedir}
> -
> -        if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)}; then
> -            rm -rf ${D}${sysconfdir}/init.d/
> -            rm -rf ${D}${sysconfdir}/rc*
> -            install -d ${D}${nonarch_libdir}/tmpfiles.d
> -            install -m 0644 ${UNPACKDIR}/pam-volatiles.conf \
> -                    ${D}${nonarch_libdir}/tmpfiles.d/pam.conf
> -        else
> -            install -d ${D}${sysconfdir}/default/volatiles
> -            install -m 0644 ${UNPACKDIR}/99_pam \
> -                    ${D}${sysconfdir}/default/volatiles/
> -        fi
> -
> -       install -d ${D}${sysconfdir}/pam.d/
> -       install -m 0644 ${UNPACKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
> -
> -       # The lsb requires unix_chkpwd has setuid permission
> -       chmod 4755 ${D}${sbindir}/unix_chkpwd
> -
> -       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -               echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
> -       fi
> -       if [ "${base_libdir}" != "${libdir}" ]; then
> -               install -d ${D}/${libdir}/
> -               mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
> -       fi
> -}
> -
> -do_install_ptest() {
> -    mkdir -p ${D}${PTEST_PATH}/tests
> -    install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
> -    install -m 0644 ${S}/tests/confdir ${D}${PTEST_PATH}/tests
> -}
> -
> -pkg_postinst:${PN}() {
> -         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> -                 /etc/init.d/populate-volatile.sh update
> -         fi
> -}
> -
> -inherit features_check
> -ANY_OF_DISTRO_FEATURES = "pam systemd"
> -
> -BBCLASSEXTEND = "nativesdk native"
> -
> -CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-session"
> -CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-auth"
> -CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-password"
> -CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
> -CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-account"
> -CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
> -
> -GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
> -
> -CVE_PRODUCT = "linux-pam"
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208137): https://lists.openembedded.org/g/openembedded-core/message/208137
> Mute This Topic: https://lists.openembedded.org/mt/109877521/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

