Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 986D161883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 09:55:58 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 98B3E3F501;
	Tue, 20 Aug 2013 11:55:58 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -2.6
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5, UNWANTED_LANGUAGE_BODY=1.8]
	autolearn=no
X-Spam-Languages: sco
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Tue, 20 Aug 2013 11:55:56 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Tue, 20 Aug 2013 11:55:54 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Tue, 20 Aug 2013 11:55:53 +0200
Message-ID: <52133D29.4010104@topic.nl>
Date: Tue, 20 Aug 2013 11:55:53 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Tue, 20 Aug 2013 09:55:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI cannot get this to work, do_install fails because it cannot find=
 the=20
generated ".dtb" file.

See further in the message:

On 08/13/2013 03:52 PM, Otavio Salvador wrote:
> As the Linux kernel, unconditionally, builds the dtc application and
> it is the compatible version with the DeviceTree files shipped within
> the kernel it is better to use it and the kernel build system to
> generate the dtb files.
>
> Some DeviceTree files rely on CPP and kernel headers to be able to
> generate the dtb binary contents and it is harder to replicate it
> outside of Linux kernel build system so we /use/ it.
>
> To comply with these assumptions we need to use the dtb file when
> calling 'make' instead of pointing to the DeviceTree source file; the
> code has been made backward compatible but it is advised to move to
> the new definition to avoid warnings as:
>
> ,----[ Original definition ]
> | KERNEL_DEVICETREE =3D "${S}/arch/arm/boot/dts/imx6q-sabresd.dts"
> `----
>
> Becomes:
>
> ,----[ New definition ]
> | KERNEL_DEVICETREE =3D "imx6q-sabresd.dtb"
> `----
>
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes in v2:
> - Drop debug warning left by mistake
> - Improve bbwarn message (Bruce Ashfield)
> - Improve commit log (Bruce Ascfield)
>
>   meta/recipes-kernel/linux/linux-dtb.inc | 58 +++++++++++++++-----------=
-------
>   1 file changed, 26 insertions(+), 32 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kerne=
l/linux/linux-dtb.inc
> index 41dd599..cebc76a 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -1,44 +1,38 @@
>   # Support for device tree generation
>   FILES_kernel-devicetree =3D "/${KERNEL_IMAGEDEST}/devicetree*"
> -KERNEL_DEVICETREE_FLAGS ?=3D "-R 8 -p 0x3000"
>
>   python __anonymous () {
> -    devicetree =3D d.getVar("KERNEL_DEVICETREE", True) or ''
> -    if devicetree:
> -        depends =3D d.getVar("DEPENDS", True)
> -        d.setVar("DEPENDS", "%s dtc-native" % depends)
> -        packages =3D d.getVar("PACKAGES", True)
> -        d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> +    d.appendVar("PACKAGES", " kernel-devicetree")
>   }
>
>   do_install_append() {
>   	if test -n "${KERNEL_DEVICETREE}"; then
> -		for DTS_FILE in ${KERNEL_DEVICETREE}; do
> -			if [ ! -f ${DTS_FILE} ]; then
> -				echo "Warning: ${DTS_FILE} is not available!"
> -				continue
> +		for DTB in ${KERNEL_DEVICETREE}; do
> +			if echo ${DTB} | grep -q '/dts/'; then
> +				bbwarn "${DTB} contains the full path to the the dts file, but only =
the dtb name should be used."
> +				DTB=3D`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>   			fi
> -			DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -			DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_=
BASE_NAME}/g"`
> -			DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACH=
INE}/${DTS_BASE_NAME}/g"`
> -			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DT=
S_FILE}
> -			install -m 0644 ${DTS_BASE_NAME} ${D}/${KERNEL_IMAGEDEST}/devicetree-=
${DTB_SYMLINK_NAME}.dtb
> +			DTB_BASE_NAME=3D`basename ${DTB} .dtb`
> +			DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_=
BASE_NAME}/g"`
> +			DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACH=
INE}/${DTB_BASE_NAME}/g"`
> +			oe_runmake ${DTB}
> +			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${D}/${KERNEL_IMAGEDEST=
}/devicetree-${DTB_SYMLINK_NAME}.dtb

This fails now, because  ${B}/arch/${ARCH}/boot/${DTB} cannot be found.=20
The dtb file is in the "dts" subdirectory, so should this line read:

+			install -m 0644 ${B}/arch/${ARCH}/boot/dts/${DTB}=20
${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb

I wonder why this works on your system?


>   		done
>   	fi
>   }
>
>   do_deploy_append() {
>   	if test -n "${KERNEL_DEVICETREE}"; then
> -		for DTS_FILE in ${KERNEL_DEVICETREE}; do
> -			if [ ! -f ${DTS_FILE} ]; then
> -				echo "Warning: ${DTS_FILE} is not available!"
> -				continue
> +		for DTB in ${KERNEL_DEVICETREE}; do
> +			if echo ${DTB} | grep -q '/dts/'; then
> +				bbwarn "${DTB} contains the full path to the the dts file, but only =
the dtb name should be used."
> +				DTB=3D`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>   			fi
> -			DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -			DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_=
BASE_NAME}/g"`
> -			DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACH=
INE}/${DTS_BASE_NAME}/g"`
> +			DTB_BASE_NAME=3D`basename ${DTB} .dtb`
> +			DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_=
BASE_NAME}/g"`
> +			DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACH=
INE}/${DTB_BASE_NAME}/g"`
>   			install -d ${DEPLOYDIR}
> -			install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
> +			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${DEPLOYDIR}/${DTB_NAME=
}.dtb
>   			cd ${DEPLOYDIR}
>   			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>   			cd -
> @@ -48,20 +42,20 @@ do_deploy_append() {
>
>   pkg_postinst_kernel-devicetree () {
>   	cd /${KERNEL_IMAGEDEST}
> -	for DTS_FILE in ${KERNEL_DEVICETREE}
> +	for DTB_FILE in ${KERNEL_DEVICETREE}
>   	do
> -		DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -		DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHI=
NE}/${DTS_BASE_NAME}/g"`
> -		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dt=
b ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY=
} || true
> +		DTB_BASE_NAME=3D`basename ${DTB_FILE} | awk -F "." '{print $1}'`
> +		DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHI=
NE}/${DTB_BASE_NAME}/g"`
> +		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dt=
b ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY=
} || true
>   	done
>   }
>
>   pkg_postrm_kernel-devicetree () {
>   	cd /${KERNEL_IMAGEDEST}
> -	for DTS_FILE in ${KERNEL_DEVICETREE}
> +	for DTB_FILE in ${KERNEL_DEVICETREE}
>   	do
> -		DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -		DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHI=
NE}/${DTS_BASE_NAME}/g"`
> -		update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYM=
LINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +		DTB_BASE_NAME=3D`basename ${DTB_FILE} | awk -F "." '{print $1}'`
> +		DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHI=
NE}/${DTB_BASE_NAME}/g"`
> +		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYM=
LINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>   	done
>   }
>



Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.

