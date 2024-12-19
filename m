Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED28E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 16:29:44 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.132925.1734625778598677017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 08:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CmDNsDS6;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d89a727a19so18577206d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734625777; x=1735230577; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5LmuzoTPjrUkVA4U4lmmTD27heKAda2i0TZ9qDMK+g=;
        b=CmDNsDS66O7Vl/nGAy9aI9UYvyO28tuTTRfljRDqjdcnFR2kKfTXYjJLxFhh8P29dT
         wdEgPexN0ZBcJVNqhPrDT00zhQAf7g+WRIOWTh05FMwotA+u96b/WEl8OaeOGsVY/x0S
         shZixYXsEFuGYMMqtEVDBwsZzY0HcbDmktJtAxsYwd/iIgNBO8GhtLZV27ek6FUce146
         b3NUOUccOAmaTVcqTPev3KF3ZaThfMQDhIi9cvMtegQj/sWbVGkx4Qye2lpP32bfWepq
         YV1/JZiLNOxHBb4VTVhl6k5GdO+SRzhvbVxVYmLv8ulVvNREwopaUXHddwfFKaccOFiy
         t7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734625777; x=1735230577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5LmuzoTPjrUkVA4U4lmmTD27heKAda2i0TZ9qDMK+g=;
        b=ofV9UlVwU2qGSMlwjUaFFS/Hu/Cq2aw6Ho6hCwHFNGB3RHc3TSskVZ3yjFFvrcmV6d
         ua0kd0L4rAUAQzXxT9wChMYr88dpmmPEP9mTdmDUqEhgjEa08u2HZ/PfYTBVEGbkYQz+
         piOYYnNdHwQLXDDoEBP/iovwG5i0PhJdeZXRoXsTWLF23KU73Z6xlLw7zYevdWUAySXA
         YE9VRHUpQWwjS3P4XtLl/bVvD77+qRLVh5y9ldmRK/y2GcvzgOBbW48ivP2OLutebxL4
         bVkr8fif6QFlSrQEPGEo7TTUo48NxBvRSotryduMc7NLicOzqUkEBTF++H+rAeGR7b48
         DwPg==
X-Gm-Message-State: AOJu0Yw4Z0E4xagCw8+GNpD06y25yheXem9HjPBf6Ge3yV6rl2OErXPo
	da/DYWmpKyH8r4hwwpTdnu4V/ePWSNiC9q+jVUx1TRhysdQM3DfpVBZJNFI4JMisaGD/9fIrIwZ
	G495gfnQaCGs6bw/VXyZKu6l1BD8=
X-Gm-Gg: ASbGncukVkgUJ6kYrhM0cB7+UECPhkNX07OL0zMWRBUde9Fizxayg7flu4m6DzDb8i9
	poFg7A/jvLYAdV12EIl+dHorHLJ9JpgI3qbtpuVDfweG4LXo3CIKAjzYSsHVTQQoAWy2EmW1a
X-Google-Smtp-Source: AGHT+IE1jWcRInqPtHyuUglOGRg8rFgqJcKmwX+7UGUYUX7ow7FOj7yk4vgoF2j2BAy6Mf8/K+8wYIfpE1m4rJE2/Ms=
X-Received: by 2002:a05:6214:5bc1:b0:6d8:98a0:23b6 with SMTP id
 6a1803df08f44-6dd15546325mr67738486d6.4.1734625777356; Thu, 19 Dec 2024
 08:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20241219144255.3366730-1-tgamblin@baylibre.com>
In-Reply-To: <20241219144255.3366730-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Dec 2024 17:29:26 +0100
Message-ID: <CANNYZj_0CBdCpCxcTfUUjRy+AHfN=gn-dxG-PvoFDpTYdnJSQg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: upgrade 3.13.0 -> 3.13.1
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 16:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208923

Hello,

