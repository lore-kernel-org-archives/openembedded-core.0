Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C24DC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 22:40:05 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.6570.1739832004610715323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 14:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=aB79VAfU;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6D2410382F0E;
	Mon, 17 Feb 2025 23:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1739832002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EG92ovGwu8fP76jZrE5oPyEUAJ1wF539kl57XrOffs=;
	b=aB79VAfUZLH6Y1nmWC156R3Xh7kN1IdRQodCegF8hDV8+Usk/LhuuDNeJAEKA2oR92l3qR
	/qopEESPn9lcUGQ1jEhr97oDyCfojrGBHBq9KQN8hXLNJGRPPqFJs2UrG0MabmTXjl02d7
	0i+qFqWyo98ZNRjiPETYjpS1HaScE5LHW9ojfE8iOfcXM60ZhJ76QYLagPeBiAsHUgOjid
	6v8TrbInl6zmb4qK+SUYvfH+dA1HjJP/vnPOipiEm+AbjgtPD6RMyefTyk5V3yRaEmNleL
	0AsgM8J9P9ntDVQXqBQgJmsis/ubX+KhMUl5xr2H4QsdOwA0C/dUdpCLLElSqQ==
Message-ID: <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
Date: Mon, 17 Feb 2025 23:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: Quentin Schulz <quentin.schulz@cherry.de>, rogerio.borin@toradex.com,
 openembedded-core@lists.openembedded.org
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
In-Reply-To: <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 22:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211556

On 2/17/25 11:34 AM, Quentin Schulz wrote:
> +Cc Marek

Hi,

> On 2/16/25 7:36 PM, Rogerio Guerra Borin via lists.openembedded.org wro=
te:
>> You don't often get email from=20
>> rogerio.borin=3Dtoradex.com@lists.openembedded.org. Learn why this is=20
>> important<https://aka.ms/LearnAboutSenderIdentification>
>> Hello,
>>
>> At Toradex we're using class "kernel-fitimage" to produce our signed=20
>> kernel FIT images and we've found that the recent commit d7bd9c627661=20
>> ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE=20
>> and UBOOT_ENV enabled") broke our builds. The logs of a failed build=20
>> show the following message that I found noteworthy:

Can you mail me the entire log file for completeness ?

>> log.do_uboot_assemble_fitimage.841485:
>> ...
>> Couldn't open RSA private key: '/secboot-data/fit-keys/dev2.key': No=20
>> such file or directory
>>
>> The odd thing was that the build was setting:
>>
>> UBOOT_SIGN_KEYNAME =3D "dev"
>> UBOOT_SIGN_IMG_KEYNAME =3D "dev2"
>> FIT_SIGN_INDIVIDUAL =3D "0"
>> FIT_GENERATE_KEYS =3D "0"

FIT_SIGN_INDIVIDUAL =3D "0" is correct, you do want to sign=20
configurations, not individual images in the fitImage, because signing=20
individual images is susceptible to mix-and-match attack.

>> =C2=A0From the above we see the individual images signing is disabled =
but=20
>> the system is trying to access the key file for the individual signing=
=20
>> (dev2) regardless of that. Checking the code in uboot-sign.bbclass I=20
>> found this line:
>>
>> https://git.openembedded.org/openembedded-core/tree/meta/classes-=20
>> recipe/uboot-sign.bbclass?h=3Dscarthgap#n116
>>
>> that is responsible for that access (inside function concat_dtb()).=20
>> The code is always referencing variable UBOOT_SIGN_IMG_KEYNAME=20
>> regardless of FIT_SIGN_INDIVIDUAL being set to "1" or "0" even though=20
>> there's a condition a couple lines above L116 where=20
>> FIT_SIGN_INDIVIDUAL is tested to decide in which mode to run the=20
>> signing tool.

Uh, good find, does the following patch fix your problem ?

