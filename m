Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB20CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:35:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.48800.1759134894689773946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zt9S7Yp7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4B98AC0078E;
	Mon, 29 Sep 2025 08:34:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6D2F606AE;
	Mon, 29 Sep 2025 08:34:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 828C3102F1849;
	Mon, 29 Sep 2025 10:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759134892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SWX+XOQAp5W0Eq0VQH/vzhKYKtqFEA+VbsAE6XS465A=;
	b=zt9S7Yp7gHBNDPF8BT/uWmg7ab5JgKQ1AFWr+i7iftq/xYn/c5+i5/2xTxKNBqGzbHUoEz
	c9Nep4m+QdTwUW3NHoFZj1hYqbaxgl+DDt9ZuLHcqbUI4cgSTWAAPfz3BxPrN1uuNc5/f4
	P/26HmH25L96Mu57rdd5QXdJ0Xd0l++WvdCO6ViznVhpo14NoGqjF4O4jxfxw50cWmoxp5
	1hHPJaorZaG220+8u6yk7bvMyWY9uEaJKM25jpwyNUauWPdsJ4C1qHN54BWoeW8dozDFNx
	Iz5IrWXUJ8bAAYiI8xP9rSPjuSrso6HU2enm5eeZZwCOwzMYviOh4oENFkP/YA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 10:34:50 +0200
Message-Id: <DD559WH6JH42.39SI3VILMNKY4@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yoann.congal@smile.fr>
Subject: Re: [OE-core] [PATCH] sanity: Update minimum gcc version to 10.1
References: <20250929-min-gcc-version-v1-1-c93d7f5a4f49@bootlin.com>
 <CAMSfU+5b1Dd2fohNSgs1pT-9By8cPkv-HLpg3BoO0cveY_78Qg@mail.gmail.com>
In-Reply-To: <CAMSfU+5b1Dd2fohNSgs1pT-9By8cPkv-HLpg3BoO0cveY_78Qg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224127

On Mon Sep 29, 2025 at 10:25 AM CEST, Yoann Congal via lists.openembedded.o=
rg wrote:
[...]
>> -# Require at least gcc version 8.0
>> -#
>> -# This can be fixed on CentOS-7 with devtoolset-6+
>> -# https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
>> +# Require at least gcc version 10.1
>>  #
>>  # A less invasive fix is with scripts/install-buildtools (or with user
>>  # built buildtools-extended-tarball)
>>  #
>>  def check_gcc_version(sanity_data):
>>      version =3D oe.utils.get_host_gcc_version(sanity_data)
>> -    if bb.utils.vercmp_string_op(version, "8.0", "<"):
>> -        return "Your version of gcc is older than 8.0 and will break
>> builds. Please install a newer version of gcc (you could use the project=
's
>> buildtools-extended-tarball or use scripts/install-buildtools).\n"
>> +    if bb.utils.vercmp_string_op(version, "10.1", "<"):
>> +        return "Your version of gcc is older than 10.1 and will break
>> builds. Please install a newer version of gcc (you could use the project=
's
>> buildtools-extended-tarball or use scripts/install-buildtools).\n"
>>
>
> While you are modifying this line could you make the version a single
> variable instead of repeating it twice? (I know I would forget to update
> the one in the message -_-')

Hi Yoann,

This is not limited to this test, I think most of the check_*_version tests
could benefit from that improvement. Maybe it's more relevant to have a sep=
arate
patch for this improvement, instead of just here?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


