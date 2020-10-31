Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.7075.1604183462934683704
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 15:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S2etLPYu;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 63so4500139qva.7
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U7D6uOmar2JdKqZwQpoOckz74/yVfycGiOj+/CQP7aA=;
        b=S2etLPYu/FFWSuH0nJZqMLfCgNGoCosNW5SGQmC9c/udFGadjoIopK17Xr9sSR1kO3
         cKDtEOJDc3fO68e6iq656XK5v5bsMTGySPHnIPd6gDBasEIIJs5wqWI0q3iNVC4mrkRL
         diNDmnju7UTMmjmBU/OW1oug2DKEIiihWyCN4L6e603GhvhQf3IJkx8CXWiGIm+o23Q0
         jKvV9JFNBoH1zr89cCHgT932Suqjuie/4hmLadhDwVALLvIwjtRfnjYmzu+qkHzFG88G
         7F6mkiasJm0iL9tsZENFtoRJdlwqGC4gd7mjDDQoc3WCE77X3RxXmjKiskB7EaJAoSlI
         TKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7D6uOmar2JdKqZwQpoOckz74/yVfycGiOj+/CQP7aA=;
        b=rvieCHrQ3GZQOgm+phDpXvPYw0Q5CO3YYYh8MOIGhXKSq4bGY2/XV2F1FDgcMp25ww
         lDi6lPo9pCmHjAImyiRa5SbGS8We6mkBaiq/8kJ/BrQBqedoChCPUki8bCrQexCUCoxB
         EfL8Aw5qHC5UgvJqDYsHUV8Y2Yuj9rtPeCXZiJ+i3c8z0syADnIxnfJ+p0G6BCATnf4q
         B18DhYu9jVf2H+vOAegd0b5jKmqvuT4ulyo1Ah90nID9D+HvPVJbhbqreAcYYUAgBVSQ
         6utn++Pu/XUqN5PUkHDbIvNlWCrYU3zSOC1tDVCu7M6+KC5iGTckriML+Eh++zf0oGNH
         EK/A==
X-Gm-Message-State: AOAM530ge7CXZH6fW6BHSixyWcrquIjIjITsdQFrH6QlvDwN1WZUHxhd
	qVvXMMJ2In2lzT5/8zRXZFsWAeugO9QSEmdmvao=
X-Google-Smtp-Source: ABdhPJz01GFTW0lqooLY3iPBMNIw43e4E77N9r64YkHPMQIvXOw3/O/Q3C+92ovUN5jVi28lNFZBWPTY3OZvAnvEbRI=
X-Received: by 2002:a0c:ecc8:: with SMTP id o8mr4496536qvq.19.1604183461853;
 Sat, 31 Oct 2020 15:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com> <20201028210558.21070-11-alex.kanavin@gmail.com>
In-Reply-To: <20201028210558.21070-11-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 31 Oct 2020 15:30:35 -0700
Message-ID: <CAMKF1sq6EjtpkLaCFKKcXPvF0m_yDHeutLZ9rXGU2LxwSM3YiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/33] rpm: update 4.15.1 -> 4.16.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop backports.
> Drop 0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch as
> enabling compression support in libmagic finally allows us to use
> parallel file classification.
>
> Add a backported patch that fixes musl builds.
>

I am still seeing an error on x86/gold linker where symbols are
missing from libelf see
http://errors.yoctoproject.org/Errors/Details/510980/

