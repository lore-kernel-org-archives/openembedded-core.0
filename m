Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9741.1794997915268427898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 02:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tMSejS5s;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 016D24E4162C
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:31:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C34A55FE9B
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:31:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B6F911BC103B;
	Wed, 18 Nov 2026 11:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794997912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lUFz6HDePdC0BwUyMMyWjanzmdeOpvv5KiZnfyujNDU=;
	b=tMSejS5sKSrCWQdXUsqkdAt49CEgW6jYmf6nVDPYoJRYttwMj6vIRVC/qcZB9C6/w2rtkn
	NfvNp03noFyA/LMd2UfmO6KI3ttL6AzwDrUYHT+OSlSuhGITkL7EwC4IA6L8DzSElzy905
	r2ileeEE4iEwduU8MbhDRHyytDBotN6pDl8D54r+2ZQS2OOkd3Q+tQBl29ZhK3+Kz7EcqJ
	i4gzdtq7WuXEb8d2CViazuxn63kdmhWkYh77tzTNPoSpxB8mte+YZUd/IChw7Fd2HcQ1id
	JTVUM96yN4RVgu10vF1xuGXC3hcUvwFfmApR4+46PRUS2ZowTKquEW3J5zWGGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 11:31:50 +0100
Message-Id: <DMY9NKCWW45J.EUS9CH7352K8@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 05/13] lib/oe: move
 oe.types.{is_x86,qemu_use_kvm} to oe.qemu
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
 <20261116-oe-lib-docstrings-v1-5-0c894f6a1064@bootlin.com>
 <DMXEK4LWEZJH.2MIWDYR9RRMC7@bootlin.com>
In-Reply-To: <DMXEK4LWEZJH.2MIWDYR9RRMC7@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250533

On Tue Nov 17, 2026 at 11:09 AM CET, Mathieu Dubois-Briand wrote:
[...]
>> +
>> +def is_x86(arch):
>> +    """
>> +    Check whether ``arch`` is ``x86`` or ``x86_64``, return ``True`` if=
 it is,
>> +    ``False`` otherwise.
>> +    """
>> +    if arch.startswith('x86_') or re.match('i.*86', arch):
>> +        return True
>> +    else:
>> +        return False
>> +
>> +def qemu_use_kvm(kvm, target_arch):
>> +    """
>> +    Enable kvm if target_arch =3D=3D build_arch or both of them are x86=
 archs.
>> +    """
>> +
>> +    use_kvm =3D False
>> +    if kvm and boolean(kvm):
>
> Missing import of oe.types here? We are probably also missing os and re.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/5078
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/4956

Indeed, thanks Mathieu, those missing didn't prevent me from building the d=
ocs
so I did not spot that. Will be fixed in v2.

Antonin
