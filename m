Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4768CD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 17:29:38 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10329.1777742977623500212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 10:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=uWqJx27o;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g7FJs6RRyz9scD;
	Sat,  2 May 2026 19:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777742974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGx1R7GGd05a9oFZ1P3HmzEPyoJjpPj2Ha4TJ+fyIQ0=;
	b=uWqJx27ojxtf50jQNsykUOuqU3g5ulTgD9nZXNLwiG9qoaJoyuX5KRytCgToJ1kl/qano4
	NJa+IJ9HfBOghIVMnZNvF/2lS6ufRfLWkouggmJ3uWy1mxVNC6hSQsqvGY4O2ibCGX5vPD
	zggLmX0ZYmxbilIqCAEkiTo18JwU+/PHqU5BdxkgaK9Lv28XYpp1HboHZsmMhPqU6y+DTx
	XT2RrbQ4zPpeJZqxwPGECvxLN1H8Yg/fsOJhE9yoiJB9KQjwYpazY/A5h+cBiLk/UDGbkM
	rVLbnhH6Q6dCGIUN94kDRO9h7kFNt2hRqPIzeVWyXqI+EEsBEXe/JF6lWbc/uQ==
Message-ID: <a8d75cfc-a4db-4c5c-b50e-1bc5f5df4511@mailbox.org>
Date: Sat, 2 May 2026 19:29:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] populate_sdk: Execute populate_sdk before rm_work if
 rm_work.bbclass active
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Adam Nilsson <Adam.X.Nilsson@axis.com>,
 Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Patrick Ohly <patrick.ohly@intel.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 Philip Lorenz <philip.lorenz@bmw.de>
References: <20260429233224.562584-1-marek.vasut@mailbox.org>
 <e1a87043b8d16e9d2d49d5b0a2ac6ca48a023644.camel@linuxfoundation.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <e1a87043b8d16e9d2d49d5b0a2ac6ca48a023644.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-MBO-RS-META: e8hw7c7wj4tu3rsyrwjxebsdtb7e6it9
X-MBO-RS-ID: d9e4c4de121bcd190f3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 17:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236426

On 4/30/26 10:46 AM, Richard Purdie wrote:

Hello Richard,

>> diff --git a/meta/classes-recipe/populate_sdk.bbclass b/meta/classes-r=
ecipe/populate_sdk.bbclass
>> index caeef5d2b2a..3b89ff997f5 100644
>> --- a/meta/classes-recipe/populate_sdk.bbclass
>> +++ b/meta/classes-recipe/populate_sdk.bbclass
>> @@ -10,4 +10,11 @@
>>  =C2=A0inherit populate_sdk_base
>>  =20
>>  =C2=A0addtask populate_sdk after do_install before do_build
>> -
>> +addhandler inject_sdk_rm_work
>> +inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
>> +python inject_sdk_rm_work() {
>> +=C2=A0=C2=A0=C2=A0 if d.getVar('RM_WORK_BUILD_WITHOUT'):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_popul=
ate_sdk', 'do_rm_work do_build', ' ', d)
>> +=C2=A0=C2=A0=C2=A0 else:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_popul=
ate_sdk', 'do_build', ' ', d)
>> +}
>> diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/clas=
ses-recipe/populate_sdk_base.bbclass
>> index b427ff27616..073949ebcde 100644
>> --- a/meta/classes-recipe/populate_sdk_base.bbclass
>> +++ b/meta/classes-recipe/populate_sdk_base.bbclass
>> @@ -435,3 +435,10 @@ do_populate_sdk[rdepends] =3D "${@' '.join([x + '=
:do_package_write_${IMAGE_PKGTYPE
>>  =C2=A0do_populate_sdk[recrdeptask] +=3D "do_packagedata do_package_wr=
ite_rpm do_package_write_ipk do_package_write_deb do_package_qa"
>>  =C2=A0do_populate_sdk[file-checksums] +=3D "${POSTINST_INTERCEPT_CHEC=
KSUMS}"
>>  =C2=A0addtask populate_sdk
>> +
>> +addhandler inject_sdk_rm_work
>> +inject_sdk_rm_work[eventmask] =3D "bb.event.RecipeTaskPreProcess"
>> +python inject_sdk_rm_work() {
>> +=C2=A0=C2=A0=C2=A0 if d.getVar('RM_WORK_BUILD_WITHOUT'):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.build.addtask('do_popul=
ate_sdk', 'do_rm_work', ' ', d)
>> +}
>=20
> The solution is creative but I suspect it will cause problems with
> populate_sdk being injected into builds where it otherwise wasn't going
> to run.

Currently, both populate_sdk.bbclass and populate_sdk_base.bbclass=20
already contain "addtask populate_sdk", so aren't those tasks already=20
injected into all such builds?

My understanding is, that bb.build.addtask() only extends that addtask=20
with optional " ... before rm_work" in case the rm_work bbclass is=20
inherited in the build, so it shouldn't change the current behavior of=20
these bbclasses, except for the rm_work case.

> There is clearly an issue here but I'm not sure it can be solved with
> the way tehe task graph code currently works. It might be time to have
> some kind of bitbake level API to better handle a task with the
> requirements rm_work has. I've long wondered if we should do something
> like that and this is a further sign we may not be able to do much
> else.

