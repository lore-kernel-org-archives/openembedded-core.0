Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A883DCCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:02:28 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.41064.1760353341549326696
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OqZ3g+Ru;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE76C4E41068;
	Mon, 13 Oct 2025 11:02:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B57A6606C6;
	Mon, 13 Oct 2025 11:02:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FA30102F2250;
	Mon, 13 Oct 2025 13:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760353339; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pdpIY+kK2Xxhpu4P1lf2/COhzdE4xPfpWNTMoLckvmI=;
	b=OqZ3g+Ru4e1Lh7CA7X+PM/KS7fDhlVAfFkFO4MSvybsFsqi9zVqnfUGfCIAaXxM09CIvLB
	AZLHUVy9w5AQPSNNeTchG1QtE1meoz7HeZXcm51QYUTX+0oeyW8bSmhihJrNUx/tvAHdOo
	UBeplpY6E3ZzX6yAStSfNV9GM2PMXH4fI0NWoWJaDHTxte3bKrpL1LCxZbxLwjk+eFLDSW
	ta+6VRpgwIVrxflZ+o/abffcrjL63N19+TcxR4ILsRSGsaGphxT7wQFtu3DAjg1/ohgUwu
	yD/Wgz0bWJ4bH/L4Vp2uAqXBMXg1K/zcDOo89UixnmXTbhLuMgBZklK3iaLQWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 13:02:17 +0200
Message-Id: <DDH56F91Q48V.1QO5IE5R5S5UH@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/4] oeqa: runtime: Ignore SSH errors during
 setup and tear down
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
 <20251007-mathieu-ssh-fails-v1-2-a6affee3571b@bootlin.com>
 <DC955EFB-988F-4BCA-91C9-8205286AA5D7@arm.com>
In-Reply-To: <DC955EFB-988F-4BCA-91C9-8205286AA5D7@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224771

On Thu Oct 9, 2025 at 4:26 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> On 7 Oct 2025, at 18:38, Mathieu Dubois-Briand via lists.openembedded.org=
 <mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>>=20
>> Tests using SSH will fail when no SSH server is present on the target.
>> These tests are disabled in these cases, by being marked with a
>> dependency on ssh.SSHTest.test_ssh, which in turns has a dependency on
>> having either dropbear or openssh-sshd in the image.
>>=20
>> But setUpClass() and tearDownClass() functions are always executed, even
>> on tests failing the dependency checks, leading to unexpected failed
>> tests.
>
> Well that=E2=80=99s just silly.  I wonder if OEHasPackage() works on the =
class scope too and does actually avoid doing the setup/teardown?
>
> However, this does demonstrate that doing non-trivial setup/teardown is a=
 bad idea in test cases, and copying files to the target is definitely non-=
trivial.
>
> I suggest merging all of the logrotate tests and setup/teardown into a si=
ngle test that uses finally: to cleanup, and just removing the teardown fro=
m the weston test.
>

I am going to send some patches to clean this.

On the logrotate one, I choose to keep two separate tests, but we can
highly simplify this cleanup part and integrate that in the tests. On
weston, let's remove the log file before starting weston, so we can
still be sure the log is clean.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


