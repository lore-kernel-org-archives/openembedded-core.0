Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2528673E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 01:31:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7K1VDKh022095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Aug 2015 18:31:13 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 18:31:12 -0700
Message-ID: <55D52DDF.7040408@windriver.com>
Date: Thu, 20 Aug 2015 09:31:11 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1439967611.git.wenzong.fan@windriver.com>
	<557dc413728ff7c18f48e1ffaa9f54b7ccb8e3af.1439967611.git.wenzong.fan@windriver.com>
	<20150819131201.GA2441@jama>
In-Reply-To: <20150819131201.GA2441@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] swig: add package 3.0.2
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
X-List-Received-Date: Thu, 20 Aug 2015 01:31:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2015 09:12 PM, Martin Jansa wrote:
> On Wed, Aug 19, 2015 at 03:29:28AM -0400, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Pull package from meta-oe to oe-core:
>> meta-oe commit: 8b7d90d8e4c3338f94c588fc7e4a88319bd9a9e8
>
> There is patch for meta-oe to upgrade it to 3.0.6 (which isn't
> compatible with some recipes, but fixes for that were sent as well
> already).

Hi Martin,

Do you mean the fix for python-m2crypto?
----------------------------------------
commit 74de7be5a464e184fed64661e2a45f2f6fac58a5
Author: Li xin <lixin.fnst@cn.fujitsu.com>
Date:   Thu Jul 30 18:31:25 2015 +0800

     python-m2crypto: Error fix for swig >= 3.0.5

     After swig upgrade to 3.0.6, build the recipes which
     depends on python-m2crypto will occur errors like this:
     "SALT_LEN = m2.PKCS5_SALT_LEN
     AttributeError: 'module' object has no attribute 'PKCS5_SALT_LEN'"

     Reference
 
https://github.com/martinpaljak/M2Crypto/issues/60#issuecomment-75735489

     Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-----------------------------------------

If the fixes are not applied to swig directly, I think this patch is OK. 
I'll consider to remove swig from meta-oe next step ...

Thanks
Wenzong

