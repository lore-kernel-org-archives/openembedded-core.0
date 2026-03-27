Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E2B10BA449
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:35:01 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68486.1774600489158762294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=q8REVRQi;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 01A244E4278B
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:34:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC92B60230;
	Fri, 27 Mar 2026 08:34:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 925F810450F26;
	Fri, 27 Mar 2026 09:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774600485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vVjP6+JTAsTSnAwYKl6x7euJS9yNPJLv/UwfLIfLqww=;
	b=q8REVRQip8hTk0471JAZa7Mlyif7qvNwh8tx/lVhYbWPa49gC970sNmO4tgcQyn6+VHZeT
	Az3RGYo89xpeSjkOQgtdBT97ngnIUM0B9gVc7fzF7K9VykJmVZwt0mwuAbcza8Ozq+LANn
	xD7KubTrSnk36gJNHvEFGqnau9Bz/xffuvlL35NQyqSp0y7U5YiXnJJBDaP11d5x+7ICaE
	AeOBECQtxQ5dojQ7k05IEMNykgiBI+merm6Dx56+R8apUMiKr/FgJHquYLwGQLWDyCZ9/K
	W27nBrh+LCKMawkWTYJFG6WN7bvvUq1OBhJj0OdYshB+t4FCPkSW6+SPfYUuZw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 09:34:42 +0100
Message-Id: <DHDFDB6KCDMU.LLC8N7SBMK6H@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <francesco@valla.it>, "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>, "Adrian Freihofer"
 <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v2] kernel-fit-image: support arbitrary
 loadables
Cc: "Marek Vasut" <marek.vasut@mailbox.org>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>
References: <20260301-fit_loadables-v2-1-2cf4cdf36a91@valla.it>
 <896a5439-cafb-41c7-b770-0d328cb5bf8b@baylibre.com>
 <e3b71012-6f22-4d8b-82d3-6dfefc947a7d@valla.it>
In-Reply-To: <e3b71012-6f22-4d8b-82d3-6dfefc947a7d@valla.it>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234068

Hi,

On Tue Mar 3, 2026 at 9:30 PM CET, Francesco Valla via lists.openembedded.o=
rg wrote:
[...]
>> Thanks for submitting this. LGTM, but it'd be nice to have it=20
>> documented as well.
>>
>> Could you add some details to the Yocto Project docs (e.g. in the=20
>> "Variables Glossary" section) and submit it to=20
>> docs@lists.yoctoproject.org?
>
> Yes, documentation here is pretty much necessary to understand how this=
=20
> shall be used.
> I'll work on it as soon as possible.

Did you manage to come up with some documentation for this? I am catching u=
p
with the latest changes from OE-Core and this appears to be missing.

As a starting point, we'd need documentation for the following variable in
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/varia=
bles.rst:

FIT_LOADABLES
FIT_LOADABLE_FILENAME
FIT_LOADABLE_TYPE
FIT_LOADABLE_ARCH
FIT_LOADABLE_OS
FIT_LOADABLE_LOADADDRESS

And an update to the class' documentation here:
https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/class=
es.rst?id=3D5bfe4f9aecf542766dec727bedbb30b1f93ab64a#n1419

I think the key point is to show how these variables are translated into th=
e fit
node. I think an example in the class documentation would be great for that=
.

These should be sent to docs@lists.yoctoproject.org.

Let me know if I can be of any help.

Thanks!
Antonin

