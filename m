Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2C1C021B3
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 23:24:02 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.77820.1740353034503131443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 15:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=ACfIB7t2;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDC3F10382D3C;
	Mon, 24 Feb 2025 00:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740353032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxdEuh5ScfPQIKO/i5ru7E4cgYxgXsDdcPHS2GOkNI4=;
	b=ACfIB7t26KkY72uuh85sZ9JimMU1yGdZmWi80zo8vcrveUDXCXbFIrpYfgec6bOyKT16dH
	PH5mynwQBSJAmuzhVkKorTup6HuoTqoQSnnjcyg9YiRxlTh41sV5fKrmSFs2dMea2CDu+8
	LDOlT4PK8mkJMHWd0dT39y3c/3D7vnnPdiTUrfOEbzjLiVcbVbFDMNgCO5kbb45w0zNCKK
	Ob8TA8b3XrWWaR5kTOQ68CJVURoW7EMlf3BLbBSngjYf9plnVnW0v5P4zalqyvO62UzBGn
	pJQA4hOQALTjKWPgW8ZcBtD6mv6maDU/+kX+RHFS+p2QfSgRIks/EV385Ye/Cg==
Message-ID: <5f338f80-79a8-4174-8c30-454242a86565@denx.de>
Date: Mon, 24 Feb 2025 00:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1"
 behavior
To: Rogerio Guerra Borin <rogerio.borin@toradex.com>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Jose Quaresma <quaresma.jose@gmail.com>,
 Leonard Anderweit <L.Anderweit@phytec.de>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sean Anderson <seanga2@gmail.com>
References: <20250222002047.319479-1-marex@denx.de>
 <0665a8da-cab0-4d66-89b8-cb9649918365@toradex.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0665a8da-cab0-4d66-89b8-cb9649918365@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 23:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211832

On 2/23/25 11:13 PM, Rogerio Guerra Borin wrote:
> On 2/21/25 21:20, Marek Vasut wrote:
>> This message originated from outside your organization
>>
>> OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
>> where the resulting signed fitImage contains both signed
>> images and signed configurations, possibly using different
>> keys. This kind of signing of images is redundant, but so is
>> the behavior of FIT_SIGN_INDIVIDUAL=3D"1" and that is here to
>> stay.
>>
>> Adjust the process of public key insertion into u-boot.dtb
>> such that if FIT_SIGN_INDIVIDUAL=3D=3D1, the image signing key
>> is inserted into u-boot.dtb first, and in any case the
>> configuration signing key is inserted into u-boot.dtb last.
>>
>> The verification of the keys inserted into u-boot.dtb against
>> unused.itb is performed only for FIT_SIGN_INDIVIDUAL!=3D1 due to
>> mkimage limitation, which does not allow mkimage -f auto-conf
>> to update the generated unused.itb, and instead rewrites it.
>>
>> Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if=20
>> UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
>> Cc: Jose Quaresma <quaresma.jose@gmail.com>
>> Cc: Leonard Anderweit <L.Anderweit@phytec.de>
>> Cc: Quentin Schulz <quentin.schulz@cherry.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>
>> Cc: Sean Anderson <seanga2@gmail.com>
>> ---
>> =C2=A0 meta/classes-recipe/uboot-sign.bbclass | 60 +++++++++++++++++++=
+++----
>> =C2=A0 1 file changed, 51 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-=20
>> recipe/uboot-sign.bbclass
>> index 96c47ab0165..5c579a9fb0e 100644
>> --- a/meta/classes-recipe/uboot-sign.bbclass
>> +++ b/meta/classes-recipe/uboot-sign.bbclass
>> @@ -101,27 +101,69 @@ concat_dtb() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 binary=3D"$2"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -e "${UBOOT_DTB_BINARY}" ]; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Re-sign the kernel in or=
der to add the keys to our dtb
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UBOOT_MKIMAGE_MODE=3D"auto=
-conf"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Signing indiv=
idual images is not recommended as that
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # makes fitImag=
e susceptible to mix-and-match attack.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # OE FIT_SIGN_INDIVIDUAL i=
s implemented in an unusual manner,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # where the resulting sign=
ed fitImage contains both signed
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # images and signed config=
urations. This is redundant. In
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # order to prevent mix-and=
-match attack, it is sufficient
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # to sign configurations. =
The FIT_SIGN_INDIVIDUAL =3D "1"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # support is kept to avoid=
 breakage of existing layers, but
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # it is highly recommended=
 to avoid FIT_SIGN_INDIVIDUAL =3D "1",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # i.e. set FIT_SIGN_INDIVI=
DUAL =3D "0" .
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${FIT_SIG=
N_INDIVIDUAL}" =3D "1" ] ; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UB=
OOT_MKIMAGE_MODE=3D"auto"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
Sign dummy image images in order to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
add the image signing keys to our dtb
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${=
UBOOT_MKIMAGE_SIGN} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if=20
>> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -f auto \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -k "${UBOOT_SIGN_KEYDIR}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -g "${UBOOT_SIGN_IMG_KEYNAME}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -K "${UBOOT_DTB_BINARY}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -d /dev/null \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -r ${B}/unused.itb \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE_SIGN_ARGS}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Sign dummy image configu=
rations in order to
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # add the configuration si=
gning keys to our dtb
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE=
_SIGN} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if=20
>> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -f=
 $UBOOT_MKIMAGE_MODE \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -f=
 auto-conf \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -k "${UBOOT_SIGN_KEYDIR}" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -g=
 "${UBOOT_SIGN_IMG_KEYNAME}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -g=
 "${UBOOT_SIGN_KEYNAME}" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -K "${UBOOT_DTB_BINARY}" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -d /dev/null \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 -r ${B}/unused.itb \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${UBOOT_MKIMAGE_SIGN_ARGS}
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Verify the kernel image =
and u-boot dtb
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_FIT_CHECK_SIGN} \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -k=
 "${UBOOT_DTB_BINARY}" \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -f=
 ${B}/unused.itb
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Verify the dummy fitImag=
e signature against u-boot.dtb
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # augmented using public k=
ey material.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # This only works for FIT_=
SIGN_INDIVIDUAL =3D "0", because
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # mkimage -f auto-conf doe=
s not support -F to extend the
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # existing unused.itb , an=
d instead rewrites unused.itb
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # from scratch.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Using two separate unuse=
d.itb for mkimage -f auto and
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # mkimage -f auto-conf inv=
ocation above would not help, as
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the signature verificati=
on process below checks whether
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # all keys inserted into u=
-boot.dtb /signature node pass
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # the verification. Separa=
te unused.itb would each miss one
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # of the signatures.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # The FIT_SIGN_INDIVIDUAL =
=3D "1" support is kept to avoid
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # breakage of existing lay=
ers, but it is highly recommended
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # to not use FIT_SIGN_INDI=
VIDUAL =3D "1", i.e. set
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # FIT_SIGN_INDIVIDUAL =3D =
"0" .
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${FIT_SIGN_INDIVIDUA=
L}" !=3D "1" ] ; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${=
UBOOT_FIT_CHECK_SIGN} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -k "${UBOOT_DTB_BINARY}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -f ${B}/unused.itb
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${UBOOT_DTB_=
BINARY} ${UBOOT_DTB_SIGNED}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>=20
> Hey Marek,

Hi,

> I've built images with both FIT_SIGN_INDIVIDUAL set to "0" and "1' and=20
> checked the resulting artifacts for the presence of keys and signatures=
.=20
> Everything looks fine, as far as I can tell.
Thank you for testing.

Could you also provide Tested-by tag ?

