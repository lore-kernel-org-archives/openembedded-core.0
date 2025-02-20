Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1679C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 23:18:19 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.11187.1740093491984770160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 15:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=EVRgdMLc;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CBA710382D3C;
	Fri, 21 Feb 2025 00:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740093489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Js4Om48nF83S9Qt7IKlY34mwnEFdnoXdX5vr3TuZyZo=;
	b=EVRgdMLcaBoZ76JkXdbmkW9byS9ZXAc467oDWXdZFRDXrtfRGGdEGcpIJOeCp2cQSVG9CW
	rsxyQLTLPEdJTYZpNvqGRD8mOfcguyZOUgZKKyQIDgoXtPCdhcIRG/j6nkHzla4kOCRZep
	drOIvbdOWTekw5ZBewa4focbyasiKEy7fo3ApsAMhLjRDX7FbIwogrol3oXmKM5FZ1MpWE
	CA9qqfUAXIMsPyVT3NUU9C9w/na/Vg2MDKHexKaAooVmmw2v+qzNurcqw5pQnjkSaQqpnB
	nxyExLrYXkUqMcMVPSiSN6BkgQGgcrwyAI5Giw77FhQvg/pdA1zd1IQqeIvU3A==
Message-ID: <3341efe1-1515-4549-97ac-d3a82f71f16b@denx.de>
Date: Fri, 21 Feb 2025 00:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Broken FIT image signing since "u-boot:
 kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV
 enabled"
To: Rogerio Guerra Borin <rogerio.borin@toradex.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org, Sean Anderson <seanga2@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Freihofer, Adrian" <adrian.freihofer@siemens.com>
References: <VcVL.1739730983448118565.i0SN@lists.openembedded.org>
 <e82e9be5-9a56-4c22-ba44-90c8e6690d99@cherry.de>
 <86f57755-bad6-49ad-a1b6-d0dceaf5344b@denx.de>
 <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c1fdfe98-90cd-44e4-9c5a-fe5d73ac49b4@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 23:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211781

On 2/18/25 4:49 AM, Rogerio Guerra Borin wrote:

[...]

>> =C2=A0>> that is responsible for that access (inside function concat_d=
tb()).
>> =C2=A0>> The code is always referencing variable UBOOT_SIGN_IMG_KEYNAM=
E
>> =C2=A0>> regardless of FIT_SIGN_INDIVIDUAL being set to "1" or "0" eve=
n though
>> =C2=A0>> there's a condition a couple lines above L116 where
>> =C2=A0>> FIT_SIGN_INDIVIDUAL is tested to decide in which mode to run =
the
>> =C2=A0>> signing tool.
>>
>> Uh, good find, does the following patch fix your problem ?
>>
>> """
>> diff --git a/meta/classes-recipe/uboot-sign.bbclass
>> b/meta/classes-recipe/uboot-sign.bbclass
>> index 96c47ab016..74ef5697ca 100644
>> --- a/meta/classes-recipe/uboot-sign.bbclass
>> +++ b/meta/classes-recipe/uboot-sign.bbclass
>> @@ -107,13 +107,16 @@ concat_dtb() {
>> # makes fitImage susceptible to mix-and-match attack.
>> if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
>> UBOOT_MKIMAGE_MODE=3D"auto"
>> + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_IMG_KEYNAME}
>> + else
>> + UBOOT_MKIMAGE_KEYNAME=3D${UBOOT_SIGN_KEYNAME}
>> fi
>> ${UBOOT_MKIMAGE_SIGN} \
>> ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
>> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>> -f $UBOOT_MKIMAGE_MODE \
>> -k "${UBOOT_SIGN_KEYDIR}" \
>> -o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
>> - -g "${UBOOT_SIGN_IMG_KEYNAME}" \
>> + -g "$UBOOT_MKIMAGE_KEYNAME" \
>> -K "${UBOOT_DTB_BINARY}" \
>> -d /dev/null \
>> -r ${B}/unused.itb \
>> """
>=20
> Looking at the patch I'm pretty sure it would solve my problem,=20
> particularly because we set FIT_SIGN_INDIVIDUAL=3D"0" in our builds.=20
> However, I see it keeps the concept of the signing being either on the=20
> config or on the individual images, which I wanted to further comment=20
> down below.

That is correct, the signing is supposed to operate either on signed=20
configurations (where the configuration signature includes the hash of=20
all the images referenced by the configuration), or separate images=20
(which is susceptible to mix and match attack).

[...]

>> Signed configuration also includes hash of the images that the
>> configuration references in it, that's what prevents the mix-and-match
>> attack.
>>
>> =C2=A0>> , which doesn't match the documented behavior. I believe
>> =C2=A0>> the code in concat_dtb() also seems to assume only one of the=
 keys
>> =C2=A0>> (dev/dev2) would need be present in the DTB. So the fix would=
 involve
