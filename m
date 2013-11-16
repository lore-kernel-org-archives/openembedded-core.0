Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id BB0F76D476
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 15:56:36 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so1549700eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=d+N54J07xd2YBtafEtZX6ee+JThEGGs9TcFiPAZpmHk=;
	b=sw6RSuDEjOYKDHADQcv3ChdtoqhxZFujIb4ZGKKGr3Q4t5iKXHfLCWI1UbMAYtljgM
	KytNn+J2V0OgAOn8y5njIbl/2paYfuHHCM/PKUCp9Y+s2Kg07eNmnv/ZP+ztuTFGWLcd
	gE5j2CR5cGm2aWmgDcs3Qud44qLf0TOrcAkXE9ErCblpITEVXweh4Z/4HoY6ewIGisYz
	lLZbdAiQ+qfCjRoGJmfQMgtJi1WWHZhibY8mi8DC4FBqaLzTOfV78GRQIMfLR+b+tX/R
	1S9TuJm0FEGY3Luel02KahBvElQyoKEFALV3RLmO1WMUEasZzVDdAhiM+gKdxOKcgSLM
	Pj3A==
X-Received: by 10.14.205.8 with SMTP id i8mr205630eeo.19.1384617398194;
	Sat, 16 Nov 2013 07:56:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm17906458eew.18.2013.11.16.07.56.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Nov 2013 07:56:37 -0800 (PST)
Date: Sat, 16 Nov 2013 16:57:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131116155704.GH31430@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Interesting case of different signature in TUNE_PKGARCH recipe
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
X-List-Received-Date: Sat, 16 Nov 2013 15:56:37 -0000
X-Groupsio-MsgNum: 47166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WHz+neNWvhIGAO8A"
Content-Disposition: inline

--WHz+neNWvhIGAO8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Found in:
meta-oe/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb

this line:
CONFIGUREOPTS :=3D "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-s=
ilent-rules', ' ')}"

is able to trick variable tracking code to forget that STAGING_DIR_HOST is =
included in
BB_HASHBASE_WHITELIST, it came from:
meta/classes/autotools.bbclass:def append_libtool_sysroot(d):
   --with-libtool-sysroot=3D${STAGING_DIR_HOST}

So it behaves like with
CONFIGUREOPTS[vardepvalue] =3D "${CONFIGUREOPTS}"

And the result is:

basehash changed from c54dc1c615c0a94b3e5a072c72325ba3 to 6bea3354c011fa0e4=
dce25bba058806b
Variable CONFIGUREOPTS value changed from '=20
--build=3Dx86_64-linux               =20
--host=3Di586-webos-linux                              =20
--target=3Di586-webos-linux                =20
--prefix=3D/usr                                    =20
--exec_prefix=3D/usr               =20
--bindir=3D/usr/bin                =20
--sbindir=3D/usr/sbin                    =20
--libexecdir=3D/usr/lib/libdvdread                         =20
--datadir=3D/usr/share               =20
--sysconfdir=3D/etc
--sharedstatedir=3D/com            =20
--localstatedir=3D/var             =20
--libdir=3D/usr/lib                =20
--includedir=3D/usr/include                =20
--oldincludedir=3D/usr/include             =20
--infodir=3D/usr/share/info                =20
--mandir=3D/usr/share/man                                  =20
--disable-dependency-tracking            =20
--with-libtool-sysroot=3D/home/mjansa/build-webos/BUILD-qemux86copy/sysroot=
s/qemux86copy' to '=20
--build=3Dx86_64-linux             =20
--host=3Di586-webos-linux                  =20
--target=3Di586-webos-linux                =20
--prefix=3D/usr            =20
--exec_prefix=3D/usr               =20
--bindir=3D/usr/bin                =20
--sbindir=3D/usr/sbin              =20
--libexecdir=3D/usr/lib/libdvdread                 =20
--datadir=3D/usr/share             =20
--sysconfdir=3D/etc                =20
--sharedstatedir=3D/com            =20
--localstatedir=3D/var             =20
--libdir=3D/usr/lib                =20
--includedir=3D/usr/include                =20
--oldincludedir=3D/usr/include             =20
--infodir=3D/usr/share/info                =20
--mandir=3D/usr/share/man                                  =20
--disable-dependency-tracking            =20
--with-libtool-sysroot=3D/home/mjansa/build-webos/BUILD-qemux86/sysroots/qe=
mux86'

