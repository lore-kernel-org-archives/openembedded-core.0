Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF57C2A075
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 08:37:09 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60212.1767602221282653349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 00:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1CI2h20q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3D4B3C1BEBF;
	Mon,  5 Jan 2026 08:36:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A2F060726;
	Mon,  5 Jan 2026 08:36:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DCAA1103C8495;
	Mon,  5 Jan 2026 09:36:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767602218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CMUkVhW62acCs/deC0ZHF3Oe8fxPTB+mNqeq49d3H1Q=;
	b=1CI2h20qsQhN7HfTAg5iQkGCKwh5IqYkDRNpN998ot8Ex9ATcB0fctt5LiuV1uZuHBnguT
	l9TB/Gb3oN6U2Ys9N4SYxZ//NOj74wwRWcEXIDm7N2hbqXwkRycFdGusCRnT1IULwRPlOR
	D50pHQY5hojS1PGyw2ZK+Xvwaz/a0CPssIc6yxnQiOXnuyW6ygEz3GoI4TiSP8d3/btCJ4
	0MRvRXfVpHcY7V7hWJ76G4oXOqJxrz7lY7AdrYk0jjHWG0PkYgSrnnNq1JNB6GvBr35HgJ
	CQiHot5XpMG8Je3fL6bYUy62o3dpjRJEzL6Mh27PShBCBkDQPMbpFXRFSXBa8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 09:36:57 +0100
Message-Id: <DFGIOWJE2L8I.342KUTKKK3RT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH] libnl: upgrade 3.11.0 -> 3.12.0
Cc: <openembedded-core@lists.openembedded.org>, "Alexander Kanavin"
 <alex@linutronix.de>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251229124538.1535197-1-alex.kanavin@gmail.com>
 <DFBMYE2AZW0G.2OICW0SD4EGBV@bootlin.com>
 <CANNYZj9N=vQECr+oRj8NKcbS95kztcuuVW1frpKrBBu5tYGy6w@mail.gmail.com>
In-Reply-To: <CANNYZj9N=vQECr+oRj8NKcbS95kztcuuVW1frpKrBBu5tYGy6w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 08:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228860

On Fri Jan 2, 2026 at 12:58 PM CET, Alexander Kanavin via lists.openembedde=
d.org wrote:
> On Tue, 30 Dec 2025 at 15:54, Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
>
>> Just some note: it looks like some ptest is failing intermittently on
>> ARM64 after this upgrade. I'm not sure how bad the whole situation is,
>> but it's bad enough that I already saw it fail twice today:
>>
>> Failed ptests:
>> {'libnl': ['nl-test-util.c:Core:route_1_The_list_of_2_routes_did_not_fin=
d_a_one-to-one_match_with_the_list_of_3_expected_routes']}
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2800
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2802
>>
>> Yet on both times, the rebuild succeed. No issues on other
>> architectures.
>>
>> I will keep the patch in my branch, so I will try to monitor the failure
>> frequency.
>
> Hello Mathieu,
>
> the update has landed in master, let me know if you see it happening
> again. It shouldn't be difficult to patch the test out and file a
> ticket upstream, I just want a definite confirmation of the
> intermittent issue.
>
> Alex

Hi Alex,

For some reason this did not happen on master so far, but I bet it will
happen soon. I opened a bugzilla entry to track these:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16118

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


