Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15000.1795015336954922880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=heL+sK+S;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 80715C4CBDE;
	Wed, 18 Nov 2026 15:22:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 931135FE9B;
	Wed, 18 Nov 2026 15:22:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E533811BC247C;
	Wed, 18 Nov 2026 16:22:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795015334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GIXDp6Liqdfo8h6uEqSTQ2t3FJfzG5DAe7I+x7tQjEE=;
	b=heL+sK+S9Tzu7VpmXBrI4u03E8m7Hrw5TKIUJnW8jCazKnuiTIAKKn/L6zKt8Raesh40eI
	GZLS81jhBSk8Ur1IA1z9pEV7H6LiIC7chs8icmPm7bm7Z9sggH+GON8zzESWL3zS+LhV2/
	OVW8vi9pG7ZxJes1R0cP5W1d9oJ4sH7kvCLj37fmbJc7W6OWlI7/260s6rzl1seDMNXwsc
	sG4UTilgZik9pKTuKMdLJhYpUxJAdyfkXoIehmUrCJlcrWxTjMWIeXF/a4InM+sRfzg8/p
	NO9A1PcNrSSkFmrNtaTwgNAzX1P/cFNyc9NcZVbrM+UgA3YYJR3n5vAha5/6Jw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 16:22:10 +0100
Message-Id: <DMYFTUY2A6RH.1WI2PDCNCPOJY@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/4] spdx30: Add the PURLs of the source
 downloads to the output packages
Cc: "Joshua Watt" <JPEWhacker@gmail.com>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "Stefan Herbrechtsmeier"
 <stefan.herbrechtsmeier@weidmueller.com>, "Stefano Tondo"
 <stefano.tondo.ext@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <stondo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261118092927.204959-1-stondo@gmail.com>
 <20261118092927.204959-4-stondo@gmail.com>
In-Reply-To: <20261118092927.204959-4-stondo@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250565

On Wed Nov 18, 2026 at 10:29 AM CET, Stefano Tondo via openembedded-core wr=
ote:
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Statically linked code, for example a Rust crate, is part of the
> binary, but the SPDX of the output package only names the recipe.
> A vulnerability scanner that checks the packages of an image does
> not find the dependency.
>
> Add the PURLs of the source downloads to the external identifiers of
> each output package. Leave out the crates that the cargo dependency
> graph proves are not built into the target. The software_packageUrl
> of the package stays the first PURL in SPDX_PACKAGE_URLS.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---

Hi Stefano,

Thanks for your patches.

It looks like this is using memory in a way it got killed several times
on the autobuilder. Locally, I managed to have a do_create_spdx task
using more than 10GB of memory, with a value continuously increasing of
about 100MB/s.

This can be reproduced with master branch + your patches, then:
bitbake python3-uv-build-native -c do_create_spdx

Some failed builds for reference:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1605
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/5058
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/5060
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/5039
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/5061

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

