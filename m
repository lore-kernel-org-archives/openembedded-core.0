Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFEFC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:24:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.7809.1639146270573824333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=A9ZombVJ;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso9147421wms.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+9X7R9Z70zv+ioSxjGmdiIaXCl1uU7Hn5Pg1DkqvxUs=;
        b=A9ZombVJ9MsriTEjzkCdj+zNl7yqKvouYo1A1nAntDrudOFwnT83pNrhYsQQavR7Qu
         U3HYi13vqL/bIRM7015KoNEP+J/AS1a6WwMrZ+a/6PPjDkxnsPE2tRANWQ/G4dxzq2yt
         pat7QriEvQ0Bn74Q9En6loC7c2EdTUTnORyHKc2vYZy9rTYp0zPUCkDveTJquwwUGWfn
         OfVSMBIZq/Lv0wdN/BiDhc3Jy66zI8rgvWINw9OfotVrt1Wo/rTYh3ZBRRbJi3ZzLCOL
         JZMnVq/30wlhicXKSdknSsnWX0HlwA0JxTZN2IOmKNjK546U0AfKssvL9zM88z5O1Uo2
         0cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+9X7R9Z70zv+ioSxjGmdiIaXCl1uU7Hn5Pg1DkqvxUs=;
        b=KSclUhoJ+XYVHZxvuXGKlpacIyir8LjdtTo5AIvbb42b5fr1ZIKPT65Opb6E1qxQi1
         JT6IlrYLVV8aTySCBZ7k8BaWvRqXdLVeCknCK24SzLOQqJCiA58d3D+7zbRFVSeBOh+1
         nEgyc5y5MAHiulXEZMcbrroUhJFYRVz3EtV4JkrxVQ9Uz6n1Bxe5//ZbKbKKXonZLwAK
         R0DeyG2WvkWZOPW1AVrPMJTkWWdqZSQloDHVYs4l0VQGEwVjRJMFujoyuazk3yvS6HMB
         A2EK6dI7DKi6UQ+BmX+qV8fKVZ8mXEZmFaH4nMpPBNi9P0v6JIPEx/9coGwcGCc0s48X
         POvw==
X-Gm-Message-State: AOAM531l6WBIH0QgEUDhr21YCpgBZl6PvOH1iknEvZKjLF0yj/qlHqNf
	CbIK7kVcRJKlTd0VsqCmYzxZp/835Mxk4Hk7Z1mKtg==
X-Google-Smtp-Source: 
 ABdhPJzEjao6OOas14Q32FEGzhiSr5pKN3DNZQxJmA6+gKZ3xNr7NqNbG2vppcuh2uWL1FWHSi8ldxHsC+3VcTQDWSU=
X-Received: by 2002:a1c:488:: with SMTP id 130mr16990942wme.157.1639146268675;
 Fri, 10 Dec 2021 06:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20211210142242.2698587-1-ross.burton@arm.com>
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 10 Dec 2021 14:24:17 +0000
Message-ID: 
 <CAAnfSTvJRHAQcbcOOQ5X7Xe2a4awovRPSEvHEuEefunJ4A3MJQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 01/10] libtool: don't prefix the installed
 binary
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:24:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159538

Note that meta-oe-contrib:ross/libtool contains the patches needed to
get this working against meta-oe, as far as I can tell in my testing.

Ross

