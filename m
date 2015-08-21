Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id D669360557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 07:26:16 +0000 (UTC)
Received: by igfj19 with SMTP id j19so8444414igf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 00:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WWOLDogCj/+HbMsiC4c81W8iHDlAAigds11p2maR+8I=;
	b=vZf0s/g0AfjzQr434iMdKxSApWqvECKNjhILUiFNieQ+QF6d/3mRBn0PAFpVX+UNtA
	Ri8BdiqWp2iisIaVDsllsIfHy4YXkOvuYGQ8FGLRGxNwbx0xasVvqzwmZ+qZgeHYJCqp
	0e9Zc32gY2DPRK9ideNRvUmEpfRLWXaNj+48VYIdLXunBiOclqOjrtvJTEL5YjI58PfC
	5iTemTSehWCKU7RGroaanHIFO46Ia+1XQBhkuTGMy/gLGmu6cPqbTwv0PL/PASkcQBQP
	1nuk/PclszX3pmd4jFJW0RbpKfChUin0aTYmqZdXQQZWFid+Vk/41twVufie+WkKWeSu
	kGtg==
X-Received: by 10.50.30.196 with SMTP id u4mr1617553igh.11.1440141976737; Fri,
	21 Aug 2015 00:26:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 00:25:47 -0700 (PDT)
In-Reply-To: <c22d818de805fde488bce9e0263d573c51cee5c9.1440126018.git.wenzong.fan@windriver.com>
References: <cover.1440126018.git.wenzong.fan@windriver.com>
	<c22d818de805fde488bce9e0263d573c51cee5c9.1440126018.git.wenzong.fan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 00:25:47 -0700
Message-ID: <CAMKF1srnPDL=yzcu7_niSfwuxa8a-93bBQLN0ba-Roru4DRHhw@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] libcap-ng: add package 0.7.7
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
X-List-Received-Date: Fri, 21 Aug 2015 07:26:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 10:38 PM,  <wenzong.fan@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Pull package from meta-oe to oe-core:
> meta-oe commit: bce4dba5546480c8e43c6442959ac7d0a4ef32f6
>
> The libcap-ng library is intended to make programming with posix
> capabilities much easier than the traditional libcap library.
>
> It's not a replacement to libcap, it provides different library
> (libcap-ng.so) while packages explicitly look for libcap.so. It
> could be used by qemu, util-linux, libvirt, audit ...
>
> With adding it to oe-core, the copies from following layers could
> be removed:
>
> * meta-oe, meta-selinux, meta-security-framework ...

I am afraid that we  are setting a pretext for moving all recipes that
are in multiple layers to be eligible for OE-core now.
met-oe is common layer for extended recipes, so may be other layers
should have been a bit more vigilant and made sure
there requirements were met with whats in meta-oe.
we should ask what core feature does it enable for reference images
and machines.

>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  .../libcap-ng/libcap-ng/python.patch               | 58 ++++++++++++++++++++++
>  meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  | 39 +++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 meta/recipes-support/libcap-ng/libcap-ng/python.patch
>  create mode 100644 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
>
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
> new file mode 100644
> index 0000000..59591eb
> --- /dev/null
> +++ b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
> @@ -0,0 +1,58 @@
> +From b01bb2694f66cd981e6d61523433dc3eb5ed32f2 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Sat, 18 Jul 2015 23:03:30 +0900
> +Subject: [PATCH] configure.ac - Avoid an incorrect check for python.
> + Makefile.am - avoid hard coded host include paths.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + bindings/python/Makefile.am |  3 ++-
> + configure.ac                | 15 ++-------------
> + 2 files changed, 4 insertions(+), 14 deletions(-)
> +
> +diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> +index 82b9bb8..f9fe7a8 100644
> +--- a/bindings/python/Makefile.am
> ++++ b/bindings/python/Makefile.am
> +@@ -23,7 +23,8 @@ SUBDIRS = test
> + CONFIG_CLEAN_FILES = *.loT *.rej *.orig
> + AM_CFLAGS = -fPIC -DPIC
> + PYLIBVER ?= python$(PYTHON_VERSION)
> +-AM_CPPFLAGS = -I. -I$(top_builddir) -I@PYINCLUDEDIR@
> ++PYINC ?= /usr/include/$(PYLIBVER)
> ++AM_CPPFLAGS = -I. -I$(top_builddir) -I$(PYINC)
> + LIBS = $(top_builddir)/src/libcap-ng.la
> + SWIG_FLAGS = -python
> + SWIG_INCLUDES = ${AM_CPPFLAGS}
> +diff --git a/configure.ac b/configure.ac
> +index 1d777d5..9d90f64 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -123,19 +123,8 @@ if test x$use_python = xno ; then
> + else
> + AC_MSG_RESULT(testing)
> + AM_PATH_PYTHON
> +-PYINCLUDEDIR=`python${am_cv_python_version} -c "from distutils import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))"`
> +-if test -f ${PYINCLUDEDIR}/Python.h ; then
> +-      python_found="yes"
> +-      AC_SUBST(PYINCLUDEDIR)
> +-      AC_MSG_NOTICE(Python bindings will be built)
> +-else
> +-      python_found="no"
> +-      if test x$use_python = xyes ; then
> +-              AC_MSG_ERROR([Python explicitly required and python headers found])
> +-      else
> +-              AC_MSG_WARN("Python headers not found - python bindings will not be made")
> +-      fi
> +-fi
> ++python_found="yes"
> ++AC_MSG_NOTICE(Python bindings will be built)
> + fi
> + AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
> +
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
> new file mode 100644
> index 0000000..a31d5dc
> --- /dev/null
> +++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "An alternate posix capabilities library"
> +DESCRIPTION = "The libcap-ng library is intended to make programming \
> +with POSIX capabilities much easier than the traditional libcap library."
> +HOMEPAGE = "http://freecode.com/projects/libcap-ng"
> +SECTION = "base"
> +LICENSE = "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +                   file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
> +
> +SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
> +           file://python.patch"
> +
> +inherit lib_package autotools pythonnative
> +
> +SRC_URI[md5sum] = "3d7d126b29e2869a0257c17c8b0d9b2e"
> +SRC_URI[sha256sum] = "615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b"
> +
> +DEPENDS += "swig-native python"
> +
> +EXTRA_OECONF += "--without-python3"
> +
> +EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
> +
> +PACKAGES += "${PN}-python"
> +
> +FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
> +FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
> +
> +BBCLASSEXTEND = "native"
> +
> +do_install_append() {
> +       # Moving libcap-ng to base_libdir
> +       if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> +               mkdir -p ${D}/${base_libdir}/
> +               mv -f ${D}${libdir}/libcap-ng.so.* ${D}${base_libdir}/
> +               relpath=${@os.path.relpath("${base_libdir}", "${libdir}")}
> +               ln -sf ${relpath}/libcap-ng.so.0.0.0 ${D}${libdir}/libcap-ng.so
> +       fi
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

