Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TxqOp-0001vX-1c
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 03:49:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N2Xhi1005501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 18:33:43 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 22 Jan 2013 18:33:41 -0800
Message-ID: <50FF4C54.9020200@windriver.com>
Date: Wed, 23 Jan 2013 10:35:00 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1358853878.git.kai.kang@windriver.com>
	<0d6ea9677eea7e35d709f802f646a8dbf5971250.1358853878.git.kai.kang@windriver.com>
	<50FEC533.10403@linux.intel.com>
In-Reply-To: <50FEC533.10403@linux.intel.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r0N2Xhi1005501
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
X-List-Received-Date: Wed, 23 Jan 2013 02:50:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B401=E6=9C=8823=E6=97=A5 00:58, Saul Wold wrote:
> On 01/22/2013 03:30 AM, Kang Kai wrote:
>> external-python-tarball only can be built when inherit package_ipk now.
>> Update it to reuse existed populate sdk code that it could be built fo=
r
>> rpm and deb too.
>>
>> [Yocto 3006]
>>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> meta/recipes-core/meta/external-python-tarball.bb | 69=20
>> ++-------------------
>> 1 files changed, 6 insertions(+), 63 deletions(-)
>>
>> diff --git a/meta/recipes-core/meta/external-python-tarball.bb=20
>> b/meta/recipes-core/meta/external-python-tarball.bb
>> index 2085acc..186bf50 100644
>> --- a/meta/recipes-core/meta/external-python-tarball.bb
>> +++ b/meta/recipes-core/meta/external-python-tarball.bb
>> @@ -3,19 +3,16 @@ LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D=20
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>> file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2=
0420"
>>
>> -DEPENDS =3D "opkg-native opkg-utils-native virtual/fakeroot-native=20
>> sed-native"
>> +DEPENDS =3D "virtual/fakeroot-native sed-native"
>>
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> inherit meta
>> +inherit populate_sdk
>>
>> -SDK_DIR =3D "${WORKDIR}/sdk"
>> -SDK_OUTPUT =3D "${SDK_DIR}/image"
>> -SDK_DEPLOY =3D "${TMPDIR}/deploy/sdk"
>> +TOOLCHAIN_TARGET_TASK =3D ""
>>
>> -IPKG_HOST =3D "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
>> -
>> -TOOLCHAIN_HOST_TASK ?=3D "\
>> +TOOLCHAIN_HOST_TASK =3D "\
>> nativesdk-python-core \
>> nativesdk-python-textutils \
>> nativesdk-python-sqlite3 \
>> @@ -37,62 +34,8 @@ TOOLCHAIN_HOST_TASK ?=3D "\
>> nativesdk-chrpath \
>> "
>>
>> -TOOLCHAIN_OUTPUTNAME ?=3D "python-nativesdk-standalone-${SDKMACHINE}"
>> +TOOLCHAIN_OUTPUTNAME =3D "python-nativesdk-standalone-${SDKMACHINE}"
>>
> Why are you changing the above two from being overriden to straight=20
> assignments? Don't we want these to possibly be overriden with=20
> additional TASK info or allow the name to change?

Hi Saul,

Vars TOOLCHAIN_OUTPUTNAME TOOLCHAIN_HOST_TASK and TOOLCHAIN_TARGET_TASK=20
are also defined with ?=3D in populate_sdk_base.bbclass, so I simply=20
thought to override them in external-python-tarball.bb with '=3D'.
Sorry for that, I'll update with inheriting bbclasses at the end of .bb=20
file.

Regards,
Kai

>
> This is not explained in the commit message
>
>
> Sau!
>
>> RDEPENDS =3D "${TOOLCHAIN_HOST_TASK}"
>>
>> EXCLUDE_FROM_WORLD =3D "1"
>> -
>> -do_populate_sdk() {
>> - rm -rf ${SDK_OUTPUT}
>> - mkdir -p ${SDK_OUTPUT}
>> - mkdir -p ${SDK_OUTPUT}${localstatedir}/lib/opkg/
>> -
>> - rm -f ${IPKGCONF_TARGET}
>> - touch ${IPKGCONF_TARGET}
>> - rm -f ${IPKGCONF_SDK}
>> - touch ${IPKGCONF_SDK}
>> -
>> - package_update_index_ipk
>> - package_generate_ipkg_conf
>> -
>> - for arch in ${PACKAGE_ARCHS}; do
>> - revipkgarchs=3D"$arch $revipkgarchs"
>> - done
>> -
>> - ${IPKG_HOST} update
>> - ${IPKG_HOST} install ${TOOLCHAIN_HOST_TASK}
>> -
>> - install -d=20
>> ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg
>> - mv ${SDK_OUTPUT}/var/lib/opkg/*=20
>> ${SDK_OUTPUT}/${SDKPATHNATIVE}${localstatedir_nativesdk}/lib/opkg/
>> - rm -Rf ${SDK_OUTPUT}/var
>> -
>> - install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}
>> - install -m 0644 ${IPKGCONF_SDK}=20
>> ${SDK_OUTPUT}/${SDKPATHNATIVE}/${sysconfdir}/
>> -
>> - rm -f ${SDK_OUTPUT}/${SDKPATHNATIVE}${libdir_nativesdk}/*.la
>> -
>> - # Link the ld.so.cache file into the hosts filesystem
>> - ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cach=
e
>> -
>> - # Add version information
>> - versionfile=3D${SDK_OUTPUT}/${SDKPATH}/version-${MULTIMACH_TARGET_SY=
S}
>> - touch $versionfile
>> - echo 'Distro: ${DISTRO}' >> $versionfile
>> - echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
>> - echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
>> - echo 'Timestamp: ${DATETIME}' >> $versionfile
>> -
>> - # Package it up
>> - mkdir -p ${SDK_DEPLOY}
>> - cd ${SDK_OUTPUT}
>> - tar --owner=3Droot --group=3Droot -cj=20
>> --file=3D${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
>> -}
>> -
>> -do_populate_sdk[nostamp] =3D "1"
>> -do_populate_sdk[recrdeptask] =3D "do_package_write"
>> -addtask populate_sdk before do_build after do_install
>> -
>> -inherit blacklist
>> -
>> -PNBLACKLIST[external-python-tarball] =3D=20
>> "${@base_contains('PACKAGE_CLASSES', 'package_ipk', '', 'This recipe=20
>> requires \'package_ipk\' support to be enabled in PACKAGE_CLASSES.',=20
>> d)}"
>>
>