"""
diff --git a/meta/classes-recipe/uboot-sign.bbclass=20
b/meta/classes-recipe/uboot-sign.bbclass
index 96c47ab016..74ef5697ca 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -107,13 +107,16 @@ concat_dtb() {
                 # makes fitImage susceptible to mix-and-match attack.
                 if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
                         UBOOT_MKIMAGE_MODE=3D"auto"
+                       UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_IMG_KEYNAME}
+               else
+                       UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_KEYNAME}
                 fi
                 ${UBOOT_MKIMAGE_SIGN} \
                         ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if=20
len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
                         -f $UBOOT_MKIMAGE_MODE \
                         -k "${UBOOT_SIGN_KEYDIR}" \
                         -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
-                       -g "${UBOOT_SIGN_IMG_KEYNAME}" \
+                       -g "$UBOOT_MKIMAGE_KEYNAME" \
                         -K "${UBOOT_DTB_BINARY}" \
                         -d /dev/null \
                         -r ${B}/unused.itb \
"""

>> To better understand the behavior I created dev2.=20
>> {key,crt} files and retried a build which worked. However, checking=20
>> the contents of the final u-boot.dtb file I found that the "dev2" key=20
>> node was present but the "dev" key wasn't. Then, checking the contents=
=20
>> of the final fitImage I noticed the configuration nodes were signed by=
=20
>> the dev key while the individual images were not signed (as expected).=
=20
>> But that means such a system wouldn't boot since the required "dev"=20
>> key is not present in the U-Boot DTB, from what I conclude the FIT=20
>> signing is broken at the moment.
>>
>> So, first of all I wanted to let you guys know about this issue=20
>> (hoping we're not doing anything wrong with our builds).

No, your builds are fine, this is a real bug.

>> As a second point, I wanted to confirm the expected behavior regarding=
=20
>> variable FIT_SIGN_INDIVIDUAL. According to the documentation:
>>
>> https://docs.yoctoproject.org/5.0.6/ref-manual/variables.html#term-=20
>> FIT_SIGN_INDIVIDUAL
>>
>> when its value is "1" the individual images will be signed *in=20
>> addition* to the FIT image being signed.

That is a bit weird and no, I don't think that is how it is supposed to=20
work.

FIT_SIGN_INDIVIDUAL=3D1 -> only image subnodes in fitImage /images nodes=20
are signed AND fitImage is susceptible to mix-and-match attack=20
(basically attacker can replace individual signed images in fitImage=20
with different individual signed images, e.g. with older versions, to=20
achieve a combination of images which allows them to somehow break the=20
system).

FIT_SIGN_INDIVIDUAL=3D0 (recommended) -> images are hashed, configuration=
s=20
are hashed, hashes are combined and signed. Because images and=20
configurations (which images are to be used together) are signed,=20
attacker cannot mix-and-match images into an un-allowed configuration.

>> From that, I understand that=20
>> the configurations will be always signed and the individual images may=
=20
>> or may not be signed depending on FIT_SIGN_INDIVIDUAL.

The other way around. The configurations are signed by default, which is=20
good, but this can be disabled if needed (unlikely).

>> I kind of=20
>> confirmed this behavior by checking our build artifacts on kirkstone:=20
>> with FIT_SIGN_INDIVIDUAL=3D"0" the U-Boot DTB has only the "dev" key a=
nd=20
>> the fit image is signed by that same key; with FIT_SIGN_INDIVIDUAL=3D"=
1"=20
>> both keys are present in the DTB, the configurations are signed by the=
=20
>> "dev" key and the images by the "dev2" key. I understand this is the=20
>> correct behavior, right?

Images shouldn't be signed by different keys than configurations, that=20
is a bit odd.

>> I'm asking because looking at the comment at:
>>
>> https://git.openembedded.org/openembedded-core/tree/meta/classes-=20
>> recipe/uboot-sign.bbclass?h=3Dscarthgap#n106
>>
>> it gives me the impression that FIT_SIGN_INDIVIDUAL would select=20
>> between either signing individual images

Yes

>> or signing the=20
>> configurations

Signed configuration also includes hash of the images that the=20
configuration references in it, that's what prevents the mix-and-match=20
attack.

>> , which doesn't match the documented behavior. I believe=20
>> the code in concat_dtb() also seems to assume only one of the keys=20
>> (dev/dev2) would need be present in the DTB. So the fix would involve=20
>> a review on this as well I imagine.
IIRC Adrian was looking into improving those docs.

