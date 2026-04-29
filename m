Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE48BFF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:48:01 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7808.1777456072960414185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=l3ArgMB1;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g5CCT01G7z9v3n;
	Wed, 29 Apr 2026 11:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777456069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGU4KoBSStVL4SM5l3EMHFGzIkL9gnf24Lvk6gCXdPU=;
	b=l3ArgMB1rcQ7MLpoEM+8l+RiqgHeoW7b4o4bmxp14utrtqZt4BDybSKUahSUV/hZMwvafv
	33XZNWIerosqk5LLRxCKqnOgfm72MsGGKDvdSMcRYISVOPvIpV1vBSIMEDCmhbXnIevnM2
	FvZ1DDMhd3kAlfHgtcxObpexFpfX7vuissqxgZbFSolxxbBgc0f9OhriYBB1fgYJ2ncqJS
	ACsb9vH7IEl/pg82F1XsXybdaWLJrAosFZMabTgooHNqkM+mrgJPL66Q9tomYO6mDbRuKe
	/DxQ83XnvWb9/b02Qwt/XKopequEVDgpGFoqBrzXRDmMGHHZ5lOVKMB5OSquaA==
Message-ID: <a5a2b4a5-3392-4a90-974b-c72a892e8e27@mailbox.org>
Date: Wed, 29 Apr 2026 11:47:46 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after DTC
 update
To: Richard Purdie <richard.purdie@linuxfoundation.org>, festevam@gmail.com,
 openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com
References: <20260429001811.2723886-1-festevam@gmail.com>
 <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
 <70662038-11e3-46d4-b2cb-ff603ab3858f@mailbox.org>
 <88c70e057ecc5e570253905c61d7d69dac4d2364.camel@linuxfoundation.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <88c70e057ecc5e570253905c61d7d69dac4d2364.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-MBO-RS-META: s87b4x54nn3qw3yjk9ofaqmaw34jjprh
X-MBO-RS-ID: ff67a3dfe4a24ec8809
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236094

On 4/29/26 10:56 AM, Richard Purdie wrote:
> On Wed, 2026-04-29 at 10:36 +0200, Marek Vasut wrote:
>> On 4/29/26 10:03 AM, Richard Purdie wrote:
>>> On Tue, 2026-04-28 at 21:18 -0300, Fabio Estevam via lists.openembedd=
ed.org wrote:
>>>> From: Marek Vasut <marek.vasut@mailbox.org>
>>>>
>>>> Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>>> build will surely not find host /usr/include/yaml.h file and
>>>> will disable yamltree build. For details, see U-Boot commit
>>>> 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>>>> ---
>>>>  =C2=A0=C2=A0meta/recipes-bsp/u-boot/u-boot-tools.inc | 7 ++++++-
>>>>  =C2=A0=C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes=
-bsp/u-boot/u-boot-tools.inc
>>>> index a055409c2cb0..071746b64e24 100644
>>>> --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
>>>> @@ -1,5 +1,5 @@
>>>>  =C2=A0=C2=A0SUMMARY =3D "U-Boot bootloader tools"
>>>> -DEPENDS +=3D "gnutls openssl util-linux swig-native libyaml-native"
>>>> +DEPENDS +=3D "gnutls openssl util-linux swig-native"
>>>>   =20
>>>>  =C2=A0=C2=A0inherit python3native
>>>>  =C2=A0=C2=A0export STAGING_INCDIR =3D "${STAGING_INCDIR_NATIVE}"
>>>> @@ -88,3 +88,8 @@ RDEPENDS:${PN}:class-native =3D ""
>>>>   =20
>>>>  =C2=A0=C2=A0BBCLASSEXTEND =3D "native nativesdk"
>>>>   =20
>>>> +# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>>> +# build will surely not find host /usr/include/yaml.h file and
>>>> +# will disable yamltree build. For details, see U-Boot commit
>>>> +# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot=
")
>>>> +PKG_CONFIG_SYSROOT_DIR:prepend =3D "/invalid/"
>>>
>>> This feels a bit like a hack. Is there not a config option we can pas=
s
>>> to u-boot to make this deterministic, i.e. always disable libyaml?
>> Currently there is not, but Linux did drop the whole yamltree part in
>> ef8795f3f1ce ("dt-bindings: kbuild: Use DTB files for validation") and
>> U-Boot should do the same. This path change is the minimum invasive
>> change to achieve disabled yamltree with current U-Boot, until this is
>> fixed upstream the same way Linux fixed it.
>=20
> Lets just explicitly patch the code out then or something, I'm not sure
> we need to be minimally invasive here.
>=20
> I really don't like hacks which people may copy/propagate and which can
> have interesting unintended side effects.
This is fine by me. Let me comment on the email from Quentin real quick=20
with a bit more elaborate patch plan.

