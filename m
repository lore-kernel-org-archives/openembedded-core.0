Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FF5CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 20:26:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3637.1778272006679921995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 13:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=unF2/sXl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8AA8D4E42C4C;
	Fri,  8 May 2026 20:26:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ED37605D0;
	Fri,  8 May 2026 20:26:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E55F10819D96;
	Fri,  8 May 2026 22:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778272003; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HuNp2sESTVTbFLo9RvJGbXemvTDAI0KsO0AEeRa383I=;
	b=unF2/sXlv28emafVh6CK5Lc3KYPWMrc/hHk7M5qkzdFLVWFfSA0Yz6SKb92Ota37pRagZ3
	zWieOKCoxjkskqe6egIyLUmEXNWfYNu2ZV/c4pFx0EKTxyF42oOH65vQ1PZUDnIF/NmPGa
	Tvknm/hjGCqABW7d9QDVRzsTnzF4H8stlT5rOEcUoi0bZOVLV3ZxkVlO7eu3XPCjubq784
	j85/sgmcIk7xBk+Szjg+oID88KB8uRTBh6uPyxiSeoeXTNxiZtYvG4wgC/WB728whMJOeO
	tMeW4y+kYGvBLhI2eVLQFN6lGFZaTCTk0xw5m7b/20esSZgu8dOH4GGKua9eIA==
Message-ID: <215f2fee-ef34-4e14-b1fb-c91535e7b477@bootlin.com>
Date: Fri, 8 May 2026 22:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] What to do with vim in openembedded-core?
To: Paul Barker <paul@pbarker.dev>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 20:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236738

Hello,

On 5/8/26 15:29, Paul Barker wrote:
> Hi all,
>=20
> We have a vim recipe in openembedded-core to provide:
> - An editor without the limitations of busybox vi.
> - The `xxd` command, used as a runtime dependency of dosfstools-ptest.
>=20
> However, vim is difficult to maintain in our stable releases. There is =
a
> regular stream of CVEs that need fixing due to the large UI and input
> surface of vim, and backporting fixes has proven difficult. This isn't
> just a Yocto Project issue, the Debian tracker [1] currently shows 14
> unresolved CVEs in Trixie and 15 unresolved CVEs in Bookworm. And, it's
> very difficult to share work between distros, as vim tags every commit
> as a new release, every distro ends up on a different release and needs
> to re-validate any backported patches.
>=20
> So, I propose we drop vim from openembedded-core on the master branch,
> post-wrynose.
>=20
> We can use tinyxxd [2] to provide xxd, this is based on the vim codebas=
e
> and frequently merges changes from upstream.
>=20
> We can use GNU Nano as our default editor where something more capable
> than busybox vi is needed, this has a sensible release model. The much
> simpler input model and lack of scripting facility means that CVEs in
> nano are much fewer and further between.
>=20
> If we do this, what should we do with vim? We could move it back to
> meta-oe, but that would simply be moving the maintenance burden. We
> could stop backporting CVE fixes to vim and recommend that an LTS mixin
> layer is used to provide newer versions of vim for stable branches. I'm
> open to ideas.
>=20
> [1]: https://tracker.debian.org/pkg/vim
> [2]: https://github.com/xyproto/tinyxxd
>=20
> Best regards,
>=20

Last week I prepared a series splitting vim and xxd in different=20
recipes, but I didn't have the time to send it. I will try to do it ASAP=20
and I think this could avoid dropping vim from oe-core, since xxd would=20
then be handled in a much simpler way.

I hope I'm not too late in this discussion...

--=20
Best regards,
Jo=C3=A3o Marcos Costa

