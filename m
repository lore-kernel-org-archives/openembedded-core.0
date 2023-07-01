Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BDDEB64DC
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 01:30:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.791.1688261451420838055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 18:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=cRNYJp4c;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 32E3986177;
	Sun,  2 Jul 2023 03:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1688261448;
	bh=Tzog1d5IDHKq3Rie68mIeNYaa6t+4T8IHEFKdUxL3oE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cRNYJp4c+771AGztY5Y7vIDv96GRScWCx767zoDlFOwDlxtnzi2xMRDE5e9YBJxkF
	 +txjDNbCCCqXVflhfTuMfDEQ+nj/XCzWVKJ8CH4/K8pyP8u7dKWAGHG6hwPLedZ8oY
	 xa7zUanH37qIqsl1xYYgKlqlLynUK/icO2/6X9ghZTFmcCeUTP7uzgbGjdeFpirCn5
	 TAYDKi413dS8SD1NY2ePb1kgVQJFEaLqb2VCojRlO50wCzYI875zT8hG431fPoBioq
	 5Tv9CZBCnjzPv3qKhf0VyzR/FOWRET2zSXbw/KO/N6TtVIT3q2G5cYbGk+kx0Oxq4+
	 4l7VMeMIfkNqg==
Message-ID: <a848849f-752d-bd03-61d5-da30e56f97d0@denx.de>
Date: Sun, 2 Jul 2023 00:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [kirkstone][PATCH] cpio: Replace fix wrong CRC with ASCII CRC for
 large files with upstream backport
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
References: <20230625135020.104159-1-marex@denx.de>
 <CAOSpxdYin7XBvq-r+CW1s6wan28cNnuJbsj-rHLXEx7_+NMCuw@mail.gmail.com>
 <b348e1ac-5222-6ad9-4e1f-1b2ddec3074c@denx.de>
 <CAOSpxdYQ_7KZL4Zg=Rh5LwtSRT8M7P8NO5oc2A+-bfw7NyhYeQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAOSpxdYQ_7KZL4Zg=Rh5LwtSRT8M7P8NO5oc2A+-bfw7NyhYeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 01:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183773

On 6/28/23 00:05, Steve Sakoman wrote:
> On Tue, Jun 27, 2023 at 11:59=E2=80=AFAM Marek Vasut <marex@denx.de> wr=
ote:
>>
>> On 6/27/23 16:08, Steve Sakoman wrote:
>>> On Sun, Jun 25, 2023 at 3:50=E2=80=AFAM Marek Vasut <marex@denx.de> w=
rote:
>>>>
>>>> Replace the original "Wrong CRC with ASCII CRC for large files"
>>>> patch with upstream backport, and add additional fix on top of
>>>> the same problem which upstream detected and fixed.
>>>
>>> Your replacement patches are missing Upstream-Status and Signed-off-b=
y tags:
>>>
>>> ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
>>> /home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/=
cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
>>> Please add according to
>>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Pat=
ch_Header_Recommendations:_Upstream-Status
>>> .
>>> ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
>>> /home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/=
cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
>>> Please add according to
>>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Pat=
ch_Header_Recommendations:_Upstream-Status
>>
>> Upstream-Status was indeed missed.
>>
>> What do I put into SoB line if the original patches have no SoB line
>> (which btw is common in other backports in OE-core and e.g. oelint-adv
>> warns about that too) ?
>=20
> Probably common because only missing Upstream-Status generates an error=
!
>=20
> The Signed-off-by should be your name/email if you are kind enough to a=
dd it.

V2 should have those fixed.

