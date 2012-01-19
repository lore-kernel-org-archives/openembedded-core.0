Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RnocS-000610-PL
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:49:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jan 2012 01:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108623184"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2012 01:41:40 -0800
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 19 Jan 2012 17:40:50 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Thu, 19 Jan 2012 17:40:49 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.21]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.90]) with mapi id
	14.01.0355.002; Thu, 19 Jan 2012 17:40:49 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] gcc-common.inc: Added shared source
	support for basichash.
Thread-Index: AQHM1HEYuWbrKmUE/0W5qA0K+j+gdZYP1XWQgAMQdgCAAIxQsA==
Date: Thu, 19 Jan 2012 09:40:49 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FCBF7E0@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326714004.git.lianhao.lu@intel.com>
	<2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
	<1326733174.2933.3.camel@ted>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCA9A7E@SHSMSX102.ccr.corp.intel.com>
	<1326964344.2511.49.camel@ted>
In-Reply-To: <1326964344.2511.49.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] gcc-common.inc: Added shared source support for basichash.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 09:49:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Richard Purdie wrote on 2012-01-19:
> On Tue, 2012-01-17 at 03:05 +0000, Lu, Lianhao wrote:
>> Richard Purdie wrote on 2012-01-17:
>>> On Mon, 2012-01-16 at 19:43 +0800, Lianhao Lu wrote:
>>>=20
>>> Can you please check if this can be fixed by:
>>>=20
>>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/=
recipes-devtools/gcc/gcc-configure-common.inc
>>> index d014980..3a82720 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>>> @@ -77,6 +77,9 @@ do_headerfix () {
>>>=20
>>>  addtask headerfix after do_unpack before do_patch
>>> +CROSS_TARGET_SYS_DIR[vardepsexclude] =3D "PN"
>>> +CROSS_TARGET_SYS_DIR[vardepvalue] =3D "1"
>>> +
>>>  do_configure_prepend () {
>>>         # teach gcc to find correct target includedir when checking lib=
c ssp support
>>>         mkdir -p ${B}/gcc
>>> as discussed in the "sstate info" thread?
>>>=20
>>=20
>> By using this patch, gcc-cross-initial, gcc-cross-intermediate,
>> gcc-cross would have the same signatures for tasks like do_fetch,
>> do_unpack, do_headerfix, do_patch. But libgcc still has different
>> signature with gcc-cross-initial for task do_patch.
>>=20
>> By bitbake-diffsigs the do_patch signature files between gcc-cross-initi=
al and libgcc, it says:
>>   Dependency on task gcc-cross-initial_4.6.bb.do_unpack was added
>>   Dependency on task gcc-cross-initial_4.6.bb.do_headerfix was added
>>   Dependency on task libgcc_4.6.bb.do_unpack was removed
>> Besides, gcc-runtime seems have an additional patch file "fortran-cross-=
compile-hack.patch" which was never got be used. This would
> results all the signature difference between gcc-cross-initial and gcc-ru=
ntime. After I remove that unused patch file, the signatures begin to
> differ in  task do_headerfix and do_patch. By bitbake-diffsigs the do_hea=
derfix sigangure files between gcc-cross-initial and gcc-runtime,
> we could see tons of variable values, variable dependencies, task depende=
ncies difference.
>>=20
>> So I think this patch alone is not enough to solve all the problems here=
.
>=20
> Agreed, there are further issues. The patch should really move into the
> main SRC_URI which would resolve that problem. libgcc should really be
> able to see the do_headerfix task so we could move that from
> gcc-configure-common to gcc-common.inc.
>=20
> This might not be all of the differences but should get us closer to
> solving this problem!
>=20

By moving the gcc-runtime specific patch into main SRC_URI, gcc-runtime sti=
ll has different signature with gcc-cross-initial for task do_headerfix. Bi=
tbake-diffsigs gives the following information. Is it possible that the dif=
ference comes from the "inherit cross" in gcc-cross.inc?

$ bitbake-diffsigs gcc-cross-initial-4.6.2+svnr181430-r20.do_headerfix.sigd=
ata.6305744411a4f2d0055d98b5d8c2dd51 gcc-runtime-4.6.2+svnr181430-r20.do_he=
aderfix.sigdata.2d8cad118dd54b302eadae3db11021fa
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'ARMPKGARCH', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'AR=
MPKGSFX_ENDIAN', 'ARMPKGSFX_FPU', 'ARMPKGSFX_THUMB', 'AS', 'ASNEEDED', 'BRA=
NCH', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'B=
UILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS',=
 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_F77', 'BUILD_LD', 'BUILD_LDFLAGS', '=
BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX=
', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCACH=
E', 'CCACHE_DIR', 'CCLD', 'CFLAGS', 'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CROS=
S_TARGET_SYS_DIR', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_=
OPTIMIZATION', 'F77', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HO=
ST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_VENDOR', 'LC_A=
LL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MAKE', 'MULTIM=
ACH_HOST_SYS', 'NM', 'OBJCOPY', 'OBJDUMP', 'OPIEDIR', 'PACKAGE_ARCH', 'PATC=
H_GET', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIB=
DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISA=
BLED', 'PV', 'QPEDIR', 'QTDIR', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SI=
TECONFIG_SYSROOTCACHE', 'SRCPV', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING=
_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE', 'STRIP', 'T=
ARGET_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET=
_LDFLAGS', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_SYS', 'TARGET_VEN=
DOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_PKGARCH', 'base_bindir', 'bas=
e_libdir', 'base_prefix', 'base_sbindir', 'baselib', 'bindir', 'datadir', '=
docdir', 'exec_prefix', 'includedir', 'includedir_native', 'infodir', 'libd=
ir', 'libdir_native', 'libexecdir', 'localstatedir', 'lt_cv_sys_lib_dlsearc=
h_path_spec', 'mandir', 'oldincludedir', 'palmqtdir', 'palmtopdir', 'prefix=
', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'siteinfo_da=
ta', 'siteinfo_get_files', 'sysconfdir']
to:
['ABIEXTENSION', 'AR', 'ARMPKGARCH', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'AR=
MPKGSFX_ENDIAN', 'ARMPKGSFX_FPU', 'ARMPKGSFX_THUMB', 'ARM_INSTRUCTION_SET',=
 'ARM_THUMB_M_OPT', 'AS', 'ASNEEDED', 'BRANCH', 'BUILD_AR', 'BUILD_ARCH', '=
BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUI=
LD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', '=
BUILD_F77', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUIL=
D_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP',=
 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCACHE', 'CCACHE_DIR', 'CCLD', 'CFLAGS=
', 'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEB=
UG_FLAGS', 'DEBUG_OPTIMIZATION', 'F77', 'FULL_OPTIMIZATION', 'HOST_ARCH', '=
HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'H=
OST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE=
', 'MAKE', 'MULTIMACH_HOST_SYS', 'NM', 'OBJCOPY', 'OBJDUMP', 'OPIEDIR', 'PA=
CKAGE_ARCH', 'PATCH_GET', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED=
', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', =
'PR', 'PSEUDO_DISABLED', 'PV', 'QPEDIR', 'QTDIR', 'RANLIB', 'S', 'SELECTED_=
OPTIMIZATION', 'SITECONFIG_SYSROOTCACHE', 'SRCPV', 'STAGING_DATADIR', 'STAG=
ING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NA=
TIVE', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_=
CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD=
_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS=
', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_=
CCARGS', 'TUNE_LDARGS', 'TUNE_PKGARCH', 'base_bindir', 'base_libdir', 'base=
_prefix', 'base_sbindir', 'baselib', 'bindir', 'datadir', 'docdir', 'exec_p=
refix', 'includedir', 'includedir_native', 'infodir', 'libdir', 'libdir_nat=
ive', 'libexecdir', 'localstatedir', 'lt_cv_sys_lib_dlsearch_path_spec', 'm=
andir', 'oldincludedir', 'palmqtdir', 'palmtopdir', 'prefix', 'prefix_nativ=
e', 'sbindir', 'servicedir', 'sharedstatedir', 'siteinfo_data', 'siteinfo_g=
et_files', 'sysconfdir']
basehash changed from e593cd201ee425228fc7eea0dc86c848 to 00eacaec12ed71089=
c4a54c532ce9996
List of dependencies for variable CXXFLAGS changed from set(['BUILD_CFLAGS'=
]) to set([])
changed items: set(['BUILD_CFLAGS'])
List of dependencies for variable prefix changed from set(['STAGING_DIR_NAT=
IVE', 'prefix_native']) to set([])
changed items: set(['STAGING_DIR_NATIVE', 'prefix_native'])
List of dependencies for variable HOST_OS changed from set(['BUILD_OS']) to=
 set(['TARGET_OS'])
changed items: set(['TARGET_OS', 'BUILD_OS'])
List of dependencies for variable HOST_VENDOR changed from set(['BUILD_VEND=
OR']) to set(['TARGET_VENDOR'])
changed items: set(['TARGET_VENDOR', 'BUILD_VENDOR'])
List of dependencies for variable base_bindir changed from set(['bindir']) =
to set(['base_prefix'])
changed items: set(['base_prefix', 'bindir'])
List of dependencies for variable HOST_CC_ARCH changed from set(['BUILD_CC_=
ARCH']) to set(['TARGET_CC_ARCH'])
changed items: set(['BUILD_CC_ARCH', 'TARGET_CC_ARCH'])
List of dependencies for variable PKG_CONFIG_DIR changed from set(['STAGING=
_DIR', 'TUNE_PKGARCH', 'libdir', 'TARGET_VENDOR', 'TARGET_OS']) to set(['ST=
AGING_DIR_HOST', 'libdir'])
changed items: set(['STAGING_DIR_HOST', 'STAGING_DIR', 'TARGET_VENDOR', 'TU=
NE_PKGARCH', 'TARGET_OS'])
List of dependencies for variable libdir changed from set(['exec_prefix', '=
CROSS_TARGET_SYS_DIR']) to set(['exec_prefix', 'baselib'])
changed items: set(['CROSS_TARGET_SYS_DIR', 'baselib'])
List of dependencies for variable LDFLAGS changed from set(['BUILD_LDFLAGS'=
]) to set(['TARGET_LDFLAGS'])
changed items: set(['TARGET_LDFLAGS', 'BUILD_LDFLAGS'])
List of dependencies for variable HOST_LD_ARCH changed from set(['BUILD_LD_=
ARCH']) to set(['TARGET_LD_ARCH'])
changed items: set(['BUILD_LD_ARCH', 'TARGET_LD_ARCH'])
List of dependencies for variable base_prefix changed from set(['STAGING_DI=
R_NATIVE']) to set([])
changed items: set(['STAGING_DIR_NATIVE'])
List of dependencies for variable bindir changed from set(['exec_prefix', '=
CROSS_TARGET_SYS_DIR']) to set(['exec_prefix'])
changed items: set(['CROSS_TARGET_SYS_DIR'])
List of dependencies for variable HOST_ARCH changed from set(['BUILD_ARCH']=
) to set(['TARGET_ARCH'])
changed items: set(['BUILD_ARCH', 'TARGET_ARCH'])
List of dependencies for variable PKG_CONFIG_SYSROOT_DIR changed from set([=
'STAGING_DIR', 'TUNE_PKGARCH', 'TARGET_VENDOR', 'TARGET_OS']) to set(['STAG=
ING_DIR_HOST'])
changed items: set(['STAGING_DIR', 'TUNE_PKGARCH', 'STAGING_DIR_HOST', 'TAR=
GET_VENDOR', 'TARGET_OS'])
List of dependencies for variable base_sbindir changed from set(['bindir'])=
 to set(['base_prefix'])
changed items: set(['base_prefix', 'bindir'])
List of dependencies for variable HOST_PREFIX changed from set(['BUILD_PREF=
IX']) to set(['TARGET_PREFIX'])
changed items: set(['BUILD_PREFIX', 'TARGET_PREFIX'])
List of dependencies for variable TOOLCHAIN_OPTIONS changed from set([]) to=
 set(['STAGING_DIR_TARGET'])
changed items: set(['STAGING_DIR_TARGET'])
List of dependencies for variable sbindir changed from set(['bindir']) to s=
et(['exec_prefix'])
changed items: set(['exec_prefix', 'bindir'])
List of dependencies for variable CFLAGS changed from set(['BUILD_CFLAGS'])=
 to set(['TARGET_CFLAGS'])
changed items: set(['TARGET_CFLAGS', 'BUILD_CFLAGS'])
List of dependencies for variable exec_prefix changed from set(['STAGING_DI=
R_NATIVE', 'prefix_native']) to set([])
changed items: set(['STAGING_DIR_NATIVE', 'prefix_native'])
List of dependencies for variable HOST_AS_ARCH changed from set(['BUILD_AS_=
ARCH']) to set(['TARGET_AS_ARCH'])
changed items: set(['TARGET_AS_ARCH', 'BUILD_AS_ARCH'])
List of dependencies for variable libexecdir changed from set(['exec_prefix=
', 'CROSS_TARGET_SYS_DIR']) to set(['exec_prefix'])
changed items: set(['CROSS_TARGET_SYS_DIR'])
Dependency on variable CROSS_TARGET_SYS_DIR was added
Dependency on Variable TUNE_CCARGS was removed
Dependency on Variable ARM_INSTRUCTION_SET was removed
Dependency on Variable TARGET_AS_ARCH was removed
Dependency on Variable ARM_THUMB_M_OPT was removed
Dependency on Variable TARGET_PREFIX was removed
Dependency on Variable TUNE_LDARGS was removed
Dependency on Variable TUNE_ASARGS was removed
Dependency on Variable TARGET_LD_ARCH was removed
Dependency on Variable TARGET_CC_ARCH was removed
Variable CXXFLAGS value changed from ${BUILD_CFLAGS} to -O2 -pipe -g -felim=
inate-unused-debug-types -fpermissive
Variable prefix value changed from ${STAGING_DIR_NATIVE}${prefix_native} to=
 /usr
Variable HOST_OS value changed from ${BUILD_OS} to ${TARGET_OS}
Variable HOST_VENDOR value changed from ${BUILD_VENDOR} to ${TARGET_VENDOR}
Variable base_bindir value changed from ${bindir} to ${base_prefix}/bin
Variable HOST_CC_ARCH value changed from ${BUILD_CC_ARCH} to ${TARGET_CC_AR=
CH}
Variable PKG_CONFIG_DIR value changed from ${STAGING_DIR}/${TUNE_PKGARCH}${=
TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig to ${STAGING_DIR_HOST}/${lib=
dir}/pkgconfig
Variable libdir value changed from ${exec_prefix}/lib/${CROSS_TARGET_SYS_DI=
R} to ${exec_prefix}/${baselib}
Variable LDFLAGS value changed from ${BUILD_LDFLAGS} to ${TARGET_LDFLAGS}
Variable HOST_LD_ARCH value changed from ${BUILD_LD_ARCH} to ${TARGET_LD_AR=
CH}
Variable base_prefix value changed from ${STAGING_DIR_NATIVE} to
Variable bindir value changed from ${exec_prefix}/bin/${CROSS_TARGET_SYS_DI=
R} to ${exec_prefix}/bin
Variable HOST_ARCH value changed from ${BUILD_ARCH} to ${TARGET_ARCH}
Variable PKG_CONFIG_SYSROOT_DIR value changed from ${STAGING_DIR}/${TUNE_PK=
GARCH}${TARGET_VENDOR}-${TARGET_OS} to ${STAGING_DIR_HOST}
Variable base_sbindir value changed from ${bindir} to ${base_prefix}/sbin
Variable HOST_PREFIX value changed from ${BUILD_PREFIX} to ${TARGET_PREFIX}
Variable TOOLCHAIN_OPTIONS value changed from  to  --sysroot=3D${STAGING_DI=
R_TARGET}
Variable sbindir value changed from ${bindir} to ${exec_prefix}/sbin
Variable CFLAGS value changed from ${BUILD_CFLAGS} to ${TARGET_CFLAGS}
Variable exec_prefix value changed from ${STAGING_DIR_NATIVE}${prefix_nativ=
e} to /usr
Variable HOST_AS_ARCH value changed from ${BUILD_AS_ARCH} to ${TARGET_AS_AR=
CH}
Variable libexecdir value changed from ${exec_prefix}/libexec/${CROSS_TARGE=
T_SYS_DIR} to ${exec_prefix}/libexec
Dependency on task gcc-cross-initial_4.6.bb.do_unpack was added
Dependency on task gcc-runtime_4.6.bb.do_unpack was removed

Best Regards,
Lianhao




