Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84356CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:08:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7242.1779264488083204718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=QKLmpRCB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0CAC4E42CFD;
	Wed, 20 May 2026 08:08:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1FBC6070E;
	Wed, 20 May 2026 08:08:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BCFB107E9D66;
	Wed, 20 May 2026 10:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779264484; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7Y016/8ZM6UHsOSsG1r4fDgMki7vl063FNurvrlH1Yc=;
	b=QKLmpRCBTQMWT4wpVDHTan44Csr+v3yq6Vbs+oO8DwevG3Rjv3JALB8Jj8WTun/iuRCOJc
	0FFrq+zE0tXO8jQa3A1Ky98Up4UmkbpF+U54M0piCGgWCVTMUj6a+sk3B1IJHB0z6s+KEs
	oXRKmNePZEMjaY5ZRXWnSELzrvdB5FxUZeCkYAISxpcTe8gMxF4DuUoCDx6YSORFtRS+hs
	O7v/LH3g2WrWnY0yUnvG3BQWypEleKYs3s4e/UOYkkPlUE0vSV8KIDsv+tsbMLM7CSFdpx
	Bb2fid3z41wSYBZqW5Vga9Rf4a/oej82pmy1wr8MrXeXQ4VB/r2s+CKb9kfB4g==
Message-ID: <366342bf-aba4-4d37-bb27-ea4bb7045b45@bootlin.com>
Date: Wed, 20 May 2026 10:08:01 +0200
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
 <9910b568-95f2-43ce-921f-3556482854d1@bootlin.com>
 <766ed885-2fd7-4752-8049-a8118a916c70@rootcommit.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <766ed885-2fd7-4752-8049-a8118a916c70@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237390

Hello,

On 5/19/26 18:24, Michael Opdenacker wrote:
> Hi Jo=C3=A3o Marcos
>=20
> On 5/19/26 3:51 PM, Joao Marcos Costa wrote:
>> Hello again,
>>
>> On 5/18/26 21:12, Michael Opdenacker wrote:
>>> Hi Jo=C3=A3o Marcos
>>>
>>> FYI, building the "qemuriscv64" machine is still broken on OE-core=20
>>> (master), and it's seems likely to be related to this change;
>>>
>>> | /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
>>> | yamltree.c:(.text+0x8fa): undefined reference to=20
>>> `yaml_emitter_initialize'
>>> | /usr/bin/ld: yamltree.c:(.text+0x905): undefined reference to=20
>>> `yaml_emitter_set_output_file'
>>> | /usr/bin/ld: yamltree.c:(.text+0x912): undefined reference to=20
>>> `yaml_stream_start_event_initialize'
>>> | /usr/bin/ld: yamltree.c:(.text+0x91d): undefined reference to=20
>>> `yaml_emitter_emit'
>> (...)
>>
>> This looks very much as the case described here:
>>
>> https://github.com/u-boot/u-boot/commit/807bcd844afeadbfe47ac132524cc7=
e3b699bc46
>>
>> Which could explain why it wasn't caught in the autobuilder, and why=20
>> I'm not able to reproduce it in my container that does not natively=20
>> provides this lib (i.e., no /usr/include/yaml.h).
>=20
>=20
> Indeed, I had the "libyaml-dev" package on my Debian 13 system, and the=
=20
> problem goes away when I remove it.
> So, this explains why our autobuilder didn't catch this and I'm the onl=
y=20
> one who seems to be impacted.
>=20
> So, this is a U-Boot issue. However, I wonder why the problem is still=20
> there while the above commit (present in 2026.04 that we're using) is=20
> supposed to fix it...
> Thanks again
> Cheers
> Michael.

Well, yes, it was not a definitive solution. In fact, fixing this once=20
and for all was originally the point of my patch, which is merged into=20
u-boot's master, but not in 2026.04 tag.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

