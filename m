Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C3DEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 21:59:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.2301.1687903182428805483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 14:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=irKm4v3E;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 40F05865F1;
	Tue, 27 Jun 2023 23:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1687903180;
	bh=JdNsdcYkBDBehtgjHovk75lVEsRAwjcCtYcs0inAnFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=irKm4v3EPW3nJXS5J7uYUFHGNK+KL2OKaLbacblYufBIpUxWtqoLHeK5fY7tRsFtz
	 6FA3zkacLU3nXoh4hpttFTvb01a2FcT3UheN97urVRnwgZxyf7UQVeSl9a/KskSYfv
	 FvvTD8UPh3dP4EYDqzDRZmnEiq9JXwsC6u3vfeaoq+VSZ12/4VamdRu/UsPLMkAgvQ
	 VlMKAlpj+QFr+qZUCvK9NHXn6RiM+4BWS24Kg9HYav97wGy4lM76DGInauW4ePkVuP
	 WcU265DHyH5t/q3uLMyNzhZ5+O25F67cuw2YgllEuj3fLNzirHrhbPEvkgWREyp9+Q
	 EdcDFsRXjjdPg==
Message-ID: <b348e1ac-5222-6ad9-4e1f-1b2ddec3074c@denx.de>
Date: Tue, 27 Jun 2023 23:23:24 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAOSpxdYin7XBvq-r+CW1s6wan28cNnuJbsj-rHLXEx7_+NMCuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 21:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183503

On 6/27/23 16:08, Steve Sakoman wrote:
> On Sun, Jun 25, 2023 at 3:50=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
>>
>> Replace the original "Wrong CRC with ASCII CRC for large files"
>> patch with upstream backport, and add additional fix on top of
>> the same problem which upstream detected and fixed.
>=20
> Your replacement patches are missing Upstream-Status and Signed-off-by =
tags:
>=20
> ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
> /home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/cp=
io-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
> Please add according to
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch=
_Header_Recommendations:_Upstream-Status
> .
> ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
> /home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/cp=
io-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
> Please add according to
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch=
_Header_Recommendations:_Upstream-Status

Upstream-Status was indeed missed.

What do I put into SoB line if the original patches have no SoB line=20
(which btw is common in other backports in OE-core and e.g. oelint-adv=20
warns about that too) ?