with this update on top of master, I'm getting the following when
building core-image-full-cmdline (core-image-minimal builds fine). Can
you check please?

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Could not invoke dnf.
Command '/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/co=
re-image-full-cmdline/1.0/recipe-sysroot-native/usr/bin/dnf
-v --rpmverbosity=3Dinfo -y -c
/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-linux/core-image-=
full-cmdline/1.0/rootfs/etc/dnf/dnf.conf
--setopt=3Dreposdir=3D/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-=
poky-linux/core-image-full-cmdline/1.0/rootfs/etc/yum.repos.d
--installroot=3D/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-poky-l=
inux/core-image-full-cmdline/1.0/rootfs
--setopt=3Dlogdir=3D/srv/storage/alex/yocto/build-64/tmp/work/qemux86_64-po=
ky-linux/core-image-full-cmdline/1.0/temp
--repofrompath=3Doe-repo,/srv/storage/alex/yocto/build-64/tmp/work/qemux86_=
64-poky-linux/core-image-full-cmdline/1.0/oe-rootfs-repo
repoquery --installed --queryformat Package: %{name} %{arch}
%{version} %{name}-%{version}-%{release}.%{arch}.rpm
Dependencies:
%{requires}
Recommendations:
%{recommends}
DependenciesEndHere:
' returned -11:


Alex

On Thu, 19 Dec 2024 at 15:43, Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-=
1-final
>
> - Patch 'fix-armv5.patch' is in 3.13.1, so no longer needed:
>
> |tgamblin@megalith ~/workspace/git/pythonsrc/cpython ((HEAD detached from=
 v3.13.1))$ git tag --contains 18b9079ddbc149d6b99c922630c246812e4d8ae7