> License-Update: formatting
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...he-limit-of-signature-header-to-64MB.patch | 62 ------------------
>  ...lib-rpm-as-the-installation-path-for.patch | 14 ++--
>  .../0001-rpmdb.c-add-a-missing-include.patch  | 25 +++++++
>  ...-run-file-classification-in-parallel.patch | 65 -------------------
>  ...lugins.c-call-dlerror-prior-to-dlsym.patch | 29 ---------
>  .../rpm/{rpm_4.15.1.bb => rpm_4.16.0.bb}      | 16 +++--
>  6 files changed, 42 insertions(+), 169 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch
>  rename meta/recipes-devtools/rpm/{rpm_4.15.1.bb => rpm_4.16.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch b/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
> deleted file mode 100644
> index 0a19c12a7a..0000000000
> --- a/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From e8bf0eba7143abb6e69db82ee747a0c6790dd00a Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Wed, 3 Jun 2020 10:25:24 +0800
> -Subject: [PATCH] Bump up the limit of signature header to 64MB
> -
> -Since commits [Place file signatures into the signature header where they
> -belong][1] applied, run `rpm -Kv **.rpm' failed if signature header
> -is larger than 64KB. Here are steps:
> -
> -1) A unsigned rpm package, the size is 227560 bytes
> -$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
> --rw-------. 1 mockbuild 1000 227560 Jun  3 09:59
> -
> -2) Sign the rpm package
> -$ rpmsign --addsign ... xz-src-5.2.5-r0.corei7_64.rpm
> -
> -3) The size of signed rpm is 312208 bytes
> -$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
> --rw-------. 1 mockbuild 1000 312208 Jun  3 09:48
> -
> -4) Run `rpm -Kv' failed with signature hdr data out of range
> -$ rpm -Kv xz-src-5.2.5-r0.corei7_64.rpm
> -xz-src-5.2.5-r0.corei7_64.rpm:
> -error: xz-src-5.2.5-r0.corei7_64.rpm: signature hdr data: BAD, no. of
> -bytes(88864) out of range
> -
> -From 1) and 3), the size of signed rpm package increased
> -312208 - 227560 = 84648, so the check of dl_max (64KB,65536)
> -is not enough.
> -
> -As [1] said:
> -
> -    This also means the signature header can be MUCH bigger than ever
> -    before,so bump up the limit (to 64MB, arbitrary something for now)
> -
> -So [1] missed to multiply by 1024.
> -
> -[1] https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c
> -
> -Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/486579912381ede82172dc6d0ff3941a6d0536b5]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - lib/header.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/header.c b/lib/header.c
> -index 9ec7ed0..cbf6890 100644
> ---- a/lib/header.c
> -+++ b/lib/header.c
> -@@ -1906,7 +1906,7 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
> -
> -     if (regionTag == RPMTAG_HEADERSIGNATURES) {
> -       il_max = 32;
> --      dl_max = 64 * 1024;
> -+      dl_max = 64 * 1024 * 1024;
> -     }
> -
> -     memset(block, 0, sizeof(block));
> ---
> -2.25.4
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> index 52440d6818..30975faeaf 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> @@ -1,4 +1,4 @@
> -From 2f3d1619b6510bc131c4375827caf912559f0fa2 Mon Sep 17 00:00:00 2001
> +From 4fd37bc9d8d0777aa038777dd81a76b64f536efd Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 27 Feb 2017 09:43:30 +0200
>  Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
> @@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index d3aeab86e..1a1f3f91f 100644
> +index 186e4aeec..5df252085 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1086,7 +1086,7 @@ else
> +@@ -944,7 +944,7 @@ else
>       usrprefix=$prefix
>   fi
>
> @@ -27,10 +27,10 @@ index d3aeab86e..1a1f3f91f 100644
>
>   AC_SUBST(OBJDUMP)
>  diff --git a/macros.in b/macros.in
> -index fe9803aad..d128675bf 100644
> +index 35c8cf9df..9d8b2825c 100644
>  --- a/macros.in
>  +++ b/macros.in
> -@@ -985,7 +985,7 @@ package or when debugging this package.\
> +@@ -996,7 +996,7 @@ package or when debugging this package.\
>   %_sharedstatedir      %{_prefix}/com
>   %_localstatedir               %{_prefix}/var
>   %_lib                 lib
> @@ -40,7 +40,7 @@ index fe9803aad..d128675bf 100644
>   %_infodir             %{_datadir}/info
>   %_mandir              %{_datadir}/man
>  diff --git a/rpm.am b/rpm.am
> -index 40b4ec55f..3139ce8f6 100644
> +index b46c6b7da..02d5c7a0a 100644
>  --- a/rpm.am
>  +++ b/rpm.am
>  @@ -1,10 +1,10 @@
> @@ -55,4 +55,4 @@ index 40b4ec55f..3139ce8f6 100644
>  +rpmconfigdir = $(libdir)/rpm
>
>   # Libtool version (current-revision-age) for all our libraries
> - rpm_version_info = 9:1:0
> + rpm_version_info = 10:0:1
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch b/meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch
> new file mode 100644
> index 0000000000..c7ae158f8d
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-rpmdb.c-add-a-missing-include.patch
> @@ -0,0 +1,25 @@
> +From 9de15c7e1f4ca23a10edb9a3b657f06b2b13e841 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 20 Oct 2020 22:16:39 +0200
> +Subject: [PATCH] rpmdb.c: add a missing include
> +
> +This addressed build failures on non-glibc systems.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + lib/rpmdb.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/lib/rpmdb.c b/lib/rpmdb.c
> +index 4c101569f..73187630b 100644
> +--- a/lib/rpmdb.c
> ++++ b/lib/rpmdb.c
> +@@ -8,6 +8,7 @@
> + #include <utime.h>
> + #include <errno.h>
> + #include <dirent.h>
> ++#include <fcntl.h>
> +
> + #ifndef       DYING   /* XXX already in "system.h" */
> + #include <fnmatch.h>
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> deleted file mode 100644
> index d8d338792d..0000000000
> --- a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 93c3c7f043f62e96941274e957c4ad9432032af1 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 18 Nov 2019 16:22:56 +0100
> -Subject: [PATCH] rpmfc.c: do not run file classification in parallel
> -
> -This is causing freezes with libmagic when the file in question is compressed:
> -https://github.com/rpm-software-management/rpm/issues/756
> -
> -Upstream-Status: Inappropriate [upstream wants a proper fix]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - build/rpmfc.c | 8 --------
> - 1 file changed, 8 deletions(-)
> -
> -diff --git a/build/rpmfc.c b/build/rpmfc.c
> -index 3db7a9352..17afdd57a 100644
> ---- a/build/rpmfc.c
> -+++ b/build/rpmfc.c
> -@@ -680,7 +680,6 @@ static void rpmfcAttributes(rpmfc fc, int ix, const char *ftype, const char *ful
> -       /* Add attributes on libmagic type & path pattern matches */
> -       if (matches(&(*attr)->incl, ftype, path, is_executable)) {
> -           argvAddTokens(&fc->fattrs[ix], (*attr)->name);
> --          #pragma omp critical(fahash)
> -           fattrHashAddEntry(fc->fahash, attr-fc->atypes, ix);
> -       }
> -     }
> -@@ -1105,7 +1104,6 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
> -     /* Build (sorted) file class dictionary. */
> -     fc->cdict = rpmstrPoolCreate();
> -
> --    #pragma omp parallel
> -     {
> -     /* libmagic is not thread-safe, each thread needs to a private handle */
> -     magic_t ms = magic_open(msflags);
> -@@ -1113,15 +1111,12 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
> -     if (ms == NULL) {
> -       rpmlog(RPMLOG_ERR, _("magic_open(0x%x) failed: %s\n"),
> -               msflags, strerror(errno));
> --      #pragma omp cancel parallel
> -     }
> -
> -     if (magic_load(ms, NULL) == -1) {
> -       rpmlog(RPMLOG_ERR, _("magic_load failed: %s\n"), magic_error(ms));
> --      #pragma omp cancel parallel
> -     }
> -
> --    #pragma omp for ordered reduction(+:nerrors)
> -     for (int ix = 0; ix < fc->nfiles; ix++) {
> -       rpmsid ftypeId;
> -       const char * ftype;
> -@@ -1185,14 +1180,11 @@ rpmRC rpmfcClassify(rpmfc fc, ARGV_t argv, rpm_mode_t * fmode)
> -       fc->fcolor[ix] = fcolor;
> -
> -       /* Add to file class dictionary and index array */
> --      #pragma omp ordered
> -       if (fcolor != RPMFC_WHITE && (fcolor & RPMFC_INCLUDE)) {
> -           ftypeId = rpmstrPoolId(fc->cdict, ftype, 1);
> --          #pragma omp atomic
> -           fc->fknown++;
> -       } else {
> -           ftypeId = rpmstrPoolId(fc->cdict, "", 1);
> --          #pragma omp atomic
> -           fc->fwhite++;
> -       }
> -       /* Pool id's start from 1, for headers we want it from 0 */
> diff --git a/meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch b/meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch
> deleted file mode 100644
> index 8842e3ebd7..0000000000
> --- a/meta/recipes-devtools/rpm/files/0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 6878a83f9bac015c64d83cee42530a20a264cc5a Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 7 Jan 2020 12:02:06 +0100
> -Subject: [PATCH] rpmplugins.c: call dlerror() prior to dlsym()
> -
> -This is the recommended way in the manpage; if there is
> -a lingering error from an unrelated dl*() call that was
> -never obtained via dlerror(), it needs to be cleared
> -prior to calling dlsym().
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/998]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - lib/rpmplugins.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/lib/rpmplugins.c b/lib/rpmplugins.c
> -index 65e684e84..b950f85cf 100644
> ---- a/lib/rpmplugins.c
> -+++ b/lib/rpmplugins.c
> -@@ -68,6 +68,8 @@ static rpmPlugin rpmPluginNew(const char *name, const char *path,
> -
> -     /* make sure the plugin has the supported hooks flag */
> -     hooks_name = rstrscat(NULL, name, "_hooks", NULL);
> -+    /* clear out any old errors that weren't fetched */
> -+    dlerror();
> -     hooks = dlsym(handle, hooks_name);
> -     if ((error = dlerror()) != NULL) {
> -       rpmlog(RPMLOG_ERR, _("Failed to resolve symbol %s: %s\n"),
> diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.16.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/rpm/rpm_4.15.1.bb
> rename to meta/recipes-devtools/rpm/rpm_4.16.0.bb
> index a1c5205554..f01874fe38 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.16.0.bb
> @@ -22,9 +22,9 @@ HOMEPAGE = "http://www.rpm.org"
>
>  # libraries are also LGPL - how to express this?
>  LICENSE = "GPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c0bf017c0fd1920e6158a333acabfd4a"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
>
> -SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
> +SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
>             file://environment.d-rpm.sh \
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
> @@ -38,14 +38,12 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
>             file://0001-perl-disable-auto-reqs.patch \
>             file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
>             file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
> -           file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
> -           file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
>             file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
> -           file://0001-Bump-up-the-limit-of-signature-header-to-64MB.patch \
> +           file://0001-rpmdb.c-add-a-missing-include.patch \
>             "
>
>  PE = "1"
> -SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
> +SRCREV = "cd7f9303ef1070f027493cad7d00bc66935af2a0"
>
>  S = "${WORKDIR}/git"
>
> @@ -55,6 +53,8 @@ DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native
>  inherit autotools gettext pkgconfig python3native
>  export PYTHON_ABI
>
> +AUTOTOOLS_AUXDIR = "${S}/build-aux"
> +
>  # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
>  EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
>
> @@ -97,6 +97,10 @@ WRAPPER_TOOLS = " \
>     ${libdir}/rpm/rpmdeps \
>  "
>
> +do_configure_prepend() {
> +        mkdir -p ${S}/build-aux
> +}
> +
>  do_install_append_class-native() {
>          for tool in ${WRAPPER_TOOLS}; do
>                  test -x ${D}$tool && create_wrapper ${D}$tool \
> --
> 2.29.0
>
>
> 
>
