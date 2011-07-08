Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QezNP-00048D-B2
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 02:57:03 +0200
Received: by vxa37 with SMTP id 37so1244899vxa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 17:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=FBF2JmbV5LIvY62Swi+9z8rJfPf3qWwvNGfGpkbw1Uk=;
	b=p4g1Pt4cvVMu4wF0vlYTGA79tTAYUllZj2TeqeoBfkp0aBk0rV194Xjls1xRrqjH6r
	pDSX1v6WFUsjSya7wNB8IHJDQC6c2jjRuqGpKepgVPZikDfyqbADUAaJbNc2j4F06JOR
	DMDEF/mUxtSzXMPKqya0hadRkZX7K1SfXr7dU=
Received: by 10.52.180.194 with SMTP id dq2mr2018253vdc.105.1310086390617;
	Thu, 07 Jul 2011 17:53:10 -0700 (PDT)
Received: from [192.168.30.25] (ns-visitor-nsrp.juniper.net [208.223.208.242])
	by mx.google.com with ESMTPS id c1sm3495059vdu.5.2011.07.07.17.53.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 17:53:09 -0700 (PDT)
References: <cover.1310079506.git.andrea.adami@gmail.com>
	<54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
	<CAAQYJAuSgb=pK1ZgpEtymW7skVbcBejqy4DY6-em8-GD2Uridw@mail.gmail.com>
In-Reply-To: <CAAQYJAuSgb=pK1ZgpEtymW7skVbcBejqy4DY6-em8-GD2Uridw@mail.gmail.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <BAE51988-281C-4135-A796-75ABE2667937@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2011 17:53:38 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Fri, 08 Jul 2011 00:57:03 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 7, 2011, at 5:00 PM, Andrea Adami <andrea.adami@gmail.com> wrote:

> Ehm,
> some cruft slipped in :/
>=20
> On Fri, Jul 8, 2011 at 1:11 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
>> * from org.openembedded.dev (oe-classic)
>>=20
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  meta/classes/kernel.bbclass |   22 ++++++++++++++++++++++
>>  1 files changed, 22 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 943252a..03b321d 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -14,8 +14,20 @@ python __anonymous () {
>>        depends =3D bb.data.getVar("DEPENDS", d, 1)
>>        depends =3D "%s u-boot-mkimage-native" % depends
>>        bb.data.setVar("DEPENDS", depends, d)
>> +
>> +    image =3D bb.data.getVar('INITRAMFS_IMAGE', d, True)
>> +    if image !=3D '' and image is not None:
                        ^^^
Is this ok ?

>> +        bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs',=
 d)
>> +
>=20
>=20
>> +    machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, True)
>> +
>> +    if machine_kernel_pr:
>> +        bb.data.setVar('PR', machine_kernel_pr, d)
>=20
> Those bits are extraneous and copied and pasted by mistake.
>=20
>=20
>=20
>>  }
>>=20
>> +INITRAMFS_IMAGE ?=3D ""
>> +INITRAMFS_TASK ?=3D ""
>> +
>>  inherit kernel-arch deploy
>>=20
>>  PACKAGES_DYNAMIC +=3D "kernel-module-*"
>> @@ -179,8 +191,18 @@ kernel_do_configure() {
>>                cp "${WORKDIR}/defconfig" "${S}/.config"
>>        fi
>>         yes '' | oe_runmake oldconfig
>> +
>> +       if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>=20
>> +               for img in cpio.gz cpio.lzo cpio.lzma; do
>=20
> We'll have to add cpio.xz as bonus too, being there is support for it
> in image_types.bbclass
>=20
>=20
>> +               if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE=
}.$img"
>> +                       cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACH=
INE}.$i
>> +               fi
>> +               done
>> +       fi
>>  }
>>=20
>> +kernel_do_configure[depends] +=3D "${INITRAMFS_TASK}"
>> +
>>  do_menuconfig() {
>>         export DISPLAY=3D'${DISPLAY}'
>>         export DBUS_SESSION_BUS_ADDRESS=3D'${DBUS_SESSION_BUS_ADDRESS}'
>> --
>> 1.7.3.4
>>=20
>>=20
>=20
> If you mind, I'll resend a corrected V2 of the patch

Please do=20

>=20
> Regards
>=20
> Andrea
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