>
>> It's required for libcap-ng to build python bindings.
>>
>> With adding it to oe-core, the copies from following layers could
>> be removed:
>>
>> * meta-oe, meta-selinux, meta-intel-iot-middleware ...
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   meta/recipes-devtools/swig/swig.inc                | 63 ++++++++++++++++++++
>>   ...lf-exe-for-swig-swiglib-on-non-Win32-plat.patch | 69 ++++++++++++++++++++++
>>   ...nfigure-use-pkg-config-for-pcre-detection.patch | 64 ++++++++++++++++++++
>>   meta/recipes-devtools/swig/swig_3.0.2.bb           |  8 +++
>>   4 files changed, 204 insertions(+)
>>   create mode 100644 meta/recipes-devtools/swig/swig.inc
>>   create mode 100644 meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
>>   create mode 100644 meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
>>   create mode 100644 meta/recipes-devtools/swig/swig_3.0.2.bb
>>
>> diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
>> new file mode 100644
>> index 0000000..9821fa5
>> --- /dev/null
>> +++ b/meta/recipes-devtools/swig/swig.inc
>> @@ -0,0 +1,63 @@
>> +DESCRIPTION = "SWIG - Simplified Wrapper and Interface Generator"
>> +HOMEPAGE = "http://swig.sourceforge.net/"
>> +LICENSE = "BSD & GPLv3"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
>> +                    file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
>> +                    file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
>> +
>> +SECTION = "devel"
>> +
>> +DEPENDS = "libpcre python"
>> +
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>> +
>> +inherit autotools pythonnative
>> +
>> +EXTRA_OECONF = " \
>> +    --with-python=${PYTHON} \
>> +    --without-allegrocl \
>> +    --without-android \
>> +    --without-boost \
>> +    --without-chicken \
>> +    --without-clisp \
>> +    --without-csharp \
>> +    --without-d \
>> +    --without-gcj \
>> +    --without-go \
>> +    --without-guile \
>> +    --without-java \
>> +    --without-lua \
>> +    --without-mzscheme \
>> +    --without-ocaml \
>> +    --without-octave \
>> +    --without-perl5 \
>> +    --without-pike \
>> +    --without-php \
>> +    --without-python3 \
>> +    --without-r \
>> +    --without-ruby \
>> +    --without-tcl \
>> +"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +do_configure() {
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/Tools/config
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
>> +    oe_runconf
>> +}
>> +
>> +do_install_append_class-nativesdk() {
>> +    cd ${D}${bindir}
>> +    ln -s swig swig2.0
>> +}
>> +
>> +def swiglib_relpath(d):
>> +    swiglib = d.getVar('datadir', True) + "/" + d.getVar('BPN', True) + "/" + d.getVar('PV', True)
>> +    return os.path.relpath(swiglib, d.getVar('bindir', True))
>> +
>> +do_install_append_class-native() {
>> +    create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
>> +}
>> diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
>> new file mode 100644
>> index 0000000..81df3e2
>> --- /dev/null
>> +++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
>> @@ -0,0 +1,69 @@
>> +From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
>> +From: "NODA, Kai" <nodakai@gmail.com>
>> +Date: Sun, 22 Apr 2012 17:01:02 +0900
>> +Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
>> + platforms.
>> +
>> +If it wasn't found, then fall back to a fixed string just as before.
>> +
>> +Upstream-Status: Submitted
>> +http://sourceforge.net/mailarchive/message.php?msg_id=29179733
>> +
>> +---
>> + Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
>> + 1 file changed, 22 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
>> +index d2f5d3b..cbb0a12 100644
>> +--- a/Source/Modules/main.cxx
>> ++++ b/Source/Modules/main.cxx
>> +@@ -26,6 +26,11 @@ char cvsroot_main_cxx[] = "$Id$";
>> + #include "cparse.h"
>> + #include <ctype.h>
>> + #include <limits.h>		// for INT_MAX
>> ++#ifndef _WIN32
>> ++#include <cstddef>
>> ++#include <unistd.h>		// for readlink
>> ++#include <sys/stat.h>		// for stat
>> ++#endif
>> +
>> + // Global variables
>> +
>> +@@ -902,9 +907,9 @@ int SWIG_main(int argc, char *argv[], Language *l) {
>> +
>> +   // Check for SWIG_LIB environment variable
>> +   if ((c = getenv("SWIG_LIB")) == (char *) 0) {
>> ++    char *p;
>> + #if defined(_WIN32)
>> +     char buf[MAX_PATH];
>> +-    char *p;
>> +     if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
>> +       *(p + 1) = '\0';
>> +       SwigLib = NewStringf("%sLib", buf); // Native windows installation path
>> +@@ -914,7 +919,22 @@ int SWIG_main(int argc, char *argv[], Language *l) {
>> +     if (Len(SWIG_LIB_WIN_UNIX) > 0)
>> +       SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
>> + #else
>> +-    SwigLib = NewString(SWIG_LIB);
>> ++    char buf[PATH_MAX];
>> ++    if (0 < ::readlink("/proc/self/exe", buf, sizeof(buf)) &&
>> ++        (p = ::strstr(buf, "/bin/swig"))) {
>> ++        int major, minor, patch;
>> ++        const int ret = ::sscanf(VERSION, "%d.%d.%d", &major, &minor, &patch);
>> ++        if (3 == ret) {
>> ++            const ::ptrdiff_t dir_part_len = p - buf;
>> ++            ::snprintf(p, PATH_MAX - dir_part_len, "/share/swig/%d.%d.%d", major, minor, patch);
>> ++            struct ::stat stat_res;
>> ++            if (0 == ::stat(buf, &stat_res) && S_ISDIR(stat_res.st_mode)) {
>> ++                SwigLib = NewString(buf);
>> ++            }
>> ++        }
>> ++    }
>> ++    if (NULL == SwigLib)
>> ++        SwigLib = NewString(SWIG_LIB);
>> + #endif
>> +   } else {
>> +     SwigLib = NewString(c);
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
>> new file mode 100644
>> index 0000000..1b1128a
>> --- /dev/null
>> +++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
>> @@ -0,0 +1,64 @@
>> +From 5c4d6d8538994d5fe9b3b46bfafaf0a605e3bda6 Mon Sep 17 00:00:00 2001
>> +From: Koen Kooi <koen.kooi@linaro.org>
>> +Date: Tue, 17 Jun 2014 08:18:17 +0200
>> +Subject: [PATCH] configure: use pkg-config for pcre detection
>> +
>> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> +Upstream-Status: pending
>> +---
>> + configure.ac | 38 +++++++-------------------------------
>> + 1 file changed, 7 insertions(+), 31 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 0c984b7..6edcec1 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -70,38 +70,14 @@ AC_MSG_RESULT([$with_pcre])
>> +
>> + dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
>> + if test x"${with_pcre}" = xyes ; then
>> +-  AC_MSG_CHECKING([whether to use local PCRE])
>> +-  local_pcre_config=no
>> +-  if test -z $PCRE_CONFIG; then
>> +-    if test -f `pwd`/pcre/pcre-swig-install/bin/pcre-config; then
>> +-      PCRE_CONFIG=`pwd`/pcre/pcre-swig-install/bin/pcre-config
>> +-      local_pcre_config=$PCRE_CONFIG
>> +-    fi
>> +-  fi
>> +-  AC_MSG_RESULT([$local_pcre_config])
>> +-fi
>> +-AS_IF([test "x$with_pcre" != xno],
>> +-  [AX_PATH_GENERIC([pcre],
>> +-    [], dnl Minimal version of PCRE we need -- accept any
>> +-    [], dnl custom sed script for version parsing is not needed
>> +-    [AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
>> +-     LIBS="$LIBS $PCRE_LIBS"
>> +-     CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
>> +-    ],
>> +-    [AC_MSG_FAILURE([
>> +-        Cannot find pcre-config script from PCRE (Perl Compatible Regular Expressions)
>> +-        library package. This dependency is needed for configure to complete,
>> +-        Either:
>> +-        - Install the PCRE developer package on your system (preferred approach).
>> +-        - Download the PCRE source tarball, build and install on your system
>> +-          as you would for any package built from source distribution.
>> +-        - Use the Tools/pcre-build.sh script to build PCRE just for SWIG to statically
>> +-          link against. Run 'Tools/pcre-build.sh --help' for instructions.
>> +-          (quite easy and does not require privileges to install PCRE on your system)
>> +-        - Use configure --without-pcre to disable regular expressions support in SWIG
>> +-          (not recommended).])
>> +-    ])
>> ++  PKG_CHECK_MODULES([PCRE], [libpcre], [
>> ++    AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
>> ++    LIBS="$LIBS $PCRE_LIBS"
>> ++    CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
>> ++  ], [
>> ++    AC_MSG_WARN([$PCRE_PKG_ERRORS])
>> +   ])
>> ++fi
>> +
>> +
>> + dnl CCache
>> +--
>> +1.9.3
>> +
>> diff --git a/meta/recipes-devtools/swig/swig_3.0.2.bb b/meta/recipes-devtools/swig/swig_3.0.2.bb
>> new file mode 100644
>> index 0000000..ac41914
>> --- /dev/null
>> +++ b/meta/recipes-devtools/swig/swig_3.0.2.bb
>> @@ -0,0 +1,8 @@
>> +require ${BPN}.inc
>> +
>> +SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
>> +            file://0001-configure-use-pkg-config-for-pcre-detection.patch \
>> +           "
>> +
>> +SRC_URI[md5sum] = "62f9b0d010cef36a13a010dc530d0d41"
>> +SRC_URI[sha256sum] = "a2669657cabcedc371f63c0457407a183e0b6b2ef4e7e303c1ec9a3964cc7813"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

