Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F54C87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 12:57:11 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.5642.1754744230582030010
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 05:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BHDDp6HH;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 607DF44981;
	Sat,  9 Aug 2025 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754744228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1TZ4zfc2fucm4eUyko/RYTCa5gGZ6J6FvJZ3Bp3L+Q=;
	b=BHDDp6HH1De3KApfLYJT4ZtM10Qcs3EPVoiUZc/N3DLccOJP4L0ezhHYiqazydlipZjAVu
	zVY4sDnwPEQFSesXfxN+yI+Pkr9rnQgJINN60W4D2kB0Dvx+DWJAsi6AJaMc/WNj7RxQ67
	OYlEh1lMLEtnhPQJDrFVjuPQcI2gjUIKti5PB99MlctAwRqwJnwazD8F0fzoo/Zbrs28iT
	GQXNbExC+6EKBHjE9VKocZx9cLXzWKvdmXagUSi4lyW/xy+pwJLKFNcL1L1dO4WQpgUYVM
	Hu0+6treyaulNq0WTN6NcmLJik2C7/MMlWL3veKgLuPzN8nPcopOKUTinJBGeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 Aug 2025 14:57:08 +0200
Message-Id: <DBXWWY2ZO45D.363V2QKSL85VW@bootlin.com>
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] wic: add --extra-part-space option to set
 unused space
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250808144958.1005928-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250808144958.1005928-1-pierre-loup.gosse@smile.fr>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdeijeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehheevgefgvdeghffgheeitedvvdeftdelheehffdvteetkeehgeetuddthfdvheenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmeguugeimedvgeeftdemfhekudejmeekfegvtdemugejsggrmeekudeludenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemugguieemvdegfedtmehfkedujeemkeefvgdtmegujegsrgemkeduledupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepphhivghrrhgvqdhlohhuphdrghhos
 hhsvgesshhmihhlvgdrfhhrpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 12:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221672

On Fri Aug 8, 2025 at 4:49 PM CEST, pierre-loup.gosse via lists.openembedde=
d.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Currently, the content of the partition is filled by the filesystem
> without leaving any unused free space. The --extra-space flag adds
> extra space to the filesystem size, not to the partition.
>
> Unused free space after the filesystem can be useful for some cases,
> such as encrypting a partition at runtime. With --extra-part-space 32M,
> we ensure that the last 32M of the partition is unused: this space does
> not contain filesystem data and can store the LUKS2 header.
>
> The implementation sets a difference between the partition and
> filesystem size:
>   - With --fixed-size, the extra part space is removed from the
>     filesystem size.
>   - Otherwise (with or without --size flags), the extra part space is
>     added to the partition size.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
> ---

Hi Pierre-Loup,

Thanks for the v2.

It looks like this is failing the selftests:

2025-08-09 08:38:22,672 - oe-selftest - INFO - 9: 75/92 535/635 (30.50s) (2=
 failed) (wic.Wic2.test_fixed_size_error)
2025-08-09 08:38:22,672 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/wic.py", line 1221, in test_fixed_size_error
    p, _ =3D self._get_wic_partitions(wkspath, ignore_status=3DTrue)
           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/wic.py", line 1192, in _get_wic_partitions
    res =3D runCmd("parted -m %s unit kib p" % wicimg,
                 native_sysroot=3Dnative_sysroot, stderr=3Dsubprocess.PIPE)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'parted -m None unit kib p' returned non-zero exit =
status 1:
WARNING: You are not superuser.  Watch out for permissions.
Error: Could not stat device None - No such file or directory.


https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2050
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2121
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2271

Can you have a look at this issue please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


