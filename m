Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E35C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 10:34:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.20481.1751452443510279870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 03:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dot7LtLz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFA73439FB;
	Wed,  2 Jul 2025 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751452440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNNi3rmrtsHcgvG8LZLBfk3mWRWgaaML7CWZIUlTM+I=;
	b=dot7LtLz1iFgepIvthoBoXbN7sb2vlxxqBrHFQqyAkx0tEp3Xh0zyhUYfu3unJNaN1NDwm
	36MMPkptM2AxbfZCZ15PZUmTsAh1N1hBEdbh/Mb/uwdtppVKu+xTAOO2JsbVcr5CnQVOga
	jd0n1nFHohjy4hhEbyV+NNh+ew9EOYRAdKdJIpU5J0PSP00Bjd2ws7bP/1XgjYs5jVgGvS
	70YIkHSNjfrsyTe/KsQxUbBqlqf6keNcwSo7c5Zpj0qpOTzuP/eTAJFo40iOQVqUwXT1mW
	C/XmK05WQ65/CqpztGqkOKo6xOVUjZ9C7LEB/1D9YoXIbozla8qDaUhU6tfjzg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 12:33:59 +0200
Message-Id: <DB1I2N3JADAI.3AFKK4PYIHWQW@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 5/5] sanity/utils: Directly use gcc instead
 of BUILD_CC in host_gcc_version
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20250702053220.4104358-1-raj.khem@gmail.com>
 <20250702053220.4104358-5-raj.khem@gmail.com>
In-Reply-To: <20250702053220.4104358-5-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehgfeljeeggfdtueduvefghefgiefhgfefjeetkeeitedtffeggeevudefteevteenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 10:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219816

On Wed Jul 2, 2025 at 7:32 AM CEST, Khem Raj via lists.openembedded.org wro=
te:
> This assumes GCC compiler, so feed it one, BUILD_CC might point to
> clang as well in that case it fails.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oe/utils.py | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 27d304ec72d..d31f8c3db36 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -446,21 +446,17 @@ def host_gcc_version(d, taskcontextonly=3DFalse):
>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') !=3D '1':
>          return
> =20
> -    compiler =3D d.getVar("BUILD_CC")
> -    # Get rid of ccache since it is not present when parsing.
> -    if compiler.startswith('ccache '):
> -        compiler =3D compiler[7:]
>      try:
>          env =3D os.environ.copy()
>          env["PATH"] =3D d.getVar("PATH")
> -        output =3D subprocess.check_output("%s --version" % compiler, \
> +        output =3D subprocess.check_output("gcc --version", \
>                      shell=3DTrue, env=3Denv, stderr=3Dsubprocess.STDOUT)=
.decode("utf-8")
>      except subprocess.CalledProcessError as e:
> -        bb.fatal("Error running %s --version: %s" % (compiler, e.output.=
decode("utf-8")))
> +        bb.fatal("Error running gcc --version: %s" % (e.output.decode("u=
tf-8")))
> =20
>      match =3D re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
>      if not match:
> -        bb.fatal("Can't get compiler version from %s --version output" %=
 compiler)
> +        bb.fatal("Can't get compiler version from gcc --version output")
> =20
>      version =3D match.group(1)
>      return "-%s" % version if version in ("4.8", "4.9") else ""

I can't apply this patch locally, isn't redundant with patch 4/5?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


