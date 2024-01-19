Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AB6C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 06:30:15 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.105])
 by mx.groups.io with SMTP id smtpd.web10.16142.1705645804541897629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 22:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=UDuAO4t2;
 spf=pass (domain: aspeedtech.com, ip: 40.107.255.105, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H654izhvA/GEUTqEx2XToqoF3DTNISWQG9H7Uol2kaM+rsE08c2g2eW/iD+vjV04QjmZO5JOS++qhsTqX9z+8OOIuPlN5DTUl8/ZRFoZ3Q5sAzI0OZtBRZyhiUB43Ql50MeHtPkwgHpAMbQHaWvzplXhT1j2PFFzvaLLfS6MCEcvPhASNwHBW6tOGX3RdB+j+f8UpKaErJxVwcI+K4IGGWsqDAV3FVmJ16l3bAGpIEXFl5b/hRth3fsNbHBeB/sRfjh37G+TT5K49gPux2AvofTJuPYVrpNn0djGhGs84lzcrA/tfV+LUHHtx8WuUJUoql6VRimtjlEol63aeMChrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2WaibGoCT/wm+PXME3uHsf3RI5idQAmUHYv0O9OtAI=;
 b=JS0wH2FYiGXBAuldZ+rVzWD3T+BKoCuitgK2YVc/QibdVo3lVgdctHpOPKaMMzfca0pjIOSO7Aei3pK0uPMK+BE2e2n404nGFLHe8t0I55qsiJzZWg1/s7k+C0KQgchcBcAoCcSqLvoXx6D3+5+jhFqEQMlr4MMAaka5MnyGKjlSpS8xZPj90bojqEOBQFy9cmS0QcIJ8bJof7ClPpy2pi8WlSuzdKMQPtzgSAdIPAQ38V6YiHPz3UJdrh39sBmRzKRILAe8aKIr4dOc6alDALfLRhRx1/zZmpyiqezIy7140dGp6m/yqpduk+tB8LgSBI77p5nHppUYSsGlUMpX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2WaibGoCT/wm+PXME3uHsf3RI5idQAmUHYv0O9OtAI=;
 b=UDuAO4t2fcUlhmn4ttZ14VyUnbq+CF4avXalCIuvhjsr/l3HU10vo34ihzZiQqU2CgEjBzkQrclfn9vC5z2l7g2YuJ4MTIx7N1b9SPIfTjcNjH3kx75fWm4LlS0C9KPRv8zxyRCQk6DBeb0Lbkhj8x2HNuw8qo6o1fUOrfp/yHUVjAi8XCUZYQOYDiCVf8Q1/aG9fKgr/a1j8OnEG2QJ4/LV3yxp9oj8MaCSKayuBWHzIJjeRN752p+38nKF82zk+WR3MiBOqTwD44Dnjn4jTaNDhJ3oLKVxAx7+si8C3jeNbgB4RlOL+Rj+W1hMdsEaSej7MDnkJQON1J99IA2slA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 KL1PR0601MB3939.apcprd06.prod.outlook.com (2603:1096:820:27::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 06:29:58 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::c621:5399:ca9:c609]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::c621:5399:ca9:c609%5]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 06:29:58 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v1] uboot-sign: support to load optee-os and TFA
 images
Thread-Topic: [OE-core] [PATCH v1] uboot-sign: support to load optee-os and
 TFA images
Thread-Index: AQHaShWh8Bf/lbYlq0OYK+Zim4uAaLDgrTog
Date: Fri, 19 Jan 2024 06:29:58 +0000
Message-ID: 
 <SI2PR06MB5041D66A4AE75D543BFBDD9BFC702@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240117021051.2102450-1-jamin_lin@aspeedtech.com>
 <20240118135242eb1e86c8@mail.local>
