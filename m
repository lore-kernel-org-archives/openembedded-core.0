Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF2EE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 17:04:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.16133.1733936636925504044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 09:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TfOqt4zA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBF491BF20C;
	Wed, 11 Dec 2024 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733936635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTPoJ7YkTbK5b/Sy+Lp6cMp3RtN8IluIhkIWRcwgUOY=;
	b=TfOqt4zACdrLYm1ujSeez7c1rdwbfxv5LaDVz0CBjbYfTIS1l6PPcyGdxP9LZ99oXEETme
	KE3IuMzUGQ5Y4dot66wg/r7muTktY1CGgAjtKwoeu4s7JRUypQww83k2RNphYThh/UX3jk
	cbQ6dMS9l6NBeQ/MOHpS9aniUugMzcEBa5pLicuJQkLQVq87B8TQjNBA3VO8SBsYCISUp+
	z1rbPf1hgs9gyZ+PHcuH7fFAcT+5h6QESoR5QhL6AhpvAnUyxvxybDqDYTqUgAiVGNozsf
	SgrMHDuKLrrCaa5ImuCc9pjAEBItHeIDa5XKNjiHQ7DVI+EJkogd69mqsVXcBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 18:03:54 +0100
Message-Id: <D6918L62GCW9.139TWVMC398ET@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] meta/lib/oe/sbom30.py: correct alias
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241211120728.3737604-1-hongxu.jia@windriver.com>
In-Reply-To: <20241211120728.3737604-1-hongxu.jia@windriver.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208595

On Wed Dec 11, 2024 at 1:07 PM CET, hongxu via lists.openembedded.org wrote=
:
> After commit [spdx 3.0: Rework how SPDX aliases are linked] applied,
> it added extra "/" to namespace, which causing the replacement of
> UNIHASH missing a "/"
>
>   http://spdxdocs.org/openembedded-alias/by-doc-hash/0b308e4b9ad979f642d8=
787c61f76c31bdcad04837eeaaf8bc383f33f99bbeb8/flex-nativeUNIHASH/build/recip=
e
>
> After applying this commit to remove "/" from namespace.
>
>   http://spdxdocs.org/openembedded-alias/by-doc-hash/0b308e4b9ad979f642d8=
787c61f76c31bdcad04837eeaaf8bc383f33f99bbeb8/flex-native/UNIHASH/build/reci=
pe
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

We have some warnings on the autobuilder while picking these patches,
such as:

WARNING: core-image-sato-1.0-r0 do_create_image_sbom_spdx: The following SP=
DX IDs were unable to be resolved:
  http://spdxdocs.org/openembedded-alias/by-doc-hash/7f7bda815cc04b5b265ac8=
602753d177a96016826f71217624323d1afbb6a65e/gdk-pixbuf/UNIHASH/build/recipe
  http://spdxdocs.org/openembedded-alias/by-doc-hash/c0aa4c9cb1de03839f2a5e=
077627543f00e6269d6a16bfccf156b395df054f2d/gtk+3/UNIHASH/build/recipe

https://valkyrie.yoctoproject.org/#/builders/13/builds/557/steps/13/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/89/builds/579/steps/17/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/95/builds/610/steps/13/logs/st=
dio

Can you have a look at this issue please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