On Fri, 10 Dec 2021 at 14:22, Ross Burton via lists.openembedded.org
<ross=burtonini.com@lists.openembedded.org> wrote:
>
> Typically libtool installs the binary to 'libtool' in the source tree,
> but we've got patches to rename this to ${host_sys}-libtool. As this
> isn't standard any upstream that don't respect the LIBTOOL variable need
> to be told explicitly where libtool is, which is a long-term maintenance
> burden for us on top of the initial libtool patches.
>
> The reasoning for this renaming appears to stem from the design to be
> sure that we're using our new/patched libtool and not the host's binary.
> However, now that we have HOSTTOOLS, there's no way to run the host
> libtool so this argument is moot.
>
> This patch removes the libtool renaming, follow-up patches remove the
> required modifications from the rest of the recipes.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../libtool/libtool-cross_2.4.6.bb            | 11 ++-
>  .../libtool/libtool-native_2.4.6.bb           |  4 +-
>  .../libtool/libtool/prefix.patch              | 98 -------------------
>  .../libtool/nativesdk-libtool_2.4.6.bb        |  6 +-
>  4 files changed, 11 insertions(+), 108 deletions(-)
>  delete mode 100644 meta/recipes-devtools/libtool/libtool/prefix.patch
>
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> index 4a43867b3ec..4448373afc4 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
> @@ -1,7 +1,7 @@
>  require libtool-${PV}.inc
>
>  PACKAGES = ""
> -SRC_URI += "file://prefix.patch"
> +#SRC_URI += "file://prefix.patch"
>  SRC_URI += "file://fixinstall.patch"
>
>  datadir = "${STAGING_DIR_TARGET}${target_datadir}"
> @@ -22,15 +22,16 @@ do_configure:prepend () {
>  # Find references to LTCC="ccache xxx-gcc" and CC="ccache xxx-gcc"
>  #
>  do_install () {
> +       ln -s false ${D}
>         install -d ${D}${bindir_crossscripts}/
> -       install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> +       install -m 0755 libtool ${D}${bindir_crossscripts}/libtool
>         sed -e 's@^\(predep_objects="\).*@\1"@' \
>             -e 's@^\(postdep_objects="\).*@\1"@' \
>             -e 's@^CC="ccache.@CC="@' \
>             -e 's@^LTCC="ccache.@LTCC="@' \
> -           -i ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> -       sed -i '/^archive_cmds=/s/\-nostdlib//g' ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> -       sed -i '/^archive_expsym_cmds=/s/\-nostdlib//g' ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
> +           -i ${D}${bindir_crossscripts}/libtool
> +       sed -i '/^archive_cmds=/s/\-nostdlib//g' ${D}${bindir_crossscripts}/libtool
> +       sed -i '/^archive_expsym_cmds=/s/\-nostdlib//g' ${D}${bindir_crossscripts}/libtool
>         GREP='/bin/grep' SED='sed' ${S}/build-aux/inline-source libtoolize > ${D}${bindir_crossscripts}/libtoolize
>         chmod 0755 ${D}${bindir_crossscripts}/libtoolize
>         install -d ${D}${target_datadir}/libtool/build-aux/
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> index 3b20ce3e69f..c68527f2609 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
> @@ -2,7 +2,7 @@ require libtool-${PV}.inc
>
>  DEPENDS = ""
>
> -SRC_URI += "file://prefix.patch"
> +#SRC_URI += "file://prefix.patch"
>
>  inherit native
>
> @@ -18,5 +18,5 @@ do_configure:prepend () {
>  do_install () {
>         autotools_do_install
>         install -d ${D}${bindir}/
> -       install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
> +       install -m 0755 libtool ${D}${bindir}/libtool
>  }
> diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/recipes-devtools/libtool/libtool/prefix.patch
> deleted file mode 100644
> index a73df2e4a7a..00000000000
> --- a/meta/recipes-devtools/libtool/libtool/prefix.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Renames "libtool" -> "${TARGET_PREFIX}libtool" which makes sure
> -it can't be confused with the host libtool.
> -
> -Originally by: RP
> -
> -Updated: Date: 2010/06/28
> -Nitin A Kamble <nitin.a.kamble@intel.com>
> -
> -It also adjusts libtool so that the header at the script is used for
> -script execution and not thevalue of $SHELL. This is because many
> -Makefiles change $SHELL so dash can get used to execute what is
> -otherwise configured as a bash shell script. Since we don't need to
> -execute scipts this way on any system I'm aware of us building upon,
> -the simplest fix is just to remove $SHELL.
> -
> -Updated: Date: 2011/11/09
> -RP
> -
> -Updated by: Robert Yang <liezhi.yang@windriver.com>
> -
> -diff --git a/Makefile.am b/Makefile.am
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -31,7 +31,7 @@ SUBDIRS                      = .
> - DIST_SUBDIRS          = $(SUBDIRS)
> - EXTRA_DIST            =
> -
> --BUILT_SOURCES         = libtool libtoolize
> -+BUILT_SOURCES         = $(host_alias)-libtool libtoolize
> -
> - CLEANFILES            =
> - MOSTLYCLEANFILES      =
> -@@ -67,7 +67,7 @@ build_scripts        = $(srcdir)/$(aux_dir)/announce-gen \
> -
> - EXTRA_DIST     += bootstrap bootstrap.conf $(build_scripts) cfg.mk maint.mk \
> -                 GNUmakefile
> --CLEANFILES     += libtool libtoolize
> -+CLEANFILES     += $(host_alias)-libtool libtoolize
> -
> - ## If a file is named several times below, and especially if it
> - ## is a distributed file created during Libtool bootstrap, we
> -@@ -276,7 +276,7 @@ configure_edit = $(bootstrap_edit) \
> -       -e 's|@srcdir\@|$(srcdir)|g'
> -
> - # The libtool distributor and the standalone libtool script.
> --bin_SCRIPTS = libtool
> -+bin_SCRIPTS = $(host_alias)-libtool
> -
> - libtoolize: $(libtoolize_in) $(config_status)
> -       $(AM_V_at)rm -f '$@'
> -@@ -287,7 +287,7 @@ libtoolize: $(libtoolize_in) $(config_status)
> - # We used to do this with a 'stamp-vcl' file, but non-gmake builds
> - # would rerun configure on every invocation, so now we manually
> - # check the version numbers from the build rule when necessary.
> --libtool: $(ltmain_sh) $(config_status) $(dotversion)
> -+$(host_alias)-libtool: $(ltmain_sh) $(config_status) $(dotversion)
> -       @$(rebuild); \
> -       if test -f '$@'; then \
> -         eval `'$(SED)' -n '/^package_revision=/p' '$@'`; \
> -@@ -731,12 +731,12 @@ TESTS_ENVIRONMENT = MAKE="$(MAKE)" CC="$(CC)" CFLAGS="$(CFLAGS)" \
> -
> - BUILDCHECK_ENVIRONMENT = _lt_pkgdatadir="$(abs_top_srcdir)" \
> -       LIBTOOLIZE="$(abs_top_builddir)/libtoolize" \
> --      LIBTOOL="$(abs_top_builddir)/libtool" \
> -+      LIBTOOL="$(abs_top_builddir)/$(host_alias)-libtool" \
> -       tst_aclocaldir="$(abs_top_srcdir)/m4"
> -
> - INSTALLCHECK_ENVIRONMENT = \
> -       LIBTOOLIZE="$(bindir)/`echo libtoolize |$(SED) '$(program_transform_name)'`" \
> --      LIBTOOL="$(bindir)/`echo libtool |$(SED) '$(program_transform_name)'`" \
> -+      LIBTOOL="$(bindir)/`echo $(host_alias)-libtool |$(SED) '$(program_transform_name)'`" \
> -       LTDLINCL="-I$(includedir)" \
> -       LIBLTDL="$(libdir)/libltdl.la" \
> -       tst_aclocaldir="$(aclocaldir)"
> -diff --git a/m4/libtool.m4 b/m4/libtool.m4
> ---- a/m4/libtool.m4
> -+++ b/m4/libtool.m4
> -@@ -86,7 +86,8 @@ _LT_SET_OPTIONS([$0], [$1])
> - LIBTOOL_DEPS=$ltmain
> -
> - # Always use our own libtool.
> --LIBTOOL='$(SHELL) $(top_builddir)/libtool'
> -+LIBTOOL='$(top_builddir)'
> -+LIBTOOL="$LIBTOOL/${host_alias}-libtool"
> - AC_SUBST(LIBTOOL)dnl
> -
> - _LT_SETUP
> -@@ -199,7 +200,7 @@ aix3*)
> - esac
> -
> - # Global variables:
> --ofile=libtool
> -+ofile=${host_alias}-libtool
> - can_build_shared=yes
> -
> - # All known linkers require a '.a' archive for static linking (except MSVC,
> diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> index e3ad6721fdf..cede2092db0 100644
> --- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> +++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
> @@ -2,7 +2,7 @@ require libtool-${PV}.inc
>
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
>
> -SRC_URI += "file://prefix.patch"
> +#SRC_URI += "file://prefix.patch"
>  SRC_URI += "file://fixinstall.patch"
>
>  inherit nativesdk
> @@ -20,12 +20,12 @@ do_configure:prepend () {
>  do_install () {
>         autotools_do_install
>         install -d ${D}${bindir}/
> -       install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/
> +       install -m 0755 libtool ${D}${bindir}/
>  }
>
>  SYSROOT_PREPROCESS_FUNCS += "libtoolnativesdk_sysroot_preprocess"
>
>  libtoolnativesdk_sysroot_preprocess () {
>         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> -       install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${bindir_crossscripts}/${HOST_SYS}-libtool
> +       install -m 755 ${D}${bindir}/libtool ${SYSROOT_DESTDIR}${bindir_crossscripts}/libtool
>  }
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159530): https://lists.openembedded.org/g/openembedded-core/message/159530
> Mute This Topic: https://lists.openembedded.org/mt/87636630/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

