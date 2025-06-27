Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91237C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:42:07 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.14037.1751031721322344632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ah8b+CMt;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B40043140;
	Fri, 27 Jun 2025 13:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751031719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dnxsjb3sQLqJSmIUbqn+4D4rlhLCosBWALo0oQI+ePo=;
	b=ah8b+CMtLyGCM/q6IZ/TDdIGZzpRAfOcVYu1eeIPdg0IDeIQugqH42lx/iTQTP2Ocb4rgu
	Jg9mJfeLq1d2InG0rQUrt86OEGmP3kd32p7i0VQu2R0vA1/gWshGha9a3txmyCLky3zSx2
	005M67RkkGGmfxm6mCzUBfPJYe7B6r487czkYFRfMss4tabmcrJ6bws0vHhcxZm2S+Z9Bg
	Zbt06aHDQkb/fQvqRiq4ZG+j3jRJQsQwh4hh+l/idBc7cK57NXPFmcGhacI34rX/djdzEh
	9BxZTFvVMEIFf/QSIz9SiKnH0pXIjtL+QigkOMzbQwyiYRRzl95/pS0CeG6ooQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 15:41:59 +0200
Message-Id: <DAXCXUQFYSCA.2B2JGX1DBLF84@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] oeqa runtime ping.py: make
 run_network_serialdebug() specific to qemu
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250627063004.781560-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffufhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtgefgveeihfelveeftddvfeejgeeigeeigfeuleeiudfghfduieegtdeugedunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdprhhunhhtihhmvgdrtggrshgvpdgtohhrvgdrthgrrhhgvghtpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepo
 hhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219412

On Fri Jun 27, 2025 at 8:29 AM CEST, Mikko Rapeli via lists.openembedded.or=
g wrote:
> Only qemu runner supports self.targets.runner. ssh runner does not
> define this and on error path this function causes another exception.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/runtime/cases/ping.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/=
cases/ping.py
> index efb91d4cc9da..515d376602bd 100644
> --- a/meta/lib/oeqa/runtime/cases/ping.py
> +++ b/meta/lib/oeqa/runtime/cases/ping.py
> @@ -10,6 +10,7 @@ from time import sleep
>  from oeqa.runtime.case import OERuntimeTestCase, run_network_serialdebug
>  from oeqa.core.decorator.oetimeout import OETimeout
>  from oeqa.core.exception import OEQATimeoutError
> +from oeqa.core.target.qemu import OEQemuTarget
> =20
>  class PingTest(OERuntimeTestCase):
> =20
> @@ -36,7 +37,8 @@ class PingTest(OERuntimeTestCase):
>                      count =3D 0
>                      sleep(1)
>          except OEQATimeoutError:
> -            run_network_serialdebug(self.target.runner)
> +            if isinstance(self.target, OEQemuTarget):
> +                run_network_serialdebug(self.target.runner)
>              self.fail("Ping timeout error for address %s, count %s, outp=
ut: %s" % (self.target.ip, count, output))
>          msg =3D ('Expected 5 consecutive, got %d.\n'
>                 'ping output is:\n%s' % (count,output))

Hi,

I think this series is causing issues on the autobuilder:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm-tc/build/scripts/oe-selftest", =
line 58, in <module>
    ret =3D main()
  File "/srv/pokybuild/yocto-worker/qemuarm-tc/build/scripts/oe-selftest", =
line 45, in main
    results =3D args.func(logger, args)
  File "/srv/pokybuild/yocto-worker/qemuarm-tc/build/meta/lib/oeqa/selftest=
/context.py", line 413, in run
    self._process_args(logger, args)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm-tc/build/meta/lib/oeqa/selftest=
/context.py", line 260, in _process_args
    super(OESelftestTestContextExecutor, self)._process_args(logger, args)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm-tc/build/meta/lib/oeqa/core/con=
text.py", line 183, in _process_args
    test_suites =3D self.tc_kwargs['init']['td'].get("TEST_SUITES").split()
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'NoneType' object has no attribute 'split'

Can you have a look?
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/1848

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


