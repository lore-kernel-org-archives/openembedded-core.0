Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5A7CD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 16:24:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2784.1779207885278897305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 09:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=nvtWZov6;
 spf=pass (domain: rootcommit.com, ip: 185.171.202.116, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 52F10C2B9E9;
	Tue, 19 May 2026 16:25:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2C745FFC8;
	Tue, 19 May 2026 16:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFA7A107E9380;
	Tue, 19 May 2026 18:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779207882;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kBzp4tGjfgv25iBAxBkoLlFurEYVZYDHWvuuAeQ2TNE=;
	b=nvtWZov6j/eShTrTE/SK9dU70vCtnR9g35d6NhBJY67iu19C/Hk/c28A7wT0RCG3/RTDpK
	6blZo+G/MPyO7cN1ni7udr1BHIO64MXowyFyXz7OJLGc7GoASU2tcTBcPGxx0Jdl1GFghP
	tx6k5EJ1GENygm9Kh2lC7Rtz5/9M/acgqmQF3oeh6ocHu6mdJzeXMTnJD0QxCxK5futw+T
	vVd0HQIVcOfejAG/dwFf8KwrFPd32s/ym0bwcmuzdA+MnStRzI6Vs13yt+hGekJBQJJSy8
	rlG0rebagPT028jz67Y+w0JPbDVpVj33850FY9HSZYzEvnywMGEm/fJ2m+mkgg==
Message-ID: <766ed885-2fd7-4752-8049-a8118a916c70@rootcommit.com>
Date: Tue, 19 May 2026 18:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
 quentin.schulz@cherry.de, marek.vasut@mailbox.org, festevam@gmail.com,
 khem.raj@oss.qualcomm.com, ricardo.salveti@oss.qualcomm.com
Subject: Re: [OE-core] [PATCH v2 0/1] u-boot-tools: drop yaml in DT validation
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
References: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
 <CAA_5yovdT5_WHP4mTR3ZMP3xodPQfsw1z5wH98vSrBwMWhZwwQ@mail.gmail.com>
 <4533420d-afdf-4d10-a5cb-3e111d96e2d4@rootcommit.com>
 <9910b568-95f2-43ce-921f-3556482854d1@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <9910b568-95f2-43ce-921f-3556482854d1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237334

Hi Jo=C3=A3o Marcos

On 5/19/26 3:51 PM, Joao Marcos Costa wrote:
> Hello again,
>
> On 5/18/26 21:12, Michael Opdenacker wrote:
>> Hi Jo=C3=A3o Marcos
>>
>> FYI, building the "qemuriscv64" machine is still broken on OE-core=20
>> (master), and it's seems likely to be related to this change;
>>
>> | /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
>> | yamltree.c:(.text+0x8fa): undefined reference to=20
>> `yaml_emitter_initialize'
>> | /usr/bin/ld: yamltree.c:(.text+0x905): undefined reference to=20
>> `yaml_emitter_set_output_file'
>> | /usr/bin/ld: yamltree.c:(.text+0x912): undefined reference to=20
>> `yaml_stream_start_event_initialize'
>> | /usr/bin/ld: yamltree.c:(.text+0x91d): undefined reference to=20
>> `yaml_emitter_emit'
> (...)
>
> This looks very much as the case described here:
>
> https://github.com/u-boot/u-boot/commit/807bcd844afeadbfe47ac132524cc7e=
3b699bc46=20
>
>
> Which could explain why it wasn't caught in the autobuilder, and why=20
> I'm not able to reproduce it in my container that does not natively=20
> provides this lib (i.e., no /usr/include/yaml.h).


Indeed, I had the "libyaml-dev" package on my Debian 13 system, and the=20
problem goes away when I remove it.
So, this explains why our autobuilder didn't catch this and I'm the only=20
one who seems to be impacted.

So, this is a U-Boot issue. However, I wonder why the problem is still=20
there while the above commit (present in 2026.04 that we're using) is=20
supposed to fix it...
Thanks again
Cheers
Michael.

--=20
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


