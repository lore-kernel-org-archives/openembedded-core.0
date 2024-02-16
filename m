Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB1FC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:20:00 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.869.1708100393435736980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=cyoOqLIU;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A3D3A240101
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 17:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708100391; bh=yIwCaapNasxh1a78GWWFVqfSshVBYWvlmGAB7oeOjI4=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=cyoOqLIUZsuSp1TtHBmRCIwfyGkh2K0KoMT/w8ykO0Y3i0/U+ZEcC+YvC4M6wRPUd
	 50zAFb2wldn5gsFCEbvMnv3jZvZGcoKfyfca0ov68XKlc2jhta/NOyqdhj27rmkRyN
	 a+XCIlMLrVPuFbwhToc+/WfYDQ2EhP1rYYCDgMZ/E6Uek7KFNbUObdEGPo+mgNsHY4
	 dooc4VUYeiZQ+6B+9zVMGzYLdWq5kQW79vPvvx5qAgIIk/qLniMLYEfVmyYOOQkTUW
	 bn9TBW/SVu+X99/pedz4EzjuMy3sYkMSb3UpdPEC7Q3ovUiVi2f3Foa3G/z1ysea+a
	 lz8p0XM4tXanQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TbxwQ0pG6z9rxB;
	Fri, 16 Feb 2024 17:19:49 +0100 (CET)
Message-ID: <ee91117924cca38a5bfc5d345da269d89a03670e.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] patchtest: Add further information for failed
 testcases
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Simone
 =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2024 16:19:49 +0000
In-Reply-To: <ccccce2389cda121cfc5cef4c87b7edf63d6a41b.camel@linuxfoundation.org>
References: <20240215213932.245929-1-simone.p.weiss@posteo.com>
	 <ccccce2389cda121cfc5cef4c87b7edf63d6a41b.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195780

On Thu, 2024-02-15 at 22:10 +0000, Richard Purdie wrote:
> On Thu, 2024-02-15 at 21:39 +0000, Simone Wei=C3=9F wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > Add more information to log messages when a test case fails.
> > Still keep it short and mostly reference the documentation. Reasson is
> > that
> > documentation should already contain the needed information, do not
> > duplicate
> > it here, so we also do not need to update here should the doc/policy
> > change.
> >=20
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>=20
> This does get a little tricky since the responses from patchtest on our
> test infrastructure has a character limit for security reasons.
>=20

> I have wondered if we do need to change it to some kind of code
> response which can then be translated back into real text.
>=20
What could be easily done is also to remove some kind of information that
is kinda duplicated from the logs: e.g.=20

FAIL: test commit message presence: Please include a commit message on
your patch explaining the change
(test_mbox.TestMbox.test_commit_message_presence)

basically duplicates test_commit_message_presence (with and w/o _), that
is not really needed IMO.

Also the reference links could be given instead - if any testcases failed
- in  a bundled fashion by adopting the suggestions in patchtest-send-
result and for local runs in patchtest's run function

Cheers,
Simone
> The reason for the character limit is to stop abuse of the VMs that run
> the tests, you can't mine bitcoin and pass them out as the failure
> message for example.
>=20
> Cheers,
>=20
> Richard
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195707):
> https://lists.openembedded.org/g/openembedded-core/message/195707
> Mute This Topic: https://lists.openembedded.org/mt/104382125/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


