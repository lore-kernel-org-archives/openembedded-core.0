Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 460E560DC1
	for <openembedded-core@openembedded.org>;
	Sun, 29 Dec 2013 04:27:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Dec 2013 20:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,568,1384329600"; d="scan'208";a="457084964"
Received: from unknown (HELO [10.255.12.34]) ([10.255.12.34])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 20:27:41 -0800
Message-ID: <52BFA4BD.1030600@linux.intel.com>
Date: Sat, 28 Dec 2013 20:27:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>, openembedded-core@openembedded.org
References: <1388166891-850-1-git-send-email-philip@balister.org>
In-Reply-To: <1388166891-850-1-git-send-email-philip@balister.org>
Cc: Steve Arnold <esteve@gentoogeek.org>
Subject: Re: db : Include C++ binding library in Berkeley DB recipe.
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
X-List-Received-Date: Sun, 29 Dec 2013 04:27:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2013 09:54 AM, Philip Balister wrote:
> Create the C++ library for db. This library is packaged in a new
> package so the db package only contains the c library. This prevents
> existing users from adding libstdc++ to the package DEPENDS.
>

This change seems to introduce a packaging failure when building the sdk 
using -c populate_sdk.

ERROR: QA Issue: package nativesdk-db-cxx contains bad RPATH 
$ORIGIN/../../../../../../../home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/sysroots/i686-nativesdk-pokysdk-linux/opt/poky/1.5+snapshot/sysroots/i686-pokysdk-linux/usr/lib:$ORIGIN/.:$ORIGIN/../../lib 
in file 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-db/5.3.21-r0/packages-split/nativesdk-db-cxx/opt/poky/1.5+snapshot/sysroots/i686-pokysdk-linux/usr/lib/libdb_cxx-5.3.so
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: 
/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-arm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-db/5.3.21-r0/temp/log.do_package.21337
NOTE: recipe nativesdk-db-5.3.21-r0: task do_package: Failed


Sau!

> Signed-off-by: Philip Balister <philip@balister.org>
> Signed-off-by: Douglas Geiger <doug.geiger@bioradiation.net>
> Signed-off-by: Steve Arnold <esteve@gentoogeek.org>
> ---
>   meta/recipes-support/db/db_5.3.21.bb | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
> index 328f9db..1f1eca2 100644
> --- a/meta/recipes-support/db/db_5.3.21.bb
> +++ b/meta/recipes-support/db/db_5.3.21.bb
> @@ -17,7 +17,8 @@ RCONFLICTS_${PN} = "db3"
>
>   SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
>   SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
> -            file://fix-parallel-build.patch"
> +            file://fix-parallel-build.patch \
> +           "
>
>   SRC_URI[md5sum] = "3fda0b004acdaa6fa350bfc41a3b95ca"
>   SRC_URI[sha256sum] = "ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8"
> @@ -47,18 +48,22 @@ B = "${WORKDIR}/db-${PV}/build_unix"
>   # management on the system.
>   inherit lib_package
>
> +PACKAGES =+ "${PN}-cxx"
> +FILES_${PN}-cxx = "${libdir}/*cxx*so"
> +
> +
>   # The dev package has the .so link (as in db3) and the .a's -
>   # it is therefore incompatible (cannot be installed at the
>   # same time) as the db3 package
>   # sort out the .so since they do version prior to the .so
>   SOLIBS = "-5*.so"
> -FILES_SOLIBSDEV = "${libdir}/libdb.so"
> +FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
>
>   #configuration - set in local.conf to override
>   # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
>   DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
>
> -EXTRA_OECONF = "${DB5_CONFIG}"
> +EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx"
>
>   # Override the MUTEX setting here, the POSIX library is
>   # the default - "POSIX/pthreads/library".
> @@ -80,16 +85,17 @@ do_configure() {
>   	oe_runconf
>   }
>
> +do_compile_prepend_class-target() {
> +	sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' \
> +		${B}/libtool
> +}
> +
>   do_install_append() {
>   	mkdir -p ${D}/${includedir}/db51
> -	#mv ${D}/${includedir}/db_185.h ${D}/${includedir}/db51/.
>   	mv ${D}/${includedir}/db.h ${D}/${includedir}/db51/.
>   	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db51/.
> -	#mv ${D}/${includedir}/dbsql.h ${D}/${includedir}/db51/.
> -	#ln -s db51/db_185.h ${D}/${includedir}/db_185.h
>   	ln -s db51/db.h ${D}/${includedir}/db.h
>   	ln -s db51/db_cxx.h ${D}/${includedir}/db_cxx.h
> -	#ln -s db51/dbsql.h ${D}/${includedir}/dbsql.h
>
>   	# The docs end up in /usr/docs - not right.
>   	if test -d "${D}/${prefix}/docs"
> @@ -103,6 +109,7 @@ do_install_append() {
>   }
>
>   INSANE_SKIP_${PN} = "dev-so"
> +INSANE_SKIP_${PN}-cxx = "dev-so"
>
>   BBCLASSEXTEND = "native nativesdk"
>
>

