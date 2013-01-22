Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TxhQ7-0006XF-JI
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 18:13:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Jan 2013 08:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,515,1355126400"; d="scan'208";a="193972699"
Received: from unknown (HELO [10.255.15.40]) ([10.255.15.40])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jan 2013 08:58:27 -0800
Message-ID: <50FEC533.10403@linux.intel.com>
Date: Tue, 22 Jan 2013 08:58:27 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1358853878.git.kai.kang@windriver.com>
	<0d6ea9677eea7e35d709f802f646a8dbf5971250.1358853878.git.kai.kang@windriver.com>
In-Reply-To: <0d6ea9677eea7e35d709f802f646a8dbf5971250.1358853878.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] external-python-tarball: code refactoring
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 17:14:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2013 03:30 AM, Kang Kai wrote:
> external-python-tarball only can be built when inherit package_ipk now.
> Update it to reuse existed populate sdk code that it could be built for
> rpm and deb too.
>
> [Yocto 3006]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   meta/recipes-core/meta/external-python-tarball.bb |   69 ++-------------------
>   1 files changed, 6 insertions(+), 63 deletions(-)
>
> diff --git a/meta/recipes-core/meta/external-python-tarball.bb b/meta/recipes-core/meta/external-python-tarball.bb
> index 2085acc..186bf50 100644
> --- a/meta/recipes-core/meta/external-python-tarball.bb
> +++ b/meta/recipes-core/meta/external-python-tarball.bb
> @@ -3,19 +3,16 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>                       file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>
> -DEPENDS = "opkg-native opkg-utils-native virtual/fakeroot-native sed-native"
> +DEPENDS = "virtual/fakeroot-native sed-native"
>
> -PR = "r1"
> +PR = "r2"
>
>   inherit meta
> +inherit populate_sdk
>
> -SDK_DIR = "${WORKDIR}/sdk"
> -SDK_OUTPUT = "${SDK_DIR}/image"
> -SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
> +TOOLCHAIN_TARGET_TASK = ""
>
> -IPKG_HOST = "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
> -
> -TOOLCHAIN_HOST_TASK ?= "\
> +TOOLCHAIN_HOST_TASK = "\
>       nativesdk-python-core \
>       nativesdk-python-textutils \
>       nativesdk-python-sqlite3 \
> @@ -37,62 +34,8 @@ TOOLCHAIN_HOST_TASK ?= "\
>       nativesdk-chrpath \
>       "
>
> -TOOLCHAIN_OUTPUTNAME ?= "python-nativesdk-standalone-${SDKMACHINE}"
> +TOOLCHAIN_OUTPUTNAME = "python-nativesdk-standalone-${SDKMACHINE}"
>
Why are you changing the above two from being overriden to straight 
assignments?  Don't we want these to possibly be overriden with 
additional TASK info or allow the name to change?

This is not explained in the commit message


Sau!

>   RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
>
>   EXCLUDE_FROM_WORLD = "1"
> -
> -do_populate_sdk() {
> -	rm -rf ${SDK_OUTPUT}
> -	mkdir -p ${SDK_OUTPUT}
> -	mkdir -p ${SDK_OUTPUT}${localstatedir}/lib/opkg/
> -
> -	rm -f ${IPKGCONF_TARGET}
> -	touch ${IPKGCONF_TARGET}
> -	rm -f ${IPKGCONF_SDK}
> -	touch ${IPKGCONF_SDK}
> -
> -	package_update_index_ipk
> -	package_generate_ipkg_conf
> -
> -	for arch in ${PACKAGE_ARCHS}; do
> -		revipkgarchs="$arch $revipkgarchs"
> -	done
> -
> -	${IPKG_HOST} update
> -	${IPKG_HOST} install ${TOOLCHAIN_HOST_TASK}
> -
> -	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg
> -	mv ${SDK_OUTPUT}/var/lib/opkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg/
> -	rm -Rf ${SDK_OUTPUT}/var
> -
> -	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}
> -	install -m 0644 ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}/
> -
> -	rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/*.la
> -
> -	# Link the ld.so.cache file into the hosts filesystem
> -	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
> -
> -	# Add version information
> -	versionfile=${SDK_OUTPUT}/${SDKPATH}/version-${MULTIMACH_TARGET_SYS}
> -	touch $versionfile
> -	echo 'Distro: ${DISTRO}' >> $versionfile
> -	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
> -	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
> -	echo 'Timestamp: ${DATETIME}' >> $versionfile
> -
> -	# Package it up
> -	mkdir -p ${SDK_DEPLOY}
> -	cd ${SDK_OUTPUT}
> -	tar  --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
> -}
> -
> -do_populate_sdk[nostamp] = "1"
> -do_populate_sdk[recrdeptask] = "do_package_write"
> -addtask populate_sdk before do_build after do_install
> -
> -inherit blacklist
> -
> -PNBLACKLIST[external-python-tarball] = "${@base_contains('PACKAGE_CLASSES', 'package_ipk', '', 'This recipe requires \'package_ipk\' support to be enabled in PACKAGE_CLASSES.', d)}"
>