>> =C2=A0>> a review on this as well I imagine.
>> IIRC Adrian was looking into improving those docs.
>=20
> Regarding this second topic, let me show you some other information I=20
> gathered from a couple of builds that may help with your assessment:
>=20
> FSI :=3D FIT_SIGN_INDIVIDUAL
> CFG :=3D Whether or not the configurations inside the FIT image were si=
gned
> IMG :=3D Whether or not the subimages inside the FIT image were signed
>=20
> | Branch=C2=A0=C2=A0=C2=A0 | Version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | FSI | Keys inside DTB=C2=A0 | CFG | IMG |
> |-----------+---------------+-----+------------------+-----+-----|
> | kirkstone | latest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | "0" | =
{dev}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 Y=C2=A0=C2=A0 | N=C2=A0=C2=A0 |
> | kirkstone | latest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | "1" | =
{dev,dev2}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Y=C2=A0=C2=A0 | Y=C2=A0=C2=
=A0 |
> |-----------+---------------+-----+------------------+-----+-----|
> | scarthgap | latest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | "0" | =
Build failed (!) | n/a | n/a |
> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | + dummy=
 dev2=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 | {dev2}=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Y=C2=A0=C2=A0 | N=C2=A0=C2=A0 |
> | scarthgap | latest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | "1" | =
{dev2} (!)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Y=C2=A0=C2=A0 | Y=C2=A0=C2=
=A0 |
> |-----------+---------------+-----+------------------+-----+-----|
> | scarthgap | w/o @d7bd9c62 | "0" | {dev}=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | Y=C2=A0=C2=A0 | N=C2=A0=C2=A0 |
> | scarthgap | w/o @d7bd9c62 | "1" | {dev,dev2}=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | Y=C2=A0=C2=A0 | Y=C2=A0=C2=A0 |
>=20
> The first two lines show that on kirkstone when FIT_SIGN_INDIVIDUAL=3D"=
0"=20
> only the configurations are signed and the DTB contains only the "dev"=20
> key. When FIT_SIGN_INDIVIDUAL=3D"1" both "dev" and "dev2" are present i=
n=20
> the DTB and both the configurations and the images are signed.

This last part is a bit odd. The behavior you describe would imply that=20
FIT_SIGN_INDIVIDUAL=3D"1" is some sort of setup which signs both=20
configurations (which include signature of referenced images) and images=20
themselves, which would be redundant.

> And=20
> that's the exact same behavior I got on scarthgap after reverting the=20
> commit d7bd9c62. And, as I said, this seems to match the documentation.
> I've attached snippets of the fdtdump for the FIT image and U-Boot DTB=20
> from my build on kirkstone to illustrate what I said.

See the U-Boot documentation:

https://docs.u-boot.org/en/latest/usage/fit/signature.html

And especially this section:

https://docs.u-boot.org/en/latest/usage/fit/signature.html#signed-configu=
rations

That is why I find the signing of both images and configurations odd.

> So, if the expected behavior is according to what you described then th=
e=20
> behavior so far was wrong (for a long time) and the new behavior is=20
> introducing a breaking change for anyone relying on what's documented=20
> for the FIT_SIGN_INDIVIDUAL=3D"1" case, right?

I believe FIT_SIGN_INDIVIDUAL=3D"1" did not work correctly, yes. I also=20
think FIT_SIGN_INDIVIDUAL=3D"1" should not be used, because of the mix an=
d=20
match attack, please see U-Boot documentation above.

+CC Sean to get second opinion here.

> Btw, for us at Toradex this=20
> is not a big deal because we don't fall into that case but considering=20
> the general use of the layer the change in behavior could be an issue.
>=20
> Another piece of information that might be useful: I made a change to=20
> concat_dtb() to make it add both keys (dev/dev2) to the DTB (by invokin=
g=20
> mkimage twice) and I found the invocation to "uboot-fit_check_sign"=20
> failed afterwards. I confirmed that the DTB had the two keys, but=20
> because the FIT image only had the configurations signed, the tool thre=
w=20
> an error saying the signature of "require key dev2" could not be=20
> verified but the showed that the check of the "dev" key succeeded.=20
> Unfortunately I don't have the logs available for that case, but I coul=
d=20
> repeat the tests if needed. Anyway, my point is that the "uboot-=20
> fit_check_sign" tool seems capable of checking both keys as well.
>=20
> Interestingly, if I removed the verification step (performed on the=20
> "unused.itb" file), then the image generation succeeded and everything=20
> seemed to work as before both when FIT_SIGN_INDIVIDUAL is "0" or "1".
> So, it's not hard to get the old behavior, though we'd need to figure=20
> out how to properly do the verification when mkimage is invoked with -f=
=20
> "auto" or -f "auto-conf". I could post my unfinished patch if helpful.

I am not convinced adding the old behavior is the right thing to do,=20
please see above.

But I am also unsure what to do about people depending on the old=20
behavior, which I think is odd. Thoughts ?