In-Reply-To: <20240118135242eb1e86c8@mail.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|KL1PR0601MB3939:EE_
x-ms-office365-filtering-correlation-id: 82f72055-0446-49e0-171c-08dc18b80f16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3dIn/SrRkl3SGOqZDmKcBlZUFCJLPdSVF19iCuUCiR0LOwOfBJ7jWFY9mP06AeRFUk+1L83FJkXDpVI8WS/OEjhPJCEN6PlFZ4RIAmgSbkU1D4qucrnXhE7Sh8fRopEKymWk5ph0LrDl5SOqCkkqd1gc2p63n6h8yoFIHC+VFYKdKuvN7Xf0w/wZYwBoLAe1UdslASyv45kgyzuZzcXyeRgRCkHrA+w3iHEaDt9vTq8s+saeyLm/VtY/zz7g6ibzd/nlVLPxP7c3jAFhaFDgNLkbShGH0kkhCJ1PO+sD0tLrZHDK6sUkyFYA12WgMdpvA95J166VHXOmKf5a/BfogXBUGB566pcSJheSyFh/u7LEZ8q9KzYa0NR+Nm4qbok98rcH/0pl3Q4n7IdpRHtovjwYUKpqYHJtbBpjaUvWA3hZm18xKmDtmU9eWHw4Ut/qu+ABIJNMRitjQa+kv9nSSr6lJs4LrMA8HtnP9JTtOvF4LkTbWC+btwgfG5YFAgMXwPHnOwrZmhkLF2ZyrCqhh/11qUgfOrTJCV0t3bWAN8/QfOhi1uwg/GU984kX1Ohd8qJf0rTU3pwz4MhTkv4uTYpGD0m3/Iqu86yJgCQljhw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39850400004)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(55016003)(66899024)(26005)(9686003)(83380400001)(86362001)(33656002)(38070700009)(52536014)(7696005)(4326008)(5660300002)(66446008)(6506007)(122000001)(38100700002)(64756008)(8936002)(66556008)(66946007)(66476007)(316002)(8676002)(76116006)(6916009)(478600001)(41300700001)(71200400001)(2906002)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?odsSjfTIezaUnHSaPqci90xE3a2N3KKfKYMdKftr4gV3NCB78ErmnKuVHWHk?=
 =?us-ascii?Q?MmnfLMB1lgIcNtvzN4NTY3yfPPQWSEyAtpokAcpU6NuR4QgCb3E1/G7Pmzr1?=
 =?us-ascii?Q?caAvjF73CcQV71wiqf2+T2/mtZRfbxwtCIjhfvwPmJQ3a4zz8wIifVsBDgE5?=
 =?us-ascii?Q?7PW+ZpjPSQdaBl8V87+J3cEih8ZhEWl5kaaxQ/Fr2BawF6oLVgxISXTnQGoD?=
 =?us-ascii?Q?Dk5a5U036cuvyH7BTEjG7jIKeD9OHI5XkhaXbHck7aDY0Twcu3V3rp0osk3e?=
 =?us-ascii?Q?gxX6NXQIO4xosNRLV2VmrwFBwCOZBkfdOl6CniS4gjYzcC3nhKACP2aPyRQp?=
 =?us-ascii?Q?FhY7qcrE5UQ36cHko9GV2ZVoyXd8qrfsMjlMzL6VakZdG5Ys/jRL+fu6Iz90?=
 =?us-ascii?Q?W1Wd/7oPax4L6qkYlzGXDclj++woW2O6+Yo0nCw5H8ueKh5gD0P0Xum970iF?=
 =?us-ascii?Q?OV8IQvNlGLzXFNy9d7Vl/mZvy459LdFiXvnhp9TyWk4mc9yfTLbQvxfQqyoG?=
 =?us-ascii?Q?tlrT/3UHf3QQW5WhRUlpisknlbYjgpsqRPyR8UJPHMbSxujYx4lEemYEz37M?=
 =?us-ascii?Q?f2hKrO+yIFmXXHLrl9HcIj6N2DwI8vn7OVGHrS+G3/4trc2orJUYiFb6SHH0?=
 =?us-ascii?Q?CsuI7fCaeZySGoaTDJaEvpV+KyRSGIMaPACBhn2MMtRKsQoNFclFveS7vO+Z?=
 =?us-ascii?Q?eeu/eTr3SGnF5WvTaEikZLN101SkqA4mV8rhnigmrcqMCr2Bp0i/dKJjiLmn?=
 =?us-ascii?Q?li3sKLzuEbmHzaGWxjh1Ho1q43C5a8tO5xRfPpaX5WxBv//mOCCoKui3GjcW?=
 =?us-ascii?Q?Bs5OfDhnuqraW4qP6NWyzNGQxP8+TUnsXYuzBRXbq6xPaThRtx+tCOmPcCHm?=
 =?us-ascii?Q?7jMiCnIQTVf5k9FmHyPmDVHhz/6kxdqZswyF1esNVK1glEtNPZzF3yPUyKmT?=
 =?us-ascii?Q?LfEkmAyPY8ozy0DGSOgFPQbkdCZbvEH6nXQHwP2nBCuUZFiWHk2acUn25Mza?=
 =?us-ascii?Q?/JLpAt19B+EgJfbCc8wdw1PxB2fcJgGIp0QqNkEFZ1H5OxyJ3UA9np1QKphE?=
 =?us-ascii?Q?IarWM4GslQdTqU4f3+VDJMcjVuZzGjarI8QakJwZjN7ZdmbxTjAYHZdsRa3I?=
 =?us-ascii?Q?7V/oDZ/s41aX+g0qeMxjRRicdf5NeqIBC20K9/hebIz4h4St/tGt20YDc8UV?=
 =?us-ascii?Q?ZGm87OLAIpv3OoLTV+y1MN0RglYmP0prPKF8CZZUO1VN70OEYyYcVSkqUDm0?=
 =?us-ascii?Q?dZArjAP2UiQdL3OaPThIsBQK/MaqyIAjveOxL73cORpKlp5Vnj6kDifi+LqA?=
 =?us-ascii?Q?VO3S0sX1Piih2Gb0t1UhBvgl5ubbnF5eN1FiENV194moU1Q8WiTRMUbQDODh?=
 =?us-ascii?Q?nhE9SHw0+lMkjEPzjncxPRZ3fsRnUNPc+Qf2ho1sNOpNsurGnkwgxcdCXrIh?=
 =?us-ascii?Q?5saUW8yBbnu9E6pEpy+guS0mEa/KMZilUFhjBqhVIbH7t1ZzG6nX29InfPFS?=
 =?us-ascii?Q?0+P0blx4vQoTtmUKKP0es9fRdnwbtZY+BiJvKglbuCWLtF6BS6Ol4cm2yv6J?=
 =?us-ascii?Q?gRxtIkc0fjCO331e4j5vCt0PkXYePr0LFCxaAPNr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f72055-0446-49e0-171c-08dc18b80f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 06:29:58.5714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCe8qzb5al7zykkPQdmU1mW6RPnKZh5JZikB/DrLBl7kS6XavD+dx7OS7BjjBjfDeETTqVgDmoxkT2veiiFz6Q9LnwxbpFWbHQcfAjtu5Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3939
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 06:30:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194014

