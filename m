Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qnh8l-0004JH-Gs
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 03:17:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2011 18:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,297,1309762800"; d="scan'208";a="34343832"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2011 18:13:34 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 1 Aug 2011 09:12:47 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 1 Aug 2011 09:12:46 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Mon, 1 Aug 2011
	09:12:45 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 09:12:44 +0800
Thread-Topic: [OE-core] [PATCH 2/3] package(rootfs)_ipk.bbclass: support
	multilib in opkg backend.
Thread-Index: AcxO1RGsMvBmtRV/TKaSxfPsphGfCABEoBtg
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2C844F92FC@shsmsx502.ccr.corp.intel.com>
References: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
	<98d2970ed91756d79ee3903dc0fd3d907d9bdf65.1311720062.git.richard.purdie@linuxfoundation.org>
	<4953517.rmrrWIv0Tx@perseus>
In-Reply-To: <4953517.rmrrWIv0Tx@perseus>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] package(rootfs)_ipk.bbclass: support	multilib in opkg backend.
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
X-List-Received-Date: Mon, 01 Aug 2011 01:17:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote on 2011-07-31:
> On Tuesday, July 26, 2011 11:50:26 PM Richard Purdie wrote:
>> From: Lianhao Lu <lianhao.lu@intel.com>
>>=20
>> Support install multiple multilib in opkg backend.
>>=20
>> The installation is done in 3 phases.
>>=20
>> Phase 1: install normal packages to IMAGE_ROOTFS.
>>=20
>> Phase 2: install multilib packages under MULTILIB_TEMP_ROOTFS.
>> Packages belongs to the same multilib arch would be installed to a
>> unique directory.
>>=20
>> Phase 3: check file confliction between IMAGE_ROOTFS and
>> MULTILIB_TEMP_ROOTFS, install multilib packages to IMAGE_ROOTFS only
>> if the sanity check passed.
>>=20
>> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>> ---
>>  meta/classes/package_ipk.bbclass |   51
>> ++++++++++++++++++++++++++++++++++++++ meta/classes/rootfs_ipk.bbclass
>> ++++++++++++++++++++++++++++++++++++++ |
>>  2 +
>>  2 files changed, 53 insertions(+), 0 deletions(-)
>> diff --git a/meta/classes/package_ipk.bbclass
>> b/meta/classes/package_ipk.bbclass index 0c0f00d..b7afa83 100644
>> --- a/meta/classes/package_ipk.bbclass
>> +++ b/meta/classes/package_ipk.bbclass
>> @@ -61,6 +61,28 @@ python package_ipk_install () {
>>  		raise bb.build.FuncFailed
>>  }
>> +package_tryout_install_multilib_ipk() {
>> +	#try install multilib
>> +	multilib_tryout_dirs=3D""
>> +	for arch in ${MULTILIB_ARCHS}; do
>> +		local target_rootfs=3D"${MULTILIB_TEMP_ROOTFS}/${arch}"
>> +		local ipkg_args=3D"-f ${INSTALL_CONF_IPK} -o ${target_rootfs}
>> --force_overwrite" +		local selected_pkg=3D""
>> +		#strip the "ml" from package_arch
>> +		local pkgarch_prefix=3D"${arch:2}-"
>> +		for pkg in "${INSTALL_PACKAGES_MULTILIB_IPK}"; do
>> +			if [ ${pkg:0:${#pkgarch_prefix}} =3D=3D ${pkgarch_prefix} ]; then
>> +			    selected_pkg=3D"${selected_pkg} ${pkg}"
>> +			fi
>> +		done
>> +		if [ ! -z "${selected_pkg}" ]; then
>> +			mkdir -p ${target_rootfs}/${opkglibdir}
>> +			opkg-cl ${ipkg_args} update
>> +			opkg-cl ${ipkg_args} install ${selected_pkg}
>> +			multilib_tryout_dirs=3D"${multilib_tryout_dirs} ${target_rootfs}"
>> +		fi
>> +	done
>> +}
>=20
> we use --force-overwrite and if mistakenly if a multilib package
> installs into standard paths will opkg inform about it ?

I'm afraid it will not. That's why we need to check the confliction before =
we finally get the multilib packages installed.
=20
>>  #
>>  # install a bunch of packages using opkg  # the following shell
>> variables needs to be set before calling this func:
>> @@ -78,6 +100,7 @@ package_install_internal_ipk() {
>>  	local package_to_install=3D"${INSTALL_PACKAGES_NORMAL_IPK}" 	local
>>  package_attemptonly=3D"${INSTALL_PACKAGES_ATTEMPTONLY_IPK}" 	local
>>  package_lingusa=3D"${INSTALL_PACKAGES_LINGUAS_IPK}" +	local
>>  package_multilib=3D"${INSTALL_PACKAGES_MULTILIB_IPK}" 	local
>>  task=3D"${INSTALL_TASK_IPK}"
>> =20
>>  	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/ @@ -102,6 +125,14
>>  @@ package_install_internal_ipk() { 	if [ ! -z
>>  "${package_attemptonly}" ]; then 		opkg-cl ${ipkg_args} install
>>  ${package_attemptonly} >
>> "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}" || true fi
>> +
>> +	package_tryout_install_multilib_ipk
>> +	#sanity check
>> +	multilib_sanity_check  ${target_rootfs} ${multilib_tryout_dirs}||
>> +exit 1
>> +
>> +	if [ ! -z "${package_multilib}" ]; then
>> +		opkg-cl ${ipkg_args} install ${package_multilib}
>> +	fi
>>  }
>> =20
>>  ipk_log_check() { @@ -142,6 +173,11 @@ package_update_index_ipk () {
>>  		packagedirs=3D"$packagedirs ${DEPLOY_DIR_IPK}/$arch
>> ${DEPLOY_DIR_IPK}/$sdkarch-nativesdk" done
>>=20
>> +	multilib_archs=3D"${MULTILIB_ARCHS}"
>> +	for arch in $multilib_archs; do
>> +		packagedirs=3D"$packagedirs ${DEPLOY_DIR_IPK}/$arch"
>> +	done
>> +
>>  	for pkgdir in $packagedirs; do 		if [ -e $pkgdir/ ]; then 			touch
>>  $pkgdir/Packages @@ -173,6 +209,13 @@ package_generate_ipkg_conf () {
>>  		        echo "src oe-$sdkarch$extension
>>  file:${DEPLOY_DIR_IPK}/$sdkarch$extension" >> ${IPKGCONF_SDK} fi 	done
>> +
>> +	multilib_archs=3D"${MULTILIB_ARCHS}"
>> +	for arch in $multilib_archs; do
>> +		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
>> +		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >>
>> ${IPKGCONF_TARGET} +		fi
>> +	done
>>  }
>> =20
>>  package_generate_archlist () { @@ -188,6 +231,14 @@
>>  package_generate_archlist () { 		echo "arch $sdkarch$extension
>>  $priority" >> ${IPKGCONF_SDK} 		priority=3D$(expr $priority + 5) 	done
>> +
>> +	multilib_archs=3D"${MULTILIB_ARCHS}"
>> +	for arch in $multilib_archs; do
>> +		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
>> +		priority=3D$(expr $priority + 5)
>> +	done
>> +
>> +
>>  }
>> =20
>>  python do_package_ipk () {
>> diff --git a/meta/classes/rootfs_ipk.bbclass
>> b/meta/classes/rootfs_ipk.bbclass index 4fcacc6..695bee0 100644
>> --- a/meta/classes/rootfs_ipk.bbclass
>> +++ b/meta/classes/rootfs_ipk.bbclass
>> @@ -22,6 +22,7 @@ opkglibdir =3D "${localstatedir}/lib/opkg"
>>=20
>>  # Which packages to not install on the basis of a recommendation
>> BAD_RECOMMENDATIONS ?=3D ""
>> +MULTILIBRE_ALLOW_REP =3D "${opkglibdir}"
>>=20
>>  fakeroot rootfs_ipk_do_rootfs () { 	set -x @@ -58,6 +59,7 @@ fakeroot
>>  rootfs_ipk_do_rootfs () { 	export INSTALL_ROOTFS_IPK=3D"${IMAGE_ROOTFS}=
"
>>  	export INSTALL_CONF_IPK=3D"${IPKGCONF_TARGET}" 	export
>>  INSTALL_PACKAGES_NORMAL_IPK=3D"${PACKAGE_INSTALL}"
>> +	export INSTALL_PACKAGES_MULTILIB_IPK=3D"${MULTILIB_PACKAGE_INSTALL}"
>>=20
>>  	package_install_internal_ipk

Best Regards,
Lianhao




