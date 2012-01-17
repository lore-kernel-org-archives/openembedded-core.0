Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Rn5ZY-0003lQ-LO
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 10:43:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 01:35:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96655759"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 01:35:41 -0800
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 17 Jan 2012 17:35:06 +0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 17 Jan 2012 17:35:05 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.88]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.60]) with mapi id
	14.01.0355.002; Tue, 17 Jan 2012 17:35:04 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC PATCH 1/1] self-hosted-image: generate the
	.hdddirect and .vmdk image files
Thread-Index: AQHM0UeyU1yk2xenJUWATGL4Q+iM6ZYQQ4Eg
Date: Tue, 17 Jan 2012 09:35:04 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FC9F275@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326221405.git.dexuan.cui@intel.com>
	<020d54ed54c0ad9a1a7cc63ca8660f5b5451b361.1326221405.git.dexuan.cui@intel.com>
	<4F0F0AE5.4040009@linux.intel.com>
In-Reply-To: <4F0F0AE5.4040009@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/1] self-hosted-image: generate the .hdddirect and .vmdk image files
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
X-List-Received-Date: Tue, 17 Jan 2012 09:43:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2012-01-13:
> Hi Dexuan,
>=20
> Please include a complete patch header. Much of your 0/1 content can
> go here.
(Sorry for the late reply! I overlooked the mails...)
Ok, I'll pay attention to this in future.

> Comments below...
>=20
> On 01/10/2012 10:53 AM, Dexuan Cui wrote:
>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>> ---
>>  meta/classes/boot-directdisk.bbclass          |   10 +++++++++-
>>  meta/recipes-core/images/self-hosted-image.bb |   11 +++++++++--
>>  2 files changed, 18 insertions(+), 3 deletions(-)
>> diff --git a/meta/classes/boot-directdisk.bbclass
>> b/meta/classes/boot-directdisk.bbclass index 8879ba8..83ec929 100644
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
>>  PACKAGES =3D " "
>>  EXCLUDE_FROM_WORLD =3D "1"
>> @@ -38,7 +39,7 @@ BOOTDD_EXTRA_SPACE ?=3D "16384"
>>=20
>>  AUTO_SYSLINUXCFG =3D "1"
>>  LABELS =3D "boot"
>> -APPEND =3D "root=3D/dev/sda2"
>> +APPEND =3D "root=3D/dev/hda2"
>=20
> This seems like it had the potential to break other uses of hdddirect.
> Qemu may use hda2, but other hdddirect users (external layers for
Hi Darren, thanks for pointing this out!
I thought it's ok since now I'm the only user ofhdddirect, but I didn't rea=
lize I might break external layers...

> example) may not. This feels like a MACHINE config to me. In fact,
> machine's do already set APPEND for things like the console.
I agree.
So, I think here we should change the =3D to ?=3D like the below
-APPEND =3D "root=3D/dev/sda2"
+APPEND ?=3D "root=3D/dev/sda2"
And in meta/conf/machine/include/qemu.inc, I can add a line
APPEND =3D "root=3D/dev/hda2".

Does this sound ok?

>=20
>>  TIMEOUT =3D "10"
>>  SYSLINUXCFG  =3D "${HDDDIR}/syslinux.cfg"
>>  SYSLINUXMENU =3D "${HDDDIR}/menu"
>> @@ -50,6 +51,7 @@ build_boot_dd() {
>>=20
>>  	install -d ${HDDDIR}
>>  	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage
> ${HDDDIR}/vmlinuz
>> +	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
>=20
> Hrm... syslinux.cfg wasn't installed before at all?
I'm not very clear about the history, but according to syslinux.bbclass,
iso and hddimg do invoke syslinux_populate, but hdddirect doesn't -- I supp=
ose hdddirect doesn't need all the functionality of build_syslinux_menu, so=
 it tries to install the files itself, and unluckily it misses syslinux.cfg=
. Now there is no user of .hdddirect in poky, and I don't know there is any=
 actual external user. This may explain why nobody complains. :-)


>=20
>>  	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys
>> ${HDDDIR}/ldlinux.sys
>>=20
>>  	BLOCKS=3D`du -bks ${HDDDIR} | cut -f 1` @@ -83,6 +85,12 @@
>>  build_boot_dd() { 	cd ${DEPLOY_DIR_IMAGE} 	rm -f
>>  ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect 	ln -s
>>  ${IMAGE_NAME}.hdddirect
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
>> +
>> +	if [ "${NOVMDK}" !=3D "1" ] ; then
>> +		${STAGING_BINDIR_NATIVE}/qemu-img convert -O vmdk   \
>=20
> You've added a dependency on qemu-img, please add the appropriate
> DEPENDS above.
I have added the line in my patch:
do_bootdirectdisk[depends] +=3D "qemu-native:do_populate_sysroot"

I think this is enough?
Need I add "DEPENDS +=3D "qemu-native", too?

>=20
>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect \
>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>> +	fi
>>  }
>> =20
>>  python do_bootdirectdisk() {

> Darren Hart wrote on 2012-01-13:
> On 01/10/2012 10:53 AM, Dexuan Cui wrote:
>=20
> A couple additional thoughts about the boot-directdisk class in general:
>=20
> So build_boot_dd needs a careful audit to ensure the various dd
> commands do not stomp on eachother iirc, the dd of syslinux/mbr.bin
> was stomping on the partition table or some such.
Hi Darren,
The dd-ing of mbr.bin actually writes only the first 440 bytes of $IMAGE --=
 please note
the size of mbr.bin(generated by the recipe syslinux, I think) is 440 bytes=
 rather than 512 bytes. :-)
I think 440 is safe enough because it's even smaller than 512-16*4=3D448 by=
tes.

> Also note that it uses "mkdosfs -d" which we have purged (and it aint
> coming back if my NACK is worth anything ;-). Sounds like we need to
> abstract building msdos images into an msdosfs.bbclass. No reason to
Would you volunteer to make a msdosfs.bbclass? :-)

> duplicate all the fatfs overhead calculations I did yesterday (See the
> patch I sent yesterday to bootimg.bbclass).
I agree.
I see your patch has been in poky master now.
If you could help to make msdosfs.bbclass, I would appreciate that a lot.
Now I'm stick in something else and I'm afraid I can't start to work on thi=
s immediately. :-(

Thanks,
-- Dexuan




