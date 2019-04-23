Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA97B6D6DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 07:51:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3N7pDg7024753
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Apr 2019 00:51:23 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 23 Apr 2019 00:51:03 -0700
To: Chad Gibeaut <chadg@videx.com>, oe-core
	<openembedded-core@lists.openembedded.org>
References: <917454045-31000@mail.videx.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <03f1c4a6-7d01-394c-0e31-3b2d93783092@windriver.com>
Date: Tue, 23 Apr 2019 15:51:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <917454045-31000@mail.videx.com>
Subject: Re: [bitbake-devel] QA Error for DB
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
X-List-Received-Date: Tue, 23 Apr 2019 07:51:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Chad,

This emails should go into oe-core mailing list (Please see the To list).
And I think that something is wrong with:

> # The executables go in a separate package - typically there
> # is no need to install these unless doing real database
> # management on the system.
> inherit lib_package
> 
> PACKAGES =+ "${PN}-cxx"
> FILES_${PN}-cxx = "${libdir}/*cxx*so"

Only -dev/-dbg/nativesdk- packages can contain .so (endswith .so) file,
so you can try:

FILES_${PN}-dev += "${libdir}/*cxx*so"

This is just a rough suggestion, I didn't try it, you need test it
carefully before really use it.

> 
> 
> # The dev package has the .so link (as in db3) and the .a's -
> # it is therefore incompatible (cannot be installed at the
> # same time) as the db3 package
> # sort out the .so since they do version prior to the .so
> SOLIBS = "-6*.so"
> FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"


// Robert