>=20
> Hello,
>=20
> This doesn't apply on top of your previous patches. Can you send a proper
> series with what you want to be tested/applied?
>=20
> Thanks!
>=20
Hi Alexandre

I created a series patch here, https://patchwork.yoctoproject.org/project/o=
e-core/list/?series=3D21444
Thanks-Jamin

> On 17/01/2024 10:10:51+0800, Jamin Lin via lists.openembedded.org wrote:
> > Currently, u-boot FIT image only support to load u-boot image.
> > To support optee-os and trusted-firmware-a, update ITS file generation
> > scripts, so users are able to use u-boot FIT image to load u-boot,
> > optee-os and treustred-firmware-a images
> >
> > Add a variable "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A" to enable
> > trusted-firmware-a image and it is disable by default.
> >
> > Add a variable "UBOOT_FIT_OPTEE_OS" to enable optee-os image and it is
> > disable by default.
> >
> > The ITS file creation looks like as following.
> > 1. Both optee-os and trusted-firmware-a are disabled.
> > '''
> > /dts-v1/;
> >
> > / {
> >     images {
> >         uboot {
> >
> >         };
> >         fdt {
> >         };
> >     };
> >
> >     configurations {
> >         default =3D "conf";
> >         conf {
> >             loadables =3D "uboot";
> >             fdt =3D "fdt";
> >         };
> >     };
> > };
> > '''
> >
> > 2. Only enable optee-os
> > '''
> > /dts-v1/;
> >
> > / {
> >     images {
> >         uboot {
> >         };
> >         fdt {
> >         };
> >         optee {
> >         };
> >     };
> >
> >     configurations {
> >         default =3D "conf";
> >         conf {
> >             firmware =3D "optee";
> >             loadables =3D "uboot";
> >             fdt =3D "fdt";
> >         };
> >     };
> > };
> > '''
> >
> > 3: Both optee-os and trusted-firmware-a are enabled '''
> > /dts-v1/;
> >
> > / {
> >     images {
> >         uboot {
> >         };
> >         fdt {
> >         };
> >         atf {
> >         };
> >         optee {
> >         };
> >     };
> >
> >     configurations {
> >         default =3D "conf";
> >         conf {
> >             firmware =3D "atf";
> >             loadables =3D "uboot", "optee";
> >             fdt =3D "fdt";
> >         };
> >     };
> > };
> > '''
> >
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  meta/classes-recipe/uboot-sign.bbclass | 91
> > +++++++++++++++++++++++++-
> >  1 file changed, 90 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/uboot-sign.bbclass
> > b/meta/classes-recipe/uboot-sign.bbclass
> > index ad04c82378..b874eb84db 100644
> > --- a/meta/classes-recipe/uboot-sign.bbclass
> > +++ b/meta/classes-recipe/uboot-sign.bbclass
> > @@ -88,6 +88,18 @@ UBOOT_FIT_ADDRESS_CELLS ?=3D "1"
> >  # This is only necessary for determining the signing configuration
> > KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
> >
> > +# Trusted Firmware-A (TF-A) provides a reference implementation of #
> > +secure world software for Armv7-A and Armv8-A, # including a Secure
> > +Monitor executing at Exception Level 3 (EL3) # ATF is used as the
> > +initial start code on ARMv8-A cores for all K3 platforms
> > +UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A ?=3D "0"
> > +UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE ?=3D "bl31.bin"
> > +
> > +# OP-TEE is a Trusted Execution Environment (TEE) designed as #
> > +companion to a non-secure Linux kernel running on Arm
> > +UBOOT_FIT_OPTEE_OS ?=3D "0"
> > +UBOOT_FIT_OPTEE_OS_IMAGE ?=3D "tee-raw.bin"
> > +
> >  python() {
> >      # We need u-boot-tools-native if we're creating a U-Boot fitImage
> >      sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
> > @@ -230,6 +242,20 @@ addtask uboot_generate_rsa_keys before
> > do_uboot_assemble_fitimage after do_compi  # Create a ITS file for the
> > U-boot FIT, for use when  # we want to sign it so that the SPL can
> > verify it
> >  uboot_fitimage_assemble() {
> > +	conf_loadables=3D"\"uboot\""
> > +	conf_firmware=3D""
> > +
> > +	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" =3D "1" ]; then
> > +		conf_firmware=3D"\"atf\""
> > +		if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ]; then
> > +			conf_loadables=3D"\"uboot\", \"optee\""
> > +		fi
> > +	else
> > +		if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ]; then
> > +			conf_firmware=3D"\"optee\""
> > +		fi
> > +	fi
> > +
> >  	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
> >
> >  	# First we create the ITS script
> > @@ -282,13 +308,76 @@ EOF
> >
> >  	cat << EOF >> ${UBOOT_ITS}
> >          };
> > +EOF
> > +	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" =3D "1" ] ; then
> > +		cat << EOF >> ${UBOOT_ITS}
> > +        atf {
> > +            description =3D "ARM Trusted Firmware-A";
> > +            data =3D
> /incbin/("${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE}");
> > +            type =3D "firmware";
> > +            arch =3D "${UBOOT_ARCH}";
> > +            os =3D "arm-trusted-firmware";
> > +            load =3D
> <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_LOADADDRESS}>;
> > +            entry =3D
> <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_ENTRYPOINT}>;
> > +            compression =3D "none";
> > +EOF
> > +
> > +		if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
> > +			cat << EOF >> ${UBOOT_ITS}
> > +            signature {
> > +                algo =3D
> "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
> > +                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
> > +            };
> > +EOF
> > +		fi
> > +
> > +	cat << EOF >> ${UBOOT_ITS}
> > +        };
> > +EOF
> > +	fi
> > +
> > +	if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ] ; then
> > +		cat << EOF >> ${UBOOT_ITS}
> > +        optee {
> > +            description =3D "OPTEE OS Image";
> > +            data =3D /incbin/("${UBOOT_FIT_OPTEE_OS_IMAGE}");
> > +            type =3D "tee";
> > +            arch =3D "${UBOOT_ARCH}";
> > +            os =3D "tee";
> > +            load =3D <${UBOOT_FIT_OPTEE_OS_LOADADDRESS}>;
> > +            entry =3D <${UBOOT_FIT_OPTEE_OS_ENTRYPOINT}>;
> > +            compression =3D "none";
> > +EOF
> > +
> > +		if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
> > +			cat << EOF >> ${UBOOT_ITS}
> > +            signature {
> > +                algo =3D
> "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
> > +                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
> > +            };
> > +EOF
> > +		fi
> > +
> > +	cat << EOF >> ${UBOOT_ITS}
> > +        };
> > +EOF
> > +	fi
> > +
> > +	cat << EOF >> ${UBOOT_ITS}
> >      };
> >
> >      configurations {
> >          default =3D "conf";
> >          conf {
> >              description =3D "Boot with signed U-Boot FIT";
> > -            loadables =3D "uboot";
> > +EOF
> > +	if [ -n "${conf_firmware}" ]; then
> > +	cat << EOF >> ${UBOOT_ITS}
> > +            firmware =3D ${conf_firmware}; EOF
> > +	fi
> > +	cat << EOF >> ${UBOOT_ITS}
> > +            loadables =3D ${conf_loadables};
> >              fdt =3D "fdt";
> >          };
> >      };
> > --
> > 2.25.1
> >
>=20
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193883):
> https://lists.openembedded.org/g/openembedded-core/message/193883
> > Mute This Topic: https://lists.openembedded.org/mt/103778291/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

