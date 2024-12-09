Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BEAE77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 07:05:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.95473.1733727904230503963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 23:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P8k6oYSs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D45C91C0009;
	Mon,  9 Dec 2024 07:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733727902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbuRZ4JtCiTecMeCBv84/gMxmArySPoivJLI7UOZFTk=;
	b=P8k6oYSsPmrvPkrw6iYNvY7w6Br3igI3hIYtlEAOLaLzhBzkh5Jc3wKNP2bssvn+BFh3t3
	3jfvwL0D2WGt9/pzEYnGqIpCj1hOCjMyh5+dRFqdywY2gKIb9YvRGmdCS039kwwh0gTvNY
	RscmSuxo2/zFdic69pIuhMrVfQ6WjGGBTD1GFqryaGtPJ3+ujnw+QO0qdaoW3/O9x4tQSC
	vfUaPEpo/cieICeR2so4tBAkOypzy8D71XdcZBmjQaHIzlYVd74qYVAMOqkrwXsL83i8Zc
	5t2mTURiwqyurXvFqwJgAhlecREYrenliQY1UsTw+aKsb7547/wu86OStwEntw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Dec 2024 08:05:02 +0100
Message-Id: <D66Z8Z0753NP.2HHE39VDDW4FO@bootlin.com>
Cc: "Robert Berger" <Robert.Berger@ReliableEmbeddedSystems.com>
Subject: Re: [OE-core] [PATCH v2] wic: bootimg-pcbios.py: optionally pass
 'initrd' from .wks(.in) via sourceparams
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <oecore.mailinglist@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241206164822.18330-1-Robert.Berger@ReliableEmbeddedSystems.com>
In-Reply-To: <20241206164822.18330-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 07:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208474

On Fri Dec 6, 2024 at 5:48 PM CET, Robert Berger via lists.openembedded.org=
 wrote:
> optionally allow to pass 'initrd' from .wks(.in) via sourceparams
>
> Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
> ---

Hi,

I believe this patch is the source of the following error on the
autobuilder:

  File "/srv/pokybuild/yocto-worker/wic/build/scripts/lib/wic/plugins/sourc=
e/bootimg-pcbios.py", line 177, in do_prepare_partition
    initrd_dir_and_file =3D os.path.join(deploy_dir_image, initrd)
  File "<frozen posixpath>", line 89, in join
  File "<frozen genericpath>", line 188, in _check_arg_types
TypeError: join() argument must be str, bytes, or os.PathLike object, not '=
NoneType'

https://valkyrie.yoctoproject.org/#/builders/15/builds/580/steps/12/logs/st=
dio

Can you have a look at this issue, please ?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


