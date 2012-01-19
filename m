Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RngvW-0006WS-KL
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 02:36:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2012 17:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113802882"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2012 17:22:15 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 19 Jan 2012 09:21:37 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.21]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.90]) with mapi id
	14.01.0355.002; Thu, 19 Jan 2012 09:21:36 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC PATCH 1/1][v2] self-hosted-image: generate the
	.hdddirect and .vmdk image files
Thread-Index: AQHM1fu5qN+lC/AnZEi3c9lVtAWAJJYS4/8A
Date: Thu, 19 Jan 2012 01:21:36 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCAB7F8@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326894448.git.dexuan.cui@intel.com>
	<84776a87449ee57fcf3a568562cb0957da04f8bc.1326894448.git.dexuan.cui@intel.com>
	<4F16EEFD.1020700@linux.intel.com>
In-Reply-To: <4F16EEFD.1020700@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>
Subject: Re: [RFC PATCH 1/1][v2] self-hosted-image: generate the .hdddirect and .vmdk image files
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
X-List-Received-Date: Thu, 19 Jan 2012 01:36:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2012-01-19:
> On 01/18/2012 06:18 AM, Dexuan Cui wrote:
>> The self-hosted-image work needs a live-bootable and r/w-able image
>> format. The existing .iso isn't ok since it's readonly. The existing
>> .hddimg is not a good choice, since it has a two-option(boot, install)
>> syslinux function that we don't need: we don't hope a user to be
>> potentially able to "install", and I think it may be not suitble to
>> hack build_hddimg to hide the "install"? Moreever, .hddimg is not that
>> compatibible with some devices and we hope to have the most
>> compatibility.
>>=20
> Please use a spell checker here
> suitable
> Moreover
> compatible
I'm very sorry about this... I'll be more careful in future. :-)

>> So I think the .hdddirect format is a good choice and I made this patch
>> to adopt it and also enhanced boot-directdisk.bbclass to generate .vmdk
>> image so we can run it on vmware, too. BTW, currently self-hosted-image
>> is the only user of boot-directdisk.bbclass; with the adoption of
>> .hdddirect and .vmdk formats, a user can still use "IMAGE_FSTYPES +=3D
>> 'live'" to generate the .iso and .hddimg format.
>>=20
>> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
>> ---
>>   meta/classes/boot-directdisk.bbclass          |    8 ++++++++
>>   meta/conf/machine/include/qemu.inc            |    2 ++
>>   meta/recipes-core/images/self-hosted-image.bb |   11 +++++++++--
>>   3 files changed, 19 insertions(+), 2 deletions(-)
>> diff --git a/meta/classes/boot-directdisk.bbclass
>> b/meta/classes/boot-directdisk.bbclass index 8879ba8..7f14225 100644
>> --- a/meta/classes/boot-directdisk.bbclass +++
>> b/meta/classes/boot-directdisk.bbclass @@ -24,6 +24,7 @@
>> do_bootdirectdisk[depends] +=3D "dosfstools-native:do_populate_sysroot \
>>=20
>> syslinux-native:do_populate_sysroot \
>>=20
>> parted-native:do_populate_sysroot \
>>=20
>> mtools-native:do_populate_sysroot " +do_bootdirectdisk[depends] +=3D
>> "qemu-native:do_populate_sysroot"
>>=20
>>   PACKAGES =3D " "
>>   EXCLUDE_FROM_WORLD =3D "1"
>> @@ -50,6 +51,7 @@ build_boot_dd() {
>>=20
>>   	install -d ${HDDDIR}
>>   	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage
>> ${HDDDIR}/vmlinuz
>> +	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
>>   	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys
>> ${HDDDIR}/ldlinux.sys
>>=20
>>   	BLOCKS=3D`du -bks ${HDDDIR} | cut -f 1` @@ -83,6 +85,12 @@
>>   build_boot_dd() { 	cd ${DEPLOY_DIR_IMAGE} 	rm -f
>>   ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect 	ln -s
>>   ${IMAGE_NAME}.hdddirect
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
>> +
>> +	if [ "${NOVMDK}" !=3D "1" ] ; then
> Why make this a "double negative", Why not have a CREATE_VMDK check?
>=20
>> +		${STAGING_BINDIR_NATIVE}/qemu-img convert -O vmdk   \
>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect \
>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>> +	fi
>>   }
>>  =20
>>   python do_bootdirectdisk() {
>> diff --git a/meta/conf/machine/include/qemu.inc
>> b/meta/conf/machine/include/qemu.inc index 3cebfab..a5b563b 100644 ---
>> a/meta/conf/machine/include/qemu.inc +++
>> b/meta/conf/machine/include/qemu.inc @@ -5,6 +5,8 @@ MACHINE_FEATURES =
=3D
>> "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
>>=20
>>   IMAGE_FSTYPES ?=3D "tar.bz2 ext3"
>> +APPEND_${MACHINE} =3D "root=3D/dev/hda2"
>> +
> I thought this was to become ?=3D
There is some side effort with ?=3D.
Darren expressed his concern in a later mail. I have to think more about th=
is.

>>   ROOT_FLASH_SIZE =3D "280"
>>  =20
>>   # Don't include kernels in standard images diff --git
>> a/meta/recipes-core/images/self-hosted-image.bb
>> b/meta/recipes-core/images/self-hosted-image.bb
>> index 111c057..df6c81f 100644
>> --- a/meta/recipes-core/images/self-hosted-image.bb
>> +++ b/meta/recipes-core/images/self-hosted-image.bb
>> @@ -6,6 +6,13 @@ POKY_EXTRA_INSTALL =3D "\
>>=20
>>   IMAGE_FEATURES +=3D "x11-mini"
>> -inherit core-image +# Needed by boot-directdisk +ROOTFS ?=3D
>> "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>>=20
>> -PR =3D "r2"
>> +inherit core-image boot-directdisk
>> +
>> +do_bootimg[depends] +=3D "${INITRD_IMAGE}:do_rootfs"
>> +do_bootimg[depends] +=3D "${IMAGE_BASENAME}:do_rootfs"
>> +do_bootdirectdisk[depends] +=3D "${PN}:do_rootfs"
>> +
>> +PR =3D "r3"

Thanks,
-- Dexuan



