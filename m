Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C7FEFD211
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:16:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41732.1772010954054241295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TQKF6rJw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 041B11A12F1
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:15:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAF585FDE5;
	Wed, 25 Feb 2026 09:15:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7EB41036921E;
	Wed, 25 Feb 2026 10:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772010951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oFFVPSpgOA+IpafqsrnzWgJzRZYSAUesLQE3GqxiYw4=;
	b=TQKF6rJwDsERHmE3b3qwI/4t041wKj1QD8+fT0LeZJ+eNGR1Ynjl1xXGezNLonbaL2i/z9
	6x/28/LuX3zEcV/8Lq/8QZdiJPVOzyboC+s+V//935gSBbvPeKc8RkbA81Zrwdiy2ftpq2
	lAok57pk2a6UC46S3ozuVPpPITmj/f69ITdYW3HLhp6C3aotA4J6zXirJT8GaxZLP41Rxl
	ifN7QuZSZZMZJGQdN5Rtj/xeT7FPDZMzXjlZI/GI3FK2eSS7vEkiHm6EAEN5PNYdTTvL0r
	xI5u5VfjSB6TX2i8jcaMXAx9/hBGRkqP58PfeErA419CivX9C8sdHOjnkDxF5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 10:15:48 +0100
Message-Id: <DGNXGFFPH2HR.3QDK13M7O8HLX@bootlin.com>
Subject: Re: [PATCH 3/5] python3-spdx-python-model: add recipe
Cc: <ross.burton@arm.com>, <peter.marko@siemens.com>,
 <jpewhacker@gmail.com>, <olivier.benjamin@bootlin.com>,
 <antonin.godard@bootlin.com>, <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260224-add-sbom-cve-check-v1-0-1c76fbd7f01b@bootlin.com>
 <20260224-add-sbom-cve-check-v1-3-1c76fbd7f01b@bootlin.com>
In-Reply-To: <20260224-add-sbom-cve-check-v1-3-1c76fbd7f01b@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231944

On Tue Feb 24, 2026 at 4:53 PM CET, Benjamin Robin wrote:
>  - Part of the dependency chain for sbom-cve-check
>
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> ---
>  ...enerate-bindings-allow-to-use-local-files.patch | 58 ++++++++++++++++=
++++++
>  .../python/python3-spdx-python-model_0.0.4.bb      | 37 ++++++++++++++
>  2 files changed, 95 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-spdx-python-model/0001-=
generate-bindings-allow-to-use-local-files.patch b/meta/recipes-devtools/py=
thon/python3-spdx-python-model/0001-generate-bindings-allow-to-use-local-fi=
les.patch
> new file mode 100644
> index 000000000000..ec24d7beb3c5
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-spdx-python-model/0001-generat=
e-bindings-allow-to-use-local-files.patch
> @@ -0,0 +1,58 @@
> +From 9fb565a0a70c6985fa1efde13cfe7fb4851588ce Mon Sep 17 00:00:00 2001
> +From: Benjamin Robin <benjamin.robin@bootlin.com>
> +Date: Tue, 24 Feb 2026 10:59:25 +0100
> +Subject: [PATCH] generate-bindings: allow to use local files
> +
> +shacl2code needs to download the following URLs during build time:
> + - https://spdx.org/rdf/3.0.1/spdx-model.ttl
> + - https://spdx.org/rdf/3.0.1/spdx-json-serialize-annotations.ttl
> + - https://spdx.org/rdf/3.0.1/spdx-context.jsonld
> +
> +There are a lot of package build tools that do not allow to download
> +a file during the build. So provide a way to use local file:
> +If the environment variable SHACL2CODE_SPDX_DIR is defined, load
> +the SPDX model and SPDX context from the directory specified by this
> +environment variable.
> +
> +Upstream-Status: Submitted [https://github.com/spdx/spdx-python-model/pu=
ll/19]
> +
> +Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> +---

Hi Benjamin,

Thanks for your patch.

It looks like there is some dependency issue with this recipe. We get
the following error on the autobuilder:

ERROR: python3-spdx-python-model-0.0.4-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linu=
x/python3-spdx-python-model/0.0.4/temp/run.do_compile.2119994' failed with =
exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
| 	shacl2code=3D=3D0.0.24
| 	hatch-build-scripts
| WARNING: exit code 1 from a shell command.
NOTE: recipe lib32-python3-spdx-python-model-0.0.4-r0: task do_compile: Fai=
led

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3246
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3078
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3299

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