> |v3.13.1
>
> - While patch 'crosspythonpath.patch' is listed as 'Inappropriate
>   [OE-Core integration specific]' specific in the commit message, it is
>   now breaking the build, while removing it allows python3 to build OK.
>   It appears that there is a similar change in upstream 3.13.1:
>
>   https://github.com/python/cpython/commit/909d5ac2959e
>
> - gcc-symlinks had to be added to ptest RDEPENDS so that 'gcc' could be
>   found on the path for the
>   test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym test.
>
> - Also reformat the DEPENDS and RDEPENDS lists to be alphabetical
>   and one-per-line, since that's easier to read and modify.
>
> - buildall-qemu output:
>
> |BUILDALL-QEMU LOG FOR python3
> |START TIME: 2024-12-18_20:38:01
> |HOSTNAME: megalith
> |HOST OS: Debian GNU/Linux 12 (bookworm)
> |HOST KERNEL: 6.1.0-28-amd64
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |BUILD RESULTS:
> |[glibc]
> |FAIL: qemuloongarch64
> |PASS: qemuriscv32
> |PASS: qemuarmv5
> |PASS: qemuppc
> |PASS: qemumips64
> |PASS: qemuriscv64
> |PASS: qemuarm64
> |PASS: qemuarm
> |PASS: qemux86-64
> |PASS: qemuppc64
> |PASS: qemux86
> |PASS: qemumips
> |[musl]
> |FAIL: qemuloongarch64
> |FAIL: qemuriscv32
> |PASS: qemuarmv5
> |PASS: qemuppc
> |PASS: qemumips64
> |PASS: qemuriscv64
> |PASS: qemuarm64
> |PASS: qemuarm
> |PASS: qemux86-64
> |PASS: qemuppc64
> |PASS: qemux86
> |PASS: qemumips
> |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> |PASSED: 21
> |FAILED: 3
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../python/python3/crosspythonpath.patch      | 33 ----------
>  .../python/python3/fix-armv5.patch            | 65 -------------------
>  .../{python3_3.13.0.bb =3D> python3_3.13.1.bb}  | 58 +++++++++++++----
>  3 files changed, 45 insertions(+), 111 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3/crosspythonpath.=
patch
>  delete mode 100644 meta/recipes-devtools/python/python3/fix-armv5.patch
>  rename meta/recipes-devtools/python/{python3_3.13.0.bb =3D> python3_3.13=
.1.bb} (96%)
>
> diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b=
/meta/recipes-devtools/python/python3/crosspythonpath.patch
> deleted file mode 100644
> index f18898e4c4f..00000000000
> --- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 8840438e73e43b99bc9c83896a5f950e4259738f Mon Sep 17 00:00:00 2001
> -From: Ricardo Ribalda <ricardo@ribalda.com>
> -Date: Tue, 18 Nov 2014 03:35:33 -0500
> -Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
> - PYTHON_FOR_BUILD
> -
> -When building x86->x86 the system will try to execute .so and related it=
ems
> -from the default PYTHONPATH.  This will fail if the target CPU contains
> -instructions that the host CPU does not have, add CROSSPYTHONPATH
> -into PYTHONPATH so we can prepend the list to find correct libs.
> -
> -Upstream-Status: Inappropriate [OE-Core integration specific]
> -
> -Credits-to: Mark Hatle <mark.hatle@windriver.com>
> -Credits-to: Jackie Huang <jackie.huang@windriver.com>
> -Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 58f5407..5101806 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -164,7 +164,7 @@ AC_ARG_WITH([build-python],
> -     dnl Build Python interpreter is used for regeneration and freezing.
> -     ac_cv_prog_PYTHON_FOR_REGEN=3D$with_build_python
> -     PYTHON_FOR_FREEZE=3D"$with_build_python"
> --    PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHON_=
HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell test -f pybui=
lddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTH=
ON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) =
'$with_build_python
> -+    PYTHON_FOR_BUILD=3D'_PYTHON_PROJECT_BASE=3D$(abs_builddir) _PYTHON_=
HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(CROSSPYTHONPATH):$(=
shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)=
$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MAC=
HDEP)_$(MULTIARCH) '$with_build_python
> -     AC_MSG_RESULT([$with_build_python])
> -   ], [
> -     AS_VAR_IF([cross_compiling], [yes],
> diff --git a/meta/recipes-devtools/python/python3/fix-armv5.patch b/meta/=
recipes-devtools/python/python3/fix-armv5.patch
> deleted file mode 100644
> index 961404b24fc..00000000000
> --- a/meta/recipes-devtools/python/python3/fix-armv5.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 18b9079ddbc149d6b99c922630c246812e4d8ae7 Mon Sep 17 00:00:00 2001
> -From: "Miss Islington (bot)"
> - <31488909+miss-islington@users.noreply.github.com>
> -Date: Wed, 16 Oct 2024 16:48:40 +0200
> -Subject: [PATCH] [3.13] gh-125444: Fix illegal instruction for older Arm
> - architectures (GH-125574) (GH-125595)
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -On Arm v5 it is not possible to get the thread ID via c13 register
> -hence the illegal instruction. The c13 register started to provide
> -thread ID since Arm v6K architecture variant. Other variants of
> -Arm v6 (T2, Z and base) don=E2=80=99t provide the thread ID via c13.
> -For the sake of simplicity we group v5 and v6 together and
> -consider that instructions for Arm v7 only.
> -(cherry picked from commit feda9aa73ab95d17a291db22c416146f8e70edeb)
> -
> -Co-authored-by: Diego Russo <diego.russo@arm.com>
> -
> -Upstream-Status: Backport [https://github.com/python/cpython/commit/18b9=
079ddbc149d6b99c922630c246812e4d8ae7]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - Include/internal/mimalloc/mimalloc/prim.h                     | 4 ++--
> - Include/object.h                                              | 2 +-
> - .../2024-10-16-12-12-39.gh-issue-125444.9tG2X6.rst            | 1 +
> - 3 files changed, 4 insertions(+), 3 deletions(-)
> - create mode 100644 Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-=
39.gh-issue-125444.9tG2X6.rst
> -
> -diff --git a/Include/internal/mimalloc/mimalloc/prim.h b/Include/interna=
l/mimalloc/mimalloc/prim.h
> -index 8a60d528458e6c..322ab29e6b41c2 100644
> ---- a/Include/internal/mimalloc/mimalloc/prim.h
> -+++ b/Include/internal/mimalloc/mimalloc/prim.h
> -@@ -151,9 +151,9 @@ static inline mi_threadid_t _mi_prim_thread_id(void)=
 mi_attr_noexcept {
> - // If you test on another platform and it works please send a PR :-)
> - // see also https://akkadia.org/drepper/tls.pdf for more info on the TL=
S register.
> - #elif defined(__GNUC__) && ( \
> --           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i=
386__) || defined(__arm__) || defined(__aarch64__))) \
> -+           (defined(__GLIBC__)   && (defined(__x86_64__) || defined(__i=
386__) || (defined(__arm__) && __ARM_ARCH >=3D 7) || defined(__aarch64__)))=
 \
