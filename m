Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA25CD612E
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 19:30:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.72382.1696879843151911055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 12:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=t6KF67tt;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8076486489;
	Mon,  9 Oct 2023 21:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696879840;
	bh=Rf1h04pPRUrXVw4wIlWNggiFlAF6hBCmMho4U4MSjGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t6KF67ttPum+GVuDPApKXERs2ks1n3lMwZSFofwYzIUjKc/a7qOwVFFAYiPFtYZeU
	 Dl8gl0VJFwTJqRXlxsnI2AZPFMXcbaRaqrtJ5euYKIB+2CWhipHDucIrS0qP5PMwwD
	 glStNggUtIrpQPL4++Bb8IwdRsjh4M6LiH8lErNueBmPsFSiS/QEf2fHGXAKqztaVF
	 HMhcfpHWCovuYQC5F/SMLWl062HlpIWiEmlBW7GZu3NGOFL1E1zYJvKRXPzE1SWFPf
	 4OKJc6jZ6oCyXPWUWKCiMKjOjDVoISi0E6E1ZP+/02P/+FGRAsaQPsUD04DjylAub0
	 ehupPqj2Sbkqg==
Message-ID: <07bc9f40-104c-478b-9077-db6a2c3099f1@denx.de>
Date: Mon, 9 Oct 2023 21:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [dunfell][PATCH] gawk: Backport CVE-2023-4156 fix
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231009162700.94188-1-marex@denx.de>
 <CAOSpxdY7SXb=Xak8KQKkbjM4VHj38n0cDHjQ7mOG1DEm4O1jSQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAOSpxdY7SXb=Xak8KQKkbjM4VHj38n0cDHjQ7mOG1DEm4O1jSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 19:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188865

On 10/9/23 19:29, Steve Sakoman wrote:
> On Mon, Oct 9, 2023 at 6:27=E2=80=AFAM Marek Vasut <marex@denx.de> wrot=
e:
>>
>> Pick fix for CVE-2023-4156 from ubuntu 20.04
>>
>> A heap out-of-bounds read flaw was found in builtin.c in the gawk
>> package. This issue may lead to a crash and could be used to read
>> sensitive information.
>>
>> https://nvd.nist.gov/vuln/detail/CVE-2023-4156
>>
>> https://packages.ubuntu.com/source/focal/gawk
>> gawk_5.0.1+dfsg-1ubuntu0.1.debian.tar.xz / 12.9 kB / 12d878acc04cd6328=
b793455547c870f
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>>   .../gawk/gawk/CVE-2023-4156.patch             | 26 +++++++++++++++++=
++
>>   meta/recipes-extended/gawk/gawk_5.0.1.bb      |  1 +
>>   2 files changed, 27 insertions(+)
>>   create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2023-4156.pat=
ch
>>
>> diff --git a/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch b/met=
a/recipes-extended/gawk/gawk/CVE-2023-4156.patch
>> new file mode 100644
>> index 0000000000..ecfd974af0
>> --- /dev/null
>> +++ b/meta/recipes-extended/gawk/gawk/CVE-2023-4156.patch
>> @@ -0,0 +1,26 @@
>> +From e709eb829448ce040087a3fc5481db6bfcaae212 Mon Sep 17 00:00:00 200=
1
>> +From: "Arnold D. Robbins" <arnold@skeeve.com>
>> +Date: Wed, 3 Aug 2022 13:00:54 +0300
>> +Subject: [PATCH] Smal bug fix in builtin.c.
>> +
>> +CVE: CVE-2023-4156
>=20
> Missing Upstream-Status.  Note that ubuntu isn't upstream so please
> link to upstream gawk commit.

Should be fixed in V2, sorry for the mess.

