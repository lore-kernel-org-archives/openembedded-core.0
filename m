Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103C9CD5BAD
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 13:52:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21643.1779198715140863812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 06:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=NGQaYJIO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2204CC2B9E9;
	Tue, 19 May 2026 13:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD03F5FFC8;
	Tue, 19 May 2026 13:51:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD559107E92AA;
	Tue, 19 May 2026 15:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779198712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=p2Pv+YyHhqmx6nfvWt1DwrwOrhCSrVsqxs82IPXVZ6o=;
	b=NGQaYJIOMePIS0jQ70c3qP5gTQ1I58f6pVOpBygkirOGDEpdVbyObytTF0RvKMB+dlRAKI
	DH3sGZlvZW9o6a58FsMZdFlHQuhZdNZd0YlYyKFXGJum1nTnn/tu4+/x4OI+WwGjJd8f/3
	GkdbQp1Uz6WtD+Xni1YcCTQQVepJOWuU5eWBFqze8GjdEUOjAsm2LPPh9VeMoNaAvtj6Xl
	IivDh2rkDrI9zP05+RjHBUOy7Yi7ic0pU5sP5+RDWA6et3GwsNA2g9iRmQo+LVYZLbwqJj
	CQrBTxhLia35zV7VzKPoNmZDFs975H6IS2NncT8FK3qt/zB1LCd/6UweBQ7d2A==
Message-ID: <9910b568-95f2-43ce-921f-3556482854d1@bootlin.com>
Date: Tue, 19 May 2026 15:51:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/1] u-boot-tools: drop yaml in DT validation
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
 quentin.schulz@cherry.de, marek.vasut@mailbox.org, festevam@gmail.com,
 khem.raj@oss.qualcomm.com, ricardo.salveti@oss.qualcomm.com
References: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
 <CAA_5yovdT5_WHP4mTR3ZMP3xodPQfsw1z5wH98vSrBwMWhZwwQ@mail.gmail.com>
 <4533420d-afdf-4d10-a5cb-3e111d96e2d4@rootcommit.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <4533420d-afdf-4d10-a5cb-3e111d96e2d4@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 13:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237325

Hello again,

On 5/18/26 21:12, Michael Opdenacker wrote:
> Hi Jo=C3=A3o Marcos
>=20
> FYI, building the "qemuriscv64" machine is still broken on OE-core=20
> (master), and it's seems likely to be related to this change;
>=20
> | /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
> | yamltree.c:(.text+0x8fa): undefined reference to=20
> `yaml_emitter_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x905): undefined reference to=20
> `yaml_emitter_set_output_file'
> | /usr/bin/ld: yamltree.c:(.text+0x912): undefined reference to=20
> `yaml_stream_start_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x91d): undefined reference to=20
> `yaml_emitter_emit'
(...)

This looks very much as the case described here:

https://github.com/u-boot/u-boot/commit/807bcd844afeadbfe47ac132524cc7e3b=
699bc46

Which could explain why it wasn't caught in the autobuilder, and why I'm=20
not able to reproduce it in my container that does not natively provides=20
this lib (i.e., no /usr/include/yaml.h).

--=20
Best regards,
Jo=C3=A3o Marcos Costa