> -         || (defined(__APPLE__)   && (defined(__x86_64__) || defined(__a=
arch64__))) \
> --        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i=
386__) || defined(__arm__) || defined(__aarch64__))) \
> -+        || (defined(__BIONIC__)  && (defined(__x86_64__) || defined(__i=
386__) || (defined(__arm__) && __ARM_ARCH >=3D 7) || defined(__aarch64__)))=
 \
> -         || (defined(__FreeBSD__) && (defined(__x86_64__) || defined(__i=
386__) || defined(__aarch64__))) \
> -         || (defined(__OpenBSD__) && (defined(__x86_64__) || defined(__i=
386__) || defined(__aarch64__))) \
> -       )
> -diff --git a/Include/object.h b/Include/object.h
> -index 78aa7ad0f459ff..b53f9acfebdb0c 100644
> ---- a/Include/object.h
> -+++ b/Include/object.h
> -@@ -259,7 +259,7 @@ _Py_ThreadId(void)
> -     __asm__("movq %%gs:0, %0" : "=3Dr" (tid));  // x86_64 macOSX uses G=
S
> - #elif defined(__x86_64__)
> -    __asm__("movq %%fs:0, %0" : "=3Dr" (tid));  // x86_64 Linux, BSD use=
s FS
> --#elif defined(__arm__)
> -+#elif defined(__arm__) && __ARM_ARCH >=3D 7
> -     __asm__ ("mrc p15, 0, %0, c13, c0, 3\nbic %0, %0, #3" : "=3Dr" (tid=
));
> - #elif defined(__aarch64__) && defined(__APPLE__)
> -     __asm__ ("mrs %0, tpidrro_el0" : "=3Dr" (tid));
> -diff --git a/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-i=
ssue-125444.9tG2X6.rst b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-1=
2-39.gh-issue-125444.9tG2X6.rst
> -new file mode 100644
> -index 00000000000000..13c1e745edf8d5
> ---- /dev/null
> -+++ b/Misc/NEWS.d/next/Core_and_Builtins/2024-10-16-12-12-39.gh-issue-12=
5444.9tG2X6.rst
> -@@ -0,0 +1 @@
> -+Fix illegal instruction for older Arm architectures. Patch by Diego Rus=
so, testing by Ross Burton.
> diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipe=
s-devtools/python/python3_3.13.1.bb
> similarity index 96%
> rename from meta/recipes-devtools/python/python3_3.13.0.bb
> rename to meta/recipes-devtools/python/python3_3.13.1.bb
> index b3170879b95..b2eaf9f4396 100644
> --- a/meta/recipes-devtools/python/python3_3.13.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.1.bb
> @@ -14,7 +14,6 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://check_build_completeness.py \
>             file://reformat_sysconfig.py \
>             file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-prof=
ile.patch \
> -           file://crosspythonpath.patch \
>             file://0001-test_locale.py-correct-the-test-output-format.pat=
ch \
>             file://0001-Skip-failing-tests-due-to-load-variability-on-YP-=
AB.patch \
>             file://0001-test_ctypes.test_find-skip-without-tools-sdk.patc=
h \
> @@ -30,7 +29,6 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://0001-test_deadlock-skip-problematic-test.patch \
>             file://0001-test_active_children-skip-problematic-test.patch =
\
>             file://0001-test_readline-skip-limited-history-test.patch \
> -           file://fix-armv5.patch \
>             file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multi=
ssl.patch \
>             file://0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch \
>             "
> @@ -39,7 +37,7 @@ SRC_URI:append:class-native =3D " \
>             file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "086de5882e3cb310d4dca48457522e2e48018ecd43da9cdf=
827f6a0759efb07d"
> +SRC_URI[sha256sum] =3D "9cf9427bee9e2242e3877dd0f6b641c1853ca461f39d6503=
ce260a59c80bf0d9"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> @@ -69,7 +67,24 @@ ALTERNATIVE_LINK_NAME[python3-config] =3D "${bindir}/p=
ython${PYTHON_MAJMIN}-config
>  ALTERNATIVE_TARGET[python3-config] =3D "${bindir}/python${PYTHON_MAJMIN}=
-config-${MULTILIB_SUFFIX}"
>
>
> -DEPENDS =3D "bzip2-replacement-native expat libffi bzip2 openssl sqlite3=
 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 =
