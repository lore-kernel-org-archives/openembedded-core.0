Return-Path: <joerg.vehlow@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4E5CA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 04:53:42 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1447.1791348816544214474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 21:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=BWmazSHs;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=BzM97LWx;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1791348814;
	bh=WMd5jGxTmJ/D+PrJgkVY27Blk6sTO2Qg4gAi4nIPGwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BWmazSHsbvmokoyYqQtoKBt4tjTzhvVI9selEifBXzNR9lorHpw02FuTPauJ+wdIw
	 gX0YJKYhOql8WQct0NfBXAXR07bBr/HtkZeHFpbO7OGxvK6UfJhArYKPhrSWy5kcfk
	 jsWcKFjP+wMZCRIbK+gJxXZaYpiI042Yu6X7j2DMCBmmWxqZ6lqDaxrFVwgmb5Frvj
	 r1QGz3dyoJSCpVqRPCsie1u1AOhR2MhbDNLfVl5NcJiJJzpAGYAj9Gaw8XQXaRBiv1
	 HybwRQUCrdm3hcACQEMhhCEtUVyLO3kAh25aLVmZfGtHa4YApkYuqLNAbcdT6/r+yg
	 u+AWf4u+fFLKA==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id F38AB5F871;
	Wed, 07 Oct 2026 06:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1791348813;
	bh=WMd5jGxTmJ/D+PrJgkVY27Blk6sTO2Qg4gAi4nIPGwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BzM97LWxKFQ7XDaLtjw0UKULdlfxNhFxDArwktVgC5DkmfnktePMYwH4HKxpwhDvZ
	 IcaEgUwV6QVQJXt1noK+gDYE0czzmJbDqtRE0yUfcvlIK+Knwdcy3IzVbVoywr50SY
	 wcGu1+8xMmlaTqAdWo6xAfScnPngg529gSfTG9PtH7bFfbX7jfHIradrRNTdQ1ZwJd
	 lFbidAgBuuTrPbserzCtdzbogBmqFgKlgxt2CCJDQqXgJkAH9M94xw5r3eLchavYx6
	 xhtH3+C+/FdFqNfnBYTHjvPaUpCNHEy1LloryBOxTcvl7yjmlcWy7Qxp28ynak2taZ
	 Jnxsa5+rBu1qg==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id C3E655F7F5;
	Wed, 07 Oct 2026 06:53:33 +0200 (CEST)
Message-ID: <9ba4f8e7-04bc-43e6-81f6-33a19e57bbc1@emlix.com>
Date: Wed, 7 Oct 2026 06:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260929072452.2187140-1-joerg.vehlow@emlix.com>
 <20261006180342.GM4190@denix.org>
 <a6a35af2707fad8c9efa1dabf4c737f2d7bb8589.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=B6rg_Vehlow?= <joerg.vehlow@emlix.com>
In-Reply-To: <a6a35af2707fad8c9efa1dabf4c737f2d7bb8589.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 04:53:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247357

Hi,

On 06.10.2026 20:42, Richard Purdie wrote:
> On Tue, 2026-10-06 at 14:03 -0400, Denys Dmytriyenko wrote:
>> On Tue, Sep 29, 2026 at 09:24:52AM +0200, Joerg Vehlow via
>> lists.openembedded.org wrote:
>>> Using EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append created a new
>>> override
>>> for EXTRA_OECONF, which led to almost all EXTRA_OECONF switches to
>>> be ignored.
>>> Furthermore, setting --without-headers here is not required,
>>> because it is set in gcc-cross.inc.
>>
>> I fully realize this change has good intentions, but it actually
>> breaks
>> baremetal. We've been trying to debug this for the past couple of
>> days.
Sorry for the inconvenience.>>
>> While we run our baremetal in a multiconfig, you don't need that to
>> reproduce
>> the breakage only with OE-Core by adding these 2 lines to local.conf:
>>
>> TCLIBC =3D "baremetal"
>> MACHINE =3D "qemuarm"
We are building a baremetal multiconfig with a custom arm v7 machine and=20
it was working without any problems (though not oe core master).
I knew that this change severely changes the EXTRA_OECONF, but that was=20
the whole point of the patch.>
> Sorry, please send a revert. I'd checked it looked like it did the
> right thing but it clearly doesn't. I suspect some "interesting"
> operator interaction :/
Not really. The reason this has such a big impact is that

FOO =3D "foobar"
OVVERIDES =3D "bar"
FOO:bar:append =3D "foo"

results in FOO =3D "bar" instead of the expected FOO =3D "foobar foo".
But that must have been the original intention (and maybe) it was even=20
what it was doing before the syntax change for overrides?

I would say the bug is no in the gcc recipe, which should remove all=20
unsupported flags on baremetal, so the fix should be done there and not=20
by reverting this patch. There is absolutely no reason to fiddle with=20
EXTRA_OECONF in the baremetal config, when the recipe clearly also tries=20
to accommodate baretmal.

J=C3=B6rg
>=20
> We may also want to consider better baremetal testing on the AB. I'm
> open to help with configs there...
>=20
> Cheers,
>=20
> Richard

--=20
emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
Office M=C3=BCnchen: Am Knie 16, 81241 M=C3=BCnchen, Germany
http://www.emlix.com

emlix - your embedded Linux partner


