Return-Path: <oe@myspectrum.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BE3C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 10:40:32 +0000 (UTC)
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
 by mx.groups.io with SMTP id smtpd.web11.5278.1744195217408820084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 03:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=D/Sav0FC;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.2, mailfrom: oe@myspectrum.nl)
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4ZXfbg08jHzCtQG;
	Wed,  9 Apr 2025 12:40:15 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission5.mail.transip.nl (Postfix) with ESMTPSA id 4ZXfbf2Hm7z34SDnX;
	Wed,  9 Apr 2025 12:40:14 +0200 (CEST)
Received: from [192.168.178.63] (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: oe@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id D4C4520079;
	Wed,  9 Apr 2025 10:40:13 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=oe@myspectrum.nl smtp.mailfrom=oe@myspectrum.nl
Message-ID: <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl>
Date: Wed, 9 Apr 2025 12:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug
 devices
To: richard.purdie@linuxfoundation.org, Jeroen Hofstee
 <jeroen@myspectrum.nl>, openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
 <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl>
 <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
Content-Language: en-US
From: Jeroen Hofstee <oe@myspectrum.nl>
In-Reply-To: <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1744195214; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=tFTzw4huACL1pr/pVrtZUk/KZsjqAuFlMEE5e/enhuk=;
 b=D/Sav0FCLIAUrc5rHSvpBrhnrMVM4wl6cRiMk9v52glHs58aMihv0XRGW2dh99GPgfGqp9
 9Tjpr/Un99rsdUYDojuXU9tIpSOt4uK6bqZJtnlP/dWUAsEkkqy9mdbswk1FrxVrdex/Hf
 9JLrdz8kTpVygGoaEucb9USJHr8rkIgVOMv0SIAvX1ZvKrYkoKO7WKk2fdib6EYfwQEDN6
 NQnFlbxhqaGtU2WGFCgxCAcfltTG6oeaQoGcLqgyT1TdCrzGULFObU6fE+uCqVM/E2Ilwn
 8GgTqfVgDEJDUOrx7IKtrUUWyCEo2/yOtufPOI3Q8QUz/VA7BbT4A1aDPuSBqw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214584

Hello Richard,

On 4/9/25 11:27, Richard Purdie via lists.openembedded.org wrote:
>>> We've purposefully kept the code called from udev and in our
>>> initscripts relatively minimal/simple as the overhead of executing
>>> multiple programs does build up over time. Taking the above, we have
>>> loops, then pipelines, each of which runs more commands. Each command
>>> has a fork/exec overhead.
>>>
>>> Is there some way we can simplify this rather than all the shell
>>> pipelines and loops?
>> The simplest solution is to patch busybox to respect=C2=A0 --allow=3Dh=
otplug I guess.
> Yes, I as wondering about that. I see patches from a long time ago but
> I guess they were never merged. It probably is easier for busybox to
> handle this rather than shell code but I don't know what chance they'd
> have of being merged upstream.
>
> I would probably perfer to fix busybox to support this but I don't know
> how well that is going to work out...

Unless they changed their mind, upstream busybox won't accept it, so it
has to be a patch in OE. But feel free to try to upstream it.

For completeness, this is not some theoretical issue, always calling if u=
p
directly after a network device is discovered does cause issues and is
against spec as well.

The sed stuff isn't that complicated, is it?

Regards,
Jeroen


