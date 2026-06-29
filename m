Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03050C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:09:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87457.1782720572323116934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 01:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZnbI3Uf2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FA921A088A;
	Mon, 29 Jun 2026 08:09:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 651595FF96;
	Mon, 29 Jun 2026 08:09:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0570106F158C;
	Mon, 29 Jun 2026 10:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720569; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y3lUJJnlOXe6fMLl0Mr1pS8CS3b841v9Fo6gtdrxSdc=;
	b=ZnbI3Uf2Gk1Ui+df1SUTq1f/pmu8AJxh9Wvptc1h0BQaWY24UuLeWwQsqq3hMgPvRNEZEN
	w622hsKQNjKuSMRn09EveQ+9bx6DVOdE/6NVPAuMMiZ3KwdBPIaOkewDTArGwPBC20jFiX
	3klozNAdtIevtCw2d25uuRgVnyFIBqouaZEp0CVCwmf2QDZ+zHh+iiQ+STV7aHFDn75Avq
	gRDx2/ZL7Wtmx7M1CZa9mr9lIjiw5JGrJAOOg+ySrlJgkaD8yRAVQyYWd2JrspSF+YIK3x
	qYo/yJxUTx8+peGBC7yjzg9QN10OS3/6iL1g/ev5RMjKaoNQhQi4pcP29Q/w3A==
Message-ID: <53e5f5cc-f919-4ac1-879d-0d5381bdfc57@bootlin.com>
Date: Mon, 29 Jun 2026 10:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 4/5] llvm-project-source.inc: add vardeps to
 do_preconfigure
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, raj.khem@gmail.com
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
 <20260623120818.110754-5-joaomarcos.costa@bootlin.com>
 <9ec404ced0ab0f4762d9c4e863ffe67de4baa025.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <9ec404ced0ab0f4762d9c4e863ffe67de4baa025.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239733

Hello, Richard

On 6/28/26 12:25, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2026-06-23 at 14:08 +0200, Joao Marcos Costa via lists.openembe=
dded.org wrote:
>> The task's signature should change if CLANG_EXTRA_OE_DISTRO and/or
>> CLANG_EXTRA_OE_VENDORS, considering the couple of for loops in
>> do_preconfigure iterate over their values.
>>
>> By adding them to 'vardeps', bitbake will correctly detect if
>> do_preconfigure needs to be executed.
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>> ---
>>  =C2=A0meta/recipes-devtools/clang/llvm-project-source.inc | 1 +
>>  =C2=A01 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/met=
a/recipes-devtools/clang/llvm-project-source.inc
>> index 85b5ef06dc..84d4bae0ab 100644
>> --- a/meta/recipes-devtools/clang/llvm-project-source.inc
>> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
>> @@ -90,4 +90,5 @@ python do_preconfigure() {
>>  =20
>>  =C2=A0do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANTS"
>>  =C2=A0addtask do_preconfigure after do_patch
>> +do_preconfigure[vardeps] +=3D "CLANG_EXTRA_OE_DISTRO CLANG_EXTRA_OE_V=
ENDORS"
>>  =C2=A0do_create_spdx[depends] +=3D "${PN}:do_preconfigure"
>=20
> We require that tasks can run in isolation and that can happen for many
> different reasons. Your fix does improve things a bit but it doesn't
> fix the underlying problem.
>=20
> Ideally we'd change the search/replace expressions so that they always
> change/update the required entries. That does sometimes need a bit more
> thought about how the expressions work and it means you can't use
> replacement tokens (unless as a comment on the line above?).
>=20
> Another less optimal way to improve things is to change do_preconfigure
> into a postfunc for do_unpack, but it wouldn't be able to change things
> altered by do_patch. You can't make it a do_patch postfunc as it could
> still have the current issues with the changes not being updated.
>=20
> Cheers,
>=20
> Richard

I see your point. I'd be more eager to have a reproducible=20
search/replace strategy than using postfuncs, but this would require=20
some more time, and I will soon be OOO for a few days.

What is the perspective for this series? Does it heavily depend on this=20
last part? I would prefer not to delay this fix any longer, and I could=20
send another series later to add some testing (to avoid regressions in=20
the future), and a more solid search/replace in do_preconfigure.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

