Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8EFC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 06:31:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.17417.1751437854382887935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 23:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kWylUZPD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BE1A4434F;
	Wed,  2 Jul 2025 06:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751437853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+lCyt1h7W0rg7dBtwVqNng4ObY7yA2JZIILlnj49ys=;
	b=kWylUZPDmTDbIAcU+CPyEBlMp+/WFALwGZdXeQUHHHx4xpKaKJeynpbopiXjcMym/vxKKa
	pgKFCm6bK/espinWcTJRtd1dSGzBM25SdLZEbJHNOBT2noS2WpE7MVbj6D7/cAiG3gU3sS
	0mMpuYTxKqLHIkDDF/KptJ0znCiB6KvFhNmaUvLXn5NpJa7VkrokQQFPHamG7Oy3xEA+0F
	tvmMVBoNplSwX2CaohoNq/QULaTqtq3J9mvHn2umK4yylY83ybemFVhcbOhItsdBYEsNIR
	sGZQvUgRHu/EhNSQIEiKIWtq5ixRAwBsWCwYniTeMfYLKU36/b8Mm8KgWJfcVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 08:30:52 +0200
Message-Id: <DB1CWHVP7UW6.Z2K1JXYVC2N8@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/6] oeqa runtime: set self.runner and
 handle None
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250701073359.979368-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehjeegffehjeefudeihfejffetgfduueegvdfhhfejtefgvdelffdvgeffiedvueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhts
 hdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 06:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219781

On Tue Jul 1, 2025 at 9:33 AM CEST, Mikko Rapeli via lists.openembedded.org=
 wrote:
> Set default self.runner to None. qemu target sets
> the runner to qemu. Then handle self.runner None in
> run_network_serialdebug(). This way ssh runner
> and failing ping or ssh tests handle the error cases.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/core/target/__init__.py | 1 +
>  meta/lib/oeqa/runtime/case.py         | 2 ++
>  2 files changed, 3 insertions(+)
>
> v2: setting self.runner for all target types instead of target conditiona=
l
>     paths in tests
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/219377
>     and https://lists.openembedded.org/g/openembedded-core/message/219378
>
> diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/t=
arget/__init__.py
> index 1382aa9b5239..177f648fe358 100644
> --- a/meta/lib/oeqa/core/target/__init__.py
> +++ b/meta/lib/oeqa/core/target/__init__.py
> @@ -10,6 +10,7 @@ class OETarget(object):
> =20
>      def __init__(self, logger, *args, **kwargs):
>          self.logger =3D logger
> +        self.runner =3D None
> =20
>      @abstractmethod
>      def start(self):
> diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.p=
y
> index 9515ca2f3d62..2a47771a3d47 100644
> --- a/meta/lib/oeqa/runtime/case.py
> +++ b/meta/lib/oeqa/runtime/case.py
> @@ -23,6 +23,8 @@ class OERuntimeTestCase(OETestCase):
>          uninstall_package(self)
> =20
>  def run_network_serialdebug(runner):
> +    if not runner:
> +        return
>      status, output =3D runner.run_serial("ip addr")
>      print("ip addr on target: %s %s" % (output, status))
>      status, output =3D runner.run_serial("ping -c 1 %s" % self.target.se=
rver_ip)

Hi Mikko,

I think this series caused some issues on the Autobuilder:

  AssertionError: 100 !=3D 0 : apt-get install --yes run-postinsts-dev

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2031
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1879
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1816

Can you have a look?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


