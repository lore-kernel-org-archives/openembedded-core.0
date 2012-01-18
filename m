Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RnWuS-0004mw-2p
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:54:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2012 06:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113589039"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2012 06:17:58 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 Jan 2012 22:17:51 +0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 18 Jan 2012 22:17:50 +0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.213]) by
	SHSMSX102.ccr.corp.intel.com ([169.254.2.21]) with mapi id
	14.01.0355.002; Wed, 18 Jan 2012 22:18:07 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] [RFC PATCH 1/1] self-hosted-image: generate the
	.hdddirect and .vmdk image files
Thread-Index: AQHM0UeyU1yk2xenJUWATGL4Q+iM6ZYQQ4Eg///qSQCAAgRiAA==
Date: Wed, 18 Jan 2012 14:17:49 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCA4141@SHSMSX101.ccr.corp.intel.com>
References: <cover.1326221405.git.dexuan.cui@intel.com>
	<020d54ed54c0ad9a1a7cc63ca8660f5b5451b361.1326221405.git.dexuan.cui@intel.com>
	<4F0F0AE5.4040009@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FC9F275@SHSMSX102.ccr.corp.intel.com>
	<4F159136.5030001@linux.intel.com>
In-Reply-To: <4F159136.5030001@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 18 Jan 2012 14:54:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2012-01-17:
> On 01/17/2012 01:35 AM, Cui, Dexuan wrote:
>> Darren Hart wrote on 2012-01-13:
>> So, I think here we should change the =3D to ?=3D like the below -APPEND
>> =3D "root=3D/dev/sda2"
>> +APPEND ?=3D "root=3D/dev/sda2"
>> And in meta/conf/machine/include/qemu.inc, I can add a line APPEND =3D
>> "root=3D/dev/hda2".
>>=20
>> Does this sound ok?
>=20
> That seems appropriate to me.
I decide not to change the line in boot-directdisk.bbclass and I think addi=
ng
a line
APPEND_${MACHINE} =3D "root=3D/dev/hda2"
in qemu.inc should be ok.
This is because ?=3D can have some side effort, i.e., in the case of atom, =
in
atom-pc.conf, APPEND is already assigned a value that isn't suitable for sy=
slinux.=20

>>=20
>>>=20
>>>>  TIMEOUT =3D "10"
>>>>  SYSLINUXCFG  =3D "${HDDDIR}/syslinux.cfg"
>>>>  SYSLINUXMENU =3D "${HDDDIR}/menu"
>>>> @@ -50,6 +51,7 @@ build_boot_dd() {
>>>>=20
>>>>  	install -d ${HDDDIR}
>>>>  	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage
>>> ${HDDDIR}/vmlinuz
>>>> +	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
>>>=20
>>> Hrm... syslinux.cfg wasn't installed before at all?
>> I'm not very clear about the history, but according to
>> syslinux.bbclass, iso and hddimg do invoke syslinux_populate, but
>> hdddirect doesn't -- I suppose hdddirect doesn't need all the
>> functionality of build_syslinux_menu, so it tries to install the
>> files itself, and unluckily it misses syslinux.cfg. Now there is no
>> user of .hdddirect in poky, and I don't know there is any actual
>> external user. This may explain why nobody complains. :-)
>=20
> This sounds like an opportunity to modularize and reuse to me.
Agree. We should try to improve the code here in future.

>>=20
>>>=20
>>>>  	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys
>>>> ${HDDDIR}/ldlinux.sys
>>>>=20
>>>>  	BLOCKS=3D`du -bks ${HDDDIR} | cut -f 1` @@ -83,6 +85,12 @@
>>>>  build_boot_dd() { 	cd ${DEPLOY_DIR_IMAGE} 	rm -f
>>>>  ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect 	ln -s
>>>>  ${IMAGE_NAME}.hdddirect
>>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect
>>>> +
>>>> +	if [ "${NOVMDK}" !=3D "1" ] ; then
>>>> +		${STAGING_BINDIR_NATIVE}/qemu-img convert -O vmdk   \
>>>=20
>>> You've added a dependency on qemu-img, please add the appropriate
>>> DEPENDS above.
>> I have added the line in my patch:
>> do_bootdirectdisk[depends] +=3D "qemu-native:do_populate_sysroot"
>>=20
>> I think this is enough?
>> Need I add "DEPENDS +=3D "qemu-native", too?
>=20
> No, I don't think so. Is do_populate_sysroot the right task? That
> would be my guess as well, but we should be confident.
I think it should be ok: do_populate_sysroot installs the utility qemu-img
into the sysroot and this is all we need.

>>=20
>>>=20
>>>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect \
>>>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk +	fi
>>>>  }
>>>> =20
>>>>  python do_bootdirectdisk() {
>>=20
>>> Darren Hart wrote on 2012-01-13:
>>> On 01/10/2012 10:53 AM, Dexuan Cui wrote:
>>>=20
>>> A couple additional thoughts about the boot-directdisk class in general=
:
>>>=20
>>> So build_boot_dd needs a careful audit to ensure the various dd
>>> commands do not stomp on eachother iirc, the dd of syslinux/mbr.bin
>>> was stomping on the partition table or some such.
>> Hi Darren, The dd-ing of mbr.bin actually writes only the first 440
>> bytes of $IMAGE -- please note the size of mbr.bin(generated by the
>> recipe syslinux, I think) is 440 bytes rather than 512 bytes. :-) I
>> think 440 is safe enough because it's even smaller than 512-16*4=3D448
>> bytes.
>>=20
>>> Also note that it uses "mkdosfs -d" which we have purged (and it
>>> aint coming back if my NACK is worth anything ;-). Sounds like we
>>> need to abstract building msdos images into an msdosfs.bbclass. No
>>> reason to
>> Would you volunteer to make a msdosfs.bbclass? :-)
>=20
> Not in the near future unfortunately, I'm heavily overloaded as it is.
> That said, please open a bug and we can find an appropriate owner.
Ok, I opened a bug http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1913. =20

>>> duplicate all the fatfs overhead calculations I did yesterday (See
>>> the patch I sent yesterday to bootimg.bbclass).
>> I agree.
>> I see your patch has been in poky master now.
>> If you could help to make msdosfs.bbclass, I would appreciate that a lot=
.
>> Now I'm stick in something else and I'm afraid I can't start to work
>> on this immediately. :-(
>>=20
>=20
> Understood. Open the bug and explain what's needed and we'll
> prioritize and assign it. There may also be others who would like this
> feature that would be willing to pick up the task.
Hi Darren,
Thanks for all the comments!
I'll send out the v2 patch and Cc you.

Thanks,
-- Dexuan


