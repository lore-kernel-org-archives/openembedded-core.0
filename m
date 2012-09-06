Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1T9lwC-0005aL-Vj
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 01:56:45 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q86NiJbq020596;
	Thu, 6 Sep 2012 18:44:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q86NiJ6D009087;
	Thu, 6 Sep 2012 18:44:19 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Thu, 6 Sep 2012 18:44:19 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH] u-boot: Use fw_env.config if
	available.
Thread-Index: AQHNiuLmF4ueulg96kSeh7/khIr/w5d925SAgAAeqACAAFW1AP//rL1A
Date: Thu, 6 Sep 2012 23:44:18 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C2B76E3@DFLE09.ent.ti.com>
References: <1346794545-14277-1-git-send-email-fcooper27jr@gmail.com>
	<5048D2BB.3000909@linux.intel.com>
	<8F29D6B095ED194EA1980491A5E029710C2B767E@DFLE09.ent.ti.com>
	<50493458.8020801@linux.intel.com>
In-Reply-To: <50493458.8020801@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Use fw_env.config if available.
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
X-List-Received-Date: Thu, 06 Sep 2012 23:56:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was slightly confused since I checked master after you sent that email an=
d actually didn't see my patch being included. I did a pull again and still=
 didn't see it. I can submit the v2 (or maybe call it v3) of the patch agai=
n if u like.

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Thursday, September 06, 2012 6:40 PM
To: Cooper Jr., Franklin
Cc: Franklin S. Cooper Jr; openembedded-core@lists.openembedded.org; Frankl=
in S. Cooper Jr
Subject: Re: [OE-core] [oe-core][PATCH] u-boot: Use fw_env.config if availa=
ble.

On 09/06/2012 04:35 PM, Cooper Jr., Franklin wrote:
> I released a second revision of this patch that should be used=20
> instead. http://patches.openembedded.org/patch/35845/
>

It's possible I made a mistake and replied to the wrong email, can you plea=
se check master and verify which version is there.  If it's the wrong versi=
on, please prepare a rebased patch.

Thanks
	Sau!


> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Thursday, September 06, 2012 11:44 AM
> To: Franklin S. Cooper Jr
> Cc: openembedded-core@lists.openembedded.org; Cooper Jr., Franklin;=20
> Franklin S. Cooper Jr
> Subject: Re: [OE-core] [oe-core][PATCH] u-boot: Use fw_env.config if avai=
lable.
>
> On 09/04/2012 02:35 PM, Franklin S. Cooper Jr wrote:
>> * Add support for board specific fw_env.config file if available.
>>
>> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
>> ---
>>    meta/recipes-bsp/u-boot/u-boot.inc           |   16 +++++++++++-----
>>    meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
>>    meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
>>    meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 +-
>>    4 files changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
>> b/meta/recipes-bsp/u-boot/u-boot.inc
>> index a8642f0..ed587a6 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>> @@ -49,6 +49,11 @@ do_install () {
>>        install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>>        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
>>
>> +    if [ -e ${WORKDIR}/fw_env.config ] ; then
>> +        install -d ${D}${sysconfdir}
>> +        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_en=
v.config
>> +    fi
>> +
>>        if [ "x${SPL_BINARY}" !=3D "x" ]
>>        then
>>            install ${S}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE} @@=20
>> -56,16
>> +61,17 @@ do_install () {
>>        fi
>>    }
>>
>> -FILES_${PN} =3D "/boot"
>> +FILES_${PN} =3D "/boot$ {sysconfdir}"
>>    FILESPATH =3D. "${FILE_DIRNAME}/u-boot-git/${MACHINE}:"
>>
>>    do_deploy () {
>>        install -d ${DEPLOYDIR}
>> -	install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>> +    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>>
>> -	cd ${DEPLOYDIR}
>> -	rm -f ${UBOOT_SYMLINK}
>> -	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> +    cd ${DEPLOYDIR}
>> +    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>> +    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> +    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>>
>>        if [ "x${SPL_BINARY}" !=3D "x" ]
>>        then
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> index 8465395..a9cbeca 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d4=
2237583f50183a5651ecb \
>>    SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>>
>>    PV =3D "v2011.03+git${SRCPV}"
>> -PR =3D "r7"
>> +PR =3D "r8"
>>
>>    SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3D=
git"
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> index 9654795..a115ed2 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d4=
2237583f50183a5651ecb \
>>    SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>>
>>    PV =3D "v2011.06+git${SRCPV}"
>> -PR =3D "r2"
>> +PR =3D "r3"
>>
>>    SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3D=
git"
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> index c4ec50d..6c099b1 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
>> @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d4=
2237583f50183a5651ecb"
>>    SRCREV =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"
>>
>>    PV =3D "v2012.04.01+git${SRCPV}"
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>>    SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3D=
git"
>>
>>
> Merged into OE-Core
>
> Thanks
> 	Sau!
>
>
>