Good news is that rewriting that line with new _remove operator as:
CONFIGUREOPTS_remove =3D "--disable-silent-rules"
makes signatures the same.

For curious people there is bitbake-diffsigs between old CONFIGUREOPTS line=
 and new one:
Task dependencies changed from:
['ABIEXTENSION', 'ACLOCALDIR', 'AR', 'ARMPKGARCH', 'ARMPKGARCH_tune-cortexa=
8t-neon', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'ARMPKGSFX_ENDIAN', 'ARMPKGSFX=
_FPU', 'ARMPKGSFX_THUMB', 'AS', 'ASNEEDED', 'AUTOTOOLS_AUXDIR', 'B', 'BASE_=
WORKDIR', 'BP', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH=
', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', =
'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_F77', 'BUILD_LD', '=
BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_O=
S', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VEND=
OR', 'CACHED_CONFIGUREVARS', 'CC', 'CCLD', 'CC_FOR_BUILD', 'CFLAGS', 'CFLAG=
S_FOR_BUILD', 'CONFIGUREOPTS', 'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CPPFLAGS_=
FOR_BUILD', 'CPP_FOR_BUILD', 'CXX', 'CXXFLAGS', 'CXXFLAGS_FOR_BUILD', 'CXX_=
FOR_BUILD', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEFAULTTUN=
E', 'EXTENDPE', 'EXTRA_AUTORECONF', 'EXTRA_OECONF', 'F77', 'FULL_OPTIMIZATI=
ON', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS'=
, 'HOST_PREFIX', 'LC_ALL', 'LD', 'LDFLAGS', 'LDFLAGS_FOR_BUILD', 'LD_FOR_BU=
ILD', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS',=
 'NM', 'OBJCOPY', 'OBJDUMP', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PKG_CONFIG=
_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_P=
ATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'RANLI=
B', 'S', 'SELECTED_OPTIMIZATION', 'SITECONFIG_SYSROOTCACHE', 'SPECIAL_PKGSU=
FFIX', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DATADIR_NA=
TIVE', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGI=
NG_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TA=
RGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARG=
ET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARG=
ET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ASARG=
S', 'TUNE_CCARGS', 'TUNE_FEATURES', 'TUNE_FEATURES_tune-armv7a', 'TUNE_FEAT=
URES_tune-armv7at', 'TUNE_FEATURES_tune-armv7at-neon', 'TUNE_FEATURES_tune-=
cortexa8t-neon', 'TUNE_LDARGS', 'TUNE_PKGARCH', 'WORKDIR', 'acpaths', 'auto=
tools_copy_aclocal', 'autotools_do_configure', 'base_bindir', 'base_libdir'=
, 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir',=
 'baselib', 'bbfatal', 'bbnote', 'bindir', 'datadir', 'datadir_native', 'do=
_configure[umask]', 'docdir', 'exec_prefix', 'includedir', 'includedir_nati=
ve', 'infodir', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', '=
lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir', 'oe_run=
conf', 'oldincludedir', 'prefix', 'prefix_native', 'sbindir', 'servicedir',=
 'sharedstatedir', 'siteinfo_data', 'siteinfo_get_files', 'sysconfdir', 'sy=
stemd_unitdir']
to:
['ABIEXTENSION', 'ACLOCALDIR', 'AR', 'ARMPKGARCH', 'ARMPKGARCH_tune-cortexa=
8t-neon', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'ARMPKGSFX_ENDIAN', 'ARMPKGSFX=
_FPU', 'ARMPKGSFX_THUMB', 'AS', 'ASNEEDED', 'AUTOTOOLS_AUXDIR', 'B', 'BASE_=
WORKDIR', 'BP', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH=
', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', =
'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_F77', 'BUILD_LD', '=
BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_O=
S', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VEND=
OR', 'CACHED_CONFIGUREVARS', 'CC', 'CCLD', 'CC_FOR_BUILD', 'CFLAGS', 'CFLAG=
S_FOR_BUILD', 'CONFIGUREOPTS', 'CONFIGUREOPT_DEPTRACK', 'CONFIG_SITE', 'CPP=
', 'CPPFLAGS', 'CPPFLAGS_FOR_BUILD', 'CPP_FOR_BUILD', 'CXX', 'CXXFLAGS', 'C=
XXFLAGS_FOR_BUILD', 'CXX_FOR_BUILD', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_O=
PTIMIZATION', 'DEFAULTTUNE', 'EXTENDPE', 'EXTRA_AUTORECONF', 'EXTRA_OECONF'=
, 'F77', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', =
'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_AL=
L', 'LD', 'LDFLAGS', 'LDFLAGS_FOR_BUILD', 'LD_FOR_BUILD', 'LIBCEXTENSION', =
'LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS', 'NM', 'OBJCOPY', 'OBJD=
UMP', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISA=
BLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSRO=
OT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'RANLIB', 'S', 'SELECTED_OPTI=
MIZATION', 'SITECONFIG_SYSROOTCACHE', 'SPECIAL_PKGSUFFIX', 'STAGING_BASE_LI=
BDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE', 'STAGING_DIR', '=
STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE', 'STR=
INGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_=
CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD=
_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS=
', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUN=
E_FEATURES', 'TUNE_FEATURES_tune-armv7a', 'TUNE_FEATURES_tune-armv7at', 'TU=
NE_FEATURES_tune-armv7at-neon', 'TUNE_FEATURES_tune-cortexa8t-neon', 'TUNE_=
LDARGS', 'TUNE_PKGARCH', 'WORKDIR', 'acpaths', 'append_libtool_sysroot', 'a=
utotools_copy_aclocal', 'autotools_do_configure', 'base_bindir', 'base_libd=
ir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindi=
r', 'baselib', 'bbfatal', 'bbnote', 'bindir', 'datadir', 'datadir_native', =
'do_configure[umask]', 'docdir', 'exec_prefix', 'includedir', 'includedir_n=
ative', 'infodir', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir'=
, 'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir', 'oe_=
runconf', 'oldincludedir', 'prefix', 'prefix_native', 'sbindir', 'servicedi=
r', 'sharedstatedir', 'siteinfo_data', 'siteinfo_get_files', 'sysconfdir', =
'systemd_unitdir']
basehash changed from 8f1454bacc1e96701a2ea517850e91bd to 68ef3e1148747a594=
c65a7cc0ce93565
List of dependencies for variable CONFIGUREOPTS changed from 'set([])' to '=
set(['CONFIGUREOPT_DEPTRACK', 'HOST_SYS', 'sysconfdir', 'infodir', 'TARGET_=
SYS', 'libdir', 'localstatedir', 'datadir', 'includedir', 'sharedstatedir',=
 'prefix', 'BUILD_SYS', 'sbindir', 'bindir', 'exec_prefix', 'libexecdir', '=
oldincludedir', 'append_libtool_sysroot', 'mandir'])'
Dependency on Variable HOST_SYS was removed
Dependency on Variable CONFIGUREOPT_DEPTRACK was removed
Dependency on Variable HOST_VENDOR was removed
Dependency on Variable append_libtool_sysroot was removed
Variable CONFIGUREOPTS value changed from ' --build=3Dx86_64-linux         =
         --host=3Darm-oe-linux-gnueabi             --target=3Darm-oe-linux-=
gnueabi                   --prefix=3D/usr                   --exec_prefix=
=3D/usr              --bindir=3D/usr/bin               --sbindir=3D/usr/sbi=
n             --libexecdir=3D/usr/lib/libdvdread                --datadir=
=3D/usr/share            --sysconfdir=3D/etc               --sharedstatedir=
=3D/com                   --localstatedir=3D/var            --libdir=3D/usr=
/lib               --includedir=3D/usr/include               --oldincludedi=
r=3D/usr/include            --infodir=3D/usr/share/info               --man=
dir=3D/usr/share/man                                 --disable-dependency-t=
racking                   --with-libtool-sysroot=3D/OE/build/shr-core/tmp-e=
glibc/sysroots/maguro' to ' --build=3D${BUILD_SYS}                 --host=
=3D${HOST_SYS}              --target=3D${TARGET_SYS}                  --pre=
fix=3D${prefix}              --exec_prefix=3D${exec_prefix}            --bi=
ndir=3D${bindir}              --sbindir=3D${sbindir}            --libexecdi=
r=3D${libexecdir}              --datadir=3D${datadir}            --sysconfd=
ir=3D${sysconfdir}              --sharedstatedir=3D${sharedstatedir}       =
       --localstatedir=3D${localstatedir}                --libdir=3D${libdi=
r}              --includedir=3D${includedir}              --oldincludedir=
=3D${oldincludedir}                --infodir=3D${infodir}            --mand=
ir=3D${mandir}                              ${CONFIGUREOPT_DEPTRACK}       =
         ${@append_libtool_sysroot(d)}'
Dependency on Variable HOST_SYS was removed
Dependency on Variable CONFIGUREOPT_DEPTRACK was removed
Dependency on Variable HOST_VENDOR was removed
Dependency on Variable append_libtool_sysroot was removed
Variable CONFIGUREOPTS value changed from ' --build=3Dx86_64-linux         =
         --host=3Darm-oe-linux-gnueabi             --target=3Darm-oe-linux-=
gnueabi                   --prefix=3D/usr                   --exec_prefix=
=3D/usr              --bindir=3D/usr/bin               --sbindir=3D/usr/sbi=
n             --libexecdir=3D/usr/lib/libdvdread                --datadir=
=3D/usr/share            --sysconfdir=3D/etc               --sharedstatedir=
=3D/com                   --localstatedir=3D/var            --libdir=3D/usr=
/lib               --includedir=3D/usr/include               --oldincludedi=
r=3D/usr/include            --infodir=3D/usr/share/info               --man=
dir=3D/usr/share/man                                 --disable-dependency-t=
racking                   --with-libtool-sysroot=3D/OE/build/shr-core/tmp-e=
glibc/sysroots/maguro' to ' --build=3D${BUILD_SYS}                 --host=
=3D${HOST_SYS}              --target=3D${TARGET_SYS}                  --pre=
fix=3D${prefix}              --exec_prefix=3D${exec_prefix}            --bi=
ndir=3D${bindir}              --sbindir=3D${sbindir}            --libexecdi=
r=3D${libexecdir}              --datadir=3D${datadir}            --sysconfd=
ir=3D${sysconfdir}              --sharedstatedir=3D${sharedstatedir}       =
       --localstatedir=3D${localstatedir}                --libdir=3D${libdi=
r}              --includedir=3D${includedir}              --oldincludedir=
=3D${oldincludedir}                --infodir=3D${infodir}            --mand=
ir=3D${mandir}                              ${CONFIGUREOPT_DEPTRACK}       =
         ${@append_libtool_sysroot(d)}'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WHz+neNWvhIGAO8A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKHldAACgkQN1Ujt2V2gBw6HgCdEzXXtxHdkHEXxaiZeCam6B40
0XwAn3OlJprf5ZGvIIc9Zhca0zxqRqdC
=zQWn
-----END PGP SIGNATURE-----

--WHz+neNWvhIGAO8A--