On 4/20/19 1:43 AM, Chad Gibeaut wrote:
> I am building images(yocto,bitbake,busybox) for two differnt karo SOM's. Both of 
> the configuration files are the same (including my own software)
> 
> One build fails during the QA portion of the build process on the recipe for the 
> Berkeley DB from Oracle. I am not even sure what is requiring this, but 
> something does.
> 
> |ERROR: db-6.0.30-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package 
> contains symlink .so: db path 
> 'work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db/usr/lib/libdb-6.so' 
> [dev-so] ERROR: db-6.0.30-r0 do_package_qa: QA run found fatal errors. Please 
> consider fixing them. ERROR: db-6.0.30-r0 do_package_qa: Function failed: 
> do_package_qa ERROR: Logfile of failure stored in: 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/temp/log.do_package_qa.1270 
> ERROR: Task 2138 
> (/home/test/karo/fsl-community-bsp_5011/sources/poky/meta/recipes-support/db/db_6.0.30.bb, 
> do_package_qa) failed with exit code '1' |
> 
> In the folder the error mentions is the .so file along with a link back to that 
> same so file minus the minor version.
> 
> |-rwxr-xr-x 2 test test 1.1M Apr 9 12:23 libdb-6.0.so lrwxrwxrwx 1 test test 12 
> Apr 9 12:24 libdb-6.so -> libdb-6.0.so |
> 
> This linked file is being created during the build at some point (removing the 
> linked file or even the whole build directory and rerunning results in the same 
> issue)
> 
> I think I could probably find a way to disable the QA check, but thats not ideal 
> since something requires this and I dont like having to disable checks for 
> production code.
> 
> The Error log file mentioned in the error is here:
> 
> -----------------------------------------------------------------------------------------------------------------------------------------------------------ERROR 
> Log-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> |DEBUG: Executing python function sstate_task_prefunc DEBUG: Python function 
> sstate_task_prefunc finished DEBUG: Executing python function do_package_qa 
> NOTE: DO PACKAGE QA DEBUG: Executing python function read_subpackage_metadata 
> DEBUG: Python function read_subpackage_metadata finished NOTE: Package db 
> skipping QA tests: ['dev-soalready-stripped'] NOTE: Checking Package: db NOTE: 
> arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db/usr/lib/libdb-6.0.so 
> ERROR: QA Issue: non -dev/-dbg/nativesdk- package contains symlink .so: db path 
> 'work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db/usr/lib/libdb-6.so' 
> [dev-so] NOTE: Checking Package: db-bin NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_stat 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_deadlock 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_replicate 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_log_verify 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_verify 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_upgrade 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_printlog 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_archive 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_hotbackup 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_dump 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_load 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_checkpoint 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_recover 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-bin/usr/bin/db_tuner 
> NOTE: Checking Package: db-staticdev NOTE: Checking Package: db-dev NOTE: 
> Package db-cxx skipping QA tests: ['dev-so'] NOTE: Checking Package: db-cxx 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-cxx/usr/lib/libdb_cxx-6.0.so 
> NOTE: Checking Package: db-doc NOTE: Checking Package: db-dbg NOTE: 
> arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_stat 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_deadlock 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_replicate 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_log_verify 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_verify 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_upgrade 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_printlog 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_archive 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_hotbackup 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_dump 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_load 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_checkpoint 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_recover 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/bin/.debug/db_tuner 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/lib/.debug/libdb_cxx-6.0.so 
> NOTE: arm-poky-linux-gnueabi-objdump -p 
> /home/test/karo/fsl-community-bsp_5011/build/tmp/work/cortexa7hf-neon-poky-linux-gnueabi/db/6.0.30-r0/packages-split/db-dbg/usr/lib/.debug/libdb-6.0.so 
> NOTE: Checking Package: db-locale ERROR: QA run found fatal errors. Please 
> consider fixing them. DEBUG: Python function do_package_qa finished ERROR: 
> Function failed: do_package_qa |
> 
> -----------------------------------------------------------------------------------------------------------------------------------------------------------ERROR 
> Log-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> And the busy box recipe is below(from the repo somewhere). There is some mention 
> in there about dev so files, but Im not sure if that might be the issue or even 
> what changes might need to be made then.
> 
> 
> 
> 
> -----------------------------------------------------------------------------------------------------------------------------------------------------------BB 
> File-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
> 
> |
> 
> 
> 
> # Version 6 of the Berkeley DB from Oracle (formerly Sleepycat) # # At present 
> this package only installs the DB code # itself (shared libraries, .a in the dev 
> package), # documentation and headers. # # The headers have the same names as 
> those as v3 # of the DB, only one version can be used *for dev* # at once - DB3 
> and DB6 can both be installed on the # same system at the same time if really 
> necessary. SECTION = "libs" SUMMARY = "Berkeley Database v6" HOMEPAGE = 
> "http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/overview/index.html" 
> LICENSE = "AGPL-3.0" VIRTUAL_NAME ?= "virtual/db" RCONFLICTS_${PN} = "db3" # 
> Note, when upgraded to 6.1.x, a patch in RPM will need to be removed to activate 
> db 6.1 support. SRC_URI = 
> "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz" SRC_URI += 
> "file://arm-thumb-mutex_db5.patch;patchdir=.. \ file://fix-parallel-build.patch 
> \ file://Makefile-let-libso_target-depend-on-bt_rec.patch \ 
> file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch;patchdir=.. \ " 
> SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b" SRC_URI[sha256sum] = 
> "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2" # Exclude NC 
> versions which lack AES encryption UPSTREAM_CHECK_REGEX = 
> "db-(?P<pver>\d+\.\d+(\.\d+)?).tar" UPSTREAM_CHECK_URI = 
> "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html" 
> LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490" 
> inherit autotools # Put virtual/db in any appropriate provider of a # relational 
> database, use it as a dependency in # place of a specific db and use: # # 
> PREFERRED_PROVIDER_virtual/db # # to select the correct db in the build (distro) 
> .conf PROVIDES += "${VIRTUAL_NAME}" # bitbake isn't quite clever enough to deal 
> with sleepycat, # the distribution sits in the expected directory, but all # the 
> builds must occur from a sub-directory. The following # persuades bitbake to go 
> to the right place S = "${WORKDIR}/db-${PV}/dist" B = 
> "${WORKDIR}/db-${PV}/build_unix" SPDX_S = "${WORKDIR}/db-${PV}" # The 
> executables go in a separate package - typically there # is no need to install 
> these unless doing real database # management on the system. inherit lib_package 
> PACKAGES =+ "${PN}-cxx" FILES_${PN}-cxx = "${libdir}/*cxx*so" # The dev package 
> has the .so link (as in db3) and the .a's - # it is therefore incompatible 
> (cannot be installed at the # same time) as the db3 package # sort out the .so 
> since they do version prior to the .so SOLIBS = "-6*.so" FILES_SOLIBSDEV = 
> "${libdir}/libdb.so ${libdir}/libdb_cxx.so" #configuration - set in local.conf 
> to override # All the --disable-* options replace --enable-smallbuild, which 
> breaks a bunch of stuff (eg. postfix) DB6_CONFIG ?= "--enable-o_direct 
> --disable-cryptography --disable-queue --disable-replication --disable-verify 
> --disable-compat185 --disable-sql" EXTRA_OECONF = "${DB6_CONFIG} --enable-shared 
> --enable-cxx --with-sysroot" # Override the MUTEX setting here, the POSIX 
> library is # the default - "POSIX/pthreads/library". # Don't ignore the nice SWP 
> instruction on the ARM: # These enable the ARM assembler mutex code ARM_MUTEX = 
> "--with-mutex=ARM/gcc-assembly" MUTEX = "" MUTEX_arm = "${ARM_MUTEX}" 
> MUTEX_armeb = "${ARM_MUTEX}" EXTRA_OECONF += "${MUTEX}" 
> EXTRA_OEMAKE_class-target = 
> "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool" # Cancel the site stuff - 
> it's set for db3 and destroys the # configure. CONFIG_SITE = "" do_configure() { 
> gnu-configize --force ${S} export STRIP="true" oe_runconf } do_compile_prepend() 
> { sed -i -e 's|hardcode_into_libs=yes|hardcode_into_libs=no|' \ ${B}/libtool } 
> do_install_append() { mkdir -p ${D}/${includedir}/db60 mv 
> ${D}/${includedir}/db.h ${D}/${includedir}/db60/. mv ${D}/${includedir}/db_cxx.h 
> ${D}/${includedir}/db60/. ln -s db60/db.h ${D}/${includedir}/db.h ln -s 
> db60/db_cxx.h ${D}/${includedir}/db_cxx.h # The docs end up in /usr/docs - not 
> right. if test -d "${D}/${prefix}/docs" then mkdir -p "${D}/${datadir}" test ! 
> -d "${D}/${docdir}" || rm -rf "${D}/${docdir}" mv "${D}/${prefix}/docs" 
> "${D}/${docdir}" fi chown -R root:root ${D} } INSANE_SKIP_${PN} = "dev-so" 
> INSANE_SKIP_${PN}-cxx = "dev-so" BBCLASSEXTEND = "native nativesdk" |
> 
> 
> 
> Thanks,
> Chad
> 
> 
> Cyberlock, Inc. | Videx, Inc. | 1105 NE Circle Blvd. | Corvallis, OR 97330 | 
> (541) 738-5500
> This email is intended only for the addressee(s) and may include material that 
> is privileged, confidential, and protected from disclosure. No contract is 
> intended. ©2019 Videx, Inc.
> 

