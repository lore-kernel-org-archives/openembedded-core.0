Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27852FF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 08:43:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6735.1777452218124817021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 01:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0qjRAldQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 020FF1A3478
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 08:43:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA9CC601DF;
	Wed, 29 Apr 2026 08:43:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CEC110729990;
	Wed, 29 Apr 2026 10:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777452215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6p4W0YkIHr+OmzW3xW87Rmi1G6Dfs7uoL+vkY1SnSGw=;
	b=0qjRAldQ/8xgeVY8+ZyzB/axgJFO97TWHfY50kwWju9fBQ94x7MFKg1jczrFZo7Jc5tje1
	roqIF3En+YYxd5d97OadmDYxoP1/g0TjAo2DmbuwJsO9X5bbjtmqUrr4ZJbY/iQvsHs8A8
	IfjT9Jt8Mzs/8R21WFAkZqaZx1rjRFGjc7JQN/hV19cWuUNZap9Pb1ZTaGtnaDgF7Azy6j
	ASprApFSg/tF7L5XHJjliSA+/1XpjjKO3eaJGgKAa8u7PZAKqSgR7oC5t4CiOap1enHLoO
	QjVAf4JMZ8tA2tyD76L+RrX0V8HJo1WCRy8E17QOXZpjXLhsDyvcENc/7SsBIQ==
Message-ID: <d322d9ea-5312-4033-a0fc-91abd7fd71cb@bootlin.com>
Date: Wed, 29 Apr 2026 10:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after DTC
 update
To: richard.purdie@linuxfoundation.org, festevam@gmail.com,
 openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com, marek.vasut@mailbox.org
References: <20260429001811.2723886-1-festevam@gmail.com>
 <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 08:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236087

Hello,

On 4/29/26 10:03, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2026-04-28 at 21:18 -0300, Fabio Estevam via lists.openembedded=
.org wrote:
>> From: Marek Vasut <marek.vasut@mailbox.org>
>>
>> Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>> build will surely not find host /usr/include/yaml.h file and
>> will disable yamltree build. For details, see U-Boot commit
>> 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
(...)
>>  =20
>> +# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>> +# build will surely not find host /usr/include/yaml.h file and
>> +# will disable yamltree build. For details, see U-Boot commit
>> +# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot")
>> +PKG_CONFIG_SYSROOT_DIR:prepend =3D "/invalid/"
>=20
> This feels a bit like a hack. Is there not a config option we can pass
> to u-boot to make this deterministic, i.e. always disable libyaml?
>=20
> Cheers,
>=20
> Richard

Maybe setting/appending "-DNO_YAML" at HOST_EXTRACFLAGS (e.g., through=20
EXTRA_OEMAKE or BUILD_CFLAGS)?

In the end, that's a direct consequence of having an invalid=20
PKG_CONFIG_SYSROOT_DIR:
https://github.com/u-boot/u-boot/blob/master/scripts/dtc/Makefile#L21

It is still kind of a hack, though, but I hope it helps!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

