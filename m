Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCBEC433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 17:17:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.184.1632503869247916270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 10:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18OHHlnh021935
	for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 12:17:48 -0500
Subject: Re: [OE-core] user/group XXX does not exist, using root with RPM/DNF
 packaging in Hardknott and Honister
To: openembedded-core@lists.openembedded.org
References: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <c1c5df22-9bed-6d90-6d04-aec9e44a4efd@kernel.crashing.org>
Date: Fri, 24 Sep 2021 12:17:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <dc967621-9759-1ab4-e526-36f9010ae3c0@pr.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id
 18OHHlnh021935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 17:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156337



On 9/24/21 9:02 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> Hi,
>=20
> I have a special package that creates users and groups
> via inherit useradd. This package doesn't depend on any
> others but it is depended on, both via DEPENDS and RDEPENDS
> by packages using those users/groups in their do_install
> scripts.
>=20
> This works for packaging becase these ownerships
> are encoded in the packages, confirmed by rpm -qp --dump ...

Does it show the useradd in the _PREINSTALL_ (you can use --scriptlets in=
 the
rpm -qp)?

> However, during do_rootfs, a couple of
> "user/group XXX does not exist, using root"
> messages appear for the packages depending on others
> creating these users/groups.

Do the using packages contain RDEPENDS on the package that adds the user/=
group
to the system?

> log.do_rootfs shows that the package installation ordering
> does not follow RDEPENDS. Instead, it's practically an
> alphabetical order when running dnf.
>=20
> This doesn't just involve my custom packages, but also clamav
> plus another one in which I ship a small limited set of
> virus signatures, also chown'd to clamav and with RDEPENDS
> on clamav.
>=20
> What is the correct solution to this?

Typically the combination of the pre-install scriptlet, along with RDEPEN=
DS will
ensure that the user has been added before the install completes.

--Mark

> Thanks in advance,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156296): https://lists.openembedded.org/g/openembed=
ded-core/message/156296
> Mute This Topic: https://lists.openembedded.org/mt/85839631/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

