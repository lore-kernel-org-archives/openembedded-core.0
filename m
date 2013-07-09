Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5CF26AD1C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 13:29:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r69DTDC2000044
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2013 06:29:13 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 06:29:13 -0700
Message-ID: <51DC1027.9030801@windriver.com>
Date: Tue, 9 Jul 2013 21:29:11 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
	<327d5b48c01febfaa4bd883b851a7640c81a7311.1373372649.git.hongxu.jia@windriver.com>
	<4535187.OqzhIf4Y4R@helios>
In-Reply-To: <4535187.OqzhIf4Y4R@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Tue, 09 Jul 2013 13:29:13 -0000
Content-Type: multipart/alternative;
	boundary="------------030807030203060406000903"

--------------030807030203060406000903
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

1, 3.15.1 is the newest version, and file structure has more change than 
previous version.

2, 3.13.3 just skip signing, and cheksum file doesn't be generated.

3, 3.13.3 doesn't completely fix incorrect shebang of perl (PATCH 5/5)

4, 3.13.3's package doesn't contain ${D}${bindir}/  and ${D}${sysconfdir}

I think 3.15.1 is better.

//Hongxu

On 07/09/2013 08:44 PM, Paul Eggleton wrote:
> Hi Hongxu,
>
> On Tuesday 09 July 2013 20:30:38 Hongxu Jia wrote:
>> Network Security Services (NSS) is a set of libraries designed to support
>> cross-platform development of security-enabled client and server
>> applications. Applications built with NSS can support SSL v2 and v3, TLS,
>> PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 v3 certificates, and other
>> security standards.
>>
>> [YOCTO #4096]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../files/nss-fix-support-cross-compiling.patch    |  71 +++++++++
>>   .../files/nss-no-rpath-for-cross-compiling.patch   |  26 ++++
>>   meta/recipes-support/nss/files/nss.pc.in           |  11 ++
>>   meta/recipes-support/nss/nss.inc                   | 169
>> +++++++++++++++++++++ meta/recipes-support/nss/nss_3.15.1.bb             |
>>   9 ++
>>   5 files changed, 286 insertions(+)
>>   create mode 100644
>> meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch create
>> mode 100644
>> meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
>> create mode 100644 meta/recipes-support/nss/files/nss.pc.in
>>   create mode 100644 meta/recipes-support/nss/nss.inc
>>   create mode 100644 meta/recipes-support/nss/nss_3.15.1.bb
>>
>> diff --git
>> a/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
>> b/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch new
>> file mode 100644
>> index 0000000..f0b3550
>> --- /dev/null
>> +++ b/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
>> @@ -0,0 +1,71 @@
>> +nss: fix support cross compiling
>> +
>> +Let some make variables be assigned from outside makefile.
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +Upstream-Status: Inappropriate [configuration]
>> +---
>> + nss/coreconf/Linux.mk   | 12 +++++++++++-
>> + nss/coreconf/arch.mk    |  2 +-
>> + nss/lib/freebl/Makefile |  6 ++++++
>> + 3 files changed, 18 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
>> +--- a/nss/coreconf/Linux.mk
>> ++++ b/nss/coreconf/Linux.mk
>> +@@ -16,11 +16,21 @@ ifeq ($(USE_PTHREADS),1)
>> + 	IMPL_STRATEGY = _PTH
>> + endif
>> +
>> ++ifndef CC
>> + CC			= gcc
>> ++endif
>> ++
>> ++ifdef CXX
>> ++CCC			= $(CXX)
>> ++else
>> + CCC			= g++
>> ++endif
>> ++
>> ++ifndef RANLIB
>> + RANLIB			= ranlib
>> ++endif
>> +
>> +-DEFAULT_COMPILER = gcc
>> ++DEFAULT_COMPILER = $(CC)
>> +
>> + ifeq ($(OS_TARGET),Android)
>> + ifndef ANDROID_NDK
>> +diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
>> +index 6557348..b722412 100644
>> +--- a/nss/coreconf/arch.mk
>> ++++ b/nss/coreconf/arch.mk
>> +@@ -37,7 +37,7 @@ OS_TEST := $(shell uname -m)
>> + ifeq ($(OS_TEST),i86pc)
>> +     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
>> + else
>> +-    OS_RELEASE := $(shell uname -r)
>> ++    OS_RELEASE ?= $(shell uname -r)
>> + endif
>> +
>> + #
>> +diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
>> +index 0d293f1..678f506 100644
>> +--- a/nss/lib/freebl/Makefile
>> ++++ b/nss/lib/freebl/Makefile
>> +@@ -36,6 +36,12 @@ ifdef USE_64
>> + 	DEFINES += -DNSS_USE_64
>> + endif
>> +
>> ++ifeq ($(OS_TEST),mips)
>> ++ifndef USE_64
>> ++	DEFINES += -DNS_PTR_LE_32
>> ++endif
>> ++endif
>> ++
>> + ifdef USE_ABI32_FPU
>> + 	DEFINES += -DNSS_USE_ABI32_FPU
>> + endif
>> +--
>> +1.8.1.2
>> +
>> diff --git
>> a/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
>> b/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch new
>> file mode 100644
>> index 0000000..7661dc9
>> --- /dev/null
>> +++ b/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
>> @@ -0,0 +1,26 @@
>> +nss:no rpath for cross compiling
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +Upstream-Status: Inappropriate [configuration]
>> +---
>> + nss/cmd/platlibs.mk | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/nss/cmd/platlibs.mk b/nss/cmd/platlibs.mk
>> +--- a/nss/cmd/platlibs.mk
>> ++++ b/nss/cmd/platlibs.mk
>> +@@ -18,9 +18,9 @@ endif
>> +
>> + ifeq ($(OS_ARCH), Linux)
>> + ifeq ($(USE_64), 1)
>> +-EXTRA_SHARED_LIBS +=
>> -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
>> ++#EXTRA_SHARED_LIBS +=
>> -Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib' +
>> else
>> +-EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
>> ++#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
>> + endif
>> + endif
>> +
>> +--
>> +1.8.1.2
>> +
>> diff --git a/meta/recipes-support/nss/files/nss.pc.in
>> b/meta/recipes-support/nss/files/nss.pc.in new file mode 100644
>> index 0000000..200f635
>> --- /dev/null
>> +++ b/meta/recipes-support/nss/files/nss.pc.in
>> @@ -0,0 +1,11 @@
>> +prefix=OEPREFIX
>> +exec_prefix=OEEXECPREFIX
>> +libdir=OELIBDIR
>> +includedir=OEINCDIR
>> +
>> +Name: NSS
>> +Description: Network Security Services
>> +Version: %NSS_VERSION%
>> +Requires: nspr >= %NSPR_VERSION%
>> +Libs: -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
>> +Cflags: -IOEINCDIR
>> diff --git a/meta/recipes-support/nss/nss.inc
>> b/meta/recipes-support/nss/nss.inc new file mode 100644
>> index 0000000..71b7250
>> --- /dev/null
>> +++ b/meta/recipes-support/nss/nss.inc
>> @@ -0,0 +1,169 @@
>> +SUMMARY = "Mozilla's SSL and TLS implementation"
>> +DESCRIPTION = "Network Security Services (NSS) is a set of libraries \
>> +designed to support cross-platform development of \
>> +security-enabled client and server applications. \
>> +Applications built with NSS can support SSL v2 and v3, \
>> +TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
>> +v3 certificates, and other security standards."
>> +HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
>> +SECTION = "libs"
>> +
>> +LICENSE = "MPL-1.1 GPL-2.0 LGPL-2.1"
>> +
>> +LIC_FILES_CHKSUM =
>> "file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f
>> \ +
>> file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=6bf96825e3d7ce4de25621ae886cc
>> 859" +SRC_URI = "\
>> +    file://nss-fix-support-cross-compiling.patch \
>> +    file://nss-no-rpath-for-cross-compiling.patch \
>> +"
>> +SRC_URI_append_class-target += "\
>> +    file://nss.pc.in \
>> +"
>> +inherit siteinfo
>> +PR = "r0"
>> +DEPENDS = "sqlite3 nspr zlib nss-native"
>> +DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
>> +
>> +TD = "${S}/tentative-dist"
>> +TDS = "${S}/tentative-dist-staging"
>> +
>> +TARGET_CC_ARCH += "${LDFLAGS}"
>> +
>> +do_compile_prepend_class-native() {
>> +    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
>> +    export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
>> +}
>> +
>> +do_compile() {
>> +    export CROSS_COMPILE=1
>> +    export NATIVE_CC="gcc"
>> +    export BUILD_OPT=1
>> +
>> +    export FREEBL_NO_DEPEND=1
>> +    export FREEBL_LOWHASH=1
>> +
>> +    export LIBDIR=${base_libdir}
>> +    export MOZILLA_CLIENT=1
>> +    export NS_USE_GCC=1
>> +    export NSS_USE_SYSTEM_SQLITE=1
>> +    export NSS_ENABLE_ECC=1
>> +
>> +    export OS_RELEASE=3.4
>> +    export OS_TARGET=Linux
>> +    export OS_ARCH=Linux
>> +
>> +    if [ "${TARGET_ARCH}" = "powerpc" ]; then
>> +        OS_TEST=ppc
>> +    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
>> +        OS_TEST=ppc64
>> +    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o
>> "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then +
>>    OS_TEST=mips
>> +    else
>> +        OS_TEST="${TARGET_ARCH}"
>> +    fi
>> +
>> +    if [ "${SITEINFO_BITS}" = "64" ]; then
>> +        export USE_64=1
>> +    fi
>> +
>> +    make -C ./nss CCC="${CXX}" \
>> +        OS_TEST=${OS_TEST} \
>> +}
>> +
>> +do_install() {
>> +    export CROSS_COMPILE=1
>> +    export NATIVE_CC="gcc"
>> +    export BUILD_OPT=1
>> +
>> +    export FREEBL_NO_DEPEND=1
>> +
>> +    export LIBDIR=${base_libdir}
>> +    export MOZILLA_CLIENT=1
>> +    export NS_USE_GCC=1
>> +    export NSS_USE_SYSTEM_SQLITE=1
>> +    export NSS_ENABLE_ECC=1
>> +
>> +    export OS_RELEASE=3.4
>> +    export OS_TARGET=Linux
>> +    export OS_ARCH=Linux
>> +
>> +    if [ "${TARGET_ARCH}" = "powerpc" ]; then
>> +        OS_TEST=ppc
>> +    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
>> +        OS_TEST=ppc64
>> +    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o
>> "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then +
>>    OS_TEST=mips
>> +    else
>> +        OS_TEST="${TARGET_ARCH}"
>> +    fi
>> +    if [ "${SITEINFO_BITS}" = "64" ]; then
>> +        export USE_64=1
>> +    fi
>> +
>> +    make -C ./nss \
>> +        CCC="${CXX}" \
>> +        OS_TEST=${OS_TEST} \
>> +        SOURCE_LIB_DIR="${TD}/${libdir}" \
>> +        SOURCE_BIN_DIR="${TD}/${bindir}" \
>> +        install
>> +
>> +    install -d ${D}/${base_libdir}/
>> +    for file in ${S}/dist/*.OBJ/lib/*.so; do
>> +        echo "Installing `basename $file`..."
>> +        cp $file  ${D}/${base_libdir}/
>> +    done
>> +
>> +    for shared_lib in ${TD}/${libdir}/*.so.*; do
>> +        if [ -f $shared_lib ]; then
>> +            cp $shared_lib ${D}/${base_libdir}
>> +            ln -sf $(basename $shared_lib) ${D}/${base_libdir}/$(basename
>> $shared_lib .1oe) +        fi
>> +    done
>> +    for shared_lib in ${TD}/${libdir}/*.so; do
>> +        if [ -f $shared_lib -a ! -e ${D}/${base_libdir}/$shared_lib ]; then
>> +            cp $shared_lib ${D}/${base_libdir}
>> +        fi
>> +    done
>> +
>> +    install -d ${D}/${includedir}/nss3
>> +    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
>> +
>> +    install -d ${D}/${bindir}
>> +    for binary in ${TD}/${bindir}/*; do
>> +        install -m 755 -t ${D}/${bindir} $binary
>> +    done
>> +}
>> +
>> +do_install_append_class-target() {
>> +    install -d ${D}${libdir}/pkgconfig/
>> +    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed
>> 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc +    sed -i
>> s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
>> +    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
>> +    sed -i s:OELIBDIR:${base_libdir}:g ${D}${libdir}/pkgconfig/nss.pc
>> +    sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
>> +
>> +    # Create a blank certificate
>> +    mkdir -p ${D}/etc/pki/nssdb/
>> +    touch ./empty_password
>> +    certutil -N -d ${D}/etc/pki/nssdb/ -f ./empty_password
>> +    chmod 644 ${D}/etc/pki/nssdb/*.db
>> +    rm ./empty_password
>> +}
>> +
>> +FILES_${PN} = "\
>> +    ${sysconfdir} \
>> +    ${bindir} \
>> +    ${base_libdir}/lib*.chk \
>> +    ${base_libdir}/lib*.so \
>> +    "
>> +FILES_${PN}-dev = "\
>> +    ${base_libdir}/nss \
>> +    ${libdir}/pkgconfig/* \
>> +    ${includedir}/* \
>> +    "
>> +FILES_${PN}-dbg = "\
>> +    ${bindir}/.debug/* \
>> +    ${base_libdir}/.debug/* \
>> +    "
>> +
>> +BBCLASSEXTEND = "native"
>> diff --git a/meta/recipes-support/nss/nss_3.15.1.bb
>> b/meta/recipes-support/nss/nss_3.15.1.bb new file mode 100644
>> index 0000000..7b06f00
>> --- /dev/null
>> +++ b/meta/recipes-support/nss/nss_3.15.1.bb
>> @@ -0,0 +1,9 @@
>> +require nss.inc
>> +
>> +SRC_URI += "\
>> +
>> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_15_1_RTM
>> /src/${BPN}-${PV}.tar.gz \ +"
>> +
>> +SRC_URI[md5sum] = "fb68f4d210ac9397dd0d3c39c4f938eb"
>> +SRC_URI[sha256sum] =
>> "f994106a33d1f3210f4151bbb3419a1c28fd1cb545caa7dc9afdebd6da626284" +
> How does this compare to the nss recipe in meta-browser?
>
> https://github.com/OSSystems/meta-browser/blob/master/recipes-support/nss/nss_3.13.3.bb
>
> Cheers,
> Paul
>


--------------030807030203060406000903
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Paul,<br>
      <br>
      1, 3.15.1 is the newest version, and file structure has more
      change than previous version.<br>
      <br>
      2, 3.13.3 just skip signing, and cheksum file doesn't be
      generated.<br>
      <br>
      3, 3.13.3 doesn't completely fix incorrect shebang of perl (PATCH
      5/5)<br>
      <br>
      4, 3.13.3's package doesn't contain
      <meta http-equiv="content-type" content="text/html;
        charset=ISO-8859-1">
      ${D}${bindir}/&nbsp; and ${D}${sysconfdir}<br>
      <br>
      I think 3.15.1 is better.<br>
      <br>
      //Hongxu<br>
      <br>
      On 07/09/2013 08:44 PM, Paul Eggleton wrote:<br>
    </div>
    <blockquote cite="mid:4535187.OqzhIf4Y4R@helios" type="cite">
      <pre wrap="">Hi Hongxu,

On Tuesday 09 July 2013 20:30:38 Hongxu Jia wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Network Security Services (NSS) is a set of libraries designed to support
cross-platform development of security-enabled client and server
applications. Applications built with NSS can support SSL v2 and v3, TLS,
PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 v3 certificates, and other
security standards.

[YOCTO #4096]

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 .../files/nss-fix-support-cross-compiling.patch    |  71 +++++++++
 .../files/nss-no-rpath-for-cross-compiling.patch   |  26 ++++
 meta/recipes-support/nss/files/nss.pc.in           |  11 ++
 meta/recipes-support/nss/nss.inc                   | 169
+++++++++++++++++++++ meta/recipes-support/nss/nss_3.15.1.bb             | 
 9 ++
 5 files changed, 286 insertions(+)
 create mode 100644
meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch create
mode 100644
meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
create mode 100644 meta/recipes-support/nss/files/nss.pc.in
 create mode 100644 meta/recipes-support/nss/nss.inc
 create mode 100644 meta/recipes-support/nss/nss_3.15.1.bb

diff --git
a/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
b/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch new
file mode 100644
index 0000000..f0b3550
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
@@ -0,0 +1,71 @@
+nss: fix support cross compiling
+
+Let some make variables be assigned from outside makefile.
+
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Upstream-Status: Inappropriate [configuration]
+---
+ nss/coreconf/Linux.mk   | 12 +++++++++++-
+ nss/coreconf/arch.mk    |  2 +-
+ nss/lib/freebl/Makefile |  6 ++++++
+ 3 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
+--- a/nss/coreconf/Linux.mk
++++ b/nss/coreconf/Linux.mk
+@@ -16,11 +16,21 @@ ifeq ($(USE_PTHREADS),1)
+ 	IMPL_STRATEGY = _PTH
+ endif
+
++ifndef CC
+ CC			= gcc
++endif
++
++ifdef CXX
++CCC			= $(CXX)
++else
+ CCC			= g++
++endif
++
++ifndef RANLIB
+ RANLIB			= ranlib
++endif
+
+-DEFAULT_COMPILER = gcc
++DEFAULT_COMPILER = $(CC)
+
+ ifeq ($(OS_TARGET),Android)
+ ifndef ANDROID_NDK
+diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
+index 6557348..b722412 100644
+--- a/nss/coreconf/arch.mk
++++ b/nss/coreconf/arch.mk
+@@ -37,7 +37,7 @@ OS_TEST := $(shell uname -m)
+ ifeq ($(OS_TEST),i86pc)
+     OS_RELEASE := $(shell uname -r)_$(OS_TEST)
+ else
+-    OS_RELEASE := $(shell uname -r)
++    OS_RELEASE ?= $(shell uname -r)
+ endif
+
+ #
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index 0d293f1..678f506 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -36,6 +36,12 @@ ifdef USE_64
+ 	DEFINES += -DNSS_USE_64
+ endif
+
++ifeq ($(OS_TEST),mips)
++ifndef USE_64
++	DEFINES += -DNS_PTR_LE_32
++endif
++endif
++
+ ifdef USE_ABI32_FPU
+ 	DEFINES += -DNSS_USE_ABI32_FPU
+ endif
+--
+1.8.1.2
+
diff --git
a/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
b/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch new
file mode 100644
index 0000000..7661dc9
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
@@ -0,0 +1,26 @@
+nss:no rpath for cross compiling
+
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+Upstream-Status: Inappropriate [configuration]
+---
+ nss/cmd/platlibs.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/cmd/platlibs.mk b/nss/cmd/platlibs.mk
+--- a/nss/cmd/platlibs.mk
++++ b/nss/cmd/platlibs.mk
+@@ -18,9 +18,9 @@ endif
+
+ ifeq ($(OS_ARCH), Linux)
+ ifeq ($(USE_64), 1)
+-EXTRA_SHARED_LIBS +=
-Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib'
++#EXTRA_SHARED_LIBS +=
-Wl,-rpath,'$$ORIGIN/../lib64:/opt/sun/private/lib64:$$ORIGIN/../lib' +
else
+-EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
++#EXTRA_SHARED_LIBS += -Wl,-rpath,'$$ORIGIN/../lib:/opt/sun/private/lib'
+ endif
+ endif
+
+--
+1.8.1.2
+
diff --git a/meta/recipes-support/nss/files/nss.pc.in
b/meta/recipes-support/nss/files/nss.pc.in new file mode 100644
index 0000000..200f635
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss.pc.in
@@ -0,0 +1,11 @@
+prefix=OEPREFIX
+exec_prefix=OEEXECPREFIX
+libdir=OELIBDIR
+includedir=OEINCDIR
+
+Name: NSS
+Description: Network Security Services
+Version: %NSS_VERSION%
+Requires: nspr &gt;= %NSPR_VERSION%
+Libs: -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
+Cflags: -IOEINCDIR
diff --git a/meta/recipes-support/nss/nss.inc
b/meta/recipes-support/nss/nss.inc new file mode 100644
index 0000000..71b7250
--- /dev/null
+++ b/meta/recipes-support/nss/nss.inc
@@ -0,0 +1,169 @@
+SUMMARY = "Mozilla's SSL and TLS implementation"
+DESCRIPTION = "Network Security Services (NSS) is a set of libraries \
+designed to support cross-platform development of \
+security-enabled client and server applications. \
+Applications built with NSS can support SSL v2 and v3, \
+TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
+v3 certificates, and other security standards."
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.mozilla.org/projects/security/pki/nss/">"http://www.mozilla.org/projects/security/pki/nss/"</a>
+SECTION = "libs"
+
+LICENSE = "MPL-1.1 GPL-2.0 LGPL-2.1"
+
+LIC_FILES_CHKSUM =
<a class="moz-txt-link-rfc2396E" href="file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f\+file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=6bf96825e3d7ce4de25621ae886cc859">"file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f
\ +                   
file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=6bf96825e3d7ce4de25621ae886cc
859"</a> +SRC_URI = "\
+    <a class="moz-txt-link-freetext" href="file://nss-fix-support-cross-compiling.patch">file://nss-fix-support-cross-compiling.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://nss-no-rpath-for-cross-compiling.patch">file://nss-no-rpath-for-cross-compiling.patch</a> \
+"
+SRC_URI_append_class-target += "\
+    <a class="moz-txt-link-freetext" href="file://nss.pc.in">file://nss.pc.in</a> \
+"
+inherit siteinfo
+PR = "r0"
+DEPENDS = "sqlite3 nspr zlib nss-native"
+DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
+
+TD = "${S}/tentative-dist"
+TDS = "${S}/tentative-dist-staging"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile_prepend_class-native() {
+    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
+    export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
+}
+
+do_compile() {
+    export CROSS_COMPILE=1
+    export NATIVE_CC="gcc"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+    export FREEBL_LOWHASH=1
+
+    export LIBDIR=${base_libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o
"${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then +     
  OS_TEST=mips
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    fi
+
+    make -C ./nss CCC="${CXX}" \
+        OS_TEST=${OS_TEST} \
+}
+
+do_install() {
+    export CROSS_COMPILE=1
+    export NATIVE_CC="gcc"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+
+    export LIBDIR=${base_libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o
"${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then +     
  OS_TEST=mips
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    fi
+
+    make -C ./nss \
+        CCC="${CXX}" \
+        OS_TEST=${OS_TEST} \
+        SOURCE_LIB_DIR="${TD}/${libdir}" \
+        SOURCE_BIN_DIR="${TD}/${bindir}" \
+        install
+
+    install -d ${D}/${base_libdir}/
+    for file in ${S}/dist/*.OBJ/lib/*.so; do
+        echo "Installing `basename $file`..."
+        cp $file  ${D}/${base_libdir}/
+    done
+
+    for shared_lib in ${TD}/${libdir}/*.so.*; do
+        if [ -f $shared_lib ]; then
+            cp $shared_lib ${D}/${base_libdir}
+            ln -sf $(basename $shared_lib) ${D}/${base_libdir}/$(basename
$shared_lib .1oe) +        fi
+    done
+    for shared_lib in ${TD}/${libdir}/*.so; do
+        if [ -f $shared_lib -a ! -e ${D}/${base_libdir}/$shared_lib ]; then
+            cp $shared_lib ${D}/${base_libdir}
+        fi
+    done
+
+    install -d ${D}/${includedir}/nss3
+    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
+
+    install -d ${D}/${bindir}
+    for binary in ${TD}/${bindir}/*; do
+        install -m 755 -t ${D}/${bindir} $binary
+    done
+}
+
+do_install_append_class-target() {
+    install -d ${D}${libdir}/pkgconfig/
+    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed
's/%NSPR_VERSION%/4.9.2/' &gt; ${D}${libdir}/pkgconfig/nss.pc +    sed -i
s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OELIBDIR:${base_libdir}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
+
+    # Create a blank certificate
+    mkdir -p ${D}/etc/pki/nssdb/
+    touch ./empty_password
+    certutil -N -d ${D}/etc/pki/nssdb/ -f ./empty_password
+    chmod 644 ${D}/etc/pki/nssdb/*.db
+    rm ./empty_password
+}
+
+FILES_${PN} = "\
+    ${sysconfdir} \
+    ${bindir} \
+    ${base_libdir}/lib*.chk \
+    ${base_libdir}/lib*.so \
+    "
+FILES_${PN}-dev = "\
+    ${base_libdir}/nss \
+    ${libdir}/pkgconfig/* \
+    ${includedir}/* \
+    "
+FILES_${PN}-dbg = "\
+    ${bindir}/.debug/* \
+    ${base_libdir}/.debug/* \
+    "
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/nss/nss_3.15.1.bb
b/meta/recipes-support/nss/nss_3.15.1.bb new file mode 100644
index 0000000..7b06f00
--- /dev/null
+++ b/meta/recipes-support/nss/nss_3.15.1.bb
@@ -0,0 +1,9 @@
+require nss.inc
+
+SRC_URI += "\
+   
<a class="moz-txt-link-freetext" href="http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_15_1_RTM">http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_15_1_RTM</a>
/src/${BPN}-${PV}.tar.gz \ +"
+
+SRC_URI[md5sum] = "fb68f4d210ac9397dd0d3c39c4f938eb"
+SRC_URI[sha256sum] =
"f994106a33d1f3210f4151bbb3419a1c28fd1cb545caa7dc9afdebd6da626284" +
</pre>
      </blockquote>
      <pre wrap="">
How does this compare to the nss recipe in meta-browser?

<a class="moz-txt-link-freetext" href="https://github.com/OSSystems/meta-browser/blob/master/recipes-support/nss/nss_3.13.3.bb">https://github.com/OSSystems/meta-browser/blob/master/recipes-support/nss/nss_3.13.3.bb</a>

Cheers,
Paul

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030807030203060406000903--
