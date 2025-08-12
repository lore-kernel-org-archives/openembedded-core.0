Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74608C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 14:17:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.75353.1755008252012042074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 07:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bHaQ98pf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04D3E1F47A;
	Tue, 12 Aug 2025 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755008250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ic+Os+hAQljSwR++BHmWY+5odrMf33aPy4TPEB0PtI=;
	b=bHaQ98pfIiCbR4saSg1ahl/JsUaNAnQ6jieLspYgQjfFxcmxPPOWjsi2XOlgUzebssbrmh
	Lz0lUqPUY+xP51M9d5jjHDKzLsSDrZFpM1WsUYPm7xV+1gHqp2jcyH+aJ1mrMBOQXka0EP
	oMPK0Qt1qRzXoDd1ZwAfA7vO/yhdlNYnxPJB95KcHa9uXx1HoKagieM8QFpllExwBq1FpT
	Ye63SkY44O4VNlqg60oMjKXbrkYpJ/QcluZJCXa6tLa0HbmjBtt5a+bZQe5PL15MBYZg7I
	CoXtzOzIuq2Hu5hIEBIQdR4QgzTBNowK+NeVqT866igddNl/GtYUDCJ3atVDiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 16:17:29 +0200
Message-Id: <DC0II3M8AROA.WDDDZHO2OW9D@bootlin.com>
Subject: Re: [PATCH v3 1/2] wic: add --extra-partition-space option to set
 unused space
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250811134804.841937-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250811134804.841937-1-pierre-loup.gosse@smile.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeehheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgefhkeettdefgeejffdvhfduteelvdeffffhteekffelfeejgfeiffduteejveenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehpihgvrhhrvgdqlhhouhhprdhgohhsshgvsehsmhhilhgvrdhfrhdprhgtp
 hhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 14:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221774

On Mon Aug 11, 2025 at 3:48 PM CEST, pierre-loup.gosse wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> By default, the content of the partition is filled by the filesystem
> without leaving any unused free space. The --extra-space flag adds
> extra space to the filesystem size, not to the partition.
>
> Unused free space after the filesystem can be useful for some cases,
> such as encrypting a partition at runtime.
> With --extra-partition-space 32M, we ensure that the last 32M of the
> partition is unused: this space does not contain filesystem data and
> can store the LUKS2 header.
>
> The implementation sets a difference between the partition and
> filesystem size:
>   - With --fixed-size, the extra part space is removed from the
>     filesystem size.
>   - Otherwise (with or without --size flag), the extra part space is
>     added to the partition size.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
> CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---

Hi Pierre-Loup,

Thanks for the new version.

It looks like some of the tests are failing on the autobuilder:

2025-08-12 11:56:06,941 - oe-selftest - INFO - 9: 73/92 537/635 (83.03s) (0=
 failed) (wic.Wic2.test_extra_partition_space)
2025-08-12 11:56:06,941 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/wic.py", line 1375, in test_extra_partition_space
    self.assertNotEqual(p.status, 0, "wic exited successfully when an error=
 was expected:\n%s" % p.output)
  File "/usr/lib/python3.12/unittest/case.py", line 894, in assertNotEqual
    raise self.failureException(msg)
AssertionError: 0 =3D=3D 0 : wic exited successfully when an error was expe=
cted:
...
2025-08-12 12:40:46,950 - oe-selftest - INFO - FAIL: wic.Wic2.test_extra_pa=
rtition_space (subunit.RemotedTestCase)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2285
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2135
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2064

Can you have a look at the issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


