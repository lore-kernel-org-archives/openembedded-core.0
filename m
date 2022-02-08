Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A91AC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 13:57:03 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web09.11440.1644328610900216202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 05:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=ffsQzVPn;
 spf=pass (domain: gmx.de, ip: 212.227.15.15, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1644328607;
	bh=k0+gF73uaiorwFL+Ea5lTYGo5NpCd7Iu67uJix8MFew=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ffsQzVPndxlb9iRKMTeARc1TPlo9xPlj1kgencZItyt4eEs6MpLEcgkR0hTwxdg4X
	 rq8enw/yBTuBUe9UZoJMUrYlb6JvMcmDLeWSsxatoxSnZ4W9YmTTPt2TbWVGIXEoYw
	 7ej7PvVoc6YeWj0ZEHm3y6VkXk64xkYWy+sytyrQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from monster.localnet ([95.88.58.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1ns8mQ0dOP-00ajhC; Tue, 08
 Feb 2022 14:56:47 +0100
From: Jan-Simon Moeller <dl9pf@gmx.de>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org, jpew.hacker@gmail.com,
 scott.murray@konsulko.com
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
Date: Tue, 08 Feb 2022 14:56:46 +0100
Message-ID: <2156423.DjyB96F3a6@monster>
In-Reply-To: <YgJxhJCQZLrkpgON@korppu>
References: <20220207192915.70095-1-saul.wold@windriver.com>
 <2518421.NRruQZ00Rg@monster> <YgJxhJCQZLrkpgON@korppu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:kY76j0G832weY+queRL7P7wU+wo88xB526RlvDT1W+inXRgdyGj
 DGY/WPEeaoQrN8twCXbc7NiwzrJplRoxZymuaGYN+RbmR7oE8j/Z/hnyTc870Sut+ai9G41
 bnWMO1hytEYqwmMuMAe41+z72L35lrQNVDMSmiev5J9kUjW5uTTjm8CC5zodyzjmJJayF8i
 +9UOK1waac8867L0KOqqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kwRQrrq9jFw=:lyYfmUKglFv2eVWa0hcoDR
 M8KnJozw4T+kcqWs07xnTLJRXDPxqCpHjaz6vtptbjHQn1LCnsn7KIxezxGYMZcBriZNU7spv
 BkTbVJJWCxOTWH/WTsE4TLPfqLtI6o31U7bAIyVbiaTHqQaPu9zQlGDNCWsXzcbElP8BHamEJ
 zoLU/K8513c6YHIzZT9xQwc9ht2OXEEbHonSLLGczvya27Zq5t94PBhodWrQeRMwKoegUImau
 Dh1uzdC6PCae0WOotlfwZ78Hvi/jgtjtpP4KFcfs6AKpNCNY2Kw9ifSq4BGjLJbTHUUxIy5Jt
 lIqOXQ9S/qMosrJJPngFqFeNea97QV87kU1FiH33d+odtcTfERgkfVTLh6xaPBOUFsue887lZ
 0y9rCyrxMsp0twmcZJQo7dBFaGJZUGWZ+x5/dGUxCPMgfDUIJSHFsOEtB/Qp0Q5hlsJ812gky
 LKv1Qy8d3BGSbhuwf/J8m2Q8kPaWgTszz5u7MMTzzrxlJVAS+hJ4ktPSGbESHduu4t2LYl3EQ
 37b3CEnceplLTfYbWLunKIhfvMoArca8JZvqkygUFsNLc4e4HSEgNtIYGbfOLKe4F+8R3ijq9
 FUAmiq8GB4z49AelOC/oXItGJ8tjVVTSm2QP8Xh7/CdO15sybvInmYlje/difX9FXW8b9qRBj
 ym5pTOWXZkuuVI/8bHQmoQn17Q/gzUsG0WIK0/I1CuvCAt/s0+XOFj/8reYVkgtYpfwX9rSyQ
 RhLB/I4yf3na1K7TiHHdAPZiITl35/yzQ38fQpJ/H1phv3hypVvdKQkRUlTmiL/czt6AoJ7kS
 DGdSYN6Bkh9hu4ngDdq+NUmdCBvCMcpFov1HY7+pUyxaG/WFR3ShyTNmASLzKrlpw9qm5OSvr
 H3+EAjGqEwqBkTMs1Jks7+2in8XPZgrLZzGUhffRQ3KnDx/Wj8dDLWqdSjoyFdCKlSHN7diL7
 eZV5RYqZkCuGjcwnFmgqHHPRWnFD/4qLU/++lL4CucqHuqjwbIoFeZ9UJBdMOCz4S5IzKcggp
 YAKXJFQAdHw51QOEQqM3sFrh6BXsuUJcb4vASzVsIRXN+aKf/Oe6I8NtB2XCfkD3JA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 13:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161509

Hi Mikko,

> I guess reports from both will be a superset of used licenses (and possi=
bly
> copyright statements too) since the list of source files which are actua=
lly
> compiled is not known to these services.
Yes, the input is the 'bare' patched source archives. Yes, you're right. W=
e do
only know the 'input' side of things aka all licenses of the source tree.

We do *not* know the 'output' side of things, yet. Aka what of these do en=
d-up
in the image.

But IMHO let's raise the bar step by step.

> Currently the source recipes which have multiple licenses including
> problematic ones, are not cleaned up for license compliance scan. E.g.
> GPLv3 licensed source code are not deleted at do_patch() time. Thus repo=
rts
> need to be manually adjusted.
Well, thats a different topic and should be discussed alongside meta-gplv2=
.

Best,
JS