autoconf-archive-native ncurses"
> +DEPENDS =3D "\
> +    autoconf-archive-native \
> +    bzip2 \
> +    bzip2-replacement-native \
> +    expat \
> +    libffi \
> +    libnsl2 \
> +    libtirpc \
> +    ncurses \
> +    openssl \
> +    sqlite3 \
> +    util-linux-libuuid \
> +    virtual/crypt \
> +    virtual/libintl \
> +    xz \
> +    zlib \
> +"
> +
>  DEPENDS:append:class-target =3D " python3-native"
>  DEPENDS:append:class-nativesdk =3D " python3-native"
>
> @@ -444,13 +459,13 @@ INSANE_SKIP:${PN}-ptest =3D "dev-deps"
>  # catch all the rest (unsorted)
>  PACKAGES +=3D "${PN}-misc"
>  RDEPENDS:${PN}-misc +=3D "\
> -  ${PN}-audio \
> -  ${PN}-codecs \
> -  ${PN}-core \
> -  ${PN}-email \
> -  ${PN}-numbers \
> -  ${PN}-pickle \
> -  ${PN}-pydoc \
> +    ${PN}-audio \
> +    ${PN}-codecs \
> +    ${PN}-core \
> +    ${PN}-email \
> +    ${PN}-numbers \
> +    ${PN}-pickle \
> +    ${PN}-pydoc \
>  "
>  RDEPENDS:${PN}-modules:append:class-target =3D " ${MLPREFIX}python3-misc=
"
>  RDEPENDS:${PN}-modules:append:class-nativesdk =3D " ${MLPREFIX}python3-m=
isc"
> @@ -466,8 +481,25 @@ RDEPENDS:libpython3:append:libc-glibc =3D " libgcc"
>  RDEPENDS:${PN}-ctypes:append:libc-glibc =3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldco=
nfig', '', d)} \
>  "
> -RDEPENDS:${PN}-ptest =3D "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-zipa=
pp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils \
> -                        locale-base-fr-fr locale-base-en-us locale-base-=
de-de"
> +RDEPENDS:${PN}-ptest =3D "\
> +    ${PN}-dev \
> +    ${PN}-modules \
> +    ${PN}-tests \
> +    ${PN}-zipapp \
> +    binutils \
> +    bzip2 \
> +    coreutils \
> +    gcc \
> +    gcc-symlinks \
> +    g++ \
> +    libgcc \
> +    locale-base-fr-fr \
> +    locale-base-en-us \
> +    locale-base-de-de \
> +    sed \
> +    tzdata \
> +    unzip \
> +"
>  RDEPENDS:${PN}-ptest:append:libc-glibc =3D " locale-base-tr-tr"
>  RDEPENDS:${PN}-tkinter +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk',=
 '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
>  RDEPENDS:${PN}-idle +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tk', '$=
{PN}-tkinter ${MLPREFIX}tcl', '', d)}"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208917): https://lists.openembedded.org/g/openembedde=
d-core/message/208917
> Mute This Topic: https://lists.openembedded.org/mt/110198411/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

